package com.gr.cg.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttendanceVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.VacationVO;
import com.gr.cg.service.AttendanceService;
import com.gr.cg.service.VacationService;

@Controller
@RequestMapping("/role/attend")
public class RoleAttendController {
	
	@Autowired
	private AttendanceService searvice;
	
	@RequestMapping("/main")
	public ModelAndView attendList(HttpSession session,ModelAndView model) throws SQLException {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		Map<String,Object> dataMap = searvice.getDailyCountForAdmin(compno);
		
		model.addAllObjects(dataMap);
				   
		model.setViewName("roleattd/main.open");
		
		return model;
	}
	
//	@RequestMapping("/list")
//	public ModelAndView vactList(ModelAndView mnv,HttpSession session,SearchCriteria cri) throws SQLException{
//		String url = "rolevact/list.open";
//
//		int compno = ((EmployeeVO) session.getAttribute("loginUser")).getComp_no();
//		cri.setComp_no(compno);
//		
//		Map<String, Object> dataMap = vacationService.getAllVactListByCompNo(cri);
//		
//		mnv.addAllObjects(dataMap);
//		mnv.setViewName(url);
//		return mnv;
//		
//	}
//	
//	
	@RequestMapping(path="/modifyAttend", method=RequestMethod.POST)
	public String deleteDept(AttendanceVO attend, @RequestParam("attd_no") int attd_no,
											@RequestParam("attd_gtwtime") String attd_gtwtime,
											@RequestParam("attd_offwtime")  String attd_offwtime,RedirectAttributes ra) throws SQLException{

		String change_attd_workshape = "";
		Map<String, Object> attend2 = searvice.getDetailAttendByAttdNo(attd_no);
		
		for (String mapkey : attend2.keySet()){
			
			if(attend2.get("ATTD_OFFWTIME") == null || attend2.get("ATTD_OFFWTIME") == "" ) {
				change_attd_workshape = "GAT03";
			}else {
				change_attd_workshape = "GAT01";
			}
	    }

		attend.setAttd_no(attd_no);
		attend.setAttd_workshape(change_attd_workshape);
		attend.setAttd_gtwtime(attd_gtwtime);
		attend.setAttd_offwtime(attd_offwtime);

		searvice.modifyMyAttendence(attend);
		
		ra.addFlashAttribute("msg", "수정  완료 됐습니다");
		
		return "redirect:/role/attend/main";
	}
//	@RequestMapping(value="/chart4", method=RequestMethod.GET,produces="application/json;charset=utf-8")
//	@ResponseBody
//	public String chart4() throws Exception{
//		
//		List<Map<String, Object>> dataMap = vacationService.getVactRemAvgByChart4();
//		
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
//		String jsonList = mapper.writeValueAsString(dataMap);
//		URLEncoder.encode(jsonList,"utf-8");
//		
//		return jsonList;
//	}
	@RequestMapping(value="/attdList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String attdList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> list =searvice.getAllAttendListForAdmin(cri);
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String detail(int attd_no, Model model) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> dataMap = searvice.getDetailAttendByAttdNo(attd_no);
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		String jsonList = mapper.writeValueAsString(dataMap);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/disabledAttend",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String disabledAttend(int attd_no,AttendanceVO attend) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		
		attend.setAttd_no(attd_no);
		attend.setAttd_workshape("GAT07");
		int chk = searvice.modifyAttendWorkshapeByAttdNo(attend);
		String chkVal = "";
		if(chk > 0) {
			chkVal ="성공";
		}else {
			chkVal ="실패";
			
		}
		ObjectMapper mapper = new ObjectMapper();
		String jsonData = mapper.writeValueAsString(chkVal);
		URLEncoder.encode(jsonData,"utf-8");
		return jsonData;
	}

}
