package com.paxxa.ers.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paxxa.ers.service.UserService;

@Controller
public class UserCompanySettingsController {
	
	@Autowired
	UserService userService;

	@RequestMapping("/user-settings/gg")
	public String settCompanyDetails(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("user", userService.findUser(name));
		return "company-details";
	}
}
