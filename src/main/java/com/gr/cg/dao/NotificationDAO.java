package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.NotificationVO;

public interface NotificationDAO {
	
	void saveNoticeAlarm(NotificationVO noti)throws SQLException;
	
	/**우측 상단 알림 창용 알림 가져오기(=읽음 여부사 n인거)**/
	List<NotificationVO> selectMyAlarmList(SearchCriteria2 cri) throws SQLException;
	
	/**토스트 팝업용 한번 도 읽지 않은 알림 가져오기**/
	List<NotificationVO> selectMyAlarmListByReadYnIsNull(String noti_recid)throws SQLException;
	
	/**스케줄러가 매 5분마다 읽음여부가 null인 리스트를 검사한다**/
	List<NotificationVO> selectAllAlarmListByReadYnIsNull() throws SQLException;
	
	/**알림여부가 Y인 리스트 가져오기**/
	List<NotificationVO> selectAllListByReadYnIsY() throws SQLException;
	/**noti번호를 가지고 notivo가져오기 **/
	NotificationVO selectAlarmByNotiNO(int notino)throws SQLException;
	
	/**
	 * 알림 업데이트
	 * **/
	int updateReadYnIsN(NotificationVO noti) throws SQLException;
	
	
	/**스케줄러 알람 지우기**/
	void deleteAlarmByScheduler(int noti_no)throws SQLException;
	
	/**스케줄러 알림 등록**/
	void insertAlramByScheduler(NotificationVO noti)throws SQLException;
	
	/**알림등록 용 시퀀스 번호**/
	int selectNoificationSeq()throws SQLException;
}
