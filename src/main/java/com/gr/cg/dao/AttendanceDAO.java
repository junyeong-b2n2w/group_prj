package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.AttendCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttendanceVO;

public interface AttendanceDAO {
	
	/**개인**/
	List<AttendCommand> selectMyAttendence(SearchCriteria2 cri) throws SQLException;
	
	/**CRI 제외하고 가져오기*/
	List<AttendanceVO> selectNotSearchAttendListByAttdId(String attd_empid) throws SQLException;
	
	int insertMyAttendence(AttendanceVO attend) throws SQLException;
	int updateMyOffWork(AttendanceVO attend) throws SQLException;
	int updateAttd_workshape(AttendanceVO attend) throws SQLException;
	int selectAttendenceSeq()throws SQLException;
	int selectlatecPersonByAttdNo(int attd_no) throws SQLException;
	void updateMyAttendence(AttendanceVO attend) throws SQLException;
	Map<String, Object> selectEmpInfoByEmpID(String emp_id) throws SQLException;
	
	List<Map<String, Object>> selectAttendanceListByDayAndAttdId(String attd_id) throws SQLException;
	List<Map<String, Object>> selectAttendanceListByWeekAndAttdId(String attd_id) throws SQLException;
	
	/**관리자**/
	List<Map<String, Object>> selectAllAttendanceListByCompno(SearchCriteria2 cri) throws SQLException;
	int selectAttdListTotalCnt(SearchCriteria cri) throws SQLException;
	
	/**오늘 출근자/ 퇴근자 / 수정요청자 수**/
	
	int selectTodayGoToWorkCnt(int compno) throws SQLException;
	int selectTodayOffWorkCnt(int compno) throws SQLException;
	int selectTodayModifyReqUserCnt(int compno) throws SQLException;
	int selectlatecPersonCnt(int compno)throws SQLException;
	int selectTodayVacationCnt(int compno) throws SQLException;
	Map<String, Object> selectDetailAttendByAttdNo(int attd_no) throws SQLException;
	
	
	int checkLateDateByAttdgtwtime(String attd_gtwtime)throws SQLException;
}
