package com.gr.cg.controller;

import java.io.PrintWriter;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.EnglishVO;
import com.gr.cg.dto.NoticeVO;
import com.gr.cg.dto.PostVO;
import com.gr.cg.dto.TaskVO;
import com.gr.cg.dto.WidgetOrdVO;
import com.gr.cg.service.EnglishService;
import com.gr.cg.service.NoticeService;
import com.gr.cg.service.PostService;
import com.gr.cg.service.TaskService;
import com.gr.cg.service.WidgetOrderService;


@Controller
@RequestMapping("/widgetord")
public class WidgetOrderController {

	@Autowired
	private WidgetOrderService service;
	
	@Autowired
	private EnglishService enservice;
	
	@Autowired
	private TaskService taskservice;
	
	@Autowired
	private PostService postservice;
	
	@Autowired
	private NoticeService noticeservice;
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session,ModelAndView mnv) throws SQLException
	{
		String url = "common/main.open";
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		String empid = emp.getEmp_id();
		
		List<WidgetOrdVO> List = service.selectListOrd(empid);
		List<WidgetOrdVO> WidgetYN = service.selectWidgetYN(empid);
		
		
		EnglishVO en = enservice.getEnglishByEnglishNo();
		
		List<TaskVO> task = taskservice.selectWidgetNum(empid);
		
		
		int post_compno =  emp.getComp_no();
		List<PostVO> post = postservice.selectWidget(post_compno);
		
		List<NoticeVO> notice = noticeservice.selectwidget(post_compno);
		
		mnv.addObject("noticeList",notice);
		mnv.addObject("postList",post);
		mnv.addObject("taskList",task);
		mnv.addObject("envo",en);
		mnv.addObject("List",List);
		mnv.addObject("WidgetYN",WidgetYN);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	
	
	@RequestMapping("/update")
	public void update(HttpSession session,WidgetOrdVO vo,int wo_old) throws SQLException{
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		String empid = emp.getEmp_id();
		
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("wo_empid", empid);
		map.put("wo_wgno", vo.getWo_wgno());
		map.put("wo_ord", vo.getWo_ord());
		map.put("wo_old", wo_old);
		
		service.updateWidget(map);
		
		
	}
	@RequestMapping("/remove")
	public void remove(WidgetOrdVO vo,HttpServletResponse response) throws SQLException,Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		service.widgetdelYN(vo);
		
		out.println("삭제!!");
		
		
		
		
	}
	
}
