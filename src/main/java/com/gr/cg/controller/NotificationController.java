package com.gr.cg.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.AttendCommand;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttendanceVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NotificationVO;
import com.gr.cg.service.AttendanceService;
import com.gr.cg.service.NotificationService;

@Controller
@RequestMapping("/attend/test")
public class NotificationController{
	
	@Autowired
	private NotificationService service;
	
	@RequestMapping("/main")
	public String main() {
		return "noti/main.open";
	}
	@RequestMapping(value="/toastList", method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String toastList(HttpSession session) throws Exception{
		
		String userID = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();

		List<NotificationVO> notiList = service.getMyAlramLustFromToast(userID);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		String jsonList = mapper.writeValueAsString(notiList);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	@RequestMapping(value="/changeRead", method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String changeRead(HttpSession session,int noti_no,NotificationVO noti) throws Exception{
		
		String userID = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		noti.setNoti_recid(userID);
		noti.setNoti_no(noti_no);
		
		int cnt = service.updateReadYnIsN(noti);
		
		String msg = "성공";
		if(cnt < 0 ) {
			msg = "실패";
		}
		
		return msg;
	}
	
	@RequestMapping(value="/alramList",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String alramList(SearchCriteria2 cri,HttpSession session)throws SQLException, JsonProcessingException{
		
		String userId = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		cri.setSearchno(userId);
		List<NotificationVO> notiList =  service.getMyAlramList(cri);
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(notiList);
		return jsonList;
	}
	
}
