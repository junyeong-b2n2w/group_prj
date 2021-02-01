package com.gr.cg.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.BusinessDocumentVO;
import com.gr.cg.dto.EmployeeVO;

public interface BdocService {

	// bdoc 등록
	int registBdoc(int ta_no[], BusinessDocumentVO bdoc, String uploadPath) throws SQLException, IOException;
	
	
	int shareBdoc(int bd_no, String uploadPath, int shareType, EmployeeVO user) throws SQLException, IOException;
	
	//  bdoc 가져오기
	List<BusinessDocumentVO> selectbdocList(HashMap<String, String> map) throws SQLException; 
	
	// bdoc 삭제
	Boolean removeBdoc(int[] attc_no,EmployeeVO emp, int removeType) throws SQLException;
	
	//fodler 리스트
	List<BusinessDocumentVO> selectFolderList(HashMap<String, String> map) throws SQLException;
	
	// bdoc 수정
	Boolean modifyBdoc(BusinessDocumentVO bdoc, EmployeeVO emp, int shareType) throws SQLException;
	
	// Folder 만들기
	void registFolder(BusinessDocumentVO bdoc) throws SQLException;
	
	// 폴더 이동
	Boolean moveItem(BusinessDocumentVO bdoc, EmployeeVO emp, int shareType) throws SQLException;
	
	//폴더 다운로드
	String folderDownloadList (HashMap<String, String> map,EmployeeVO emp, int shareType) throws SQLException, FileNotFoundException, IOException;
	
	//전체 다운로드
	String downloadAll (HashMap<String, String> map,EmployeeVO emp, int shareType) throws SQLException, FileNotFoundException, IOException;
	
	//여러개 파일 다운로드
	String choiceDownload (int[] bd_no,EmployeeVO emp, int shareType,HashMap<String, String> map) throws SQLException, FileNotFoundException, IOException;
}
