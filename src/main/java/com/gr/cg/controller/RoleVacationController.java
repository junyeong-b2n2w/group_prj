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
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.VacationVO;
import com.gr.cg.service.VacationService;

@Controller
@RequestMapping("/role/vacation")
public class RoleVacationController {
	
	@Autowired
	private VacationService vacationService;
	
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session,ModelAndView model) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		Map<String,Object> dataMap = vacationService.getCountBySysdate(compno);
				   
		List<Map<String, Object>> mapList = vacationService.selectVactIngEmpCount(compno);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonList = mapper.writeValueAsString(mapList);
		URLEncoder.encode(jsonList,"utf-8");
		
		model.addObject("jsonList", jsonList);
		model.addObject("dataMap", dataMap);
		
		String url = "rolevact/main.open";
		model.setViewName(url);
		
		
		return model;
	}
	
	@RequestMapping("/list")
	public ModelAndView vactList(ModelAndView mnv,HttpSession session,SearchCriteria cri) throws SQLException{
		String url = "rolevact/list.open";

		int compno = ((EmployeeVO) session.getAttribute("loginUser")).getComp_no();
		cri.setComp_no(compno);
		
		Map<String, Object> dataMap = vacationService.getAllVactListByCompNo(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	@RequestMapping(path="/modifyYn", method=RequestMethod.POST)
	public String deleteDept(VacationVO vacation,HttpSession session, @RequestParam("vact_no") int vact_no,
											@RequestParam("vact_aprvyn") String vact_aprvyn,
											@RequestParam("vact_delyn")  String vact_delyn,RedirectAttributes ra) throws SQLException{

		String regUser = ((EmployeeVO) session.getAttribute("loginUser")).getEmp_id();
		
		vacation.setVact_regid(regUser);
		vacation.setVact_no(vact_no);
		vacation.setVact_aprvyn(vact_aprvyn);
		vacation.setVact_delyn(vact_delyn);
		
		vacationService.updateVacationConfirm(vacation);
		
		ra.addFlashAttribute("msg", "처리가  완료 됐습니다");
		
		return "redirect:/role/vacation/list";
	}
	@RequestMapping(value="/detailVactList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String empList(SearchCriteria2 cri,HttpSession session) throws Exception{
		

		List<VacationVO> vactList = vacationService.getVactListByVactId(cri);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonList = mapper.writeValueAsString(vactList);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	@RequestMapping(value="/chart2", method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String chart2() throws Exception{
		
		List<Map<String, Object>> dataMap = vacationService.getVactAprvDeptNoByChart2();
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonList = mapper.writeValueAsString(dataMap);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	@RequestMapping(value="/chart3", method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String chart3() throws Exception{
		
		List<Map<String, Object>> dataMap = vacationService.getVactAprvRankNoByChart3();
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonList = mapper.writeValueAsString(dataMap);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	@RequestMapping(value="/chart4", method=RequestMethod.GET,produces="application/json;charset=utf-8")
	@ResponseBody
	public String chart4() throws Exception{
		
		List<Map<String, Object>> dataMap = vacationService.getVactRemAvgByChart4();
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonList = mapper.writeValueAsString(dataMap);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}

}
