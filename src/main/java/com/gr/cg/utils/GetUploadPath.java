package com.gr.cg.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

public class GetUploadPath {
	
	public static String getUploadDatePath(String path) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = cal.get(Calendar.YEAR) + "";
		String monthPath = File.separator+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String savePath = yearPath+monthPath+datePath;
		path += savePath;
		
		return path;
	}
	
	public static String getCompanyPath(String path, String comName) {
		String spl[] = path.split("/");
		String comPath = "";
		int cnt = 0;
		for(String pa : spl) {
			if(cnt == 2) {
				comPath = comPath + comName +File.separator + pa + File.separator;
			}else {
				comPath += pa + File.separator;
			}
			cnt++;
		}
		return comPath;
	}
}
