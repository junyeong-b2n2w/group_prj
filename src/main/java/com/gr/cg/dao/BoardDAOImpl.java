package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.BoardVO;

public class BoardDAOImpl implements BoardDAO{
	
private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		
		session.update("Board-Mapper.insertBoard",board);
		
	}

	@Override
	public int selectBoardSequenceNextValue() throws SQLException {
		int seq_num=session.selectOne("Board-Mapper.selectBoardSequenceNextValue");
		return seq_num;
	}

	@Override
	public List<BoardVO> selectBoardList(int comno) throws SQLException {
		
		List<BoardVO> boardList =  session.selectList("Board-Mapper.selectBoardList",comno);
		
		return boardList;
	}

	@Override
	public void BoardDelete(BoardVO board) throws SQLException {
		session.delete("Board-Mapper.BoardDelete",board);
		
	}

	@Override
	public void ModifyBoard(BoardVO board) throws SQLException {

		session.update("Board-Mapper.ModifyBoard",board);
	}

	@Override
	public List<BoardVO> selectBoardAllList(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Board-Mapper.selectBoardAllList",board);
	}

	
	
	
}
