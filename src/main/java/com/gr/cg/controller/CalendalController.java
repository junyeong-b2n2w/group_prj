package com.gr.cg.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gr.cg.dto.CalendarVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.service.CalendarService;

@Controller
@RequestMapping("/cal")
public class CalendalController {
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("/main")
	public String main() {
		String url = "calendar/calendar.open";
		
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/registCalendar", method=RequestMethod.POST)
	public ResponseEntity<CalendarVO> registCalendar(CalendarVO cal, HttpSession session) throws SQLException {
		ResponseEntity<CalendarVO> entity = null;
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		cal.setCal_id(id);
		
		try {
			int seq = calendarService.addCalendar(cal);
			cal.setCal_no(seq);
			
			entity = new ResponseEntity<CalendarVO>(cal, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CalendarVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateCalendar", method=RequestMethod.POST)
	public ResponseEntity<CalendarVO> updateCalendar(CalendarVO cal, HttpSession session) throws SQLException {
		ResponseEntity<CalendarVO> entity = null;
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		cal.setCal_id(id);
		
		try {
			int seq = calendarService.updateCalendar(cal);
			cal.setCal_no(seq);
			
			entity = new ResponseEntity<CalendarVO>(cal, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CalendarVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteCalendar", method=RequestMethod.POST)
	public ResponseEntity<Integer> deleteCalendar(int cal_no, HttpSession session) throws SQLException {
		ResponseEntity<Integer> entity = null;
		
		try {
			int seq = calendarService.deleteCalendar(cal_no);
			
//			entity = new ResponseEntity<CalendarVO>(cal, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/getCalendarList", method=RequestMethod.POST)
	public ResponseEntity<List<CalendarVO>> getCalendarList(String date, @RequestParam(value="typeList[]") List<String> typeList, HttpSession session) throws SQLException{
		ResponseEntity<List<CalendarVO>> entity = null;
		List<CalendarVO> calendar = null;
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
//		put map
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cal_id", id);
		paramMap.put("typeList", typeList);
		paramMap.put("date", date);
		
		calendar = calendarService.getCalendarList(paramMap);
		
		try {
			entity = new ResponseEntity<List<CalendarVO>>(calendar, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CalendarVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
