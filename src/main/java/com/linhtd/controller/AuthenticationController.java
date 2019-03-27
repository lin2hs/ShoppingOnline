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
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping(value = "/auth")
public class AuthenticationController {
    
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @RequestMapping("/login")
    public ModelAndView getLoginForm(@RequestParam(required = false) String authfailed,
            String logout, String denied) {
        String message = "";
        if (authfailed != null) {
            message = "Invalid username or passwrd, please check!";
        } else if (logout != null) {
            message = "Logged out successfully!";
        } else if (denied != null) {
            message = "Access denied!";
        }
        return new ModelAndView("/auth/login", "message", message);
    }

    @RequestMapping("/403page")
    public String get403denied() {
        return "redirect:/auth/login?denied";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
        return new ModelAndView("/auth/register", "user", new User());
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@Valid @ModelAttribute("user") User user,
            @RequestParam("confirm") String confirm,
            BindingResult result, ModelMap mm) throws SQLException {
        String message = "Congratulations, register successfully!";
        if(result.hasErrors()) {
            message = "Something went wrong, please try again!";
            return new ModelAndView("/auth/register", "message", message);
        }
        if(user.getUsername().length() == 0) {
             message = "Username can't be blank, please try again!";
            return new ModelAndView("/auth/register", "message", message);
        }
        if(!confirm.equals(user.getPassword())) {
            message = "Password and confirm are not matched, please try again!";
            return new ModelAndView("/auth/register", "message", message);
        }
        if(userRepository.checkExistedUser(user.getUsername()) > 0) {
            message = "Username is exsited, please try again!";
            return new ModelAndView("/auth/register", "message", message);
        }
        user.setEnabled(1);
        userRepository.save(user);
        roleRepository.save(new Role("ROLE_USER", user));
        return new ModelAndView("/auth/login", "message", message);
    }
}
