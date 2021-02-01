package com.gr.cg.service;

import java.sql.SQLException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;

import com.gr.cg.command.EncryptionUtils;
import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.EmpDAO;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.DepartmentVO;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.RankVO;
import com.gr.cg.exception.InvalidPasswordException;
import com.gr.cg.exception.NotFoundIDException;

public class EmpServiceImpl implements EmpService{


	private DeptService deptService;
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}
	private RankService rankService;
	public void setRankService(RankService rankService) {
		this.rankService = rankService;
	}
	
	private EmpDAO empDAO;
	
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}
	@Override
	public void login(String emp_id, String emp_pass, HttpSession session) throws SQLException, NotFoundIDException, InvalidPasswordException {

	
		EmployeeVO emp = empDAO.selectEmpById(emp_id);
		if(emp==null) {
			throw new NotFoundIDException();
		}
		if(!emp_pass.equals(emp.getEmp_pass())) {
			throw new InvalidPasswordException();
		}
		session.setAttribute("loginUser", emp);
		session.setMaxInactiveInterval(6*60);
	}
	@Override
	public Map<String, Object> getEmpList(SearchCriteria cri){
		
		
		Map<String,Object> dataMap=new HashMap<String,Object>();
		
		List<Map<String, Object>> empList= null; 
				
		int totalCount = 0;
		
		try {
			empList = empDAO.selectEmpMapList(cri);
			totalCount=empDAO.selectEmpListTotalCount(cri);
			
			for(int i = 0; i <  empList.size(); i++ ) {
				String empId = (String) empList.get(i).get("emp_id");
				
				List<GrantedAuthority> authList = empDAO.getEmpRoles(empId);
				
				
				empList.get(i).put("authList", authList);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("log");
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("empList", empList);
		dataMap.put("pageMaker",pageMaker);
				
		return dataMap;
		
	}
	@Override
	public Map<String, Object> GetEmpByEmpId(String emp_id)  {
		
		Map<String, Object> dataMap = new HashMap<>();
		EmployeeVO empVO = null;
		List<GrantedAuthority> authList = null;
		try {
		empVO = empDAO.selectEmpById(emp_id);
		authList = empDAO.getEmpRoles(emp_id);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dataMap.put("empVO", empVO);
		dataMap.put("authList", authList);
		
		return dataMap;
	}
	@Override
	public void registEmp(EmployeeVO emp) {
		try {
			empDAO.insertEmployee(emp);
			
			//회원 기본 권한 부여
			EmpInformationVO empRoleVO = new EmpInformationVO();
			empRoleVO.setEri_emp_id(emp.getEmp_id());
			empRoleVO.setEri_regid(emp.getEmp_regr());
			empRoleVO.setEri_roleno("20");
			empDAO.grantRole(empRoleVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void registCompanyAdmin(String comp_no) {
	
		
	}
	
	
	@Override
	public Map<String,Object> registEmpForm(int comp_no) {
		Map<String,Object> dataMap=new HashMap<String,Object>();
		
		SearchCriteria cri = new SearchCriteria();
		cri.setComp_no(comp_no);
		
		List<DepartmentVO> deptList = null;
		List<RankVO> rankList = null;
		try {
			deptList = deptService.getAllDeptList(cri);
			rankList = rankService.getRankList(cri);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dataMap.put("deptList", deptList);
		dataMap.put("rankList", rankList);
		
		return dataMap;
	}
	@Override
	public void modifyEmp(EmployeeVO emp) {
		
		try {
			empDAO.updateEmp(emp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void removeEmp(int empNo) throws SQLException {
	}

	@Override
	public String isEmpId(String emp_id) {
		
		
		int count = 0;
		try {
			 count = empDAO.isEmpId(emp_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(count > 0) {
			return "해당 아이디가 존재합니다.";
		}else {
			return "사용가능한 아이디입니다.";
		}
		
	}
	
	@Override
	public String resetPassword(String emp_id) {

		String uuidPassWord = UUID.randomUUID().toString().replace("-", "").substring(0,8);
		
		EmployeeVO emp = new EmployeeVO();
		
		String enc_emp_pass = EncryptionUtils.encryptSHA256(uuidPassWord);
		
		emp.setEmp_id(emp_id);
		emp.setEmp_pass(enc_emp_pass);
		
		try {
			empDAO.resetPassword(emp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return uuidPassWord;
	}
	
	@Override
	public Map<String, Object> modifyEmpForm(String emp_id) {
		Map<String,Object> dataMap=new HashMap<String,Object>();
		
		EmployeeVO empVO = null;
		try {
			empVO = empDAO.selectEmpById(emp_id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		SearchCriteria cri = new SearchCriteria();
		cri.setComp_no(empVO.getEmp_compno());
		
		List<DepartmentVO> deptList = null;
		List<RankVO> rankList = null;
		List<GrantedAuthority> authList = null;
		try {
			deptList = deptService.getAllDeptList(cri);
			rankList = rankService.getRankList(cri);
			authList = empDAO.getEmpRoles(emp_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dataMap.put("empVO", empVO);
		dataMap.put("authList", authList);
		dataMap.put("deptList", deptList);
		dataMap.put("rankList", rankList);
		
		return dataMap;
	}

	@Override
	public void grantRoles(EmpInformationVO empRoleInfoVO, List<String> roleList) {

		
		try {
			empDAO.dropRole(empRoleInfoVO.getEri_empid());
			
			for(String roleNum : roleList) {
				EmpInformationVO empInfoVO = new EmpInformationVO();
				empInfoVO.setEri_roleno(roleNum);
				empInfoVO.setEri_emp_id(empRoleInfoVO.getEri_empid());
				empInfoVO.setEri_regid(empRoleInfoVO.getEri_regid());
				empDAO.grantRole(empInfoVO);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	@Override
	public String changePassword(String emp_id, String old_pass, String new_pass) throws InvalidPasswordException {
		String result = "";
		try {
			EmployeeVO emp = empDAO.selectEmpById(emp_id);
			if(emp.getEmp_pass().equals(EncryptionUtils.encryptSHA256(old_pass))) {
				emp.setEmp_pass(EncryptionUtils.encryptSHA256(new_pass));
				empDAO.updatePassword(emp);
			}else {
				throw new InvalidPasswordException();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return result;
	}
	
	@Override
	public List<Map<String, Object>> empChart(HashMap<String, Object> check) {
		List<Map<String, Object>> chartResult = null;
		try {
			chartResult = empDAO.getChart(check); 
		} catch (Exception e) {
		}
			
		return chartResult;
	}
	
	@Override
	public List<Map<String, Object>> empRoleCount(HashMap<String, Object> check) {
		List<Map<String, Object>> roleCount = null;
		try {
			roleCount = empDAO.selectRoleCount(check); 
		} catch (Exception e) {
		}
			
		return roleCount;
	}
	@Override
	public List<Map<String, Object>> getCmList(int comp_no) {
		List<Map<String, Object>> roleCount = null;
		try {
			roleCount = empDAO.selectCmListByCompNo(comp_no); 
		} catch (Exception e) {
		}
		
		return roleCount;
	}
}
