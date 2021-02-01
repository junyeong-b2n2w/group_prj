package com.gr.cg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/summernote")
public class SummerNoteController {
	
	@Resource(name="summernoteUploadPath")
	private String summernotePath;
	
	@RequestMapping("/uploadImg.do")
	@ResponseBody
	public String uploadImg(HttpServletRequest request, MultipartFile file) throws Exception{
		
		String savePath = summernotePath.replace("/", File.separator);
		String fileName = UUID.randomUUID().toString().replace("-", "");
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		fileName = fileName + fileFormat;
		
		File saveFile = new File(savePath, fileName);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		file.transferTo(saveFile);
		
		return request.getContextPath()+"/summernote/getImg.do?fileName="+fileName;
	}
	
	@RequestMapping("/getImg.do")
	@ResponseBody
	public byte[] getImg(String fileName)throws IOException {
		
		String savePath = summernotePath.replace("/", File.separator);
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
	
	@RequestMapping("/deleteImg")
	@ResponseBody
	public String deleteImg(@RequestBody Map<String, String> data) throws Exception{
		
		String fileName = data.get("fileName");
		
		String savePath = summernotePath.replace("/", File.separator);
		File target = new File(savePath, fileName);
		
		String result="";
		if(!target.exists()) {
			result = "NOFILE";
		} else {
				target.delete();
				result = "SUCCESS";
		}
		
		return result;
	}
}
