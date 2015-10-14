package com.paxxa.ers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paxxa.ers.service.ConsultantService;
import com.paxxa.ers.service.MenagerService;

@Controller
public class MenagerController {

	@Autowired
	private MenagerService menagerService;

	@Autowired
	private ConsultantService consultantService;
	
	@RequestMapping("/menagers")
	public String menagers(Model model) {
		model.addAttribute("menagers", menagerService.findAll());
		return "menagers";
	}

	@RequestMapping("/consultants")
	public String consultants(Model model) {
		model.addAttribute("consultants", consultantService.findAll());
		return "consultants";
	}

	@RequestMapping("consultants/{id}")
	public String consultant(Model model, @PathVariable int id){
		model.addAttribute("consultant", consultantService.findOne(id));
		return "consultant-detail";
		
		
	}
}
