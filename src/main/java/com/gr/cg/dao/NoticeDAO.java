package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NoticeVO;

public interface NoticeDAO {
	
	List<NoticeVO> selectNoticeList(SearchCriteria cri) throws SQLException;
	List<NoticeVO> selectwidget(int compno) throws SQLException;
	int selectNoticeListCount(SearchCriteria cri) throws SQLException;
	
	NoticeVO selectNoticeByNoticeNo(int noticeNo) throws SQLException;
	
	int selectNoticeSequenceNextValue()throws SQLException;
	int insertNotice(NoticeVO notice) throws SQLException;
	
	int updateNotice(NoticeVO notice) throws SQLException;
	
	int updatePopYN(NoticeVO notice) throws SQLException;
	
	void deleteNotice(int noticeNo) throws SQLException;
	
	//조회수 증가
	void increaseViewCount(int noticeNo)throws SQLException;
	
	//파일 리스트 조회
	List<AttachVO> attachList (int ntc_no) throws SQLException;
	
	//팝업여부 y인 공지리스트 조회
	List<NoticeVO> selectNoticeListByPopYNIsY(int compno) throws SQLException;

	//알림용 전체 리스트 조회
	List<EmployeeVO> selectEmpListByAlram(EmployeeVO emp)throws SQLException;
}

