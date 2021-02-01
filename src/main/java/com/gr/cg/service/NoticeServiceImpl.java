package com.gr.cg.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.NoticeDAO;
import com.gr.cg.dao.NotificationDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NoticeVO;
import com.gr.cg.dto.NotificationVO;

public class NoticeServiceImpl implements NoticeService{

	private NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	private FileService fileService;
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	
	private NotificationDAO notificationDAO;
	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}
	@Override
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		List<NoticeVO> nList = noticeDAO.selectNoticeList(cri);
		int total = noticeDAO.selectNoticeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(total);
		pageMaker.setUrl("/notice/noticeList");
		
		dataMap.put("nList", nList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public NoticeVO getNoticeByNoticeNo(int noticeNo) throws SQLException {
		NoticeVO notice =  noticeDAO.selectNoticeByNoticeNo(noticeNo);
		noticeDAO.increaseViewCount(noticeNo);
		return notice;
	}
	@Override
	public NoticeVO getNoticeByNoticeNoFromModify(int noticeNo) throws SQLException {
		
		return noticeDAO.selectNoticeByNoticeNo(noticeNo);
	}
	@Override
	public int registNoticeWithAttach(NoticeVO notice,String uploadPath) throws SQLException, IOException {
		
		int ntc_no = noticeDAO.selectNoticeSequenceNextValue();
		int cnt = 0;
		String key = fileService.registFile(notice.getTa_no(), notice.getNtc_writerid(), uploadPath,"notice");
		
		if(!key.equals("실패")) {
			notice.setNtc_attckey(key);
			notice.setNtc_no(ntc_no);
			cnt = noticeDAO.insertNotice(notice);	
			}
		return  cnt;
		}
		
	@Override
	public int registNotice(NoticeVO notice )throws SQLException, IOException {
		
		int ntc_no = noticeDAO.selectNoticeSequenceNextValue();
		notice.setNtc_no(ntc_no);
			
		return 	noticeDAO.insertNotice(notice);	
	}
	
	
	@Override
	public void modifyNoticeWithAttach(NoticeVO notice, String uploadPath,int[] deleteFile) throws SQLException, IOException {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		//기존파일을 삭제할 경우
		if(deleteFile != null) {
			for(int i =0; i<deleteFile.length; i++) {
				AttachVO attach = new AttachVO();
				attach.setAttc_no(deleteFile[i]);
				fileService.removeFile(attach);
			}
		}
		
		
		String beforeKey = noticeDAO.selectNoticeByNoticeNo(notice.getNtc_no()).getNtc_attckey();
		
		
		if(notice.getTa_no() != null) {
			
			String key  = fileService.registFile(notice.getTa_no(), notice.getNtc_writerid(), uploadPath,"notice");
		
			if(!key.equals("실패")) {
				if( beforeKey == null) { //기본 파일이 없는경우
					notice.setNtc_attckey(key);
					int chk = noticeDAO.updateNotice(notice);	
				}else {
						fileService.deleteKey(beforeKey);
						map.put("attc_key", key);
						map.put("before_key", beforeKey);
						fileService.updateKey(map);
					notice.setNtc_attckey(key);
				}
			}	
		}
		int chk = noticeDAO.updateNotice(notice);	
	}
	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {
		
			int chk = noticeDAO.updateNotice(notice);	
	}
	@Override
	public void removeNotice(int noticeNo) throws SQLException {
		noticeDAO.deleteNotice(noticeNo);	}


	@Override
	public List<AttachVO> getAttachListt(int ntc_no) throws SQLException {
		List<AttachVO> attachList = noticeDAO.attachList(ntc_no);
		return attachList;
	}


	@Override
	public List<NoticeVO> getNoticeListByPopYNIsY(int compno) throws SQLException {

		List<NoticeVO> noticeList = noticeDAO.selectNoticeListByPopYNIsY(compno);
		
		return noticeList;
	}
	@Override
	public List<EmployeeVO> getEmpListFromAlram(EmployeeVO emp) throws SQLException {
		// TODO Auto-generated method stub
		return noticeDAO.selectEmpListByAlram(emp);
	}


	@Override
	public List<NoticeVO> selectwidget(int compno) throws SQLException {
		// TODO Auto-generated method stub
		return noticeDAO.selectwidget(compno);
	}


}


