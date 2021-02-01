package com.gr.cg.interceptor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AttachFileLoginterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
//		Map<String, Object> modelMap = modelAndView.getModelMap();
//		List<AttachVO> attachList = (List<AttachVO>) modelMap.get("attachList");
//		
//		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
//		
//		String log = "[File]"
//				+ loginUser.getId() + ","
//				+ loginUser.getName() + ","
//				+ new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + ","
//				+ "{";
//		if(attachList !=null) {
//			for(AttachVO attach : attachList) {
//				log += attach.getFileName() +" ";
//			}
//		}
//		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		log+= "}," + attachList.get(0).getUploadPath();
//		
//		String savePath = "d:\\log";
//		if(!new File(savePath).exists()) {
//			new File(savePath).mkdirs();
//		}
//		
//		String logFilePath = savePath + File.separator + "attach_file_log.txt";
//		
//		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true));
//		
//		out.write(log);
//		out.newLine();
//		out.close();
	}
	
}
