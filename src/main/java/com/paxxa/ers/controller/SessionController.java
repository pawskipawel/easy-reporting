package com.paxxa.ers.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SessionController {

	@RequestMapping("/expired-session")
	public String expiredSession() {
		return "expired-session";
	}
}
