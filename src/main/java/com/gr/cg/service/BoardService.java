package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.BoardVO;

public interface BoardService {
	void insertBoard(BoardVO board) throws SQLException;
	
	List<BoardVO> selectBoardList (int comno)throws SQLException;
	
	void BoardDelete(BoardVO board)throws SQLException;
	
	void ModifyBoard(BoardVO board)throws SQLException;
	
	List<BoardVO> selectBoardAllList (BoardVO board) throws SQLException;
}
