package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.AttendCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttendanceVO;

public interface AttendanceService {
	
	
	/*개인 근태 조회*/
	List<AttendCommand> getMyAttendenceList(SearchCriteria2 cri) throws SQLException;
	
	/*검색 조건 없이 개인 근태 조회*/
	List<AttendanceVO> getMyAttendenceListNotSearch(String attd_empid) throws SQLException;
	
	/*출근 등록*/
	int registMyAttendence(AttendanceVO attend) throws SQLException;
	/*퇴근 등록*/
	int registMyOffWork(AttendanceVO attend) throws SQLException;
	
	int modifyLateWorkshapeByAttdNo(AttendanceVO attend) throws SQLException;
	
	
	/*퇴근 등록*/
	int updateAttd_workshape(AttendanceVO attend) throws SQLException;
	
	void modifyMyAttendence(AttendanceVO attend) throws SQLException;
	int modifyAttendWorkshapeByAttdNo(AttendanceVO attend) throws SQLException;
	Map<String, Object> getEmpInfoByEmpId(String emp_id)throws SQLException;
	
	List<Map<String, Object>> getMyAttendListByDay(String attd_id) throws SQLException;
	List<Map<String, Object>> getMyAttendListByWeek(String attd_id) throws SQLException;
	
	
	/**관리자**/
	
	Map<String, Object> getDailyCountForAdmin(int compno) throws SQLException;
	List<Map<String, Object>> getAllAttendListForAdmin(SearchCriteria2 cri) throws SQLException;
	int getTodayGoToWorkCnt(int compno) throws SQLException;
	int getTodayOffWorkCnt(int compno) throws SQLException;
	int getTodayModifyReqUserCnt(int compno) throws SQLException;
	
	Map<String, Object> getDetailAttendByAttdNo(int attd_no) throws SQLException;
	
}
