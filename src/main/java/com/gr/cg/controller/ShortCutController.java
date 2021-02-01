package com.gr.cg.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.ShortcutVO;
import com.gr.cg.service.ShortCutService;
@Controller
public class ShortCutController {

	@Autowired
	private ShortCutService shortCutService;
	
	@RequestMapping("/mypage/shortcut")
	public ModelAndView myshortcut(ModelAndView mnv, HttpSession session) {
			
		String emp_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		List<ShortcutVO> scList = shortCutService.selectShortCutList(emp_id);
		
		mnv.addObject("scList", scList);
		mnv.setViewName("mypage/shortcut.open");
		return mnv;
	}
	
	@RequestMapping("/mypage/getShortCut")
	public ResponseEntity<List<ShortcutVO>> myshortcutList(HttpSession session) {
		
		ResponseEntity<List<ShortcutVO>> entity = null;
		
		String emp_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		List<ShortcutVO> scList = shortCutService.selectShortCutList(emp_id);
		
		try {
			entity = new ResponseEntity<List<ShortcutVO>>(scList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<ShortcutVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	
	
	@ResponseBody
	@RequestMapping("/mypage/regist")
	public ResponseEntity<String> registShortCut(ShortcutVO scVO, HttpSession session) {
			
		ResponseEntity<String > entity = null;
		
		String emp_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		scVO.setShc_id(emp_id);

		try {
			int result = shortCutService.insertShortCut(scVO);
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>( HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		return entity;
	}
	
	
	@ResponseBody
	@RequestMapping("/mypage/modify")
	public ResponseEntity<String> modifyShortCut(ShortcutVO scVO, HttpSession session) {
			
		ResponseEntity<String > entity = null;
		
		String emp_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		scVO.setShc_id(emp_id);

		try {
			int result = shortCutService.updateShortCut(scVO);
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>( HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/mypage/remove")
	public ResponseEntity<String> removeShortCut( @RequestParam(value="shc_no_list[]") List<String> shc_no_list) {
			
		ResponseEntity<String > entity = null;
		
		try {
			int result = shortCutService.deleteShortCut(shc_no_list);
			entity = new ResponseEntity<String>(""+result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>( HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		return entity;
	}
}
