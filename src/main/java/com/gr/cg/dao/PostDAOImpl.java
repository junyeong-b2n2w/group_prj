package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PostVO;

public class PostDAOImpl implements PostDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public PostVO selectPostByPostNo(int postNo) throws SQLException {
		return session.selectOne("Post-Mapper.selectPostByPostNo", postNo);
	}

	@Override
	public List<PostVO> selectPostList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("Post-Mapper.selectPostList",cri);
	}

	@Override
	public void insertPost(PostVO post) throws SQLException {
		session.update("Post-Mapper.insertPost", post);
	}

	@Override
	public int modifyPost(PostVO post) throws SQLException {
		return session.update("Post-Mapper.modifyPost", post);
	}

	@Override
	public void deletePost(int post_no) throws SQLException {
		session.update("Post-Mapper.deletePost", post_no);
	}

	@Override
	public int selectPostSequenceNextValue() throws SQLException {
		int seq_num=session.selectOne("Post-Mapper.selectPostSequenceNextValue");
		return seq_num;
		
	}
	
	@Override
	public void increaseViews(int post_no) throws SQLException {
		session.update("Post-Mapper.increaseViews",post_no);
	}

	@Override
	public List<AttachVO>selectFileList(int postNo) throws SQLException {
		
		return session.selectList("Post-Mapper.selectFileList",postNo);
		
	}

	@Override
	public int selectPostListCount(SearchCriteria cri) throws SQLException {
		int cnt = session.selectOne("Post-Mapper.selectPostListCount",cri);
		return cnt;
	}

	@Override
	public List<PostVO> selectWidget(int post_compno) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Post-Mapper.selectWidget",post_compno);
	}


}

