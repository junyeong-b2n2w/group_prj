package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.AttendCommand;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttendanceVO;

public class AttendanceDAOImpl implements AttendanceDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AttendCommand> selectMyAttendence(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Attendance-Mapper.selectMyAttendence", cri);
	}

	@Override
	public int insertMyAttendence(AttendanceVO attend) throws SQLException {
		return sqlSession.update("Attendance-Mapper.insertMyAttendence", attend);

	}

	@Override
	public void updateMyAttendence(AttendanceVO attend) throws SQLException {
		sqlSession.update("Attendance-Mapper.updateMyAttendence", attend);
	}

	@Override
	public int selectAttendenceSeq() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Attendance-Mapper.selectAttendenceSeq");
	}

	@Override
	public Map<String, Object> selectEmpInfoByEmpID(String emp_id) throws SQLException {
		
		return sqlSession.selectOne("Attendance-Mapper.selectEmpInfoByEmpID",emp_id);
	}

	@Override
	public List<Map<String, Object>> selectAttendanceListByDayAndAttdId(String attd_id) throws SQLException {
		return sqlSession.selectList("Attendance-Mapper.selectAttendanceListByDayAndAttdId", attd_id);
	}

	@Override
	public List<Map<String, Object>> selectAttendanceListByWeekAndAttdId(String attd_id) throws SQLException {
		return sqlSession.selectList("Attendance-Mapper.selectAttendanceListByWeekAndAttdId", attd_id);
	}

	@Override
	public int updateMyOffWork(AttendanceVO attend) throws SQLException {
		return sqlSession.update("Attendance-Mapper.updateMyOffWork", attend);
	}

	@Override
	public List<AttendanceVO> selectNotSearchAttendListByAttdId(String attd_empid) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("Attendance-Mapper.selectNotSearchAttendListByAttdId", attd_empid);
	}

	@Override
	public int updateAttd_workshape(AttendanceVO attend) throws SQLException {
		
		return sqlSession.update("Attendance-Mapper.updateAttd_workshape", attend);
	}

	@Override
	public List<Map<String, Object>> selectAllAttendanceListByCompno(SearchCriteria2 cri) throws SQLException {
		
		return sqlSession.selectList("Attendance-Mapper.selectAllAttendanceListByCompno", cri);
	}
	@Override
	public Map<String, Object> selectDetailAttendByAttdNo(int attd_no) throws SQLException {
		
		return sqlSession.selectOne("Attendance-Mapper.selectDetailAttendByAttdNo", attd_no);
	}

	@Override
	public int selectAttdListTotalCnt(SearchCriteria cri) throws SQLException {
		return sqlSession.update("Attendance-Mapper.selectAttdListTotalCnt",cri);
	}

	@Override
	public int selectTodayGoToWorkCnt(int compno) throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.selectTodayGoToWorkCnt", compno);
	}

	@Override
	public int selectTodayOffWorkCnt(int compno) throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.selectTodayOffWorkCnt", compno);
	}

	@Override
	public int selectTodayModifyReqUserCnt(int compno) throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.selectTodayModifyReqUserCnt", compno);
	}

	@Override
	public int selectlatecPersonCnt(int compno) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Attendance-Mapper.selectlatecPersonCnt", compno);
	}
	@Override
	public int selectlatecPersonByAttdNo(int attd_no) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Attendance-Mapper.selectlatecPersonByAttdNo", attd_no);
	}

	@Override
	public int selectTodayVacationCnt(int compno) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Attendance-Mapper.selectVacatIngToday", compno);
	}

	@Override
	public int checkLateDateByAttdgtwtime(String attd_gtwtime) throws SQLException {
		return sqlSession.selectOne("Attendance-Mapper.checkLateDateByAttdgtwtime", attd_gtwtime);

	}

}


