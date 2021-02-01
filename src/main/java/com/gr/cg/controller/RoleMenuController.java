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
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.MenuVO;
import com.gr.cg.dto.NoticeVO;
import com.gr.cg.service.MenuService;

@Controller
public class RoleMenuController {
	@Autowired
	private MenuService menuService;
	
	

	@RequestMapping(value="/role/menu", method=RequestMethod.GET)
	public ModelAndView menu (ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/rolemenu/list.open";
		
		
		
		List<MenuVO> allMenuList = menuService.getAllMainMenuList();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("allMenuList",allMenuList);
		
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/role/getActiveMenu", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<MenuVO>> getActiveMenu (ModelAndView mnv, HttpSession session) throws SQLException{
		ResponseEntity<List<MenuVO>> entity = null;
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		List<MenuVO> activeMenuList = menuService.getMainMenuList(compno);
		
		try {
			entity = new ResponseEntity<List<MenuVO>>(activeMenuList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>( HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/role/changeMenu", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> changeMenu ( @RequestParam(value="checkMenuList[]", required = false) List<String> checkMenuList, ModelAndView mnv, HttpSession session) throws SQLException{
		ResponseEntity<String> entity = null;
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		menuService.changeMenuList(checkMenuList, compno);
		
		try {
			entity = new ResponseEntity<String>("성공" , HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>( HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}