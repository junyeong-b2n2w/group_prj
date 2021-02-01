package com.gr.cg.service;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PostVO;

public interface PostService {
	List<PostVO> getPostList(SearchCriteria2 cri) throws SQLException;
	PostVO getPostByPostNo(int post_no) throws SQLException;
	void registPost(PostVO post,int[] ta_no,String id,String upload) throws IOException,SQLException;
	void modifyPost(PostVO post,int[] ta_no,String id,String upload,int[]delfile) throws IOException,SQLException;
	void removePost(int postNo) throws SQLException;
	List<AttachVO> selectFileList(int postNo) throws SQLException;
	List<PostVO> selectWidget(int post_compno) throws SQLException;
}
