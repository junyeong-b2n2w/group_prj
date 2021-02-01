package com.gr.cg.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TempSaveCommand;
import com.gr.cg.dto.ApprovalFormVO;
import com.gr.cg.dto.ApprovalVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.ComponentVO;
import com.gr.cg.dto.ConsensusVO;
import com.gr.cg.dto.ElecDocumentVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.FormComponentVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.service.ApprovalFormService;
import com.gr.cg.service.ComponentService;
import com.gr.cg.service.ElecDocumentService;
import com.gr.cg.service.GChartService;
import com.gr.cg.utils.CryptoAria;

@Controller
@RequestMapping("/edoc")
public class ElecDocumentController {
	
	@Autowired
	private ElecDocumentService service;
	@Autowired
	private ApprovalFormService approvalFormService;
	@Autowired
	private ComponentService componentService;
	@Autowired
	private GChartService gService;
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) throws SQLException {
		EmployeeVO vo = (EmployeeVO) session.getAttribute("loginUser");
		Map<String, String> map = service.getMyAprvCnt(vo.getEmp_id());
		model.addAttribute("map", map);
		return "/edoc/main.open";
	}
	@RequestMapping("/registForm")
	public void registForm() {}
	@RequestMapping("/regist")
	public String regist(ElecDocumentVO edoc, TempSaveCommand tempSave, HttpServletResponse res, @RequestParam(defaultValue="0") int[] delfile, RedirectAttributes ra) throws Exception {
		if(edoc.getEd_no() == 0) {
			service.registElecDocument(edoc, tempSave);
		}else {
			if(edoc.getTa_no() == null && delfile[0] == 0) {
				service.registElecDocument(edoc, tempSave);
			}else {
				service.registElecDocumentWithAttach(edoc,tempSave,delfile);
			}
		}
		if(edoc.getEd_aprvstt().equals("DED01")) {
			ra.addFlashAttribute("msg", "등록되었습니다");
			ra.addFlashAttribute("location", "edoc/edocList");
		}else if(edoc.getEd_aprvstt().equals("DED02")) {
			ra.addFlashAttribute("msg", "임시저장 되었습니다");
			ra.addFlashAttribute("location", "edoc/saveList");
		}
		return "redirect:main.open"; 
	}
	@RequestMapping("/list")
	public String list() {
		return "/edoc/list.open";
	}
	@RequestMapping("/detail")
	public String detail(int edno, Model model, HttpSession session, HttpServletResponse response) throws Exception {
		String url = "";
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");
		service.getAprvDates(edno, emp.getEmp_id());
		
		ElecDocumentVO edoc = service.getEdocForDetail(edno);
		if(edoc.getEd_aprvstt().equals("DED04")) {
			String filePath = service.getAprvPafFile(edno);
			byte[] fileByte = FileUtils.readFileToByteArray(new File(filePath));
			response.setContentType("application/pdf");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "inline; fileName=\"" + URLEncoder.encode(edoc.getEd_aprvtitle().replace("+", "_"), "UTF-8") + "\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			url = null;
		}else {
			model.addAttribute("edoc", edoc);
			
			// 결재상태 확인용 map생성
			List<ApprovalVO> aprvList = edoc.getAprvList();
			List<ConsensusVO> consList = edoc.getConsList();
			Map<String, Object> codeMap = new HashMap<>();
			for(ApprovalVO vo : aprvList) {
				codeMap.put(vo.getAprv_empid(), vo);
			}
			for(ConsensusVO vo : consList) {
				codeMap.put(vo.getCons_empid(), vo);
			}
			model.addAttribute("codeMap", codeMap);
			
			// 첨부파일 불러오기
			List<AttachVO> attachList = service.getAttachList(edno);
			for(int i=0; i < attachList.size(); i++) {
				String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
				String t = aria.encryptData(encryptKey);
				attachList.get(i).setAttc_key(t);
			}
			model.addAttribute("attachList", attachList);
			
			
			// 저장된 양식 불러오기
			ApprovalFormVO form = approvalFormService.selectApprovalFormByAFNO(edoc.getEd_formno());
			List<FormComponentVO> formList = form.getFormComponentList();
			List<ComponentVO> comList = new ArrayList<>();
			for(FormComponentVO vo : formList) {
				ComponentVO componentVO = componentService.selectComponentByCPNO(vo.getFc_no());
				comList.add(componentVO);
			}
			model.addAttribute("form", form);
			model.addAttribute("comList", comList);
			
			List<ApprovalVO> allAprvLnList = edoc.getAllAprvLnList();
			
			model.addAttribute("allAprvLnList", allAprvLnList);
			Map<String, ApprovalVO> aprvMap = new HashMap<>();
			for(ApprovalVO vo : allAprvLnList) {
				aprvMap.put(vo.getAprv_empid(), vo);
			}
			model.addAttribute("aprvMap", aprvMap);
			url = "/edoc/detail.open";
		}
		return url;
	}
	@RequestMapping("/modifyForm")
	public void modifyForm() {}
	@RequestMapping("/modify")
	public void modify() {}
	@RequestMapping("/remove")
	public void remove() {}
	
	@RequestMapping("/aprvList")
	public String aprvList() {
		return "/edoc/aprvList.open";
	}
	@RequestMapping("/edocList")
	public String edocList(@RequestParam(defaultValue="none") String main, Model model) {
		if(main.equals("main1")) {
			model.addAttribute("mainCheck", main);
		}else if(main.equals("main2")) {
			model.addAttribute("mainCheck", main);
		}else if(main.equals("main3")) {
			model.addAttribute("mainCheck", main);
		}else{
			model.addAttribute("mainCheck", main);
		}
		return "/edoc/edocList.open";
	}
	@RequestMapping("/saveList")
	public String saveList(@RequestParam(defaultValue="none") String main, Model model) {
		if(main.equals("main")) {
			model.addAttribute("mainCheck", main);
		}else {
			model.addAttribute("mainCheck", main);
		}
		return "/edoc/saveList.open";
	}
	@RequestMapping("/refReadList")
	public String refReadList() {
		return "/edoc/refReadList.open";
	}
	@RequestMapping("/receiveList")
	public String receiveList() {
		return "/edoc/receiveList.open";
	}
	
	@RequestMapping(value="/aprvPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String aprvPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getAprvListByUserId(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/edocPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String edocPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getEdocListByUserId(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/savePageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String savePageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getSaveListByUserId(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/refReadPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String refReadPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getRefReadListByUserId(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/receivePageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String receivePageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getReceiverListByUserId(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/getdeptList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String getdeptList(HttpSession session) throws SQLException, JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		int compno = ((EmployeeVO)session.getAttribute("loginUser")).getComp_no();
		// 조직도용 리스트 뽑기
		List<GChartVO> deptList = gService.getDeptList(compno);
		List<GChartVO> empList = new ArrayList<GChartVO>();
		for(GChartVO vo : deptList) {
			empList = gService.getGhartEmpList(vo.getDept_no());
			vo.setEmpList(empList);
		}
		String jsonList = mapper.writeValueAsString(deptList);
		return jsonList;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteEdoc", method=RequestMethod.POST)
	public String deleteEdoc(int edno) throws SQLException{
		service.removeElecDocument(edno);
		return  "성공";
	}
	@ResponseBody
	@RequestMapping(value="/collectEdoc", method=RequestMethod.POST)
	public String collectEdoc(int edno) throws SQLException{
		service.collectElecDocument(edno);
		return  "성공";
	}
	
	@RequestMapping("/approval")
	public String approval(int gno, String code,int edno, Model model) {
		String url = "";
		if(code.charAt(3) == '1' || code.charAt(3) == '2') {	// 합의일경우
			url = "/edoc/consensus.open";
		}else {	// 합의일겨우
			url = "/edoc/approval.open";
		}
		model.addAttribute("gno", gno);
		model.addAttribute("code", code);
		model.addAttribute("edno", edno);
		return url;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/importantApproval", method=RequestMethod.POST, produces="plain/text;charset=utf-8")
	public void importantApproval(ApprovalVO vo, HttpSession session, HttpServletResponse response) throws Exception{
		service.importantApproval(vo, session, response);
	}
	@ResponseBody
	@RequestMapping(value="/readingAuth", method=RequestMethod.POST, produces="plain/text;charset=utf-8")
	public void readingAuth(int edno,@RequestParam(value="list[]") List<String> list) throws Exception{
		service.addReadingAuth(list, edno);
	}
	@ResponseBody
	@RequestMapping(value="/importantReturn", method=RequestMethod.POST)
	public void importantReturn(ApprovalVO vo) throws Exception{
		service.importantReturn(vo);
	}
	@ResponseBody
	@RequestMapping(value="/importantConsensus", method=RequestMethod.POST)
	public void importantConsensus(ConsensusVO vo, int checkCons) throws SQLException{
		if(checkCons == 1) {	// 반대일경우
			service.importantConsYesNo(vo, checkCons);
		}else {	// 찬성일경우
			service.importantConsYesNo(vo,checkCons);
		}
	}
	
	@RequestMapping(value="aprvConsDetail", method=RequestMethod.GET)
	public String aprvConsDetail(int coapno, int gbcode, Model model) throws SQLException{
		String url = "";
		if(gbcode == 1) {
			ApprovalVO aprv = service.getAprvDetail(coapno);
			url = "edoc/aprvDetail.open";
			model.addAttribute("aprv", aprv);
			
			// 첨부파일 불러오기
			List<AttachVO> attachList = service.getAprvAttachList(aprv.getAprv_no());
			for(int i=0; i < attachList.size(); i++) {
				String encryptKey = attachList.get(i).getAttc_key() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
				String t = aria.encryptData(encryptKey);
				attachList.get(i).setAttc_key(t);
			}
			model.addAttribute("attachList", attachList);
		}else {
			ConsensusVO cons = service.getConsDetail(coapno);
			url = "edoc/consDetail.open";
			model.addAttribute("cons", cons);
		}
		return url;
	}
	
	
	
	
	@RequestMapping(value="/myAprvPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String myAprvPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getMyAprvList(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/myAprvWaitPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String myAprvWaitPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getMyAprvWaitList(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/myAprvIngPageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String myAprvIngPageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getMyAprvIngList(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
	@RequestMapping(value="/myReceivePageList", method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String myReceivePageList(SearchCriteria2 cri) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
		ObjectMapper mapper = new ObjectMapper();
		List<ElecDocumentVO> list = service.getMyReceiveList(cri);
		String jsonList = mapper.writeValueAsString(list);
		URLEncoder.encode(jsonList,"utf-8");
		return jsonList;
	}
}

