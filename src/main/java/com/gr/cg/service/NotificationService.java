package com.gr.cg.service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.NotificationVO;

public interface NotificationService {

	
	List<NotificationVO> getMyAlramList(SearchCriteria2 cri)throws SQLException;
	
	/**읽음여부가 null인 유저의 알림 리스트**/
	List<NotificationVO> getMyAlramLustFromToast(String noti_recid)throws SQLException;
	
	
	/**읽음여부 수정**/
	int updateReadYnIsN(NotificationVO noti)throws SQLException;

	
	/**스케줄러 자동 업데이트*/
	void setAutoReadYnIsN() throws SQLException, ParseException;
	void checkReadDate() throws SQLException,ParseException;
	void checkAlramList()throws SQLException;
	
	
	/**스케줄러 application list에 put하는 메서드**/
	void putApplicationLust(Map<String, Object> alramMap) throws SQLException;
}
