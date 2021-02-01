package com.gr.cg.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.google.common.io.Files;
import com.gr.cg.dao.FileDAO;
import com.gr.cg.dto.AttachKeyVO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.EmployeeVO;
import com.gr.cg.dto.TempAttcVO;
import com.gr.cg.utils.GetUploadPath;

public class FileServiceImpl implements FileService{
	
private FileDAO fileDAO;
	
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	@Override
	public int registTemp(TempAttcVO tattach) throws SQLException {
		int count = fileDAO.getTempSeq();
		tattach.setTa_no(count);
		fileDAO.createTempFile(tattach);
		return count;
	}

	@Override
	public String registFile(int ta_no[], String email, String uploadPath, String tableName) throws SQLException, IOException {
		String ran= UUID.randomUUID().toString();
		String sep = File.separator;
		String cmpnm = fileDAO.selectCmpnm(email);
		int count = 0;
		AttachKeyVO key = new AttachKeyVO();
		key.setAk(ran);
		key.setAk_usetable(tableName.toLowerCase());
		key.setAk_useyn("Y");
		key.setAk_writer(email);
		
		fileDAO.createKey(key);
		for(int i = 0; i<ta_no.length; i++) {
			TempAttcVO tattach2 = new TempAttcVO();
			tattach2.setTa_no(ta_no[i]);
			TempAttcVO tattach = fileDAO.selectOneTempinfo(tattach2);
			if(tattach != null) {
				
				String savePath = GetUploadPath.getUploadDatePath((GetUploadPath.getCompanyPath(uploadPath, cmpnm))).replaceAll("/", "\\"+sep);;
				AttachVO attach = new AttachVO();
				attach.setAttc_route(savePath);
				attach.setAttc_extn(tattach.getTa_extn());
				attach.setAttc_extnm(tattach.getTa_extnm());
				attach.setAttc_nm(tattach.getTa_nm());
				attach.setAttc_sz(tattach.getTa_sz());
				attach.setAttc_writer(tattach.getTa_writer());
				attach.setAttc_key(key.getAk());
				attach.setAttc_deletyn("N");
				fileDAO.createFile(attach);
				
				File beforeFile = new File(tattach.getTa_route()+File.separator+tattach.getTa_nm());
				
				File folder = new File(savePath);
				if(!folder.exists()) {
					folder.mkdirs();
				}
				Files.move(beforeFile, new File(folder+File.separator+tattach.getTa_nm()));
				
				
				count++;
			}
		}
		
		if(count == ta_no.length) {
			return ran;
		}
		new Exception("돌아가");
		return "실패";
		
	}

	@Override
	public void removeFile(AttachVO attach) throws SQLException {
		AttachVO attach2 =  fileDAO.selectOne(attach.getAttc_no());
		
		if(attach2 != null) {
			fileDAO.deleteFile(attach);
			
			File file = new File(attach.getAttc_route()+File.separator+attach.getAttc_nm());
			if(file.exists()) {
				file.delete();
			}
		}
		
	}

	@Override
	public void removeKey(String ak) throws SQLException {
		fileDAO.delefeKey(ak);
		
	}

	@Override
	public List<Integer> selectAkNoListByKey(String ak) throws SQLException {
		 List<Integer> attachkeyList = fileDAO.selectAkNoListByKey(ak);
		return attachkeyList;
	}

	@Override
	public void deleteKey(String key) throws SQLException {

		fileDAO.delefeKey(key);
		
	}

	@Override
	public void updateKey(Map<String, Object> map) throws SQLException {
		fileDAO.updateKey(map);
		
	}

}
