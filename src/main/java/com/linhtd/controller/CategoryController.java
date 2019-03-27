/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.controller;

import com.linhtd.entity.Category;
import com.linhtd.entity.Product;
import com.linhtd.repository.CategoryRepository;
import com.linhtd.repository.ProductRepository;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Linh
 */
@Controller
@Transactional
@RequestMapping(value = "/cate")
public class CategoryController {

    private static final Logger LOGGER = Logger.getLogger(CategoryController.class.getName());
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "keyword", required = false) String keyword,
            ModelMap mm) throws SQLException {
        if (page == null || page < 0) {
            page = 0;
        }
        if (keyword == null) {
            keyword = "";
        }
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, 2, sort); // 2 items per page
        List<Category> listCate = categoryRepository.findAndPaging(keyword, pageable);
        //Get pageCount per total result after search
        int pageCount = listCate.size() / pageable.getPageSize();
        //Add value if there is an odd page
        if ((listCate.size() % pageable.getPageSize()) > 0) {
            pageCount += 1;
        }
        if (page > pageCount) {
            //Cuz there is the last page, we can't search more result. Return page to it's lastest.
            page = page - 1;
            //Make pageCount equal amount of last page
            pageCount = page;
            if ((listCate.size() % pageable.getPageSize()) > 0) {
                pageCount += 1;
            }
            //Search with new value of page
            pageable = new PageRequest(page, 2, sort);
            listCate = categoryRepository.findAndPaging(keyword, pageable);
        }
        mm.put("page", page);
        mm.put("keyword", keyword);
        mm.put("pageCount", pageCount);
        return new ModelAndView("/cate/index", "listCate", listCate);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("/cate/create", "category", new Category());
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("category") Category category, BindingResult result, ModelMap mm) throws SQLException {
        if (result.hasErrors() || categoryRepository.exists(category.getId())) {
            return index(null, null, mm);
        }
        LOGGER.log(Level.INFO, "Create category");
        categoryRepository.save(category);
        mm.put("message", "Congratulations, create category successfully!");
        return index(null, null, mm);
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id") int id) throws SQLException {
        LOGGER.log(Level.INFO, "Details category");
        return new ModelAndView("/cate/details", "cate", categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id") int id) throws SQLException {
        return new ModelAndView("/cate/edit", "cate", categoryRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(@Valid @ModelAttribute("cate") Category category, BindingResult result, ModelMap mm) throws SQLException {
        if (result.hasErrors()) {
            return index(null, null, mm);
        }
        LOGGER.log(Level.INFO, "Edit category");
        Category categoryDB = categoryRepository.getOne(category.getId());
        categoryDB.setName(category.getName());
        categoryRepository.save(categoryDB);
        return index(null, null, mm);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(value = "id") int id, ModelMap mm) throws SQLException {
        LOGGER.log(Level.INFO, "Delete category");
        List<Product> listProduct = productRepository.findAll();
        for (int i = 0; i < listProduct.size(); i++) {
            if(listProduct.get(i).getCategory().getId() == id) {
                mm.put("message", "This category is related to some products, check it before delete!");
                return index(null, null, mm);
            }
        }
        categoryRepository.delete(id);
        return index(null, null, mm);
    }
}
