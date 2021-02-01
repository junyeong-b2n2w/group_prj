package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.dao.AttendanceDAO;
import com.gr.cg.dao.RoleMainDAO;

public class RoleMainServiceImpl implements RoleMainService{

	 private RoleMainDAO roleMainDAO;
	 public void setRoleMainDAO(RoleMainDAO roleMainDAO) {
		this.roleMainDAO = roleMainDAO;
	}
	 
	private AttendanceService attendanceService;
	
	public void setAttendanceService(AttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}
	
	@Override
	public Map<String, Object> getRoleMainChart(int comp_no) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//task
		Map<String, Object> waitTask = null;
		Map<String, Object> endTask = null;
		Map<String, Object> ingTask = null;
		
		//edoc
		Map<String, Object> regiEdoc = null;
		Map<String, Object> ingEdoc = null;
		Map<String, Object> endEdoc  = null;
		
		//cal
		Map<String, Object> calData= null;
		
		
		
		try {
			
			Map<String, Object> paramMap  = new HashMap<>();
			paramMap.put("comp_no", comp_no);
			paramMap.put("type", "대기");
			waitTask = roleMainDAO.selectTodayTaskByCompNO(paramMap);
			paramMap.put("type", "완료");
			endTask = roleMainDAO.selectTodayTaskByCompNO(paramMap);
			paramMap.put("type", "진행");
			ingTask = roleMainDAO.selectTodayTaskByCompNO(paramMap);
			
			paramMap.put("type", "DED01");
			regiEdoc = roleMainDAO.selectTodayEdocByCompNO(paramMap);
			paramMap.put("type", "DED03");
			ingEdoc  = roleMainDAO.selectTodayEdocByCompNO(paramMap);
			paramMap.put("type", "DED04");
			endEdoc  = roleMainDAO.selectTodayEdocByCompNO(paramMap);
			
			calData = roleMainDAO.selectTodayCalByCompNO(paramMap);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> dataMap2 = null;
		try {
			dataMap2 = attendanceService.getDailyCountForAdmin(comp_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		dataMap.put("waitTask", waitTask);
		dataMap.put("endTask", endTask);
		dataMap.put("ingTask", ingTask);
		
		dataMap.put("regiEdoc", regiEdoc);
		dataMap.put("ingEdoc", ingEdoc);
		dataMap.put("endEdoc", endEdoc);
		
		dataMap.put("calData", calData);
		
		dataMap.putAll(dataMap2);
		
		
		return dataMap;
	}
}
