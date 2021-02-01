package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PostVO;

public interface PostDAO {
	List<PostVO> selectPostList(SearchCriteria2 cri) throws SQLException;
	int selectPostSequenceNextValue() throws SQLException;
	PostVO selectPostByPostNo(int postNo) throws SQLException;
	void insertPost(PostVO post) throws SQLException;
	int modifyPost(PostVO post) throws SQLException;
	void deletePost(int postNo) throws SQLException;
	void increaseViews(int post_no) throws SQLException;
	List<AttachVO> selectFileList(int postNo) throws SQLException;
	List<PostVO> selectWidget(int post_compno) throws SQLException;
	int selectPostListCount(SearchCriteria cri) throws SQLException;
}

