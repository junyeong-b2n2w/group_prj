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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/img")
public class ImageController {
	
	@Resource(name="imgUploadPath")
	private String imgUploadPath;
	
	@RequestMapping(value="/uploadImg", method=RequestMethod.POST)
	@ResponseBody
	public String uploadImg(HttpServletRequest request, MultipartFile file) throws Exception{
		String savePath = imgUploadPath.replace("/", File.separator);
		String fileName = UUID.randomUUID().toString().replace("-", "");
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		fileName = fileName + fileFormat;
		
		File saveFile = new File(savePath, fileName);
		
		if(!saveFile.exists()) {
			saveFile.mkdirs();
		}
		
		file.transferTo(saveFile);
		return request.getContextPath()+"/img/getImg?fileName="+fileName;
	}
	
	@RequestMapping("/getImg")
	@ResponseBody
	public byte[] getImg(String fileName)throws IOException {
		
		String savePath = imgUploadPath.replace("/", File.separator);
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
		
		String savePath = imgUploadPath.replace("/", File.separator);
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
