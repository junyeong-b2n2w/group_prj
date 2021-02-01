package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.AttachKeyVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.TempAttcVO;

public class FileDAOImpl implements FileDAO{
	
private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void createTempFile(TempAttcVO tattach) throws SQLException {
		session.update("Attach-Mapper.insertTempFile", tattach);
	}

	@Override
	public void createFile(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.insertFile", attach);

	}
	
	@Override
	public int getTempSeq() throws SQLException {
		int count = session.selectOne("Attach-Mapper.selectTempSequenceNextValue");
		return count;
	}

	@Override
	public int getMainSeq() throws SQLException {
		int count = session.selectOne("Attach-Mapper.selectRealSequenceNextValue");
		return count;
	}

	@Override
	public TempAttcVO selectOneTempinfo(TempAttcVO tattach) throws SQLException {
		TempAttcVO tattach2 = session.selectOne("Attach-Mapper.selectTempFile",tattach);
		return tattach2;
	}

	@Override
	public void createKey(AttachKeyVO key) throws SQLException {
		session.update("Attach-Mapper.insertKey", key);
	}

	@Override
	public AttachVO selectOne(int attc_no) throws SQLException {
		AttachVO attach = session.selectOne("Attach-Mapper.selectOneInfo",attc_no);
		return attach;
	}

	@Override
	public void deleteFile(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.deleteFile", attach);
	}

	@Override
	public void delefeKey(String ak) throws SQLException {
		session.update("Attach-Mapper.deleteKey", ak);
		
	}

	@Override
	public void updateKey(Map<String, Object> map) throws SQLException {
		session.update("Attach-Mapper.updateKey", map);
		
	}

	@Override
	public List<Integer>  selectAkNoListByKey(String ak) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Attach-Mapper.selectAkNoListByKey", ak);
	}

	@Override
	public String selectCmpnm(String empid) throws SQLException {
		return session.selectOne("Attach-Mapper.selectCmpnm",empid);
	}
}
