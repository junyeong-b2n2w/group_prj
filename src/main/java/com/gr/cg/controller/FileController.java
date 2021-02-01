package com.gr.cg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gr.cg.dao.FileDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.TempAttcVO;
import com.gr.cg.service.FileService;
import com.gr.cg.utils.CryptoAria;

@RestController
@RequestMapping("/file")
public class FileController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(FileController.class);
	
	@Autowired 
	private FileService fileService;
	
	@Autowired
	private FileDAO fileDAO;
	
	@Resource(name = "cryptoService")
	private CryptoAria aria;
	
	@Resource(name="logoUploadPath")
	private String uploadPath;
	
	@Resource(name="tempUploadPath")
	private String tempPath;
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")	
	public String uploadAjax(MultipartFile file, HttpSession session) throws Exception {

		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		String email= user.getEmp_id();
		
		int ta_no = uploadFile(file,email);
		
		if(ta_no > 0) {
			logger.info(email+" 유저가 임시폴더에 파일을 등록하였습니다.");
			logger.info("originalName : " + file.getOriginalFilename());
			logger.info("size : " + file.getSize());
			logger.info("contentType : " + file.getContentType());	
			return "{\"filename\":\""+file.getOriginalFilename()+"\",\"ta_no\":"+ ta_no+"}";
		}
		
		return "실패";
	}
	
	
	@RequestMapping(value ="/getFile")
	public ResponseEntity<byte[]> getFile(int attc_no, String attc_key, HttpServletResponse response, HttpSession session) throws Exception{
		
		/** 파라미터 정의 */ 
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");

		/** 파일정보 조회 */ 
		AttachVO attach = fileDAO.selectOne(attc_no);
		
		/** 로직처리 */ 
		String fileUploadPath = attach.getAttc_route();
		String fileName = attach.getAttc_nm();
		String realName = attach.getAttc_extnm();

		/** 시간 비교 */
		String decrypt = aria.decryptData(attc_key.replaceAll(" ", "+"));
		String cliKey = decrypt.split("__")[0];
		String cliTime = decrypt.split("__")[1];
		LocalDateTime maxTime = LocalDateTime.parse(cliTime,DateTimeFormatter.ofPattern("yyyyMMddHHmm")).plusMinutes(5);
		if(LocalDateTime.now().isAfter(maxTime)) { // 다운로드가 불가능한 시간일 떄
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('오류가 발생했습니다. 관리자에게 문의해주세요');history.go(-1);</script>");
		}
		
		
		/** 파일다운로드 처리 */
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		if(cliKey.equals(attach.getAttc_key())) {
			/** 헤더 설정 */ 
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;fileName=\"" + new String(realName.getBytes("utf-8"), "ISO-8859-1") + "\"");
//			headers.add("Content-Disposition", "attachment;fileName=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
			
			try {
				in = new FileInputStream(fileUploadPath + File.separator + fileName);
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
				logger.info("{} 유저가 '{}' 파일을 다운로드 하였습니다.", user.getEmp_id(), attach.getAttc_extnm());
				
			} catch (Exception e) {
				logger.error("{}",e);
				entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
			} finally {
				if (in != null) in.close();
			}
		}

		
//		if(key.equals(cerKey+attc_key.replaceAll(" " , "+"))) {
////			System.out.println("다운가능");
//			String fileUploadPath = attach.getAttc_route();
//			String fileName = attach.getAttc_nm();
//
//			InputStream in = null;
//			ResponseEntity<byte[]> entity = null;
//			try {
//				in = new FileInputStream(fileUploadPath + File.separator + fileName);
//				fileName = fileName.substring(fileName.indexOf("$$") + 2 );
//				
//				HttpHeaders headers = new HttpHeaders();
//				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//				headers.add("Content-Disposition", "attachment;fileName=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
//				
//				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
//				logger.info(user.getEmp_id()+"유저가 '" + attach.getAttc_extnm() + "' 파일을 다운로드 하였습니다.");
//			} catch (Exception e) {
//				e.printStackTrace();
//				entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
//			} finally {
//				in.close();
//			}
//		}else {
//			logger.info(user.getEmp_id()+"유저가 '" + attach.getAttc_no() + "' 번호와 '" + attach.getAttc_key() + "'키 값을 가지고 다운로드를 시도하였습니다.");
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>alert('오류가 발생했습니다. 관리자에게 문의해주세요');history.go(-1);</script>");
//			System.out.println("실패");
//		}
		
		return entity;
	}
	
	//파일 삭제
	@RequestMapping(value ="/remove",method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String removeFile(int attc_no, HttpSession session) throws Exception{
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("loginUser");
		
		AttachVO attach = new AttachVO();
		attach.setAttc_writer(user.getEmp_id());
		attach.setAttc_no(attc_no);
		
		fileService.removeFile(attach);
		
		attach = fileDAO.selectOne(attc_no);
		
		if(attach != null) {
			return "실패";
		}
		
		return "성공";
	}
	
	// 임시폴더에 저장
	public int uploadFile(MultipartFile file, String email) throws Exception {
		
		TempAttcVO tattach = new TempAttcVO(); 
		
		
		//원래이름, 크기, 작성자
		tattach.setTa_extnm(file.getOriginalFilename());
		tattach.setTa_sz(file.getSize());
		tattach.setTa_writer(email);
		
		//중복파일명 해결..
		UUID uid=UUID.randomUUID();
		String orgName = file.getOriginalFilename();
		String saveName=uid.toString().replace("-", "");
		tattach.setTa_nm(saveName);
		
		//저장 경로..
		String savePath=tempPath;
		File s = new File(savePath);
		if(!s.exists()) {
			s.mkdirs();
		}
		tattach.setTa_route(savePath);
		
		String formatName=orgName.substring(orgName.lastIndexOf(".")+1);
		tattach.setTa_extn(formatName);
		
		//저장..
		File target=new File(savePath,saveName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		logger.info("saved path : "+target.getAbsolutePath());
		
		int count = fileService.registTemp(tattach);
		
		return count;	
	}
	
}
