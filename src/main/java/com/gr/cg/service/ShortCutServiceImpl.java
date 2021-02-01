package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dao.ShortCutDAO;
import com.gr.cg.dto.ShortcutVO;

public class ShortCutServiceImpl implements ShortCutService{

	private ShortCutDAO shortCutDAO;
	
	public void setShortCutDAO(ShortCutDAO shortCutDAO) {
		this.shortCutDAO = shortCutDAO;
	}

	@Override
	public List<ShortcutVO> selectShortCutList(String emp_id) {
		List<ShortcutVO> scList = null;
		
		try {
			scList = shortCutDAO.selectShortCutList(emp_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			
		return scList;
	}

	@Override
	public int selectShortCutSeqNextVal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ShortcutVO selectShortCutByNO(int shc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertShortCut(ShortcutVO scVO) {
		int result = 0;
		
		try {
			result = shortCutDAO.insertShortCut(scVO);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateShortCut(ShortcutVO scVO) {
		int result = 0;
		
		try {
			result = shortCutDAO.updateShortCut(scVO);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteShortCut(List<String> shc_no_list) {
		int result = 0;
		
		try {
			for (String shc_no : shc_no_list) {
				result += shortCutDAO.deleteShortCut(Integer.parseInt(shc_no));
			}
			
		} catch (Exception e) {
		}
		return result;
	}
}
