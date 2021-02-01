package com.gr.cg.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.TempAttcVO;

public interface FileService {
	
	// 임시폴더에 저장
	int registTemp(TempAttcVO tattach) throws SQLException;
		
	// 원래 폴더에 저장
	String registFile(int ta_no[], String email, String uploadPath, String tableName) throws SQLException, IOException;
	
	// 파일 삭제
	void removeFile(AttachVO attach) throws SQLException;
	
	//키 삭제
	void removeKey(String ak)throws SQLException;
	
	//키를 가지고 번호 조회
	 List<Integer>  selectAkNoListByKey(String ak) throws SQLException;
	 
	 void deleteKey(String key)throws SQLException;
	 
	 void updateKey(Map<String, Object> map)throws SQLException;

}
