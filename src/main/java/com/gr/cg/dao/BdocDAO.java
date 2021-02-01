package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.BusinessDocumentVO;

public interface BdocDAO {
	
	//리스트
	List<BusinessDocumentVO> slectbdocList (HashMap<String, String> map) throws SQLException;
	
	//폴더 만들기
	void createFolder(String folderName) throws SQLException;
	
	//업무문서 저장
	void registBdoc(BusinessDocumentVO bdoc) throws SQLException;
	
	//bdoc_Seq
	int getSeq() throws SQLException;
	
	// 삭제
	void delete(BusinessDocumentVO bdoc) throws SQLException;
	
	// 1개의 정보 가져오기 attcno로
	BusinessDocumentVO selectBdocByAttcNO (int attc_no) throws SQLException;
	
	// 폴더 리스트 가져오기
	List<BusinessDocumentVO> selectBdocFolder(HashMap<String, String> map) throws SQLException;
	
	// 1개의 정보 가져요기 bdno
	BusinessDocumentVO selectBdocByBdNo (int bd_no) throws SQLException;
	
	// bd_no로 attcno구하기
	int selectAttNoByBdNo (int bd_no) throws SQLException;
	
	// upfd 구하기
	int selectUpfd (HashMap<String, String> map) throws SQLException;
	
	// 폴더명 변경 
	void updatebdoc(BusinessDocumentVO bdoc) throws SQLException;
	
	// 파일명 변경
	void updateExtnm(HashMap<String, String> map) throws SQLException;
	
	// 위치 변경
	void moveItem(BusinessDocumentVO bdoc) throws SQLException;
	
	// 폴더 다운로드
	List<HashMap<String, String>> folderDownloadList (HashMap<String, String> map) throws SQLException;
	
	// 전체 다운로드
	List<HashMap<String, String>> downloadAll (HashMap<String, String> map) throws SQLException;
	
	// 삭제를 위해
	List<BusinessDocumentVO> selectupList (int bd_no) throws SQLException;
	
}
