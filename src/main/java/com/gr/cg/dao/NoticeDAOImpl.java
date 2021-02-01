package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<NoticeVO> selectNoticeList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("Notice-Mapper.selectNoticeList", cri,rowBounds);
	}
	@Override
	public NoticeVO selectNoticeByNoticeNo(int noticeNo) throws SQLException {
		return session.selectOne("Notice-Mapper.selectNoticeByNoticeNo", noticeNo);
	}


	@Override
	public int insertNotice(NoticeVO notice) throws SQLException {
		return session.update("Notice-Mapper.insertNotice", notice);
	}


	@Override
	public void deleteNotice(int notice_no) throws SQLException {
		session.update("Notice-Mapper.deleteNotice", notice_no);
	}

	@Override
	public int selectNoticeListCount(SearchCriteria cri) throws SQLException {
		int cnt = session.selectOne("Notice-Mapper.selectNoticeListCount",cri);
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO notice) throws SQLException {
		int cnt = session.update("Notice-Mapper.updateNotice",notice);
		return cnt;
	}

	@Override
	public int updatePopYN(NoticeVO notice) throws SQLException {
		int cnt = session.update("Notice-Mapper.updatePopYN",notice);
		return cnt;
	}

	@Override
	public void increaseViewCount(int noticeNo) throws SQLException {
		 session.update("Notice-Mapper.increaseViewCount",noticeNo);	
	}

	@Override
	public int selectNoticeSequenceNextValue() throws SQLException {
		int cnt = session.selectOne("Notice-Mapper.selectNoticeSequenceNextValue");
		return cnt;
	}

	@Override
	public List<AttachVO> attachList(int ntc_no) throws SQLException {
		List<AttachVO> attachList = session.selectList("Notice-Mapper.selectFileList", ntc_no);
		return attachList;
	}

	@Override
	public List<NoticeVO> selectNoticeListByPopYNIsY(int compno) throws SQLException {
		
		return session.selectList("Notice-Mapper.selectNoticeListByPopYNIsY",compno);
	}



	@Override
	public List<EmployeeVO> selectEmpListByAlram(EmployeeVO emp) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Notice-Mapper.selectEmpListByAlram", emp);
	}

	@Override
	public List<NoticeVO> selectwidget(int compno) throws SQLException {
		// TODO Auto-generated method stub
		 return session.selectList("Notice-Mapper.selectwidget",compno);
	}

}


