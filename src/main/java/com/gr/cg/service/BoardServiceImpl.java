package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dao.BoardDAO;
import com.gr.cg.dto.BoardVO;

public class BoardServiceImpl implements BoardService{
private BoardDAO boardDAO;
	
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}

	@Override
	public void insertBoard(BoardVO board) throws SQLException {

		int bno = boardDAO.selectBoardSequenceNextValue();
		
		board.setBoard_no(bno);
		
		if(board.getBoard_pboardno() == 0) {
			
			board.setBoard_pboardno(bno);
		}
		
		
		boardDAO.insertBoard(board);
	}

	@Override
	public List<BoardVO> selectBoardList(int comno) throws SQLException {
		List<BoardVO> boardList = boardDAO.selectBoardList(comno);
		return boardList;
	}

	@Override
	public void BoardDelete(BoardVO board) throws SQLException {
		
		boardDAO.BoardDelete(board);
		
	}

	@Override
	public void ModifyBoard(BoardVO board) throws SQLException {
		
		if(board.getBoard_pboardno() == 0) {
			board.setBoard_pboardno(board.getBoard_no());
		}
			boardDAO.ModifyBoard(board);
		
	}

	@Override
	public List<BoardVO> selectBoardAllList(BoardVO board) throws SQLException {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardAllList(board);
	}
}
