package com.gr.cg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role/poll")
public class RolePollController {
	@RequestMapping("main")
	public String main() {
		return "/rolepoll/main.open";
	}
	
	@RequestMapping("registForm")
	public String registForm() {
		return "/rolepoll/registForm.open";
	}
	
	@RequestMapping("/regist")
	public void regist() {
		
	}
}
