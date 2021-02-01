package com.gr.cg.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.service.EmpService;
import com.gr.cg.service.GChartService;

@Controller
@RequestMapping("/gchart")
public class GChartController {
	
	@Autowired
	private GChartService service;
	
	@Autowired
	private EmpService empService;
	
	
	@RequestMapping("/list")
	public ModelAndView deptList(ModelAndView model,SearchCriteria cri,HttpSession session) throws Exception{
		
		String url ="gchart/main.open";
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		cri.setComp_no(compno);
		
		List<GChartVO> deptList =service.getDeptList(compno);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(deptList);

		model.addObject("deptList", jsonList);
		
		model.setViewName(url);
		return model;

	}
	@RequestMapping(value="/empList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String empList(SearchCriteria2 cri,HttpSession session) throws Exception{
		
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		cri.setCompno(compno);

		List<GChartVO> empList= service.getEmpList(cri);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(empList);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
		
	@RequestMapping(value="/detailEmp", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String empList(String emp_id,ModelAndView mnv) throws Exception{
		

		Map<String,Object> emp =  empService.GetEmpByEmpId(emp_id);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(emp.get("empVO"));
		
		return jsonData;

	}	
	
	@RequestMapping("/registForm")
	public void registForm() {}
	@RequestMapping("/regist")
	public void regist() {}
	@RequestMapping("/detail")
	public void detail() {}
	@RequestMapping("/modifyForm")
	public void modifyForm() {}
	@RequestMapping("/modify")
	public void modify() {}
	@RequestMapping("/remove")
	public void remove() {}

	
}

