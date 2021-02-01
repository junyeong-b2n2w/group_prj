package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.ShortcutVO;

public interface ShortCutDAO {

	List<ShortcutVO> selectShortCutList(String emp_id) throws SQLException;

	int selectShortCutSeqNextVal() throws SQLException;

	ShortcutVO selectShortCutByNO(int shc_no) throws SQLException;

	int insertShortCut(ShortcutVO scVO) throws SQLException;

	int updateShortCut(ShortcutVO scVO) throws SQLException;

	int deleteShortCut(int shc_no) throws SQLException;
}
