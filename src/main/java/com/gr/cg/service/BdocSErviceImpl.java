package com.gr.cg.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.IOUtils;

import com.google.common.io.Files;
import com.gr.cg.dao.BdocDAO;
import com.gr.cg.dao.FileDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.BusinessDocumentVO;
import com.gr.cg.dto.EmployeeVO;

public class BdocSErviceImpl implements BdocService{

	private BdocDAO bdocDAO;
	private FileService fileService;
	private FileDAO fileDAO;
	
	public void setBdocDAO(BdocDAO bdocDAO) {
		this.bdocDAO = bdocDAO;
	}
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}

	@Override
	public int registBdoc(int[] ta_no, BusinessDocumentVO bdoc, String uploadPath) throws SQLException, IOException {
		
		String key = fileService.registFile(ta_no, bdoc.getBd_empid(), uploadPath, "businessDocument");
		if(!key.equals("실패")) {
			int seq = bdocDAO.getSeq();
			bdoc.setBd_no(seq);
			bdoc.setBd_attckey(key);
			bdocDAO.registBdoc(bdoc);
			
			return seq;
		}
			
		return 0;
	}
	
	@Override
	public List<BusinessDocumentVO> selectbdocList(HashMap<String, String> map) throws SQLException {
		List<BusinessDocumentVO> attachList = bdocDAO.slectbdocList(map);
		return attachList;
	}
	@Override
	public Boolean removeBdoc(int[] bd_no, EmployeeVO emp, int shareType) throws SQLException {
		
		for(int i = 0; i<bd_no.length; i++) {
			BusinessDocumentVO bdoc2 = bdocDAO.selectBdocByBdNo(bd_no[i]);
			if(bdoc2 != null) {
				if( shareType == 0 && bdoc2.getBd_empid().equals(emp.getEmp_id())) {
				}else if(shareType == 1 && bdoc2.getBd_deptno() == emp.getDept_no()) {
				}else if(shareType == 2 && bdoc2.getBd_cmpno() == emp.getComp_no()) {
				}else return false;
				
				
				if(bdoc2 != null && bdoc2.getBd_fileyn().equals("Y")) {
					
					bdocDAO.delete(bdoc2);
					bdoc2 = bdocDAO.selectBdocByBdNo(bd_no[i]);
					if(bdoc2.getBd_useyn().equals("N")) return true;
					
				}else if(bdoc2 != null && bdoc2.getBd_fileyn().equals("N")) {
					
						List<BusinessDocumentVO> list = bdocDAO.selectupList(bd_no[i]);
						
						for(int k=0; k<list.size(); k++) {
							bdocDAO.delete(list.get(k));
						}
						bdocDAO.delete(bdoc2);
						
						bdoc2 = bdocDAO.selectBdocByBdNo(bd_no[i]);
					if(bdoc2.getBd_useyn().equals("N")) return true;
				}
			}
			
			
		}
		return false;
	}
	@Override
	public List<BusinessDocumentVO> selectFolderList(HashMap<String, String> map) throws SQLException {
		return bdocDAO.selectBdocFolder(map);
	}
	@Override
	public Boolean modifyBdoc(BusinessDocumentVO bdoc, EmployeeVO emp, int shareType) throws SQLException {
		BusinessDocumentVO bdoc2 = bdocDAO.selectBdocByBdNo(bdoc.getBd_no());
		if(bdoc2 !=null) {
			if( shareType == 0 && bdoc2.getBd_empid().equals(emp.getEmp_id())) {
			}else if(shareType == 1 && bdoc2.getBd_deptno() == emp.getDept_no()) {
			}else if(shareType == 2 && bdoc2.getBd_cmpno() == emp.getComp_no()) {
			}else return false;
			
			bdoc.setBd_fileyn(bdoc2.getBd_fileyn());
			bdocDAO.updatebdoc(bdoc);
			
			bdoc2 = bdocDAO.selectBdocByBdNo(bdoc.getBd_no());
			if(bdoc2.getBd_fileyn().equals("N")) {
				if(bdoc2.getBd_nm().equals(bdoc.getBd_nm())) return true;
			}else if(bdoc2.getBd_fileyn().equals("Y")) {
				int attc_no = bdocDAO.selectAttNoByBdNo(bdoc2.getBd_no());
				HashMap<String, String> map = new HashMap<>();
				map.put("extnm", bdoc.getBd_nm());
				map.put("attc_no", String.valueOf(attc_no));
				
				bdocDAO.updateExtnm(map);
				AttachVO attach = fileDAO.selectOne(attc_no);
				
				if(attach.getAttc_extnm().equals(bdoc.getBd_nm())) return true;
				
			}
			
		}
		
		return false;
	}
	
	@Override
	public void registFolder(BusinessDocumentVO bdoc) throws SQLException {
		int seq = bdocDAO.getSeq();
		bdoc.setBd_no(seq);
		bdocDAO.registBdoc(bdoc);
	}
	@Override
	public Boolean moveItem(BusinessDocumentVO bdoc, EmployeeVO emp, int shareType) throws SQLException {
		BusinessDocumentVO bdoc2 = bdocDAO.selectBdocByBdNo(bdoc.getBd_no());
		if(bdoc2 != null) {
			if( shareType == 0 && bdoc2.getBd_empid().equals(emp.getEmp_id())) {
			}else if(shareType == 1 && bdoc2.getBd_deptno() == emp.getDept_no()) {
			}else if(shareType == 2 && bdoc2.getBd_cmpno() == emp.getComp_no()) {
			}else return false;
			
			if(bdoc2.getBd_fileyn().equals("Y")) {
				bdoc.setBd_fileyn("Y");
				bdocDAO.moveItem(bdoc);
				
				bdoc2 = bdocDAO.selectBdocByBdNo(bdoc.getBd_no());
			}else if(bdoc2.getBd_fileyn().equals("N")) {
				bdoc.setBd_fileyn("N");
				bdocDAO.moveItem(bdoc);
			}
			if(bdoc2.getBd_upfd() == bdoc.getBd_upfd()) return true;
		}
		
		
		return false;
	}
	@Override
	public String folderDownloadList(HashMap<String, String> map, EmployeeVO emp, int shareType) throws SQLException, IOException {
		BusinessDocumentVO bdoc2 = bdocDAO.selectBdocByBdNo(Integer.parseInt(map.get("bd_no")));
		if(bdoc2 != null) {
			if( shareType == 0 && bdoc2.getBd_empid().equals(emp.getEmp_id())) {
			}else if(shareType == 1 && bdoc2.getBd_deptno() == emp.getDept_no()) {
			}else if(shareType == 2 && bdoc2.getBd_cmpno() == emp.getComp_no()) {
			}else return "실패";
		
		}
		
		List<HashMap<String, String>> downloadList = bdocDAO.folderDownloadList(map);
		byte[] buffer = new byte[8192];
		
		String today = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		String zipPath = "d:\\group\\zip\\"+today;
		File zipFolder = new File(zipPath);
		if(!zipFolder.exists()) {
			zipFolder.mkdirs();
		}
		
		
		/** 100MB이하인지 확인*/
		long totalSize = 0;
		for(int i = 0; i<downloadList.size(); i++) {
			if(downloadList.get(i).get("bd_fileyn").equals("Y")) {
				totalSize += Long.parseLong(String.valueOf(downloadList.get(i).get("attc_sz")));
			}
			if(totalSize > 104857600) {
				return "용량 초과";
			}
		}
		
		for(int i = 0; i<downloadList.size(); i++) {
			if(downloadList.get(i).get("bd_fileyn").equals("Y")) {
				
				String calcPath = zipPath;
				int upfd = Integer.parseInt(String.valueOf(downloadList.get(i).get("bd_upfd")));
				
				List<String> nameList = new ArrayList<>();
				for(int j = 0; j<downloadList.size(); j++) {
					
					if(upfd == 0 || upfd < Integer.parseInt(map.get("bd_no"))) break;
					
					BusinessDocumentVO bdoc = bdocDAO.selectBdocByBdNo(upfd);
					nameList.add(File.separator + bdoc.getBd_nm());
					upfd = bdoc.getBd_upfd();
				}
				
				for(int k = nameList.size()-1; k >= 0; k--) {
					calcPath = calcPath + nameList.get(k);
				}
				
				File path = new File(calcPath);
				path.mkdirs();
				
				String realFilePath = downloadList.get(i).get("attc_route") + File.separator + downloadList.get(i).get("attc_nm"); 
				String copyFilePath = calcPath + File.separator + downloadList.get(i).get("attc_extnm");
				
				File realFile = new File(realFilePath);
				File copyFile = new File(copyFilePath);
				
				InputStream inStream = new FileInputStream(realFile);
				OutputStream outStream = new FileOutputStream(copyFile);
				
				
				
				int length;
				
				while((length = inStream.read(buffer)) > 0) {
					outStream.write(buffer, 0, length);
				}
				
				inStream.close();
				outStream.close();
				
			}
		}
		
		String tagetPath = zipPath + File.separator + bdoc2.getBd_nm();
		File target = new File(zipPath + File.separator + bdoc2.getBd_nm());
		
		if(!target.exists()) {
			return "실패";
		}
		
		createZipFile(tagetPath, zipPath, bdoc2.getBd_nm()+".zip");
		return zipPath+File.separator+bdoc2.getBd_nm()+".zip";
	}
	
	@Override
	public String downloadAll(HashMap<String, String> map, EmployeeVO emp, int shareType)
			throws SQLException, FileNotFoundException, IOException {
		if(Integer.parseInt(map.get("bd_upfd")) > 0) {
			BusinessDocumentVO bdoc2 = bdocDAO.selectBdocByBdNo(Integer.parseInt(map.get("bd_upfd")));
			if(bdoc2 != null) {
				if( shareType == 0 && bdoc2.getBd_empid().equals(emp.getEmp_id())) {
				}else if(shareType == 1 && bdoc2.getBd_deptno() == emp.getDept_no()) {
				}else if(shareType == 2 && bdoc2.getBd_cmpno() == emp.getComp_no()) {
				}else return "실패";
				
			}
		}
		
		List<HashMap<String, String>> downloadList = bdocDAO.downloadAll(map);
		byte[] buffer = new byte[8192];
		
		String today = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		String zipPath = "d:\\group\\zip\\"+today;
		File zipFolder = new File(zipPath);
		
		if(!zipFolder.exists()) {
			zipFolder.mkdirs();
		}
		
		/** 100MB이하인지 확인*/
		long totalSize = 0;
		for(int i = 0; i<downloadList.size(); i++) {
			if(downloadList.get(i).get("bd_fileyn").equals("Y")) {
				totalSize += Long.parseLong(String.valueOf(downloadList.get(i).get("attc_sz")));
			}
			if(totalSize > 104857600) {
				return "용량 초과";
			}
		}
		
		for(int i = 0; i<downloadList.size(); i++) {
			if(downloadList.get(i).get("bd_fileyn").equals("Y")) {
				
				String calcPath = zipPath;
				int upfd = Integer.parseInt(String.valueOf(downloadList.get(i).get("bd_upfd")));
				
				List<String> nameList = new ArrayList<>();
				for(int j = 0; j<downloadList.size(); j++) {
					
					if(upfd == 0 || upfd < Integer.parseInt(map.get("bd_upfd"))) break;
					
					BusinessDocumentVO bdoc = bdocDAO.selectBdocByBdNo(upfd);
					nameList.add(File.separator + bdoc.getBd_nm());
					upfd = bdoc.getBd_upfd();
				}
				
				for(int k = nameList.size()-1; k >= 0; k--) {
					calcPath = calcPath + nameList.get(k);
				}
				
				File path = new File(calcPath);
				path.mkdirs();
				
				String realFilePath = downloadList.get(i).get("attc_route") + File.separator + downloadList.get(i).get("attc_nm"); 
				String copyFilePath = calcPath + File.separator + downloadList.get(i).get("attc_extnm");
				
				File realFile = new File(realFilePath);
				File copyFile = new File(copyFilePath);
				
				InputStream inStream = new FileInputStream(realFile);
				OutputStream outStream = new FileOutputStream(copyFile);
				
				
				
				int length;
				
				while((length = inStream.read(buffer)) > 0) {
					outStream.write(buffer, 0, length);
				}
				
				inStream.close();
				outStream.close();
				
			}
		}
		
		String tagetPath = zipPath;
		File target = new File(zipPath);
		
		if(!target.exists()) {
			return "실패";
		}
		
		createZipFile(tagetPath, zipPath, target.getName()+".zip");
		
		
		return zipPath+File.separator+target.getName()+".zip";
	}
	
	@Override
	public String choiceDownload(int[] bd_no, EmployeeVO emp, int shareType, HashMap<String, String> map)
			throws SQLException, FileNotFoundException, IOException {
		
		byte[] buffer = new byte[8192];
		
		String today = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		String zipPath = "d:\\group\\zip\\"+today;
		File zipFolder = new File(zipPath);
		
		if(!zipFolder.exists()) {
			zipFolder.mkdirs();
		}
		
		for(int i = 0; i<bd_no.length; i++) {
			BusinessDocumentVO bdoc2 = bdocDAO.selectBdocByBdNo(bd_no[i]);
			if(bdoc2 != null) {
				if( shareType == 0 && bdoc2.getBd_empid().equals(emp.getEmp_id())) {
				}else if(shareType == 1 && bdoc2.getBd_deptno() == emp.getDept_no()) {
				}else if(shareType == 2 && bdoc2.getBd_cmpno() == emp.getComp_no()) {
				}else return "실패";
				
			}
			if(bdoc2.getBd_fileyn().equals("Y")) {
				int attc_no = bdocDAO.selectAttNoByBdNo(bdoc2.getBd_no());
				
				AttachVO attach = fileDAO.selectOne(attc_no);
				if(attach != null) {
					File beforeFile = new File(attach.getAttc_route()+File.separator+attach.getAttc_nm());
				
					Files.copy(beforeFile, new File(zipPath+File.separator+attach.getAttc_extnm()));
				}
				
			}else if(bdoc2.getBd_fileyn().equals("N")) {
				map.put("bd_no", String.valueOf(bdoc2.getBd_no()));
				List<HashMap<String, String>> downloadList = bdocDAO.folderDownloadList(map);
				
				for(int k = 0; k<downloadList.size(); k++) {
					if(downloadList.get(k).get("bd_fileyn").equals("Y")) {
						
						String calcPath = zipPath;
						int upfd = Integer.parseInt(String.valueOf(downloadList.get(k).get("bd_upfd")));
						
						List<String> nameList = new ArrayList<>();
						for(int j = 0; j<downloadList.size(); j++) {
							
							if(upfd == 0 || upfd < Integer.parseInt(map.get("bd_no"))) break;
							
							BusinessDocumentVO bdoc = bdocDAO.selectBdocByBdNo(upfd);
							nameList.add(File.separator + bdoc.getBd_nm());
							upfd = bdoc.getBd_upfd();
						}
						
						for(int j = nameList.size()-1; j >= 0; j--) {
							calcPath = calcPath + nameList.get(j);
						}
						
						File path = new File(calcPath);
						path.mkdirs();
						
						String realFilePath = downloadList.get(k).get("attc_route") + File.separator + downloadList.get(k).get("attc_nm"); 
						String copyFilePath = calcPath + File.separator + downloadList.get(k).get("attc_extnm");
						
						File realFile = new File(realFilePath);
						File copyFile = new File(copyFilePath);
						
						InputStream inStream = new FileInputStream(realFile);
						OutputStream outStream = new FileOutputStream(copyFile);
						
						
						
						int length;
						
						while((length = inStream.read(buffer)) > 0) {
							outStream.write(buffer, 0, length);
						}
						
						inStream.close();
						outStream.close();
						
					}
				}
				
				File target = new File(zipPath + File.separator + bdoc2.getBd_nm());
				
				if(!target.exists()) {
					return "실패";
				}
			}
		}
		
		String tagetPath = zipPath;
		File target = new File(zipPath);
		
		if(!target.exists() || target.length() > 104857600 ) {
			return "실패";
		}
		
		
		createZipFile(tagetPath, zipPath, target.getName()+".zip");
		
		
		return zipPath+File.separator+target.getName()+".zip";
	}

	
	public static void createZipFile(String path, String toPath, String fileName) throws IOException {
		 
        File dir = new File(path);
        String[] list = dir.list();
        String _path;
 
        if (!dir.canRead() || !dir.canWrite())
            return;
 
        int len = list.length;
 
        if (path.charAt(path.length() - 1) != '/')
            _path = path + "/";
        else
            _path = path;
 
            ZipOutputStream zip_out = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(toPath+"/"+fileName), 2048));
 
            for (int i = 0; i < len; i++)
                zip_folder("",new File(_path + list[i]), zip_out, toPath);
 
            zip_out.close();
 
    }
	//https://rinear.tistory.com/entry/JAVA-Zip-code-%EC%95%95%EC%B6%95%EC%BD%94%EB%93%9C-%ED%92%80%EC%86%8C%EC%8A%A4%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%9E%90%EB%B0%94%EB%A1%9C-%EC%95%95%EC%B6%95%ED%95%98%EA%B8%B0
	private static void zip_folder(String parent, File file, ZipOutputStream zout, String savePath) throws IOException {
        byte[] data = new byte[8192];
        int read;
 
        if (file.isFile()) {
            ZipEntry entry = new ZipEntry(parent + file.getName());
            zout.putNextEntry(entry);
            BufferedInputStream instream = new BufferedInputStream(new FileInputStream(file));
 
            while ((read = instream.read(data, 0, 2048)) != -1)
                zout.write(data, 0, read);
 
            zout.flush();
            zout.closeEntry();
            instream.close();
 
        } else if (file.isDirectory()) {
            String parentString = file.getPath().replace(savePath+File.separator, "");
            parentString = parentString.substring(0,parentString.length() - file.getName().length());
            ZipEntry entry = new ZipEntry(parentString+file.getName()+"/");
            zout.putNextEntry(entry);
 
            String[] list = file.list();
            if (list != null) {
                int len = list.length;
                for (int i = 0; i < len; i++) {
                    zip_folder(entry.getName(),new File(file.getPath() + "/" + list[i]), zout,savePath);
                }
            }
        }
    }
	@Override
	public int shareBdoc(int bd_no, String uploadPath, int shareType, EmployeeVO user) throws SQLException, IOException {
		BusinessDocumentVO bdoc = bdocDAO.selectBdocByBdNo(bd_no);
		if(bdoc.getBd_empid().equals(user.getEmp_id())) {
			int seq = bdocDAO.getSeq();
			bdoc.setBd_upfd(0);
			bdoc.setBd_no(seq);
			if(shareType == 1) {
				bdoc.setBd_shareyn("T");
			}else if(shareType == 2){
				bdoc.setBd_shareyn("C");
			}
			bdocDAO.registBdoc(bdoc);
			return seq;
		}
		
		return 0;
	}
}
