package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.AttendCommand;
import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.AttendanceDAO;
import com.gr.cg.dto.AttendanceVO;

public class AttendanceServiceImpl implements AttendanceService {

	
	private AttendanceDAO attendenceDAO;
	
	public void setAttendenceDAO(AttendanceDAO attendenceDAO) {
		this.attendenceDAO = attendenceDAO;
	}
	@Override
	public List<AttendCommand> getMyAttendenceList(SearchCriteria2 cri) throws SQLException {
		
		List<AttendCommand> dataMap = attendenceDAO.selectMyAttendence(cri);
		
		
		for(int i=0; i<dataMap.size(); i++) {
			if(dataMap.get(i).getAttd_offwtime() == null ||  dataMap.get(i).getAttd_offwtime().equals("")) {
					dataMap.get(i).setAttd_offwymd("");
					dataMap.get(i).setAttd_offhms("");
			}
		}
		return  dataMap;
	}

	@Override
	public int registMyAttendence(AttendanceVO attend) throws SQLException {
		int seq = attendenceDAO.selectAttendenceSeq();
		
		attend.setAttd_no(seq);
		
		int regNo = attendenceDAO.insertMyAttendence(attend);
		
		
		if(regNo > 0 ) {
			Map<String, Object> attendMap= attendenceDAO.selectDetailAttendByAttdNo(seq);
			String gtwdate = (String) attendMap.get("ATTD_GTWTIME");
			
			int chkNum  = attendenceDAO.checkLateDateByAttdgtwtime(gtwdate);
			if(chkNum > 0) {
				attend.setAttd_workshape("GAT02");
				attendenceDAO.updateAttd_workshape(attend);
			}
		}
		return regNo;
	}

	@Override
	public void modifyMyAttendence(AttendanceVO attend) throws SQLException {
		attendenceDAO.updateMyAttendence(attend);
	}
	@Override
	public Map<String, Object> getEmpInfoByEmpId(String emp_id) throws SQLException {
		
		Map<String, Object> dataMap = attendenceDAO.selectEmpInfoByEmpID(emp_id);
		return dataMap;
	}
	@Override
	public List<Map<String, Object>> getMyAttendListByDay(String attd_id) throws SQLException {
		
		return attendenceDAO.selectAttendanceListByDayAndAttdId(attd_id);
	}
	@Override
	public List<Map<String, Object>> getMyAttendListByWeek(String attd_id) throws SQLException {
		return attendenceDAO.selectAttendanceListByWeekAndAttdId(attd_id);
	}
	@Override
	public int registMyOffWork(AttendanceVO attend) throws SQLException {
		
		return attendenceDAO.updateMyOffWork(attend);
	}
	@Override
	public List<AttendanceVO> getMyAttendenceListNotSearch(String attd_empid) throws SQLException {
		return attendenceDAO.selectNotSearchAttendListByAttdId(attd_empid);
	}
	@Override
	public int updateAttd_workshape(AttendanceVO attend) throws SQLException {
		return attendenceDAO.updateAttd_workshape(attend);
	}
	@Override
	public List<Map<String, Object>>getAllAttendListForAdmin(SearchCriteria2 cri) throws SQLException {
		
		List<Map<String, Object>> aList = attendenceDAO.selectAllAttendanceListByCompno(cri);

		return aList;
	}
	@Override
	public int getTodayGoToWorkCnt(int compno) throws SQLException {
		return attendenceDAO.selectTodayGoToWorkCnt(compno);
	}
	@Override
	public int getTodayOffWorkCnt(int compno) throws SQLException {
		// TODO Auto-generated method stub
		return  attendenceDAO.selectTodayOffWorkCnt(compno);
	}
	@Override
	public int getTodayModifyReqUserCnt(int compno) throws SQLException {
		// TODO Auto-generated method stub
		return attendenceDAO.selectTodayModifyReqUserCnt(compno);
	}
	@Override
	public Map<String, Object> getDailyCountForAdmin(int compno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int cnt1 = attendenceDAO.selectTodayGoToWorkCnt(compno);
		int cnt2 = attendenceDAO.selectTodayOffWorkCnt(compno);
		int cnt3 = attendenceDAO.selectTodayModifyReqUserCnt(compno);
		int cnt4 = attendenceDAO.selectlatecPersonCnt(compno);
		int cnt5 = attendenceDAO.selectTodayVacationCnt(compno);
		dataMap.put("todayGTWCnt", cnt1);
		dataMap.put("todayOffWCnt", cnt2);
		dataMap.put("modReqCnt", cnt3);
		dataMap.put("lateCnt", cnt4);
		dataMap.put("vactCnt", cnt5);
		return dataMap;
	}
	@Override
	public Map<String, Object> getDetailAttendByAttdNo(int attd_no) throws SQLException {
		
		return attendenceDAO.selectDetailAttendByAttdNo(attd_no);
	}
	@Override
	public int modifyAttendWorkshapeByAttdNo(AttendanceVO attend) throws SQLException {
		
		return attendenceDAO.updateAttd_workshape(attend);
		
	}
	@Override
	public int modifyLateWorkshapeByAttdNo(AttendanceVO attend) throws SQLException {
		
		int chk = attendenceDAO.selectlatecPersonByAttdNo(attend.getAttd_no());
		List<AttendanceVO> attendList= attendenceDAO.selectNotSearchAttendListByAttdId(attend.getAttd_empid());
		if(chk > 0) {
			attend.setAttd_workshape("GAT02");
		}else {
			for(AttendanceVO attd : attendList) {
				if(attd.getAttd_no() == attend.getAttd_no()) {
					attend.setAttd_workshape(attd.getAttd_workshape());
				}
			}
			
		}
		return attendenceDAO.updateAttd_workshape(attend);
		
	}


}
