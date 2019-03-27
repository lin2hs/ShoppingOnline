/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.controller;

import com.linhtd.entity.Role;
import com.linhtd.entity.User;
import com.linhtd.repository.RoleRepository;
import com.linhtd.repository.UserRepository;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping(value = "/user")
public class UserController {

    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(value = "keyword", required = false) String keyword,
            ModelMap mm) throws SQLException {
        if (keyword == null) {
            keyword = "";
        }
        List<Role> listRole = roleRepository.findByUsername(keyword);
        return new ModelAndView("/user/index", "listRole", listRole);
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ModelAndView details(@RequestParam(value = "id", required = false) int id,
            ModelMap mm) throws SQLException {
        Role role = roleRepository.findOne(id);
        return new ModelAndView("/user/details", "role", role);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id,
            ModelMap mm) throws SQLException {
        Role role = roleRepository.findOne(id);
        List<Role> listRole = roleRepository.findAll();
        List<Role> listTrimmedRole = new ArrayList<>();
        for (int i = 0; i < listRole.size(); i++) {
            boolean existed = false;
            for (int j = 0; j < listTrimmedRole.size(); j++) {
                if (listRole.get(i).getROLE().equals(listTrimmedRole.get(j).getROLE())) {
                    existed = true;
                    break;
                }
                if (existed == false) {
                    listTrimmedRole.add(listRole.get(i));
                }
            }
        }
        mm.put("listRole", listTrimmedRole);
        return new ModelAndView("/user/edit", "role", role);
    }
}
