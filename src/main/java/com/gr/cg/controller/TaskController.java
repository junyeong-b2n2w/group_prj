package com.gr.cg.controller;

import java.io.PrintWriter;
import java.lang.reflect.Parameter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TaskCommand;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.PerformerVO;
import com.gr.cg.dto.TaskVO;
import com.gr.cg.service.GChartService;
import com.gr.cg.service.PerformerService;
import com.gr.cg.service.TaskService;
import com.gr.cg.utils.CryptoAria;

@Controller
@RequestMapping("/task")
public class TaskController {
	
	@Autowired
	private TaskService service;
	
	@Autowired
	private PerformerService performerService;
	
	@Autowired
	private GChartService gService;

	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@Resource(name="logoUploadPath")
	private String uploadPath;
	
	@RequestMapping("/main")
	public void main(){
	
	}
	
	
	@RequestMapping("/regist")
	public void regist(TaskCommand taskComand,PerformerVO performer,HttpSession session,HttpServletResponse response,int[] ta_no)throws Exception {
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		taskComand.setTask_empid(emp.getEmp_id());
		
		
		service.registTask(taskComand,performer, ta_no,emp.getEmp_id(),uploadPath);
		
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		out.print("등록 완료");
		out.flush();
		out.close();
	}
	
	
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv,SearchCriteria2 cri,HttpSession session)throws Exception {
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		List<GChartVO> deptList = gService.getDeptList(compno);
		List<GChartVO> empList = new ArrayList<GChartVO>();
		String url = "task/list.open";
		for(GChartVO vo : deptList) {
			empList = gService.getGhartEmpList(vo.getDept_no());
			vo.setEmpList(empList);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(deptList);
		mnv.addObject("deptList",jsonList);
		mnv.setViewName(url);
		return mnv;

	}
	@RequestMapping("/receivelist")
	public ModelAndView receivelist(ModelAndView mnv,SearchCriteria2 cri,HttpSession session)throws Exception {
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		List<GChartVO> deptList = gService.getDeptList(compno);
		List<GChartVO> empList = new ArrayList<GChartVO>();
		String url = "task/receivelist.open";
		for(GChartVO vo : deptList) {
			empList = gService.getGhartEmpList(vo.getDept_no());
			vo.setEmpList(empList);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(deptList);
		mnv.addObject("deptList",jsonList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("/workreturnlist")
	public ModelAndView workreturn(ModelAndView mnv,SearchCriteria2 cri,HttpSession session)throws Exception {
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		List<GChartVO> deptList = gService.getDeptList(compno);
		List<GChartVO> empList = new ArrayList<GChartVO>();
		String url = "task/workreturnlist.open";
		for(GChartVO vo : deptList) {
			empList = gService.getGhartEmpList(vo.getDept_no());
			vo.setEmpList(empList);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(deptList);
		mnv.addObject("deptList",jsonList);
		mnv.setViewName(url);
		return mnv;
		
	}
	
	
	//TaskList
	@RequestMapping(value="/cri",produces="application/json;charset=utf-8")
	@ResponseBody
	public String cri (SearchCriteria2 cri,HttpSession session)throws Exception {
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		cri.setSearchno(emp.getEmp_id());
		List<TaskVO> list =service.getTaskList(cri);
		ObjectMapper obj = new ObjectMapper();
		String List = obj.writeValueAsString(list);
		
		return List;
		
	}
	// TaskReceiveList 수신목록
	@RequestMapping(value="/cri2",produces="application/json;charset=utf-8")
	@ResponseBody
	public String cri2 (SearchCriteria2 cri,HttpSession session)throws Exception {
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		cri.setSearchno(emp.getEmp_id());
		List<TaskVO> list =service.selectTaskReceiveList(cri);
		ObjectMapper obj = new ObjectMapper();
		String List = obj.writeValueAsString(list);
		
		return List;
		
	}
	
	//TaskReturnList 반려 목록
	@RequestMapping(value="/cri3",produces="application/json;charset=utf-8")
	@ResponseBody
	public String cri3 (SearchCriteria2 cri,HttpSession session)throws Exception {
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		cri.setSearchno(emp.getEmp_id());
		
		List<TaskVO> list =service.selectTaskReceiveList(cri);
		
		ObjectMapper obj = new ObjectMapper();
		String List = obj.writeValueAsString(list);
		
		return List;
		
	}
	
	
	@RequestMapping("/receivedetail")
	public ModelAndView receivedetail(TaskVO task,PerformerVO performer,HttpSession session,ModelAndView mnv,int tasc_no,String perf_empid,@RequestParam(value="from",required=false )int from)throws Exception {
		String url = "task/receivedetail.open";
		
		List<AttachVO> attachList = service.selectFileList(tasc_no);
		
		
		for(int i=0; i < attachList.size(); i++) {
			String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			attachList.get(i).setAttc_key(t);
		}
		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		
		
		if(from == 0 ) {
			task.setPerf_empid(emp.getEmp_id());
		}else {
			task.setPerf_empid(perf_empid);
		}
		task = service.selectTaskNoOne(task);
		
		
		if(from == 0 ) {
			performer.setPerf_empid(emp.getEmp_id());
			performer.setPerf_tascno(tasc_no);
		}else {
			performer.setPerf_tascno(tasc_no);
			performer.setPerf_empid(perf_empid);
		}
		
		TaskVO task2 = new TaskVO();
		if(from == 0 ) {
			task2.setPerf_empid(emp.getEmp_id());
			task2.setPerf_tascno(tasc_no);
		}else {
			task2.setPerf_tascno(tasc_no);
			task2.setPerf_empid(perf_empid);
		}
		task2 =service.selectReceiverGetOne(task2);
		 
		 
		List<AttachVO> attachList2 = performerService.selectFileList(performer);
		for(int i=0; i < attachList2.size(); i++) {
			String encryptKey = attachList2.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			attachList2.get(i).setAttc_key(t);
		}
		
		
		performer = performerService.getPerformerByPerformerNo(performer);
		
		Map<String, Object> map =  service.selectTaskReciveByTaskNo(tasc_no);
		
		
		
		mnv.addObject("performer",performer);
		mnv.addObject("taskOne",task);
		mnv.addObject("taskRe",task2);
		mnv.addObject("attachList", attachList);
		mnv.addObject("attachList2", attachList2);
		mnv.addObject("recevietask",map.get("per"));
		mnv.addObject("task",map.get("task"));
		mnv.addObject("taskAll",map.get("taskAll"));
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv,int tasc_no,HttpSession session)throws Exception {
		String url = "task/detail.open";
		
		List<AttachVO> attachList = service.selectFileList(tasc_no);
		
		List<TaskVO> Nmg = service.NmgReceiverList(tasc_no);
		
		
		for(int i=0; i < attachList.size(); i++) {
			String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			attachList.get(i).setAttc_key(t);
		}
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		List<GChartVO> deptList = gService.getDeptList(compno);
		List<GChartVO> empList = new ArrayList<GChartVO>();
		for(GChartVO vo : deptList) {
			empList = gService.getGhartEmpList(vo.getDept_no());
			vo.setEmpList(empList);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(deptList);
		mnv.addObject("deptList",jsonList);
		
		TaskVO task = new TaskVO();
		
		task = service.getTaskByTaskNo(tasc_no);
		
		mnv.addObject("NmgList",Nmg);
		mnv.addObject("task",task);
		mnv.addObject("attachList", attachList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
//	@RequestMapping("/performermodify")
//	@ResponseBody
//	public void performermodify(PerformerVO performer,HttpServletResponse response)throws Exception {
//		
//		Map<String, String> map =  performerService.modifyPerformer(performer);
//		
//		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
//		
//		out.println("수정 성공");
//	}
	
	
	@RequestMapping("/modify")
	@ResponseBody
	public void modify(TaskCommand taskComand,HttpSession session,PerformerVO performer,HttpServletResponse response,int[] ta_no,@RequestParam(value="delfile",required=false )int[] delfile)throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
			
			EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
			
			taskComand.setTask_empid(emp.getEmp_id());
			
			service.modifyTask(taskComand,performer,ta_no,emp.getEmp_id(),uploadPath, delfile);
			out.println("수정 완료");
			
			
			
		
	}
	
	
	@RequestMapping("/remove")
	public void remove(int tasc_no,int perf_tascno,HttpServletResponse response)throws SQLException,Exception {
		
		service.removeTask(tasc_no, perf_tascno);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("삭제 성공");
		
	}
}

