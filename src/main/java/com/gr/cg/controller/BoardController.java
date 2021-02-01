package com.gr.cg.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.dto.BoardVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.service.BoardService;

@Controller
@RequestMapping("/role/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("/insert")
	public String insert(BoardVO board ,HttpSession session)throws SQLException{
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		board.setBoard_compno(emp.getComp_no());
	    board.setBoard_crt(emp.getEmp_id());
	    
	    service.insertBoard(board);
	    
	    return "roleboard/lists.open";
	}
	
	
	@RequestMapping(value="/list" , produces="application/json;charset=utf-8")
	@ResponseBody
	public String list(HttpSession session)throws SQLException ,Exception{
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		int comno = emp.getComp_no();
		
		List<BoardVO> boardList = service.selectBoardList(comno);
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(boardList);
		
		
		return jsonList;
	}
	@RequestMapping(value="/listpage")
	public ModelAndView Alllist(BoardVO board,HttpSession session,ModelAndView mnv)throws SQLException ,Exception{
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		board.setBoard_compno(emp.getComp_no()); 
		int comno = emp.getComp_no();
		
		List<BoardVO> boardList = service.selectBoardAllList(board);
		List<BoardVO> YboardList = service.selectBoardList(comno);
		String url = "roleboard/lists.open";
		
		mnv.addObject("NboardList",boardList);
		mnv.addObject("YboardList",YboardList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/lists" , produces="application/json;charset=utf-8")
	@ResponseBody
	public String lists(HttpSession session)throws SQLException ,Exception{
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		int comno = emp.getComp_no();
		
		List<BoardVO> boardList = service.selectBoardList(comno);
		
		
		ObjectMapper mapper = new ObjectMapper();
		String boardLists = mapper.writeValueAsString(boardList);
		
		
		return boardLists;
	}
	
	
	
	@RequestMapping("/modify")
	@ResponseBody
	public void modify(BoardVO board,HttpServletResponse response,HttpServletRequest request,HttpSession session)throws Exception,SQLException{
		
		
		response.setContentType("text/html;charset=utf-8");
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		board.setBoard_compno(emp.getComp_no());
		
		service.ModifyBoard(board);
		
		PrintWriter out = response.getWriter();
		out.println("수정 완료!!");
	}
	
	
	@RequestMapping("/remove")
		public void remove(HttpSession session,BoardVO board)throws SQLException{
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		board.setBoard_compno(emp.getComp_no());
		
		
		service.BoardDelete(board);
		
	}
	
}
