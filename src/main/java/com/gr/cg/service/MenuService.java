package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dto.MenuVO;

public interface MenuService {
	
	List<MenuVO> getMainMenuList(int comp_no)throws SQLException;
	
	List<MenuVO> getSubMenuList(String mCode)throws SQLException;
	
	MenuVO getMenuByMcode(String mCode)throws SQLException;
	List<MenuVO> getAllMainMenuList() throws SQLException;
	
	void changeMenuList(List<String> menuList, int comp_no);
}
