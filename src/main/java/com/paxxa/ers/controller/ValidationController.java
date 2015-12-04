package com.paxxa.ers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paxxa.ers.service.CompanyService;
import com.paxxa.ers.service.UserService;

@Controller
public class ValidationController {
	
	@Autowired
	CompanyService companyService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/register/available")
	@ResponseBody
	public String available(@RequestParam String username) {
		Boolean available = userService.findUser(username) == null;
		return available.toString();
	}
	
	@RequestMapping("/user-settings/edit-company/isnipcorrect")
	@ResponseBody
	public String isNipCorrect(@RequestParam String nip) {
		return companyService.isNipCorrect(nip).toString();
	}
	
	

}
