package com.gr.cg.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NoticeVO;

public interface NoticeService {
	Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException;
	NoticeVO getNoticeByNoticeNo(int noticeNo) throws SQLException;
	NoticeVO getNoticeByNoticeNoFromModify(int noticeNo) throws SQLException;
	int registNotice(NoticeVO notice) throws SQLException,IOException;
	int registNoticeWithAttach(NoticeVO notice,String uploadPath) throws SQLException,IOException;
	void modifyNotice(NoticeVO notice) throws SQLException;
	void modifyNoticeWithAttach(NoticeVO notice,String uploadPath,int[] deleteFile) throws SQLException,IOException;
	void removeNotice(int noticeNo) throws SQLException;
	List<AttachVO> getAttachListt(int ntc_no)throws SQLException;
	List<NoticeVO> getNoticeListByPopYNIsY(int compno)throws SQLException;
	List<NoticeVO> selectwidget(int compno) throws SQLException;
	List<EmployeeVO> getEmpListFromAlram(EmployeeVO emp)throws SQLException;
}
