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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.AttendCommand;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttendanceVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.service.AttendanceService;

@Controller
@RequestMapping("/attend")
public class AttendanceController{
	
	@Autowired
	private AttendanceService searvice;
	
	@RequestMapping(value="/main",produces="appplication/json;charset=utf-8")
	public ModelAndView main(HttpSession session,ModelAndView model) throws Exception{
		
		
		String userid = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		AttendanceVO attvo  = new AttendanceVO();
		Date now = new Date(System.currentTimeMillis()); //현재 시간을 가져와 DATE로 저장
		DateFormat dformat = new SimpleDateFormat("yyyyMMdd");
		String parseNow = dformat.format(now);
		
		
		List<AttendanceVO> aList = searvice.getMyAttendenceListNotSearch(userid);
		
		for(AttendanceVO att : aList) {
			
			Date attendDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(att.getAttd_gtwtime());
			String parseADate = new SimpleDateFormat("yyyyMMdd").format(attendDate);
			if(parseADate.equals(parseNow)) {

				attvo.setAttd_empid(userid);
				attvo.setAttd_no(att.getAttd_no());
				attvo.setAttd_offwtime(att.getAttd_gtwtime());
				attvo.setAttd_workshape(att.getAttd_workshape());
			}
		}
		model.addObject("attend", attvo);
		
		model.setViewName("attend/main.open");
		return model;
	}
//	@RequestMapping(value="/list")
//	public String main(HttpSession session,Model model) throws Exception{
//		String userID = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
//		VacationVO anuualvo = vacationService.getAnnualCntByVactId(userID);
//		model.addAttribute("anuualvo", anuualvo);
//		return "vacation/list.open";
//	}
	@RequestMapping(value="/dailyList", method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String attendList(HttpSession session) throws Exception{
		
		String userID = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		List<Map<String, Object>> dataMap = searvice.getMyAttendListByDay(userID);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		String jsonList = mapper.writeValueAsString(dataMap);
		URLEncoder.encode(jsonList,"utf-8");
		
		
		return jsonList;
	}
	@RequestMapping(value="/myList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String attendMyList(HttpSession session,SearchCriteria2 cri) throws Exception{
		
		String userID = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		List<AttendCommand> dataMap = searvice.getMyAttendenceList(cri);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(dataMap);
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	@RequestMapping(value="/registAttend",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String registAttend(String attd_id,AttendanceVO attend) throws SQLException {
		
		attend.setAttd_empid(attd_id);
		
		int cnt = searvice.registMyAttendence(attend);
		String msg ="성공";
		if(cnt < 1) {
			msg ="실패";
		}
		return msg;
		
	}
	@RequestMapping(value="/updateOffWork",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String updateOffWork(int attd_no,AttendanceVO attend) throws SQLException {
		
		attend.setAttd_no(attd_no);
		
		int cnt = searvice.registMyOffWork(attend);
		String msg ="성공";
		if(cnt < 1) {
			msg ="실패";
		}
		
		return msg;
		
	}
	@RequestMapping(value="/checkAttend",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> checkAttend(String attd_id) throws ParseException{
		
		ResponseEntity<String> entity = null;
		Date now = new Date(System.currentTimeMillis()); //현재 시간을 가져와 DATE로 저장
		DateFormat dformat = new SimpleDateFormat("yyyyMMdd");
		String parseNow = dformat.format(now);
		
		
			try {
				List<AttendanceVO> attendList = searvice.getMyAttendenceListNotSearch(attd_id);
				for(AttendanceVO attend : attendList) {
					
					
					Date attendDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(attend.getAttd_gtwtime());
					String parseADate = new SimpleDateFormat("yyyyMMdd").format(attendDate);
					entity = new ResponseEntity<String>(parseADate.equals(parseNow) ? parseADate:"" ,HttpStatus.OK); //같은 값이 있으면 공백
				}
			} catch (SQLException e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
		
		return entity;
		
	}
	@RequestMapping(value="/checkGtwAttend",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> checkGtwAttend(String attd_id) throws ParseException{
		
		ResponseEntity<String> entity = null;
		try {
			List<AttendanceVO> attendList = searvice.getMyAttendenceListNotSearch(attd_id);
			for(AttendanceVO attend : attendList) {
				entity = new ResponseEntity<String>(attend.getAttd_workshape().equals("GAT03")? "성공":"실패" ,HttpStatus.OK); //같은 값이 있으면 공백
			}
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	@RequestMapping(value="/sendModReq",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> sendModReq(int attd_no,AttendanceVO attend) throws ParseException{
		
		attend.setAttd_no(attd_no);
		attend.setAttd_workshape("GAT06");
		ResponseEntity<String> entity = null;
		try {
			int up = searvice.updateAttd_workshape(attend);
				entity = new ResponseEntity<String>(up > 0  ? "성공":"실패" ,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	@RequestMapping(value="/modifyShape",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> modifyShape(int attd_no,AttendanceVO attend) throws ParseException{
		
		attend.setAttd_no(attd_no);
//		attend.setAttd_workshape("GAT06");
		ResponseEntity<String> entity = null;
		try {
			int up = searvice.updateAttd_workshape(attend);
			entity = new ResponseEntity<String>(up > 0  ? "성공":"실패" ,HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
//	@RequestMapping("/modify")
//	public String modify(VacationVO vact,RedirectAttributes ra) throws SQLException {
//		
//		vacationService.modifyMyVactById(vact);
//		
//		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
//		
//		return "redirect:/vacation/list";
//	}
}
