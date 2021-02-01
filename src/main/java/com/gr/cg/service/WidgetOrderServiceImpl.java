package com.gr.cg.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.dao.WidgetDAO;
import com.gr.cg.dao.WidgetOrderDAO;
import com.gr.cg.dto.WidgetOrdVO;
import com.gr.cg.dto.WidgetVO;

public class WidgetOrderServiceImpl implements WidgetOrderService{
	
	private WidgetOrderDAO widgetorderdao;
	
	public void setWidgetOrderDAO(WidgetOrderDAO widgetorderdao) {
		this.widgetorderdao = widgetorderdao;
	}
	
	
	private WidgetDAO widgetdao;
	
	public void setWidgetDAO(WidgetDAO widgetdao) {
		this.widgetdao = widgetdao;
	}
	
	@Override
	public void insertWidget(WidgetOrdVO widgetord) throws SQLException {
		widgetorderdao.insertWidget(widgetord);
	}

	@Override
	public List<WidgetOrdVO> selectListOrd(String empid) throws SQLException {
		
		List<WidgetVO> widget = widgetdao.selectWidgetList();
		List<WidgetOrdVO> WidgetOrdList = widgetorderdao.selectListOrd(empid);
		
		WidgetOrdVO widgetOrdVO = new WidgetOrdVO();
		
		if(WidgetOrdList.size() == 0) {
			for(int i =0; i<widget.size(); i++) {
				
				widgetOrdVO.setWo_empid(empid);
				widgetOrdVO.setWo_ord(i+1);
				widgetOrdVO.setWo_wgno(widget.get(i).getWg_no());
				
				widgetorderdao.insertWidget(widgetOrdVO);
			}
		}
		
		
		return widgetorderdao.selectListOrd(empid);
	}

	@Override
	public void updateWidget(Map<String, Object> map) throws SQLException {
			
			int oldOrd = (int) map.get("wo_old"); // 예전 순서 
			int wgno = (int) map.get("wo_wgno"); // 위젯 번호 
			int woord = (int) map.get("wo_ord"); // 새로운 순서
			
			
			String empid = (String) map.get("empid");
			
			if(oldOrd > woord) { // +
				
				map.put("Num","pulse");
				
				for(int i = oldOrd-1; i >=woord; i--) {
					map.put("wo_ord", i);
					widgetorderdao.updateWidget(map);
					
				}
			}else { // -
				map.put("Num", "minus" );
				
				for(int i = oldOrd+1; i<= woord; i++) {
					
					map.put("wo_ord", i);
					widgetorderdao.updateWidget(map);
				}
				
			}
			
			widgetorderdao.updateWidgetOne(map);
	}

	@Override
	public void updateWidgetOne(Map<String, Object> map) throws SQLException {
		widgetorderdao.updateWidgetOne(map);
		
		
	}

	@Override
	public List<WidgetOrdVO> selectWidgetYN(String empid) throws SQLException {

		return widgetorderdao.selectWidgetYN(empid);
	}

	@Override
	public void widgetdelYN(WidgetOrdVO widgetord) throws SQLException {
		widgetorderdao.widgetdelYN(widgetord);
		
	}
	
	

}
