package com.example.carrental.controller;


import com.example.carrental.entity.User;
import com.example.carrental.service.CarService;
import com.example.carrental.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import javax.validation.Valid;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private CarService carService;


    @RequestMapping(value = { "/login"}, method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView model = new ModelAndView();

        model.setViewName("user/login");
        return model;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView signup() {
        ModelAndView model = new ModelAndView();
        User user = new User();
        model.addObject("user", user);
        model.setViewName("/user/signup");

        return model;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public ModelAndView createUser(@Valid User newUser, BindingResult bindingResult) {
        ModelAndView model = new ModelAndView();
        User userExists = userService.findUserByEmail(newUser.getEmail());

        if (userExists != null) {
            bindingResult.rejectValue("email", "error.user",
                    "Електронна адреса вже занята!");
        }
        if (bindingResult.hasErrors()) {
            System.out.println(
                    "ererre"
            );
            model.setViewName("user/signup");
        } else {
            userService.saveUser(newUser);
            model.addObject("msg", "Користувач зареєстрований успішно.Теппер ви можете увійти.");
            model.setViewName("user/login");
        }
        return model;
    }

    @RequestMapping(value = "/access_denied", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        ModelAndView model = new ModelAndView();
        model.setViewName("errors/access_denied");
        return model;
    }
}





















