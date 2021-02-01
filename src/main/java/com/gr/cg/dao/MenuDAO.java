package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.CompanyAcriMenuVO;
import com.gr.cg.dto.MenuVO;

public interface MenuDAO {
	
	
	List<MenuVO> selectMainMenu(int comp_no)throws SQLException;
	List<MenuVO> selectSubMenu(String mCode)throws SQLException;
	MenuVO selectMenuByMcode(String mCode)throws SQLException;
	List<MenuVO> selectTotalMainMenu() throws SQLException;
	int deleteMenuList(int comp_no) throws SQLException;
	int insertMenuList(CompanyAcriMenuVO acmenuVO) throws SQLException;
}
