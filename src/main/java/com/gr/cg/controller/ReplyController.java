package com.gr.cg.controller;

import java.io.IOException;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.ReplyVO;
import com.gr.cg.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@RequestMapping("/main")
	public void main() {}
	
	
	@RequestMapping("/regist")
	public void regist(ReplyVO reply,HttpSession session,HttpServletResponse response,HttpServletRequest request)throws IOException,SQLException {
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		reply.setRe_writerid(emp.getEmp_id());
		
		service.insertReply(reply);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(reply.getRe_cont());
		out.close();
	}
	
	
	@RequestMapping(value="/list" , produces="application/json;charset=utf-8")
	@ResponseBody
	public String list(int re_postno)throws SQLException,Exception {
		
		List<ReplyVO> replyList = service.getReplyList(re_postno);
		
		
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(replyList);
		
		
		return jsonList;
	}
	
	
	@RequestMapping("/modify")
	@ResponseBody
	public void modify(ReplyVO reply,HttpServletResponse response,HttpServletRequest request)throws SQLException,IOException {
		service.modifyReply(reply);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(reply.getRe_cont());
		
	}
	@RequestMapping("/remove")
	public void remove(int re_no,HttpServletResponse response,HttpServletRequest request,ReplyVO reply)throws SQLException,IOException {
		
		
		service.removeReply(re_no);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(reply.getRe_cont());
		
	}
}

