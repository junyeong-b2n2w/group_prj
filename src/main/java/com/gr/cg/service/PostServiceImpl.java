package com.gr.cg.service;


import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.FileDAO;
import com.gr.cg.dao.PostDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PostVO;


public class PostServiceImpl implements PostService{

	private PostDAO postDAO;
	
	private FileService fileService;
	private FileDAO fileDAO;
	
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	@Override
	public List<PostVO> getPostList(SearchCriteria2 cri) throws SQLException {
		
		 return postDAO.selectPostList(cri);
	}
	
	
	
	@Override
	public PostVO getPostByPostNo(int post_no) throws SQLException {
		postDAO.increaseViews(post_no);
		
		return postDAO.selectPostByPostNo(post_no);
		
	}
	@Override
	public void registPost(PostVO post,int[] ta_no,String id,String upload) throws IOException,SQLException {
		
		if(ta_no != null) {
			String key = fileService.registFile(ta_no, id, upload,"post");
			post.setPost_attckey(key);
		}
		int seq = postDAO.selectPostSequenceNextValue();
		
		post.setPost_no(seq);
		
		postDAO.insertPost(post);	
		}
	
	
	
	@Override
	public void modifyPost(PostVO post,int[] ta_no,String id,String upload,int[] delfile) throws IOException,SQLException {
		
		String beforeKey = postDAO.selectPostByPostNo(post.getPost_no()).getPost_attckey();
		
		if(delfile != null) {
			for(int i =0; i<delfile.length; i++) {
				AttachVO attach = new AttachVO();
				attach.setAttc_no(delfile[i]);
				fileService.removeFile(attach);
			}
			post.setPost_attckey(beforeKey);
		}
		post.setPost_attckey(beforeKey);
		
		if(ta_no != null) {
			
		String key = fileService.registFile(ta_no, id, upload,"post");
		Map<String, Object> map = new HashMap<>();
			
		if(!key.equals("실패")) {
				if(beforeKey == null) {
					post.setPost_attckey(key);
				}else {
					fileService.deleteKey(beforeKey);
					map.put("attc_key", key);
					map.put("before_key", beforeKey);
					fileService.updateKey(map);
					post.setPost_attckey(key);
				}
			}
		}
		postDAO.modifyPost(post);
		
		
	}
	
	
	
	@Override
	public void removePost(int postNo) throws SQLException {
		postDAO.deletePost(postNo);	}
	@Override
	public List<AttachVO> selectFileList(int postNo) throws SQLException {
		return postDAO.selectFileList(postNo);
		
	}
	@Override
	public List<PostVO> selectWidget(int post_compno) throws SQLException {
		// TODO Auto-generated method stub
		return postDAO.selectWidget(post_compno);
	}

}

