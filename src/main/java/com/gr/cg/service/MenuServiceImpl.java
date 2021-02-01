package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.dao.MenuDAO;
import com.gr.cg.dto.CompanyAcriMenuVO;
import com.gr.cg.dto.MenuVO;

public class MenuServiceImpl implements MenuService {
	
	
	private MenuDAO menuDAO;// = MenuDAOImpl.getInstance();
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO=menuDAO;
	}
	
	@Override
	public List<MenuVO> getMainMenuList(int comp_no) throws SQLException {
		List<MenuVO> menuList=menuDAO.selectMainMenu( comp_no);
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String mCode) throws SQLException {
		List<MenuVO> menuList=menuDAO.selectSubMenu(mCode);
		menuList.remove(0);
		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = menuDAO.selectMenuByMcode(mCode);
		return menu;
	}

	@Override
	public List<MenuVO> getAllMainMenuList() throws SQLException {
		List<MenuVO> menuList=menuDAO.selectTotalMainMenu( );
		return menuList;
	}

	@Override
	public void changeMenuList(List<String> menuList, int comp_no) {

		try {
		menuDAO.deleteMenuList(comp_no);
		for(String mCode : menuList) {
			CompanyAcriMenuVO cmVO = new CompanyAcriMenuVO();
			cmVO.setCam_compno(comp_no);
			cmVO.setCam_menuno(mCode);
			menuDAO.insertMenuList(cmVO);
		}
		
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}




