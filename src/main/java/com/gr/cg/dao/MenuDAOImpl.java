package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.dto.CompanyAcriMenuVO;
import com.gr.cg.dto.EmpInformationVO;
import com.gr.cg.dto.MenuVO;

public class MenuDAOImpl implements MenuDAO {
	
	
	private SqlSession sqlSession;
	public void setSqlSessionFactory(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MenuVO> selectMainMenu(int comp_no) throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList("Menu-Mapper.selectMainMenu",comp_no);
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenu(String mCode) throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList("Menu-Mapper.selectSubMenu",mCode);
		return menuList;
	}

	@Override
	public MenuVO selectMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = sqlSession.selectOne("Menu-Mapper.selectMenuByMcode",mCode);
		return menu;
	}

	@Override
	public List<MenuVO> selectTotalMainMenu() throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList("Menu-Mapper.selectTotalMainMenu");
		return menuList;
	}
	
	@Override
	public int deleteMenuList(int comp_no) throws SQLException {
		return sqlSession.update("Menu-Mapper.deleteMenuList",comp_no);
	}
	@Override
	public int insertMenuList(CompanyAcriMenuVO acmenuVO) throws SQLException {
		return sqlSession.update("Menu-Mapper.insertMenuList",acmenuVO);
	}
	
	
}




