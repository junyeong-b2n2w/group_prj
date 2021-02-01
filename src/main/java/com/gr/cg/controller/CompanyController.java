package com.gr.cg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Writer;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.CompanyVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.GChartVO;
import com.gr.cg.dto.MenuVO;
import com.gr.cg.service.CompanyService;
import com.gr.cg.service.EmpService;
import com.gr.cg.service.MenuService;

@Controller
@RequestMapping("/role/company")
public class CompanyController {
	
	@Autowired
	CompanyService service;
	
	@Autowired
	EmpService empService;
	
	@Autowired
	private MenuService menuService;
	
	
	@Resource(name="logoUploadPath")
	private String logoUploadPath;
	
	@Resource(name="sealUploadPath")
	private String sealUploadPath;
	
	@RequestMapping("/registForm")
	public String registMain() {
		String url = "company/companyRegist.open";
		return url;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public void regist(CompanyVO comp, @RequestParam(required = false) MultipartFile logoInput, @RequestParam(required = false) MultipartFile sealInput, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		
		String logoName= null;
		comp.setComp_logo("noImage");
		if(logoInput != null && !logoInput.getOriginalFilename().equals("")) {
			String logoPath = logoUploadPath.replace("/", File.separator);
			logoName = UUID.randomUUID().toString().replace("-", "");
			String logoFormat = logoInput.getOriginalFilename().substring(logoInput.getOriginalFilename().lastIndexOf("."));
			logoName = logoName + logoFormat;
			
			File saveLogo = new File(logoPath, logoName);
			
			if(!saveLogo.exists()) {
				saveLogo.mkdirs();
			}
			logoInput.transferTo(saveLogo);
			
			comp.setComp_logo(logoName);
		}
		
		String sealName = null;
		comp.setComp_seal("noImage");
		if(sealInput != null && !sealInput.getOriginalFilename().equals("")) {
			String sealPath = sealUploadPath.replace("/", File.separator);
			sealName = UUID.randomUUID().toString().replace("-", "");
			String sealFormat = sealInput.getOriginalFilename().substring(sealInput.getOriginalFilename().lastIndexOf("."));
			sealName = sealName + sealFormat;
			
			File saveSeal = new File(sealPath, sealName);
			
			if(!saveSeal.exists()) {
				saveSeal.mkdirs();
			}
			sealInput.transferTo(saveSeal);
			
			comp.setComp_seal(sealName);
		}
 		
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		comp.setComp_regid(id);
		 
		int compno = service.registCompany(comp);
		
		response.setContentType("text/html;charset=utf-8");
		Writer out = response.getWriter();
		
		out.write("<script>");
		out.write("alert('수정되었습니다.');");
		out.write("location.href='" + request.getContextPath() + "/company/detail?comp_no=" + compno +"'");
		out.write("</script>");
		
		out.close();
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detail(@RequestParam(defaultValue="0" ,required=false)int comp_no, ModelAndView mnv,HttpSession session) throws SQLException {
		String url = "company/companyDetail.open";
		
		if(comp_no == 0) {
			comp_no = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_compno();
		}
		
		CompanyVO comp = service.getCompany(comp_no);

		List<Map<String, Object>> cmList = empService.getCmList(comp_no);
		
		mnv.addObject("comp", comp);
		mnv.addObject("cmList", cmList);
		mnv.setViewName(url);
		
		

		List<MenuVO> allMenuList = menuService.getAllMainMenuList();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("allMenuList",allMenuList);
		
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		
		return mnv;
	}
	

	
	@RequestMapping("/getLogo")
	@ResponseBody
	public byte[] getLogo(String fileName)throws IOException {
		
		String savePath = logoUploadPath.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		FileInputStream in = null;
		
		byte[] fin = null;
		try {
			in = new FileInputStream(sendFile);
			fin = IOUtils.toByteArray(in);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		return fin;
	}
	
	@RequestMapping("/getSeal")
	@ResponseBody
	public byte[] getSeal(String fileName)throws IOException {
		
		String savePath = sealUploadPath.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		FileInputStream in = null;
		
		byte[] fin = null;
		try {
			in = new FileInputStream(sendFile);
			fin = IOUtils.toByteArray(in);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			in.close();
		}
		return fin;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int comp_no, ModelAndView mnv) throws SQLException {
		String url = "company/companyModify.open";
		
		CompanyVO comp = service.getCompany(comp_no);

		mnv.addObject("comp", comp);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public void modify(CompanyVO comp, @RequestParam(required = false) MultipartFile logoInput, @RequestParam(required = false)MultipartFile sealInput, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String url = "company/detail.open";

		String logoName = null;
		comp.setComp_logo("");
		if(logoInput != null && !logoInput.getOriginalFilename().equals("")) {
			String logoPath = logoUploadPath.replace("/", File.separator);
			logoName = UUID.randomUUID().toString().replace("-", "");
			String logoFormat = logoInput.getOriginalFilename().substring(logoInput.getOriginalFilename().lastIndexOf("."));
			logoName = logoName + logoFormat;
			
			File saveLogo = new File(logoPath, logoName);
			
			if(!saveLogo.exists()) {
				saveLogo.mkdirs();
			}
			logoInput.transferTo(saveLogo);
			
			comp.setComp_logo(logoName);
		}
		
		String sealName = null;
		comp.setComp_seal("");
		if(sealInput != null && !sealInput.getOriginalFilename().equals("")) {
			String sealPath = sealUploadPath.replace("/", File.separator);
			sealName = UUID.randomUUID().toString().replace("-", "");
			String sealFormat = sealInput.getOriginalFilename().substring(sealInput.getOriginalFilename().lastIndexOf("."));
			sealName = sealName + sealFormat;
			
			File saveSeal = new File(sealPath, sealName);
			
			if(!saveSeal.exists()) {
				saveSeal.mkdirs();
			}
			sealInput.transferTo(saveSeal);
			
			comp.setComp_seal(sealName);
		}
 		
		String id = ((EmployeeVO)session.getAttribute("loginUser")).getEmp_id();
		
		comp.setComp_udtid(id);
		
		service.updateCompany(comp);
		
		response.setContentType("text/html;charset=utf-8");
		Writer out = response.getWriter();
		
		out.write("<script>");
		out.write("alert('수정되었습니다.');");
		out.write("location.href='" + request.getContextPath() + "/role/company/detail?comp_no=" + comp.getComp_no()+"'");
		out.write("</script>");
		
		out.close();
	}
	
	@RequestMapping(value="/list")
	public String main() throws SQLException{
		String url = "company/company.open";
		
		return url;
	}
	
	@RequestMapping(value="/companyList", method=RequestMethod.POST ,produces="application/json;charset=utf-8")
	@ResponseBody
	public String companyList(SearchCriteria2 cri) throws Exception{
		
		List<CompanyVO> compList= service.getCompanyList(cri);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(compList);
		URLEncoder.encode(jsonList,"utf-8");
		
		return jsonList;
	}
	
	@ResponseBody
	@RequestMapping(value="/inactive", method=RequestMethod.GET)
	public void inactive(int comp_no) throws SQLException{
		service.updateInactive(comp_no);
	}
	
}
