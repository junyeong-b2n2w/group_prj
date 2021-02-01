package com.gr.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.MenuVO;
import com.gr.cg.dto.NoticeVO;
import com.gr.cg.service.MenuService;
import com.gr.cg.service.NoticeService;


@Controller
public class CommonController {
	
	@Autowired
	private MenuService menuService;

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/common/loginForm")
	public String loginForm(@RequestParam(defaultValue="0")String error, HttpServletResponse response) {
		String url = "common/loginForm";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		return url;
	}
	
	
	@RequestMapping("/security/accessDenied")
	public void accessDenied(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('권한이 없습니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/loginTimeOut")
	public void loginTimeOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다. \\n다시 로그인 하세요!')");
		out.println("location.href='" + request.getContextPath() + "'");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/loginExpired")
	public void loginExpired(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('중복 로그인이 확인되었습니다. \\n다시 로그인 하면 다른 장치에서 로그인은 취소됩니다!')");
		out.println("location.href='" + request.getContextPath() + "'");
		out.println("</script>");
		out.close();
	}
	
	
	@RequestMapping("/common/main")
	public String main () {
		
		String url = "/common/main.open";
		
		return  url;
	}
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView index (@RequestParam(defaultValue="M000000")String mCode, ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/common/indexPage.page";
		
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		List<NoticeVO> noticeList = noticeService.getNoticeListByPopYNIsY(compno);
		
		List<MenuVO> menuList = menuService.getMainMenuList(compno);
		MenuVO menu = menuService.getMenuByMcode(mCode);
			
		mnv.addObject("noticeList", noticeList);
		mnv.addObject("menuList", menuList);
		mnv.addObject("menu", menu);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/common/cal")
	public String calculator() {
		return "common/cal.open"; 
	}
	
	
	@ResponseBody
	@RequestMapping(value="/common/subMenu",method=RequestMethod.GET)
	public ResponseEntity<List<MenuVO>> subMenu(String mCode, HttpServletResponse response) {
		
		ResponseEntity<List<MenuVO>> entity = null;
		
		try {
			List<MenuVO> subMenu = menuService.getSubMenuList(mCode);
			entity = new ResponseEntity<List<MenuVO>>(subMenu,HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/needPasswordChange")
	public ModelAndView needPasswordChange (ModelAndView mnv , String userid) {
		
		String url = "/common/needPasswordChange.open";
		
		
		mnv.addObject("id", userid);
		mnv.setViewName(url);
		return  mnv;
	}
	
	
}

