package com.gr.cg.command;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.stereotype.Component;

import com.gr.cg.dao.NotificationDAO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NotificationVO;

//@Component
public class ContextListenerNotification implements ServletContextListener {

	
//	@Autowired
	private NotificationDAO notificationDAO;
	
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	
	List<Map<String, Object>> appList = new ArrayList<Map<String,Object>>();
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("appList", appList);

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ServletContext sc = sce.getServletContext();
		String noti_cont = "";
		List<Map<String, Object>> dataList =  (List<Map<String, Object>>) sc.getAttribute("appList");
		
//		if(dataList.size()>0 && dataList != null)  {
//			for(int i =0; i<dataList.size();i++) {
//				Map<String, Object> dataMap = dataList.get(i);
//				
//				if(dataMap.get("noti_type").equals("EDOC_FIN_SSG")) {
//					noti_cont  = "결재가 완료되었습니다";
//				}else if(dataMap.get("noti_type").equals("ARRV_TURN_SSG")) {
//					noti_cont  = "대기중인 결재 건이 있습니다";
//				}else if(dataMap.get("noti_type").equals("EDOC_RET_SSG")) {
//					noti_cont  = "기안이 반려되었습니다";
//					
//				}else if(dataMap.get("noti_type").equals("TASK_REG_SSG")) {
//					noti_cont  = "업무 등록이 완료되었습니다";
//					
//				}else if(dataMap.get("noti_type").equals("TASG_RET_SSG")) {
//					noti_cont  = "업무 요청이 반려되었습니다";
//					
//				}else if(dataMap.get("noti_type").equals("NOT_REG_SSG")) {
//					noti_cont = "공지사항이 새로 등록되었습니다";
//				}
//				
//				
//				List<EmployeeVO> recList = (List<EmployeeVO>) dataMap.get("empList");
//				for(int j =0; j <recList.size(); j++) {
//					NotificationVO noti = new NotificationVO();
//					EmployeeVO emp = recList.get(j);
//					noti.setNoti_cont(noti_cont);
//					noti.setNoti_type((String)dataMap.get("noti_type"));
//					noti.setNoti_url((String)dataMap.get("url"));
//					noti.setNoti_compno(emp.getComp_no());
//					noti.setNoti_recid(emp.getEmp_id());
//					try {
//						notificationDAO.insertAlramByScheduler(noti);
//					} catch (SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}
//				dataList.remove(i);
//				System.out.println("종료할 시");
//			}
//		}
		sc.removeAttribute("appList");
	}

}
