package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.BusinessDocumentVO;


public class BdocDAOIml implements BdocDAO {

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<BusinessDocumentVO> slectbdocList(HashMap<String, String> map) throws SQLException {
		List<BusinessDocumentVO> attachList = session.selectList("Bdoc-Mapper.selectFileList", map);
		return attachList;
	}

	@Override
	public void createFolder(String folderName) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void registBdoc(BusinessDocumentVO bdoc) throws SQLException {
		session.update("Bdoc-Mapper.insertBDoc", bdoc);
	}

	@Override
	public int getSeq() throws SQLException {
		int count = session.selectOne("Bdoc-Mapper.selectBdocSequenceNextValue");
		return count;
	}

	@Override
	public void delete(BusinessDocumentVO bdoc) throws SQLException {
		session.update("Bdoc-Mapper.deleteBdoc", bdoc);
	}

	@Override
	public BusinessDocumentVO selectBdocByAttcNO(int attc_no) throws SQLException {
		return session.selectOne("Bdoc-Mapper.selectOneByAttcNo",attc_no);
	}

	@Override
	public List<BusinessDocumentVO> selectBdocFolder(HashMap<String, String> map) throws SQLException {
		return session.selectList("Bdoc-Mapper.selectFolderList", map);
	}

	@Override
	public BusinessDocumentVO selectBdocByBdNo(int bd_no) throws SQLException {
		return session.selectOne("Bdoc-Mapper.selectBdocByBdNo",bd_no);
	}

	@Override
	public int selectAttNoByBdNo(int bd_no) throws SQLException {
		return session.selectOne("Bdoc-Mapper.selectAttNoByBdNo",bd_no);
	}

	@Override
	public int selectUpfd(HashMap<String, String> map) throws SQLException {
		return session.selectOne("Bdoc-Mapper.selectUpfd",map);
	}

	@Override
	public void updatebdoc(BusinessDocumentVO bdoc) throws SQLException {
		session.update("Bdoc-Mapper.updateFolder", bdoc);
		
	}

	@Override
	public void updateExtnm(HashMap<String, String> map) throws SQLException {
		session.update("Bdoc-Mapper.updateExtnm", map);
	}

	@Override
	public void moveItem(BusinessDocumentVO bdoc) throws SQLException {
		session.update("Bdoc-Mapper.moveItem", bdoc);
	}

	@Override
	public List<HashMap<String, String>> folderDownloadList(HashMap<String, String> map) throws SQLException {

		return session.selectList("Bdoc-Mapper.folderDownloadList", map);
	}

	@Override
	public List<HashMap<String, String>> downloadAll(HashMap<String, String> map) throws SQLException {

		return session.selectList("Bdoc-Mapper.downloadAll", map);
	}

	@Override
	public List<BusinessDocumentVO> selectupList(int bd_no) throws SQLException {
		return session.selectList("Bdoc-Mapper.selectupList", bd_no);
	}


}
