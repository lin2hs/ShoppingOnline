/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.controller;

import com.linhtd.entity.Bill;
import com.linhtd.entity.Cart;
import com.linhtd.entity.Category;
import com.linhtd.entity.Order;
import com.linhtd.entity.Product;
import com.linhtd.entity.User;
import com.linhtd.repository.BillRepository;
import com.linhtd.repository.CategoryRepository;
import com.linhtd.repository.OrderRepository;
import com.linhtd.repository.ProductRepository;
import com.linhtd.repository.UserRepository;
import java.security.Principal;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.transformation.FilteredList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Linh
 */
@Controller
@RequestMapping(value = "/shop")
public class ShoppingController {

    private static final Logger LOGGER = Logger.getLogger(ShoppingController.class.getName());
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BillRepository billRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    //Check item is existed
    private int isExistItem(int id, List<Cart> currentCart) {
        for (int i = 0; i < currentCart.size(); i++) {
            if (currentCart.get(i).getProduct().getId() == id) {
                return i;
            }
        }
        return -1;
    }

    //Book item
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order(@RequestParam int id, @RequestParam int quantity,
            HttpSession session) {
        //Get current cart which is stored in session
        List<Cart> currentCart = (List<Cart>) session.getAttribute("currentCart");
        if (currentCart == null) {
            currentCart = new ArrayList<>();
            currentCart.add(new Cart(productRepository.findOne(id), quantity));
        } else {
            int index = isExistItem(id, currentCart);
            if (index == -1) {
                currentCart.add(new Cart(productRepository.findOne(id), quantity));
            } else {
                int amount = currentCart.get(index).getQuantity();
                if ((quantity + amount) <= productRepository.findOne(id).getAmount()) {
                    currentCart.get(index).setQuantity(quantity + amount);
                } else {
                    return "redirect:index";
                }
                //Check if only quantiy is 0, then remove it
                if (currentCart.get(index).getQuantity() == 0) {
                    currentCart.remove(index);
                }
            }
        }
        session.setAttribute("currentCart", currentCart);
        return "redirect:index";
    }

    //Calculate sum of price in cart
    private double calTotal(List<Cart> currentCart) {
        double result = 0.0;
        if (currentCart != null) {
            for (Cart item : currentCart) {
                result = result + item.getQuantity() * item.getProduct().getPrice();
            }
        }
        return result;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(HttpSession session, ModelMap mm) {
        List<Cart> currentCart = (List<Cart>) session.getAttribute("currentCart");
        double total = calTotal(currentCart);
        mm.put("total", total);
        LOGGER.log(Level.INFO, "info{0}");
        return new ModelAndView("/shop/index", "currentCart", currentCart);
    }

    //Remove item
    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String remove(@RequestParam int id, HttpSession session) {
        //Get current cart which is stored in session
        List<Cart> currentCart = (List<Cart>) session.getAttribute("currentCart");
        if (currentCart == null) {
            return "redirect:index";
        } else {
            for (int i = 0; i < currentCart.size(); i++) {
                if (currentCart.get(i).getProduct().getId() == id) {
                    currentCart.remove(i);
                }
            }
            session.setAttribute("currentCart", currentCart);
        }
        return "redirect:index";
    }

    //Checkout
    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public ModelAndView payment(HttpSession session, ModelMap mm, Principal principal) throws SQLException {
        //Get current cart which is stored in session
        List<Cart> currentCart = (List<Cart>) session.getAttribute("currentCart");
        if (currentCart == null) {
            return new ModelAndView("../home/index");
        } else {
            Bill bill = new Bill();
            //Find user by username
            User user = userRepository.findOne(principal.getName());
            //Create bill with username
            bill.setUser(user);
            //Save bill to get id for Order to save
            billRepository.save(bill);
            Product product;
            Order order;
            double tmpTotalPrice = 0;
            for (int i = 0; i < currentCart.size(); i++) {
                order = new Order(currentCart.get(i).getProduct(), currentCart.get(i).getQuantity());
                //Check lastest DB with in-cart product and category
                if (productRepository.findOne(currentCart.get(i).getProduct().getId()) == null
                        || categoryRepository.findOne(currentCart.get(i).getProduct().getCategory().getId()) == null) {
                    return new ModelAndView("../shop/error", "message", "Product or Category was deleted, we're sorry about that!");
                }
                //Get lastest product data
                product = productRepository.findOne(currentCart.get(i).getProduct().getId());
                //Calculate total price
                tmpTotalPrice += product.getPrice() * currentCart.get(i).getQuantity();
                //Save order
                orderRepository.save(order);
                //Update amount of productt
                int tmpAmount = product.getAmount() - currentCart.get(i).getQuantity();
                if(tmpAmount < 0) {
                    return new ModelAndView("../shop/error", "message", "The remain amount is not enough for your order. We're sorry about that!");
                }
                product.setAmount(tmpAmount);
                order.setBill(bill);
                orderRepository.save(order);
                productRepository.save(product);
            }
            //After calculate total price and save all orders, update bill
            bill.setTime(Date.valueOf(LocalDate.now()));
            bill.setTotalPrice(tmpTotalPrice);
            billRepository.save(bill);
            currentCart.clear();
        }
        return new ModelAndView("../home/index", "currentCart", currentCart);
    }

}
