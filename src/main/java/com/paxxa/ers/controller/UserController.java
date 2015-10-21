package com.paxxa.ers.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paxxa.ers.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService UserService;
	
	@RequestMapping("/account")
	public String account(Model model, Principal principal){
		String name = principal.getName();
		model.addAttribute("user", UserService.findUser(name));
		return "user-details";
	}
	
	@RequestMapping("/user-settings")
	public String settings(Model model, Principal principal){
		String name = principal.getName();
		model.addAttribute("user", UserService.findUser(name));
		return "user-settings";
	}

}
