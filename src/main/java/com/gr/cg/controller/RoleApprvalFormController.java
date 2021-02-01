package com.gr.cg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.ComponentVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.service.ApprovalFormService;
import com.gr.cg.service.ComponentService;




@Controller
@RequestMapping("/role/aprvform")
public class RoleApprvalFormController {

	@Autowired
	private ApprovalFormService approvalFormService;
	@Autowired
	private ComponentService componentService;
	

	@RequestMapping("/list")
	public ModelAndView approvalFormList(SearchCriteria cri, ModelAndView mnv, HttpSession session) {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		
		cri.setComp_no(compno);
		
		Map<String, Object> dataMap = approvalFormService.selectApprovalFormListByCRI(cri);
		
		mnv.addAllObjects(dataMap);
		
		mnv.setViewName("role/apprvformlist.open");
		return mnv;
	}
	
	@RequestMapping("/registform")
	public ModelAndView approvalFormRegistForm( ModelAndView mnv) {
		
		List<ComponentVO> componentList = componentService.selectComponentList();
		
		mnv.addObject("componentList", componentList);
		mnv.setViewName("role/apprvformregist.open");
		
		
		return mnv;
	}
	
	
	@RequestMapping("/regist")
	@ResponseBody
	public ResponseEntity<String> approvalFormRegist(ApprovalFormVO approvalFormVO, String componentArr, Model model) {
		ResponseEntity<String> entity = null;

		System.out.println(approvalFormVO);
		System.out.println(componentArr);
		
		componentArr = componentArr.substring(1,componentArr.length()-1);
		approvalFormService.registApprovalForm(approvalFormVO, componentArr);
		
		return entity;
	}
	
	
	
	
	//수정하기
	@RequestMapping("/modify")
	@ResponseBody
	public ResponseEntity<String> approvalFormModify(ApprovalFormVO approvalFormVO, String componentArr, Model model) {
		ResponseEntity<String> entity = null;

		System.out.println(approvalFormVO);
		System.out.println(componentArr);
		
		componentArr = componentArr.substring(1,componentArr.length()-1);
		approvalFormService.updateApprovalForm(approvalFormVO,componentArr);
		
		try {
			
			entity = new ResponseEntity<String>(""+approvalFormVO.getAf_no(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public ResponseEntity<ApprovalFormVO> approvalFormDetail(int af_no, Model model) {
		ResponseEntity<ApprovalFormVO> entity = null;

		ApprovalFormVO approvalFormVO = approvalFormService.selectApprovalFormByAFNO(af_no);
		
		try {
			
			entity = new ResponseEntity<ApprovalFormVO>(approvalFormVO, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ApprovalFormVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	
	
	@RequestMapping("/componentdetail")
	@ResponseBody
	public ResponseEntity<ComponentVO> componentDetail(int cp_no, Model model) {
		ResponseEntity<ComponentVO> entity = null;

		ComponentVO componentVO = componentService.selectComponentByCPNO(cp_no);
		
		try {
			
			entity = new ResponseEntity<ComponentVO>(componentVO, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ComponentVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	
	
	@RequestMapping("/modifyform")
	public ModelAndView approvalFormModifyForm(ModelAndView mnv) {
		
		List<ComponentVO> componentList = componentService.selectComponentList();
		
		mnv.addObject("componentList", componentList);
		mnv.setViewName("role/apprvformmodify.open");
		
		
		return mnv;
	}
	
	
	@RequestMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> approvalFormReomve(int af_no, Model model) {
		ResponseEntity<String> entity = null;
		
		approvalFormService.deleteApprovalForm(af_no);

		
		try {
			
			entity = new ResponseEntity<String>( HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
}

