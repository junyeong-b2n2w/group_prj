package com.gr.cg.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.PageMaker;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.NoticeDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.NoticeVO;
import com.gr.cg.dto.NotificationVO;
import com.gr.cg.service.NoticeService;
import com.gr.cg.service.NotificationService;
import com.gr.cg.utils.CryptoAria;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name="boardUploadPath")
	private String uploadPath;
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private NotificationService notificationService;
	
	@RequestMapping("/list")
	public ModelAndView noticeList(ModelAndView mnv,SearchCriteria cri,HttpSession session) throws SQLException, JsonProcessingException{
		

		int compno   = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		cri.setComp_no(compno);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		
		Map<String, Object> dataMap = service.getNoticeList(cri);
		PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");

		pageMaker.setUrl("/notice/noticeList");
		
		mnv.addObject("nList",mapper.writeValueAsString(dataMap.get("nList")));
		mnv.addObject("pageMaker", mapper.writeValueAsString(dataMap.get("pageMaker")));
		mnv.setViewName("notice/list.open");
		
		
		return mnv;
	}
	@RequestMapping(value="/noticeList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String noticeList(SearchCriteria cri, HttpSession session) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		cri.setComp_no(compno);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		
		Map<String, Object> dataMap = service.getNoticeList(cri);
		String jsonList = mapper.writeValueAsString(dataMap);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	@RequestMapping("/registForm")
	public String registForm() {
		return "/notice/registForm.open";
	}
	@RequestMapping(path="/regist",method=RequestMethod.POST)
	public String regist(NoticeVO notice,ModelAndView mnv,RedirectAttributes ra, HttpSession session) throws SQLException, IOException {

		EmployeeVO emp = ((EmployeeVO)session.getAttribute("loginUser"));
		
		int compno  = emp.getComp_no();
		int cnt = 0;
		notice.setNtc_compno(compno);

		if(notice.getNtc_popyn() == null) {
			notice.setNtc_popyn("N");
		}
		if(notice.getTa_no() == null) {
			cnt = service.registNotice(notice);
		}else {
			cnt = service.registNoticeWithAttach(notice, uploadPath);
			
		}
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		
		if(cnt > 0) { //공지 등록 성공 시 알림 보낸다
			
			Map<String, Object> alramMap = new HashMap<String, Object>();
			//로그인한 사용자를 제외한 알림대상자 List로 가져온다
			List<EmployeeVO> empList = service.getEmpListFromAlram(emp);
			alramMap.put("empList", empList);
			alramMap.put("url", "notice/list");
			alramMap.put("noti_type", "NOT_REG_SSG");
			
			notificationService.putApplicationLust(alramMap);
			
		}
		
		return "redirect:/notice/list";
		
	}
	@RequestMapping("/detail")
	public ModelAndView detail(@RequestParam("ntc_no")int ntc_no, ModelAndView mnv) throws SQLException {
		
		NoticeVO notice = service.getNoticeByNoticeNo(ntc_no);
		String url = "notice/detail.open";
		
		List<AttachVO> attachList = service.getAttachListt(ntc_no);
		for(int i=0; i < attachList.size(); i++) {
			String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			attachList.get(i).setAttc_key(t);
		}
		
		mnv.setViewName(url);
		mnv.addObject("notice", notice);
		mnv.addObject("attachList", attachList);
		
		return mnv;
	}
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(@RequestParam("ntc_no")int ntc_no, ModelAndView mnv,RedirectAttributes ra,HttpSession session) throws SQLException {
		
		
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		
		NoticeVO notice = noticeDAO.selectNoticeByNoticeNo(ntc_no);
		
		
		
		String url = "notice/modify.open";
		if(!(notice.getNtc_writerid().equals(emp.getEmp_id()))) {
			
			ra.addFlashAttribute("msg", "수정은 본인이 작성한 게시물만 가능합니다");
			url =  "redirect:/notice/detail?ntc_no=" + ntc_no;
		}
		
		
		List<AttachVO> attachList = service.getAttachListt(ntc_no);
		
		for(int i=0; i < attachList.size(); i++) {
			String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			attachList.get(i).setAttc_key(t);
		}
		NoticeVO noice = service.getNoticeByNoticeNoFromModify(ntc_no);
		
		mnv.setViewName(url);
		mnv.addObject("notice", noice);
		mnv.addObject("attachList", attachList);
		
		
		return mnv;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(NoticeVO notice,ModelAndView mnv,RedirectAttributes ra, HttpSession session,@RequestParam(value="delfile",required=false) int[] delfile) throws SQLException, IOException {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		
		
		notice.setNtc_compno(compno);

		if(notice.getNtc_popyn() == null) {
			notice.setNtc_popyn("N");
		}
		
		if(notice.getTa_no() == null && delfile == null) {
			service.modifyNotice(notice);
		}else {
			service.modifyNoticeWithAttach(notice, uploadPath,delfile);
			
		}
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		
		return "redirect:/notice/detail?ntc_no="+notice.getNtc_no();
		
		
	}
	@RequestMapping("/remove")
	public String remove(int ntc_no) throws SQLException {
		
		service.removeNotice(ntc_no);
		
		return "redirect:/notice/list";
		
	}
}

