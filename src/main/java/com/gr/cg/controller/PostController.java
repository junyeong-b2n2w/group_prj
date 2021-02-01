package com.gr.cg.controller;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.PostVO;
import com.gr.cg.dto.TaskVO;
import com.gr.cg.service.PostService;
import com.gr.cg.utils.CryptoAria;

@Controller
@RequestMapping("/post")
public class PostController {
	@Resource(name="logoUploadPath")
	private String uploadPath;
	
	@Autowired
	private PostService service;
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;

	@RequestMapping("/main")
	public void main() {}
	
	
	
	@RequestMapping("/registpost")
	public ModelAndView registpost(ModelAndView mnv,int post_brdno) {
		
		String url = "board/registpost.open";
		PostVO post = new PostVO();
		post.setPost_brdno(post_brdno);
		
		
		mnv.addObject("postvo",post);
		mnv.setViewName(url);
		
		
		return mnv;
	}
	
	@RequestMapping("/regist")
	public void regist(PostVO post, HttpSession session,HttpServletResponse response,HttpServletRequest request,int[] ta_no)throws IOException,SQLException {
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		post.setPost_pbls(emp.getEmp_id());
		post.setPost_compno(emp.getComp_no());
		
		
		
		service.registPost(post,ta_no,emp.getEmp_id(),uploadPath);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("등록 완료 !!");
	}
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv,int post_brdno)throws SQLException, Exception {
		

		String url = "/board/authority_board.open";
		
		
		PostVO post = new PostVO();
		post.setPost_brdno(post_brdno);
		
		
		mnv.addObject("postvo",post);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/cri",produces="application/json;charset=utf-8")
	@ResponseBody
	public String cri (SearchCriteria2 cri)throws Exception {
		
		List<PostVO> list =service.getPostList(cri);
		
		ObjectMapper obj = new ObjectMapper();
		String List = obj.writeValueAsString(list);
		
		
		
		return List;
		
	}
	
	
		@RequestMapping("/detail")
		public ModelAndView detail(HttpSession session,int post_no, ModelAndView mnv) throws SQLException {
		
		
		PostVO post = new PostVO();
		
		
		post = service.getPostByPostNo(post_no);
		
		
		
		List<AttachVO> attachList = service.selectFileList(post_no);
		
		for(int i=0; i < attachList.size(); i++) {
			String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			attachList.get(i).setAttc_key(t);
		}
		
		String url = "board/detail.open";
		
		mnv.setViewName(url);
		mnv.addObject("post", post);
		mnv.addObject("attachList", attachList);
		
		return mnv;
	}
	
	
	@RequestMapping("/modify")
	@ResponseBody
	public void modify(HttpSession session,PostVO post,HttpServletResponse response,HttpServletRequest request,int[] ta_no,@RequestParam(value="delfile",required=false )int[] delfile)throws SQLException,IOException {
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		post.setPost_pbls(emp.getEmp_id());
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(!(emp.getEmp_id().equals(post.getPost_pbls()))) {
			
			out.println("수정 불가능!!");
			out.close();

		} else{
			
		service.modifyPost(post,ta_no,emp.getEmp_id(),uploadPath, delfile);
			out.println("수정 완료!!");
			out.close();
		}
		
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public void remove(int post_no,String post_pbls,HttpSession session,HttpServletResponse response,HttpServletRequest request)throws SQLException,IOException{		
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!(emp.getEmp_id().equals(post_pbls))) {
			
			out.println("삭제 불가능!!");

		} else{
			
			out.println("삭제 완료!!");
			service.removePost(post_no);
			
		}
		
		
	}
}

