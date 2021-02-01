package com.gr.cg.controller;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.ComponentVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.FormComponentVO;
import com.gr.cg.dto.FormFavoriteVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.UserAprvLnGrVO;
import com.gr.cg.dto.UserDefAprvLnVO;
import com.gr.cg.service.ApprovalFormService;
import com.gr.cg.service.ApprovalService;
import com.gr.cg.service.ComponentService;
import com.gr.cg.service.ElecDocumentService;
import com.gr.cg.service.GChartService;
import com.gr.cg.utils.CryptoAria;

@Controller
@RequestMapping("/aprv")
public class ApprovalController {
	
	@Autowired
	private ApprovalService service;
	@Autowired
	private ElecDocumentService edocService;
	@Autowired
	private GChartService gService;
	@Autowired
	private ApprovalFormService approvalFormService;
	@Autowired
	private ComponentService componentService;
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@RequestMapping("/main")
	public String main() {
		return "approval/main.open";
	}
	
	@RequestMapping("/moveAprvPage")
	public String test(Model model, HttpSession session, @RequestParam(defaultValue="0") int form_no,  @RequestParam(defaultValue="0") int edno) throws Exception {
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
				
		ObjectMapper mapper = new ObjectMapper();
		ApprovalFormVO form = new ApprovalFormVO();
		ElecDocumentVO edoc = null;
		List<AttachVO> attachList = null;
		Map<String, String> codeMap = null;
		if(form_no > 0) {
			// 선택한 양식 불러오기
			form = approvalFormService.selectApprovalFormByAFNO(form_no);
		}
		if(edno > 0) {
			edoc = edocService.getEdocForDetail(edno);
			// 결재상태 확인용 map생성
			List<ApprovalVO> aprvList = edoc.getAprvList();
			List<ConsensusVO> consList = edoc.getConsList();
			if(consList.size() > 0 || aprvList.size()>0) {
				codeMap = new HashMap<String, String>();
			}
			for(ApprovalVO vo : aprvList) {
				codeMap.put(vo.getAprv_empid(), vo.getAprv_as());
			}
			for(ConsensusVO vo : consList) {
				codeMap.put(vo.getCons_empid(), vo.getCons_agrestt());
			}
			
			// 첨부파일 불러오기
			attachList = edocService.getAttachList(edno);
			for(int i=0; i < attachList.size(); i++) {
				String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
				String t = aria.encryptData(encryptKey);
				attachList.get(i).setAttc_key(t);
			}
			
			// 저장된 양식 불러오기
			form = approvalFormService.selectApprovalFormByAFNO(edoc.getEd_formno());
		}
		
		// 양식 상세내용 불러오기
		List<FormComponentVO> formList = form.getFormComponentList();
		List<ComponentVO> comList = new ArrayList<>();
		for(FormComponentVO vo : formList) {
			ComponentVO componentVO = componentService.selectComponentByCPNO(vo.getFc_no());
			comList.add(componentVO);
		}
		
		// 조직도용 리스트 뽑기
		List<GChartVO> deptList = gService.getDeptList(compno);
		List<GChartVO> empList = new ArrayList<GChartVO>();
		for(GChartVO vo : deptList) {
			empList = gService.getGhartEmpList(vo.getDept_no());
			vo.setEmpList(empList);
		}
		String jsonList = mapper.writeValueAsString(deptList);
		model.addAttribute("deptList", jsonList);
		
		// 사용자결재선 뽑기
//		EmployeeVO loginUser = (EmployeeVO) session.getAttribute("loginUser");
//		List<UserDefAprvLnVO> udalList =  service.getAprvLnList(loginUser.getEmp_id());
//		model.addAttribute("udalList", udalList);
		
		// 양식 넘기기
		model.addAttribute("form", form);
		model.addAttribute("comList", comList);
		model.addAttribute("edoc", mapper.writeValueAsString(edoc));
		model.addAttribute("codeMap", mapper.writeValueAsString(codeMap));
		model.addAttribute("attachList", attachList);
		return "approval/registForm.open";
	}
	@RequestMapping(value="/searchAprvLn", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String searchAprvLn(String text) throws Exception {
		List<GChartVO> list = service.searchAprvLnList(text);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(list);
		return jsonList;
	}
	
	@RequestMapping(value="/registAprvLn", method=RequestMethod.POST)
	@ResponseBody
	public int registAprvLn(@RequestBody UserDefAprvLnVO udal) throws SQLException {
		int seq = service.registAprvLn(udal);
		return seq;
	}
	
	@RequestMapping(value="/selectAprvLn",produces="application/json;charset=utf-8", method=RequestMethod.POST)
	@ResponseBody
	public String selectAprvLn(int udal_no) throws Exception {
		List<UserAprvLnGrVO> list = service.getAprvLnGrList(udal_no);
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(list);
		return jsonList; 
	}
	@RequestMapping(value="/removeAprvLn", method=RequestMethod.POST)
	@ResponseBody
	public void removeAprvLn(int udal_no) throws Exception {
		service.removeAprvLn(udal_no);
	}
	
	@RequestMapping("/regist")
	public ModelAndView regist(SearchCriteria cri, ModelAndView mnv, HttpSession session) {
		approvalFormList(cri, mnv, session);
		return mnv;
	}
	@RequestMapping("/list")
	public ModelAndView approvalFormList(SearchCriteria cri, ModelAndView mnv, HttpSession session) {
		
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		
		cri.setComp_no(compno);
		
		Map<String, Object> dataMap = approvalFormService.selectApprovalFormListByCRI(cri);
		
		mnv.addAllObjects(dataMap);
		
		mnv.setViewName("approval/apprvformlist.open");
		return mnv;
	}

	@RequestMapping("/detail")
	@ResponseBody
	public ResponseEntity<ApprovalFormVO> approvalFormDetail(int af_no, Model model) {
		ResponseEntity<ApprovalFormVO> entity = null;

		ApprovalFormVO approvalFormVO = approvalFormService.selectApprovalFormByAFNO(af_no);
		
		try {
			
			entity = new ResponseEntity<ApprovalFormVO>(approvalFormVO, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ApprovalFormVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		
		return entity;
	}
	
	@RequestMapping("/componentdetail")
	@ResponseBody
	public ResponseEntity<ComponentVO> componentDetail(int cp_no, Model model) {
		ResponseEntity<ComponentVO> entity = null;

		ComponentVO componentVO = componentService.selectComponentByCPNO(cp_no);
		
		try {
			
			entity = new ResponseEntity<ComponentVO>(componentVO, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ComponentVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/addFormFavorite")
	@ResponseBody
	public void addFormFavorite(FormFavoriteVO vo) {
		approvalFormService.addFormFavorite(vo);
	}
	
	@RequestMapping("/removeFormFavorite")
	@ResponseBody
	public void removeFormFavorite(int ff_no) {
		approvalFormService.removeFormFavorite(ff_no);
	}
	@RequestMapping(value="/udalPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String udalPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		List<UserDefAprvLnVO> list = service.getAprvLnListPage(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
}

