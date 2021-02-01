package com.gr.cg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.dao.BdocDAO;
import com.gr.cg.dao.FileDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.BusinessDocumentVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.service.BdocService;
import com.gr.cg.utils.CryptoAria;

@Controller
@RequestMapping("/bdoc")
public class BdocController {

	private static final Logger logger = 
			LoggerFactory.getLogger(BdocController.class);
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@Autowired
	private FileDAO fileDAO;
	
	@Autowired 
	private BdocService bdocService;
	
	@Resource(name="bdocUploadPath")
	private String uploadPath;
	
	@Autowired
	private BdocDAO bdocDAO;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "/bdoc/list.open";
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("shareType", "P");
		map.put("empid", user.getEmp_id());
		map.put("isFirst", "Y");
		map.put("upfd","0");
		
		
		
		List<BusinessDocumentVO> bdocList = bdocService.selectbdocList(map);
		
		for(int i = 0; i<bdocList.size(); i++) {
			String encryptKey = bdocList.get(i).getBd_attckey() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			bdocList.get(i).setBd_attckey(t);
		}
		
		mnv.addObject("bdocList",bdocList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/teamList")
	public ModelAndView shareList(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "/bdoc/teamList.open";
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("shareType", "T");
		map.put("deptno", String.valueOf(user.getEmp_deptno()));
		map.put("isFirst", "Y");
		map.put("upfd","0");
		
		
		List<BusinessDocumentVO> bdocList = bdocService.selectbdocList(map);
		
		for(int i = 0; i<bdocList.size(); i++) {
			String encryptKey = bdocList.get(i).getBd_attckey() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			bdocList.get(i).setBd_attckey(t);
		}
		
		mnv.addObject("bdocList",bdocList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/companyList")
	public ModelAndView companyList(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "/bdoc/companyList.open";
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("shareType", "C");
		map.put("cmpno", String.valueOf(user.getComp_no()));
		map.put("isFirst", "Y");
		map.put("upfd","0");
		
		
		List<BusinessDocumentVO> bdocList = bdocService.selectbdocList(map);
		
		for(int i = 0; i<bdocList.size(); i++) {
			String encryptKey = bdocList.get(i).getBd_attckey() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
			String t = aria.encryptData(encryptKey);
			bdocList.get(i).setBd_attckey(t);
		}
		
		mnv.addObject("bdocList",bdocList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/getBdocList",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getBdocList(HttpSession session, @RequestParam(defaultValue="0")int shareType, int upfd) throws Exception{
		
		/** 파라미터 정의 
		 * shareType : 공유 범위 설정
		 * flag : 인가된 사용자가 맞는지 검증을 위한 flag
		 * upfd : 클릭한 상위폴더의 번호*/
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		Boolean flag = false;
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, String> map = new HashMap<>();
		
		/** 로직처리*/
		
		/** 클릭한 번호가 폴더가 아닐시 리턴*/
		/** 인가된 사용자가 맞는지 확인*/
		BusinessDocumentVO bdoc = bdocDAO.selectBdocByBdNo(upfd);
		if(bdoc != null && bdoc.getBd_fileyn().equals("N")) { 
			if(shareType == 0) {
				if(bdoc.getBd_empid().equals(user.getEmp_id())) {
					flag = true;
				}
			}else if(shareType == 1) {
				if(bdoc.getBd_deptno() == user.getDept_no()) {
					flag = true;
				}
			}else if(shareType == 2) {
				if(bdoc.getBd_cmpno() == user.getComp_no()) {
					flag = true;
				}
			}
		}
		
		if(upfd == 0) {
			flag = true;
		}
		
		/** 정상적인 접근이 아닐시 */
		if(!flag) {
			return null;
		}
		
		/** 조회*/
		map.put("isFirst", "N");
		map.put("upfd", String.valueOf(upfd));
		if(shareType == 0) {
			map.put("shareType", "P");
			map.put("empid", user.getEmp_id());
		}else if(shareType == 1) {
			map.put("shareType", "T");
			map.put("deptno", String.valueOf(user.getDept_no()));
		}else if(shareType == 2) {
			map.put("shareType", "C");
			map.put("cmpno", String.valueOf(user.getComp_no()));
		}
		
		
		
		List<BusinessDocumentVO> bdocList = bdocService.selectbdocList(map);
		
		if(bdocList != null) {
			for(int i = 0; i<bdocList.size(); i++) {
				String encryptKey = bdocList.get(i).getBd_attckey() + "__"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmm"));
				String t = aria.encryptData(encryptKey);
				bdocList.get(i).setBd_attckey(t);
			}
		}
		
		
		/** 최 하위 디렉토리에서 아무 파일 및 폴더가 없을시 상위폴더를 가기위한 seq */
		if(bdocList.size() == 0) {
			return mapper.writeValueAsString(bdocDAO.selectUpfd(map));
		}
		
		return mapper.writeValueAsString(bdocList);
	}
	
	
	//문서 삭제
	@RequestMapping(value="/remove", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String remove(HttpSession session, int removeType, @RequestParam(defaultValue="0") int[] bd_no) throws Exception{
		
		
		/** 파라미터 정의 
		 * bd_no : 문서번호
		 * removeType : 개인, 부서, 회사 삭제 위치 구분*/
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		Boolean flag = null;
		
		/** 삭제할 문서 및 파일정보 입력 */
		flag = bdocService.removeBdoc(bd_no, user, removeType);
		
		/** 로직처리 */
		if(flag) {
			
			if(removeType == 0) {
				logger.info("[BdoController] '{}' 유저가 개인 업무문서합에서 문서번호 '{}'를 삭제하였습니다.",user.getEmp_id(),bd_no);
			}else if (removeType == 1) {
				logger.info("[BdoController] '{}' 유저가 부서 업무문서합에서 문서번호 '{}'를 삭제하였습니다.",user.getEmp_id(),bd_no);
			}else if (removeType == 2) {
				logger.info("[BdoController] '{}' 유저가 회사 업무문서합에서 문서번호 '{}'를 삭제하였습니다.",user.getEmp_id(),bd_no);
			}
			return "성공";
		}
		return "실패";
	}
	
	//문서 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String modify(HttpSession session, int shareType, @RequestParam(defaultValue="0") int bd_no, String bd_nm) throws Exception{
		
		
		/** 파라미터 정의 
		 * bd_no : 문서번호
		 * removeType : 개인, 부서, 회사 삭제 위치 구분*/
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		Boolean flag = null;
		BusinessDocumentVO bdoc = new BusinessDocumentVO();
		bdoc.setBd_no(bd_no);
		bdoc.setBd_nm(bd_nm);
		bdoc.setBd_udtid(user.getEmp_id());
		
		/** 수정할 문서 및 파라미터 검증 */
		if(bd_no <= 0) {
			return null;
		}
		flag = bdocService.modifyBdoc(bdoc, user, shareType);
		
		/** 로직처리 */
		if(flag) {
			if(shareType == 0) {
				logger.info("[BdoController] '{}' 유저가 개인 업무문서합에서 문서번호 '{}'를 수정하였습니다.",user.getEmp_id(),bd_no);
			}else if (shareType == 1) {
				logger.info("[BdoController] '{}' 유저가 부서 업무문서합에서 문서번호 '{}'를 수정하였습니다.",user.getEmp_id(),bd_no);
			}else if (shareType == 2) {
				logger.info("[BdoController] '{}' 유저가 회사 업무문서합에서 문서번호 '{}'를 수정하였습니다.",user.getEmp_id(),bd_no);
			}
			return "성공";
		}
		return "실패";
	}
	
	
	
	@RequestMapping(value="/regist",method=RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String registFile (int[] ta_no, HttpSession session,@RequestParam(defaultValue="0")int shareType, @RequestParam(defaultValue="0")int upfd) throws Exception{
		
		/** 파라미터 정의 
		 * ta_no : 임시폴더 파일 번호
		 * uploadType : 개인, 부서, 회사 업로드 위치 구분*/ 
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		/** upfd 검증*/
		if(upfd < 0) {
			return "실패";
		}
		
		/** 파일정보 입력 */ 
		BusinessDocumentVO bdoc = new BusinessDocumentVO();
		bdoc.setBd_empid(user.getEmp_id());
		bdoc.setBd_useyn("Y");
		bdoc.setBd_fileyn("Y");
			
		if (shareType == 1) {
			bdoc.setBd_shareyn("T");
		}else if (shareType == 2) {
			bdoc.setBd_shareyn("C");
		}else {
			bdoc.setBd_shareyn("P");
		}
		bdoc.setBd_upfd(upfd);
		bdoc.setBd_udtid(user.getEmp_id());
		bdoc.setBd_cmpno(user.getComp_no());
		bdoc.setBd_deptno(user.getEmp_deptno());
		
		/** 로직처리 */
		int attach_no =  bdocService.registBdoc(ta_no, bdoc, uploadPath);
		if(attach_no > 0) {
			if(shareType == 0) {
				logger.info("[BdoController]" + user.getEmp_id() + "유저가 개인 업무문서합에 파일을 저장하였습니다.");
			}else if (shareType == 1) {
				logger.info("[BdoController]" + user.getEmp_id() + "유저가 부서 업무문서합에 파일을 저장하였습니다.");
			}else if (shareType == 2) {
				logger.info("[BdoController]" + user.getEmp_id() + "유저가 회사 업무문서합에 파일을 저장하였습니다.");
			}
			return String.valueOf(attach_no);
		}
		
		if(shareType == 0) {
			logger.info("[BdoController]" + user.getEmp_id() + "유저가 개인 업무문서합에 파일 저장에 실패하였습니다.");
		}else if (shareType == 1) {
			logger.info("[BdoController]" + user.getEmp_id() + "유저가 부서 업무문서합에 파일 저장에 실패하였습니다.");
		}else if (shareType == 2) {
			logger.info("[BdoController]" + user.getEmp_id() + "유저가 회사 업무문서합에 파일 저장에 실패하였습니다.");
		}
		return "실패";
	}
	
	@RequestMapping(value="/shareBdoc")
	public String shareBdoc(@RequestParam(defaultValue="0")int shareType, HttpSession session, int bd_no) throws Exception {
		if(bd_no < 1) {
			return "실패";
		}
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		int flag = bdocService.shareBdoc(bd_no, uploadPath, shareType, user);
		
		if(flag > 0) {
			return "성공";
		}
		
		return "실패";
	}
	//폴더 목록만 가져오기
	@RequestMapping(value = "/folderList", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String folderList(@RequestParam(defaultValue="0")int shareType, HttpSession session) throws Exception{
		
		
		/** 파라미터 정의 
		 * shareType : 개인, 부서, 회사 삭제 위치 구분*/
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, String> map = new HashMap<>();
		
		/** 공유 범위 지정 */
		if(shareType == 0) {
			map.put("shareType", "P");
			map.put("empid", user.getEmp_id());
		}else if(shareType == 1) {
			map.put("shareType", "T");
			map.put("deptno", String.valueOf(user.getDept_no()));
		}else if(shareType == 2) {
			map.put("shareType", "C");
			map.put("cmpno", String.valueOf(user.getComp_no()));
		}
		
		/** 로직처리 */
		List<BusinessDocumentVO> bdocList = bdocService.selectFolderList(map);
		String jsonData = mapper.writeValueAsString(bdocList);
		
		return jsonData;
	}
	
	//폴더 만들기
	@RequestMapping(value = "/registFolder", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String registFolder(@RequestParam(defaultValue="0")int bd_upfd,String bd_nm,@RequestParam(defaultValue="0")int shareType, HttpSession session) throws Exception{
		
		
		/** 파라미터 정의 
		 * shareType : 개인, 부서, 회사 등록 위치 구분*/
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		BusinessDocumentVO bdoc = new BusinessDocumentVO();
		
		bdoc.setBd_empid(user.getEmp_id());
		bdoc.setBd_useyn("Y");
		bdoc.setBd_fileyn("N");
		bdoc.setBd_upfd(bd_upfd);
		bdoc.setBd_attckey(UUID.randomUUID().toString());
		bdoc.setBd_cmpno(user.getComp_no());
		bdoc.setBd_deptno(user.getDept_no());
		bdoc.setBd_nm(bd_nm);
		bdoc.setBd_udtid(user.getEmp_id());
		
		/** 공유 범위 지정 */
		if(shareType == 1 ) {
			bdoc.setBd_shareyn("T");
		}else if(shareType == 2) {
			bdoc.setBd_shareyn("C");
		}else {
			bdoc.setBd_shareyn("P");
		}
		
		/** 로직처리 */
		bdocService.registFolder(bdoc);
		
		
		return "머고";
	}
	
	//폴더 및 파일 이동
	@RequestMapping(value = "/moveitem", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String moveItem(@RequestParam(defaultValue="0")int bd_upfd,@RequestParam(defaultValue="0")int bd_no,@RequestParam(defaultValue="0")int shareType, HttpSession session) throws Exception{
		
		
		/** 파라미터 정의 
		 * shareType : 개인, 부서, 회사 등록 위치 구분*/
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		BusinessDocumentVO bdoc = new BusinessDocumentVO();
		if(bd_upfd < 1) {
			bd_upfd = 0;
		}
		if(bd_no < 1) {
			bd_no = 0;
		}
		
		bdoc.setBd_no(bd_no);
		bdoc.setBd_upfd(bd_upfd);
		
		
		/** 로직처리 */
		Boolean flag = bdocService.moveItem(bdoc, user, shareType);
		
		if(flag) {
			return "성공";
		}
		
		
		return "실패";
	}
	
	
	//폴더 다운로드
	@RequestMapping("/download")
	public ResponseEntity<byte[]> downloadFolder (@RequestParam(defaultValue="0")int bd_upfd,@RequestParam(defaultValue="0")int[] bd_no,@RequestParam(defaultValue="0")int shareType, HttpSession session, HttpServletResponse response, String[] bd_attckey) throws Exception{
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<>();
		
		/** 공유 범위 지정 */
		if(shareType == 0) {
			map.put("shareType", "P");
			map.put("empid", user.getEmp_id());
		}else if(shareType == 1) {
			map.put("shareType", "T");
			map.put("deptno", String.valueOf(user.getDept_no()));
		}else if(shareType == 2) {
			map.put("shareType", "C");
			map.put("cmpno", String.valueOf(user.getComp_no()));
		}
		
		String filePath ="";
		
		/** 전체다운로드 */
		if(bd_upfd != 0 || (bd_upfd == 0 && bd_no[0] == 0)){
			map.put("bd_upfd", String.valueOf(bd_upfd));
			filePath = bdocService.downloadAll(map, user, shareType);
		}
		
		/** 폴더 다운로드 */
		if(bd_no[0] != 0 && bd_no.length == 1) {
			/** 시간체크 */
			String decrypt = aria.decryptData(bd_attckey[0].replaceAll(" ", "+"));
			String cliKey = decrypt.split("__")[0];
			String cliTime = decrypt.split("__")[1];
			LocalDateTime maxTime = LocalDateTime.parse(cliTime,DateTimeFormatter.ofPattern("yyyyMMddHHmm")).plusMinutes(5);
			if(LocalDateTime.now().isAfter(maxTime)) { // 다운로드가 불가능한 시간일 떄
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('오류가 발생했습니다. 관리자에게 문의해주세요');history.go(-1);</script>");
			}
			
			
			BusinessDocumentVO bdoc = bdocDAO.selectBdocByBdNo(bd_no[0]);
			if(bdoc.getBd_fileyn().equals("N")) {
				if(bdoc.getBd_attckey().equals(cliKey)) {
					String bd = Arrays.toString(bd_no);
					String bdno = bd.substring(1,bd.length()-1);
					map.put("bd_no", bdno);
					filePath = bdocService.folderDownloadList(map, user, shareType);
				}
			}else if(bdoc.getBd_fileyn().equals("Y")) {
				int attcno = bdocDAO.selectAttNoByBdNo(bd_no[0]);
				if(attcno > 0) {
					AttachVO attach = fileDAO.selectOne(attcno);
					if(attach != null) {
						filePath = attach.getAttc_route() + File.separator + attach.getAttc_nm() + "$$" + attach.getAttc_extnm(); 
					}
				}
			}
			
			
		}
		
		//여러파일 다운로드
		if(bd_no.length > 1) {
			filePath = bdocService.choiceDownload(bd_no, user, shareType, map);
		}
		
		if(filePath.length() < 10) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('오류가 발생하였습니다. 또는 파일용량이 100MB를 초과합니다'); history.go(-1);");
			out.println("</script>");
			
			out.close();
		}else {
			String realName = filePath.substring(filePath.lastIndexOf("\\")+1);
			if(filePath.lastIndexOf("$$") >= 0) {
				realName = filePath.substring(filePath.lastIndexOf("$$")+2, filePath.length());
				filePath = filePath.substring(0, filePath.lastIndexOf("$$"));
			}
			File target = new File(filePath);
			
			ResponseEntity<byte[]> entity = null;
			if(target.exists()) {
				InputStream in = null;
				
				/** 헤더 설정 */ 
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment;fileName=\"" + new String(realName.getBytes("utf-8"), "ISO-8859-1") + "\"");
//			headers.add("Content-Disposition", "attachment;fileName=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
				
				try {
					in = new FileInputStream(target);
					entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
					logger.info("{} 유저가 '{}' 파일을 다운로드 하였습니다.", user.getEmp_id(), realName);
					
				} catch (Exception e) {
					logger.error("{}",e);
					entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
				} finally {
					in.close();
				}
			}
			
			return entity;
		}
		return null;
		
	}
	
	
}
