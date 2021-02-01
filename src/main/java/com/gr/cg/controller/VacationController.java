package com.gr.cg.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.VacationVO;
import com.gr.cg.service.VacationService;

@Controller
@RequestMapping("/vacation")
public class VacationController{
	
	@Autowired
	private VacationService vacationService;
	
	
	@RequestMapping(value="/list")
	public String main(HttpSession session,Model model) throws Exception{
		String userID = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		VacationVO anuualvo = vacationService.getAnnualCntByVactId(userID);
		model.addAttribute("anuualvo", anuualvo);
		return "vacation/list.open";
	}
	@RequestMapping(value="/getlist", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String empList(SearchCriteria2 cri) throws Exception{
		
		
		List<VacationVO> vactList = vacationService.getVactListByVactId(cri);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String jsonList = mapper.writeValueAsString(vactList);
		URLEncoder.encode(jsonList,"utf-8");
		
		
		return jsonList;
	}
	@RequestMapping("/regist")
	public String regist(HttpSession session,VacationVO vact,RedirectAttributes ra) throws SQLException {
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		int compno = (emp.getComp_no());
		vact.setVact_compno(compno);
		
		vacationService.registVactById(vact, emp.getDept_no());
		
		ra.addFlashAttribute("msg", "휴가가 신청되었습니다");
		
		return "redirect:/vacation/list";
	}
	@RequestMapping("/modify")
	public String modify(VacationVO vact,RedirectAttributes ra) throws SQLException {
		
		vacationService.modifyMyVactById(vact);
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		
		return "redirect:/vacation/list";
	}
}
