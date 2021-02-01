package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.ShortcutVO;

public interface ShortCutService {

	List<ShortcutVO> selectShortCutList(String emp_id) ;

	int selectShortCutSeqNextVal()  ;

	ShortcutVO selectShortCutByNO(int shc_no)  ;

	int insertShortCut(ShortcutVO scVO)  ;

	int updateShortCut(ShortcutVO scVO)  ;

	int deleteShortCut(List<String> shc_no_list )  ;
	
}
