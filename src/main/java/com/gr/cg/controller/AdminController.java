package com.gr.cg.controller;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gr.cg.command.CompanyResources;
import com.gr.cg.command.ResourcesCommand;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static List<ResourcesCommand> list = new ArrayList<>();
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "/admin/list.open";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/resources")
	@ResponseBody
	public String Resource(HttpSession session) throws Exception{
			 OperatingSystemMXBean bean = (com.sun.management.OperatingSystemMXBean) ManagementFactory
			            .getOperatingSystemMXBean();
	    	int cpu = (int) (((com.sun.management.OperatingSystemMXBean) bean).getSystemCpuLoad() * 100);
	    	String total =  String.format("%.2f",(double)((com.sun.management.OperatingSystemMXBean) bean).getTotalPhysicalMemorySize()/1024/1024/1024  );
	    	String free = String.format("%.2f", (double)((com.sun.management.OperatingSystemMXBean) bean).getFreePhysicalMemorySize()/1024/1024/1024  );
	    	
	    	ResourcesCommand resCom = new ResourcesCommand();
	    	List<CompanyResources> comList = new ArrayList<>();
	    	resCom.setCpu(cpu);
	    	resCom.setTotal(total);
	    	resCom.setFree(free);
	    	ObjectMapper mapper = new ObjectMapper();
	    	list.add(resCom);
	    	
	    	File file = new File("C:\\group");
	    	
	    	if(file.isDirectory()) {
	    		long size = getFolderSize(file);
	    		
	    		int count = file.listFiles().length;
	    	    for (int i = 0; i < count; i++) {
	    	    	
	    	    	if(file.listFiles()[i].getName().equals("temp")) {
	    	    		continue;
	    	    	}
	    	    	CompanyResources com = new CompanyResources();
    	    		com.setComName(file.listFiles()[i].getName());
    	    		if(file.listFiles()[i].isDirectory()) {
    	    			long comSize = getFolderSize(file.listFiles()[i]);
    	    			com.setHddSize(comSize);
    	    		}
	    	    	
    	    		comList.add(com);
	    	    	
	    	    }
	    		
	    		resCom.setComList(comList);
	    		resCom.setHddTotalSize(size);
	    	}
	    	
	    	
	    	if(list.size() > 5) {
	    		list.remove(0);
	    	}
	    	
            return mapper.writeValueAsString(list);
            
	}
	
	public static long getFolderSize(File folder) {
	    long length = 0;
	    File[] files = folder.listFiles();
	    int count = files.length;
	    for (int i = 0; i < count; i++) {
	        if (files[i].isFile()) {
	            length += files[i].length();
	        } else {
	            length += getFolderSize(files[i]);
	        }
	    }
	    return length;
	}

}
