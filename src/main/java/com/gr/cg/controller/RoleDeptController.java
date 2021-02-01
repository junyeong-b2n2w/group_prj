package com.gr.cg.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.EmployeePageCommand;
import com.gr.cg.command.ModifyDeptCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.DeptHeadVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.service.DeptService;
import com.gr.cg.service.EmpService;

@Controller
@RequestMapping("/role/dept")
public class RoleDeptController {
	
	@Autowired
	private DeptService service;
	
	@RequestMapping("/list")
	public ModelAndView deptList(HttpSession session, ModelAndView mnv,SearchCriteria cri) throws Exception{
		
		String url = "/dept/deptList.open";
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		String compnm = ((EmployeeVO)session.getAttribute("loginUser")).getComp_nm();
		cri.setComp_no(compno);
		Map<String, Object> dataMap = null;
		dataMap = service.getDeptList(cri);
		dataMap.put("companyName", compnm);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping(value="/minusMyDeptList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String deptList(DepartmentVO dept) throws Exception{
		
		Map<String, Object> dataMap = service.getDeptListExceptMyDeptNoAndDeHeadVo(dept);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(dataMap);
		
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	
	@RequestMapping(value="/empList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String empList(SearchCriteria2 cri2,HttpSession session) throws Exception{
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		cri2.setCompno(compno);
		List<EmployeePageCommand> empList = service.getAllEmpList(cri2);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(empList);
		
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	
	@RequestMapping(path="/modifyDept", method=RequestMethod.POST)
	public String modifyDept(@ModelAttribute ModifyDeptCommand mod, RedirectAttributes ra) throws Exception{
		
		int MODCnt = service.modifyDept(mod.toParseDept());
		
		if(MODCnt > 0){
			ra.addFlashAttribute("msg", "정상 수정 되었습니다");
			service.modifyDeptHead(mod.toParseDHead());
			
			return "redirect:/role/dept/list";
		}
		else{
			ra.addFlashAttribute("msg", "수정 불가입니다 다시 확인해주세요");
			return "redirect:/dept/list";
		}
	}
	
	//활성수정
	@RequestMapping(path="/modifyActvYn", method=RequestMethod.GET)
	public String deleteDept(Model model, @RequestParam("dept_no") String dept_no ) throws SQLException{

		String[] arrDeptNo = dept_no.toString().split(",");
		int parseDept = 0;
		
        for (int i=0; i<arrDeptNo.length; i++) {
        	parseDept = Integer.parseInt(arrDeptNo[i]);
        	service.modifyAtvYn(parseDept);
        	
		}
		return "redirect:/role//dept/list";
	}

	//등록
	@RequestMapping(path="/registDept", method=RequestMethod.POST)
	public String registDept(DepartmentVO dept, Model model, @RequestParam("dept_nm") String dept_nm 
														,@RequestParam("dept_updept") int dept_updept
														,@RequestParam("dept_loc") String dept_loc
														,@RequestParam("dept_ph") String dept_ph
														,@RequestParam(value="emp_headid",required=false ) String emp_headid
														,HttpSession session)throws Exception{

		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		dept.setDept_compno(compno);
		dept.setDept_loc(dept_loc);
		dept.setDept_nm(dept_nm);
		dept.setDept_ph(dept_ph);
		dept.setDept_updept(dept_updept);
		
		
		service.registDept(dept,emp_headid);
		
		
		
		return "redirect:/role//dept/list";
	}

}

