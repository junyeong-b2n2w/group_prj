package com.gr.cg.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.FileDAO;
import com.gr.cg.dao.PerformerDAO;
import com.gr.cg.dao.TaskDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;

public class PerformerServiceImpl implements PerformerService{

	private PerformerDAO performerDAO;
	private FileService fileService;
	private FileDAO fileDAO;
	
	
	public void setPerformerDAO(PerformerDAO performerDAO) {
		this.performerDAO = performerDAO;
	}
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	
private TaskDAO taskDAO;
	
	public void setTaskDAO(TaskDAO taskDAO) {
		this.taskDAO = taskDAO;
	}
	@Override
	public List<PerformerVO> getPerformerList(SearchCriteria cri) throws SQLException {
		return performerDAO.selectPerformerList(cri);
	}
	@Override
	public PerformerVO getPerformerByPerformerNo(PerformerVO performer) throws SQLException {
		return performerDAO.selectPerformerByPerformerNo(performer);
	}
	@Override
	public void registPerformer(PerformerVO performer, int tasc_no) throws SQLException {
		performer.setPerf_tascno(tasc_no);
		
		performerDAO.insertPerformer(performer);
		
	}
	@Override
	public void modifyPerformer(Map<String, String> map) throws SQLException {
		
		performerDAO.updatePerformer(map);
		
		}
	@Override
	public void removePerformer(int performerNo) throws SQLException {
		performerDAO.deletePerformer(performerNo);	}
	
	
	@Override
	public void insertProcessingHistory(PerformerVO performer,int[] ta_no,String id,String upload,int[]delfile)
			throws SQLException,Exception {
		
		String beforeKey = performerDAO.selectPerformerByPerformerNo(performer).getPerf_attckey();
		
		if(delfile != null) {
			for(int i =0; i<delfile.length; i++) {
				AttachVO attach = new AttachVO();
				attach.setAttc_no(delfile[i]);
				fileService.removeFile(attach);
			}
			performer.setPerf_attckey(beforeKey);
		}
		performer.setPerf_attckey(beforeKey);
		
		if(ta_no != null) {
			
		String key = fileService.registFile(ta_no, id, upload,"performer");
		Map<String, Object> map = new HashMap<>();
			
		if(!key.equals("실패")) {
				if(beforeKey == null) {
					performer.setPerf_attckey(key);
				}else {
					fileService.deleteKey(beforeKey);
					map.put("attc_key", key);
					map.put("before_key", beforeKey);
					fileService.updateKey(map);
					performer.setPerf_attckey(key);
				}
			}
		}
		performerDAO.insertProcessingHistory(performer);
	}
	@Override
	public void BusinessApprovalPer(PerformerVO performer) throws SQLException {
		performerDAO.BusinessApprovalPer(performer);
		
	}
	@Override
	public void removeModifyPerformer(int performerNo) throws SQLException {

			performerDAO.removeModifyPerformer(performerNo);
			
	}
	@Override
	public void BusinessApprovalPerfBack(PerformerVO performer) throws SQLException {
		// TODO Auto-generated method stub
		performerDAO.BusinessApprovalPerfBack(performer);
		
	}
	@Override
	public List<PerformerVO> selectReturnPerformerList(int performerNo) throws SQLException {
		return performerDAO.selectReturnPerformerList(performerNo);
	}
	@Override
	public List<AttachVO> selectFileList(PerformerVO performer) throws SQLException {
		// TODO Auto-generated method stub
		return performerDAO.selectFileList(performer);
	}
	@Override
	public PerformerVO selectPerformerWork(PerformerVO performer) throws SQLException {
		// TODO Auto-generated method stub
		return performerDAO.selectPerformerWork(performer);
	}

}

