package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.BoardVO;

public interface BoardDAO {

	void insertBoard(BoardVO board) throws SQLException;
	int selectBoardSequenceNextValue() throws SQLException;
	List<BoardVO> selectBoardList (int comno)throws SQLException;
	List<BoardVO> selectBoardAllList (BoardVO board)throws SQLException;
	void BoardDelete(BoardVO board)throws SQLException;
	void ModifyBoard(BoardVO board)throws SQLException;
	
}
