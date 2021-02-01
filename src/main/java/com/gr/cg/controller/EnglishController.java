package com.gr.cg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.cg.service.EnglishService;

@Controller
@RequestMapping("/english")
public class EnglishController {
	
	@Autowired
	private EnglishService service;
	
	@RequestMapping("/main")
	public void main() {}
	@RequestMapping("/registForm")
	public void registForm() {}
	@RequestMapping("/regist")
	public void regist() {}
	@RequestMapping("/list")
	public void list() {}
	@RequestMapping("/detail")
	public void detail() {}
	@RequestMapping("/modifyForm")
	public void modifyForm() {}
	@RequestMapping("/modify")
	public void modify() {}
	@RequestMapping("/remove")
	public void remove() {}
}

