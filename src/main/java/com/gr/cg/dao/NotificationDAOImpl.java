package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.NotificationVO;

public class NotificationDAOImpl implements NotificationDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void saveNoticeAlarm(NotificationVO noti) throws SQLException {

		session.update("Notification-Mapper.saveNoticeAlarm", noti);

	}

	@Override
	public List<NotificationVO> selectMyAlarmList(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Notification-Mapper.selectMyAlarmListByReadYnIsN", cri);
	}

	@Override
	public List<NotificationVO> selectMyAlarmListByReadYnIsNull(String noti_recid) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Notification-Mapper.selectMyAlarmListByReadYnIsNull", noti_recid);
	}

	@Override
	public int updateReadYnIsN(NotificationVO noti) throws SQLException {
		return session.update("Notification-Mapper.updateReadAlarm", noti);
		
	}

	@Override
	public NotificationVO selectAlarmByNotiNO(int notino) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Notification-Mapper.selectAlarmByNotiNO", notino);
	}

	@Override
	public List<NotificationVO> selectAllAlarmListByReadYnIsNull() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Notification-Mapper.selectAllAlarmListByReadYnIsNull");
	}

	@Override
	public void deleteAlarmByScheduler(int noti_no) throws SQLException {
		session.delete("Notification-Mapper.deleteAlarmByScheduler", noti_no);
		
	}

	@Override
	public List<NotificationVO> selectAllListByReadYnIsY() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Notification-Mapper.selectAllListByReadYnIsY");
	}

	@Override
	public void insertAlramByScheduler(NotificationVO noti) throws SQLException {
		// TODO Auto-generated method stub
		session.update("Notification-Mapper.insertAlramByScheduler", noti);
		
	}

	@Override
	public int selectNoificationSeq() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Notification-Mapper.selectNoificationSeq");
	}

}
