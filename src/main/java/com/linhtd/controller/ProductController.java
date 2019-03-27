/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.controller;

import com.linhtd.entity.Category;
import com.linhtd.entity.FileModel;
import com.linhtd.entity.Product;
import com.linhtd.repository.CategoryRepository;
import com.linhtd.repository.ProductRepository;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Linh
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {

    private static final Logger LOGGER = Logger.getLogger(ProductController.class.getName());
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    ServletContext context;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "cateId", required = false) Integer cateId,
            ModelMap mm) throws SQLException {
        if (page == null || page < 0) {
            page = 0;
        }
        if (keyword == null) {
            keyword = "";
        }
        //Get all category for filter by category
        List<Category> listCate = categoryRepository.findAll();
        if (cateId != null && cateId >= 0) {
            for (int i = 0; i < listCate.size(); i++) {
                //If selected cateId existed, return products have that id
                if (cateId == listCate.get(i).getId()) {
                    Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
                    Pageable pageable = new PageRequest(page, 2, sort); // 2 items per page
                    LOGGER.log(Level.INFO, "info:{0}");
                    List<Product> listProduct = productRepository.findByNameFilterByCate(cateId, keyword, pageable);
                    //Get item founded by key and value
                    int totalItems = productRepository.getAllFoundedItemsFilterByCategory(cateId, keyword);
                    //Calculate number of pages
                    double totalPage = ((double) totalItems) / ((double) pageable.getPageSize());
                    int pageCount;
                    if (((totalPage * 10) % 10) > 0) {
                        pageCount = (int) totalPage + 1;
                    } else {
                        pageCount = (int) totalPage;
                    }
                    if (page >= pageCount && page > 0) {
                        //Cuz there is the last page, we can't search more result. Return page to it's lastest.
                        page = page - 1;
                        //Make pageCount equal amount of last page
                        pageCount = page;
                        if ((listProduct.size() % pageable.getPageSize()) > 0) {
                            pageCount += 1;
                        }
                        //Search with new value of page
                        pageable = new PageRequest(page, 2, sort);
                        listProduct = productRepository.findByNameFilterByCate(cateId, keyword, pageable);
                    }
                    mm.put("page", page);
                    mm.put("keyword", keyword);
                    mm.put("pageCount", pageCount);
                    mm.put("listCate", listCate);
                    return new ModelAndView("/product/index", "listProduct", listProduct);
                }
            }
        }
        Sort sort = new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
        Pageable pageable = new PageRequest(page, 2, sort); // 2 items per page
        LOGGER.log(Level.INFO, "info:{0}");
        List<Product> listProduct = productRepository.findAndPaging(keyword, pageable);
        //Get item founded by key and value
        int totalItems = productRepository.getAllFoundedItemsByName(keyword);
        //Calculate number of pages
        double totalPage = ((double) totalItems) / ((double) pageable.getPageSize());
        int pageCount;
        if (((totalPage * 10) % 10) > 0) {
            pageCount = (int) totalPage + 1;
        } else {
            pageCount = (int) totalPage;
        }
        if (page >= pageCount && page > 0) {
            //Cuz there is the last page, we can't search more result. Return page to it's lastest.
            page = page - 1;
            //Make pageCount equal amount of last page
            pageCount = page;
            //Search with new value of page
            pageable = new PageRequest(page, 2, sort);
            listProduct = productRepository.findAndPaging(keyword, pageable);
        }
        mm.put("page", page);
        mm.put("keyword", keyword);
        mm.put("pageCount", pageCount);
        mm.put("listCate", listCate);
        return new ModelAndView("/product/index", "listProduct", listProduct);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(ModelMap mm) throws SQLException {
        mm.put("listCate", categoryRepository.findAll());
        return new ModelAndView("/product/create", "product", new Product());
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("product") Product product,
            BindingResult result, @Validated FileModel file, ModelMap mm) throws SQLException, IOException {
        if (result.hasErrors()) {
            return new ModelAndView("/product/create");
        }
        //Upload file
        MultipartFile multipartFile = file.getFile();
        String uploadPath = context.getRealPath("") + File.separator + "images" + File.separator;
        FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath + file.getFile().getOriginalFilename()));
        String fileName = multipartFile.getOriginalFilename();
        //Set thumnail is file path on server
        product.setThumnail(fileName);
        //Save product
        productRepository.save(product);
        return new ModelAndView("/product/index");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id,
            ModelMap mm) throws SQLException {
        List<Category> listCate = categoryRepository.findAll();
        mm.put("listCate", listCate);
        return new ModelAndView("/product/edit", "product", productRepository.findOne(id));
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView edit(@Valid @ModelAttribute("product") Product product,
            BindingResult result, @Validated FileModel file, ModelMap mm) throws SQLException, IOException {
        if (result.hasErrors()) {
            return edit(product.getId(), mm);
        }

        //Upload file
        MultipartFile multipartFile = file.getFile();
        String uploadPath = context.getRealPath("") + File.separator + "images" + File.separator;
        FileCopyUtils.copy(file.getFile().getBytes(), new File(uploadPath + file.getFile().getOriginalFilename()));
        String fileName = multipartFile.getOriginalFilename();
        if (fileName.equals("")) {
            product.setThumnail(product.getThumnail());
        } else {
            //Set thumnail is file path on server
            product.setThumnail(fileName);
        }
        //Save product
        productRepository.save(product);
        return new ModelAndView("/product/index");
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id", required = false) int id,
            ModelMap mm) throws SQLException {
        return new ModelAndView("/product/details", "product", productRepository.findOne(id));
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(value = "id", required = false) int id,
            ModelMap mm) throws SQLException {
        productRepository.delete(id);
        return new ModelAndView("/product/index");
    }
}
