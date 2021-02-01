package com.gr.cg.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gr.cg.command.TaskCommand;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.PerformerVO;
import com.gr.cg.dto.PostVO;
import com.gr.cg.service.PerformerService;
import com.gr.cg.service.TaskService;
import com.gr.cg.utils.CryptoAria;
import com.itextpdf.text.log.SysoCounter;

@Controller
@RequestMapping("/performer")
public class PerformerController {
	
	@Resource(name="logoUploadPath")
	private String uploadPath;
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	
	
	@Autowired
	private TaskService service;
	
	@Autowired
	private PerformerService performerService;
	
	@RequestMapping("/main")
	public void main() {}
	@RequestMapping("/registForm")
	public void registForm() {}
	@RequestMapping("/regist")
	public void regist() {}
	@RequestMapping("/list")
	public void list() {}
	@RequestMapping("/detail")
	public void detail() {}
	@RequestMapping("/modify")
	
	public void modify(PerformerVO performer,TaskCommand taskComand,HttpSession session,HttpServletResponse response)throws Exception {
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(performer.getPerf_stt().equals("승인")) {
			
			performer.setPerf_empid(emp.getEmp_id());
			service.BusinessApprovalTask(taskComand);
			performerService.BusinessApprovalPer(performer);
			
			out.println("승인 완료");
			
		}
		else if(performer.getPerf_stt().equals("반려")){
			
			performer.setPerf_empid(emp.getEmp_id());
			performerService.BusinessApprovalPerfBack(performer);
			
			
			List<PerformerVO> performerList = performerService.selectReturnPerformerList(performer.getPerf_tascno());
			List<String> sttvalueList = new ArrayList<String>(); 	
			
			
			for(int i=0; i<performerList.size(); i++) {
					sttvalueList.add(performerList.get(i).getPerf_stt());
			}
			if(!(sttvalueList.contains("승인") || sttvalueList.contains("대기"))) {
				service.BusinessApprovalTaskBack(taskComand);
			}
			out.println("반려 완료");
		}
		
	}
	
	@RequestMapping("/performermodify")
	public void modify(HttpSession session,PerformerVO per,HttpServletResponse response,HttpServletRequest request,int[] ta_no,@RequestParam(value="delfile",required=false )int[] delfile)
			throws SQLException, Exception {
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		per.setPerf_empid(emp.getEmp_id());
		performerService.insertProcessingHistory(per,ta_no,emp.getEmp_id(),uploadPath, delfile);
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		out.println("등록 완료");
		out.close();
	}
	
	@RequestMapping("/remove")
	public void remove() {}
}

