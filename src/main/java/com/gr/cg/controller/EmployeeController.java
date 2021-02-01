package com.gr.cg.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gr.cg.command.EncryptionUtils;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.EmpDAO;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.security.User;
import com.gr.cg.service.DeptService;
import com.gr.cg.service.EmpService;
import com.gr.cg.service.RankService;

@Controller
public class EmployeeController {

	@Autowired
	private EmpService empService;
	
	@Autowired
	private EmpDAO empDAO;
		
		
	@RequestMapping("/role/emp/list")
	public ModelAndView employeeList(SearchCriteria cri, ModelAndView mnv, HttpSession session) {
			
			int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
			
			cri.setComp_no(compno);
			
			Map<String, Object> dataMap = empService.getEmpList(cri);
			
			mnv.addAllObjects(dataMap);
			
			mnv.setViewName("roleemp/list.open");
			return mnv;
	}
	
	@RequestMapping("/role/emp/registForm")
	public ModelAndView employeeRegistForm(EmployeeVO employeeVO, ModelAndView mnv, HttpSession session) {
			
	
		int comp_no = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		Map<String, Object> dataMap = empService.registEmpForm(comp_no);
		
		mnv.addAllObjects(dataMap);
			
		mnv.setViewName("roleemp/regForm.open");
		return mnv;
	}
	
	@RequestMapping("/role/emp/regist")
	public void employeeRegist(EmployeeVO employeeVO, HttpSession session, HttpServletResponse response) {
			
	
		int comp_no = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		
		String regr_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		employeeVO.setEmp_compno(comp_no);
		employeeVO.setEmp_regr(regr_id);
		employeeVO.setEmp_udtid(regr_id);
		String passwd = employeeVO.getEmp_brdt().replace("-", "").substring(2,8) + "#@";
		
		String encPwd = EncryptionUtils.encryptSHA256(passwd);
		employeeVO.setEmp_pass(encPwd);
		empService.registEmp(employeeVO);
		
		
			
		try {
			response.getWriter().write("<script>location.href='detail?emp_id="+employeeVO.getEmp_id()+"'</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/role/emp/idcheck", produces="text/html;charset=utf-8")
	public ResponseEntity<String> isEmp(String emp_id) {
		ResponseEntity<String> entity = null;

		String result = empService.isEmpId(emp_id);
		
		try {
			entity = new ResponseEntity<String>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	
	@RequestMapping(value="/role/emp/getEmp")
	public ResponseEntity<Map<String, Object>> getEmpByIdAjax(String emp_id) {
		ResponseEntity<Map<String, Object> > entity =null;
		
		Map<String, Object> dataMap = empService.GetEmpByEmpId(emp_id);
		
		
		
		try {
			entity = new ResponseEntity<Map<String, Object>  >(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>  >(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	
	@RequestMapping(value="/role/emp/resetPw")
	public ResponseEntity<String> resetPasswd(String emp_id) {
		ResponseEntity<String > entity =null;
		
		String resetPw = empService.resetPassword(emp_id);
		
		
		
		try {
			entity = new ResponseEntity<String  >(resetPw, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String >(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	
	@RequestMapping("/role/emp/modiForm")
	public ModelAndView employeeModifyForm(String emp_id, ModelAndView mnv, HttpSession session) {
			
	
		
		Map<String, Object> dataMap = empService.modifyEmpForm(emp_id);
		
		mnv.addAllObjects(dataMap);
			
		mnv.setViewName("roleemp/modiForm.open");
		return mnv;
	}
	
	@RequestMapping("/role/emp/modify")
	public void employeeModify(EmployeeVO employeeVO, ModelAndView mnv, HttpSession session, HttpServletResponse response) {
			
	
		
		String udt_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		employeeVO.setEmp_udtid(udt_id);
		
		empService.modifyEmp(employeeVO);
		
		
		employeeDetail(employeeVO.getEmp_id(), mnv, session);
		
		
		try {
			response.getWriter().write("<script>location.href='detail?emp_id="+employeeVO.getEmp_id()+"'</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping("/role/emp/detail")
	public ModelAndView employeeDetail(String emp_id, ModelAndView mnv, HttpSession session) {
			
	
		
		Map<String, Object> dataMap = empService.modifyEmpForm(emp_id);
		
		mnv.addAllObjects(dataMap);
			
		mnv.setViewName("roleemp/detail.open");
		return mnv;
	}
	
	@RequestMapping("/role/emp/grant")
	@ResponseBody
	public ResponseEntity<String> grantRoles(SearchCriteria cri, String emp_id, @RequestParam(value="roleList[]", required = false) List<String> roleList,  ModelAndView mnv, HttpSession session) {
			
		EmpInformationVO empRoleInfoVO = new EmpInformationVO();
		empRoleInfoVO.setEri_regid( ((EmployeeVO) session.getAttribute("loginUser")).getEmp_id());
		empRoleInfoVO.setEri_emp_id(emp_id);
		
		try {
			
		
			if(roleList != null) {
				empService.grantRoles(empRoleInfoVO, roleList);
				
				EmployeeVO emp = (EmployeeVO)empService.GetEmpByEmpId(emp_id).get("empVO");
				
				User authUser = new User(emp);
				List<GrantedAuthority> roles = null;
				try {
					roles = empDAO.getEmpRoles(authUser.getUsername());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), roles);
				result.setDetails(authUser);
				
				SecurityContextHolder.getContext().setAuthentication(result);
			}else {
				roleList = new ArrayList<String>();
				empService.grantRoles(empRoleInfoVO, roleList);
			}
			return new ResponseEntity<String>("123",HttpStatus.OK); 
			
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping("/mypage/main")
	public ModelAndView mypage(ModelAndView mnv, HttpSession session) {
			
		String emp_id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		Map<String, Object> dataMap = empService.modifyEmpForm(emp_id);
		
		mnv.addAllObjects(dataMap);
			
		mnv.setViewName("mypage/detail.open");
		return mnv;
	}
	
	
	
	@RequestMapping(value="/passwordChange",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	public ResponseEntity<String> passChange(@RequestParam(required = false)String emp_id, String old_pass, String new_pass, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		try {
			empService.changePassword(emp_id, old_pass, new_pass);
			entity = new ResponseEntity<String  >("비밀번호 변경이 성공하였습니다", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String >("비밀번호가 맞지 않습니다",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/role/emp/chart")
	public ResponseEntity<List<Map<String, Object>>> empChart(String dept_ck, String rank_ck, String gend_ck,HttpSession session) {
		ResponseEntity<List<Map<String, Object>>> entity = null;
		
		HashMap<String, Object> check = new HashMap<String, Object>();
		
		check.put("dept_ck", dept_ck);
		check.put("rank_ck", rank_ck);
		check.put("gend_ck", gend_ck);
		check.put("comp_no", ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno());
		
		List<Map<String, Object>> result = empService.empChart(check);
		
		
		
		try {
			entity = new ResponseEntity<List<Map<String, Object>>>(result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Map<String, Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/role/emp/roleCount",method=RequestMethod.POST)
	public ResponseEntity<List<Map<String, Object>>> empRoleCount(HttpSession session) {
		ResponseEntity<List<Map<String, Object>>> entity = null;
		
		HashMap<String, Object> check = new HashMap<String, Object>();
		
		check.put("comp_no", ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno());
		
		List<Map<String, Object>> result = empService.empRoleCount(check);
		
		System.out.println(result);
		
		
		try {
			entity = new ResponseEntity<List<Map<String, Object>>>(result, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<Map<String, Object>>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
}
