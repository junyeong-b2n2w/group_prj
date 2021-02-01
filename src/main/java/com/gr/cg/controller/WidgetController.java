package com.gr.cg.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.WidgetVO;
import com.gr.cg.service.WidgetService;

@Controller
@RequestMapping("/widget")
public class WidgetController {

	@Autowired
		private WidgetService service;
	
}
