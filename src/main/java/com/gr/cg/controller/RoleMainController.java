package com.gr.cg.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.RankVO;
import com.gr.cg.service.RoleMainService;




@Controller
@RequestMapping("/role")
public class RoleMainController {

	@Autowired
	private RoleMainService roleMainService;
	
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session,ModelAndView mnv)throws Exception {
		
		int comp_no = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		
		Map<String, Object> dataMap = roleMainService.getRoleMainChart(comp_no);
		
		
		String url ="/role/main.open";
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
}
