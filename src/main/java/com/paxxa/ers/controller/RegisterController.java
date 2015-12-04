package com.paxxa.ers.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxxa.ers.entity.User;
import com.paxxa.ers.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	UserService userService;

	@ModelAttribute("user")
	public User construct() {
		return new User();
	}

	@RequestMapping("/register")
	public String showRegister() {
		return "user-register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String doRegister(@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			return "user-register";
		}
		userService.create(user);
		return "redirect:/register.html?success=true";
	}


}
