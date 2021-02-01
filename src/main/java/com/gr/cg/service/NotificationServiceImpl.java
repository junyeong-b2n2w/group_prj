package com.gr.cg.service;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ServletContextAware;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dao.NotificationDAO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NotificationVO;

public class NotificationServiceImpl implements NotificationService,ServletContextAware {

	private NotificationDAO notificationDAO;
	
	private ServletContext context;
	
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}

	
	@Override
	public List<NotificationVO> getMyAlramList(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return notificationDAO.selectMyAlarmList(cri);
	}

	@Override
	public List<NotificationVO> getMyAlramLustFromToast(String noti_recid) throws SQLException {
		// TODO Auto-generated method stub
		return notificationDAO.selectMyAlarmListByReadYnIsNull(noti_recid);
	}

	@Override
	public int updateReadYnIsN(NotificationVO noti) throws SQLException {
		
		NotificationVO chkNoti = notificationDAO.selectAlarmByNotiNO(noti.getNoti_no());
		
		if(chkNoti.getNoti_readyn() == null || chkNoti.getNoti_readyn() == "") {
			noti.setNoti_readyn("N");
		}else if(chkNoti.getNoti_readyn().equals("N")) {
			noti.setNoti_readyn("Y");
		}
		
		return notificationDAO.updateReadYnIsN(noti);
		
	}

	@Override
	public void setAutoReadYnIsN() throws SQLException, ParseException {
		
		// readyn이 null인 리스트를 가져온다
		List<NotificationVO> notiList = notificationDAO.selectAllAlarmListByReadYnIsNull();
		
		Date now = new Date();
		SimpleDateFormat simpledt = new SimpleDateFormat("yyyyMMddHHmm");
		 simpledt.format(now); //해당월일의 시간을 반환
		 
		 Calendar cal = Calendar.getInstance();
		 cal.setTime(now);
		 cal.add(Calendar.HOUR, +2); //1시간 후의 시간
		 

		for(NotificationVO noti : notiList) {
			Date notiRegDt = new SimpleDateFormat("yyyyMMddHHmm").parse(noti.getNoti_regdt());
			if(cal.getTime().after(notiRegDt)) {//등록일자가 현재 날짜의 한 시간 후 이면 업데이트 해준다
				noti.setNoti_readyn("N");
				notificationDAO.updateReadYnIsN(noti);
			}
		}
		
 		
		
	}

	@Override
	public void checkReadDate() throws SQLException, ParseException {
		//읽음처리된 알람중 읽은 날짜가 현재날짜의 한달 뒤이면 삭제
		
		List<NotificationVO> notiList = notificationDAO.selectAllListByReadYnIsY(); //y인 목록
		
		Date now = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		simpleDateFormat.format(now);
		
		  Calendar cal = Calendar.getInstance();
		  cal.setTime(now);
		  cal.add(Calendar.MONTH, +1); //현재날짜의 한달 뒤의 날짜를 구한다
		   
		for(NotificationVO noti : notiList) {
			
			Date readDate = new SimpleDateFormat("yyyyMMdd").parse(noti.getNoti_readdt());
			
			if(cal.getTime().after(readDate)) {
				
				notificationDAO.deleteAlarmByScheduler(noti.getNoti_no());
			}
			
		}
		
		
	}

	@Override
	public void checkAlramList() throws SQLException {

			List<Map<String, Object>> applicationList = (List<Map<String, Object>>) context.getAttribute("appList");
			String noti_cont = "";
			
			if(applicationList != null && applicationList.size() > 0) {
				for(int i = 0; i < applicationList.size(); i++ ) {
//					for(Map<String, Object> dataMap : applicationList ) {
					Map<String, Object> dataMap = applicationList.get(i);
					//타입 체크하여 문구 설정
					if(dataMap.get("noti_type").equals("EDOC_FIN_SSG")) {
						noti_cont  = "결재가 완료되었습니다";
					}else if(dataMap.get("noti_type").equals("ARRV_TURN_SSG")) {
						noti_cont  = "대기중인 결재 건이 있습니다";
					}else if(dataMap.get("noti_type").equals("EDOC_RET_SSG")) {
						noti_cont  = "기안이 반려되었습니다";
						
					}else if(dataMap.get("noti_type").equals("TASK_REG_SSG")) {
						noti_cont  = "업무 등록이 완료되었습니다";
						
					}else if(dataMap.get("noti_type").equals("TASG_RET_SSG")) {
						noti_cont  = "업무 요청이 반려되었습니다";
						
					}else if(dataMap.get("noti_type").equals("NOT_REG_SSG")) {
						noti_cont = "공지사항이 새로 등록되었습니다";
					}
					
					List<EmployeeVO> receiverList = (List<EmployeeVO>) dataMap.get("empList");
					String receiver = "";
					for (int j = 0; j < receiverList.size(); j++) {
						NotificationVO noti = new NotificationVO();
						EmployeeVO empInfo = receiverList.get(j);
						noti.setNoti_cont(noti_cont);
						noti.setNoti_type((String)dataMap.get("noti_type"));
						noti.setNoti_url((String)dataMap.get("url"));
						noti.setNoti_compno(empInfo.getComp_no());
						noti.setNoti_recid(empInfo.getEmp_id());
						notificationDAO.insertAlramByScheduler(noti);
					}
					applicationList.remove(i);	
					System.out.println("aaaa  = >"+applicationList);
				}
				
			}
			
		
	}

	@Override
	public void putApplicationLust(Map<String, Object> alramMap) throws SQLException {
		
		List<Map<String, Object>> appList = (List<Map<String, Object>>) context.getAttribute("appList");
		
		if(appList != null){ //있으면 기족 applicationlist에 담는다
			appList.add(alramMap);
			
		}else {//없으면 새로 list를 만들어 담는다
			List<Map<String, Object>> newList = new ArrayList<>();
			context.setAttribute("appList", newList);
			newList.add(alramMap);
		}
	}


}
