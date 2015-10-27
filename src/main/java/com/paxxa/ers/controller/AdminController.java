package com.paxxa.ers.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paxxa.ers.service.AdminService;

@Transactional
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("/companies")
	public String companies(Model model) {
		model.addAttribute("companies", adminService.findAllCompanies());
		return "companies";
	}

	@RequestMapping("companies/{id}")
	public String companyUsers(Model model, @PathVariable int id) {
		model.addAttribute("users", adminService.findOneCompanyWithUsers(id));
		return "company-users";
	}
	
}
