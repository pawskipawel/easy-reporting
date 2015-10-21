package com.paxxa.ers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	
	@RequestMapping("/logout-info")
	public String logout(){
		return "logout-info";
	}

}
