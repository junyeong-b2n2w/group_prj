package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.AttachKeyVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.TempAttcVO;

public interface FileDAO {
	
	//파일 저장(임시폴더)
	void createTempFile (TempAttcVO tattach) throws SQLException;
	
	//파일 저장(정상 폴더)
	void createFile (AttachVO attach) throws SQLException;
	
	//시퀀스 가져오기
	int getTempSeq () throws SQLException;
	
	//시퀀스 2
	int getMainSeq () throws SQLException;
	
	//임시 파일 정보 가져오기
	TempAttcVO selectOneTempinfo(TempAttcVO tattach) throws SQLException;
	
	//키값 추가
	void createKey(AttachKeyVO key) throws SQLException;
	
	//1개 정보 가져오기
	AttachVO selectOne(int attc_no) throws SQLException;
	
	//파일 삭제
	void deleteFile(AttachVO attach) throws SQLException;
	
	//key 삭제
	void delefeKey(String ak) throws SQLException;
	
//	//key 수정
	void updateKey(Map<String, Object> map) throws SQLException;
	
	//키로 번호 조회
	List<Integer> selectAkNoListByKey(String ak) throws SQLException;
	
	//회사이름 가져오기
	String selectCmpnm (String empid) throws SQLException;

}
