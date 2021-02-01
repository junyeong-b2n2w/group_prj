package com.gr.cg.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.MandateVO;
import com.gr.cg.service.EmpService;
import com.gr.cg.service.GChartService;
import com.gr.cg.service.MandateService;

@Controller
@RequestMapping("/mandate")
public class MandateController {
	
	@Autowired
	private MandateService mandateService;
	
	@Autowired
	private GChartService gChartService;
	
	@RequestMapping("/main")
	public ModelAndView mdtList(HttpSession session, SearchCriteria cri, ModelAndView mnv) throws Exception{
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		List<Map<String, Object>> mdtList = new ArrayList<Map<String, Object>>();
		List<GChartVO> deptList = gChartService.getDeptList(compno);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		String url = "approval/mandate.open";
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(deptList);
	
		mdtList = mandateService.getMdtList(id);
		dataMap = gChartService.getAllListBySearchCri(cri);
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("deptList", jsonList);
		mnv.addObject("mdtList", mdtList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/unset", method=RequestMethod.POST)
	public void setUnset(@RequestParam(value="unsetArr[]") List<String> unset) throws SQLException{
		mandateService.setUnset(unset);
	}
	
	@RequestMapping(value="/regMandate", method=RequestMethod.POST)
	public void regMandate(MandateVO mdt, HttpSession session,  SearchCriteria cri, ModelAndView mnv, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		mdt.setMdt_empid(id);
		
		mandateService.setMandate(mdt);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert(\"결재권한이 위임되었습니다.\");");
		out.println("location.href = \""+request.getContextPath()+"/mandate/main\";");
		out.println("</script>");
		
		out.close();
	}
	
}
