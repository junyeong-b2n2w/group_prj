package com.gr.cg.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TaskCommand;
import com.gr.cg.dao.FileDAO;
import com.gr.cg.dao.PerformerDAO;
import com.gr.cg.dao.TaskDAO;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;
import com.gr.cg.dto.TaskVO;
import com.itextpdf.text.log.SysoCounter;

public class TaskServiceImpl implements TaskService{

	private FileService fileService;
	private FileDAO fileDAO;
	
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	
	private TaskDAO taskDAO;
	private PerformerDAO perDAO;
	
	public void setPerformerDAO(PerformerDAO perDAO) {
		this.perDAO = perDAO;
	}
	
	public void setTaskDAO(TaskDAO taskDAO) {
		this.taskDAO = taskDAO;
	}
	
	private PerformerService performerService;
	
	public void setPerformerService(PerformerService performerService) {
		this.performerService = performerService;
	}
	
	
	@Override
	public List<TaskVO> getTaskList(SearchCriteria2 cri) throws SQLException {
		
		
		return taskDAO.selectTaskList(cri);
	}
	@Override
	public TaskVO getTaskByTaskNo(int tasc_no) throws SQLException {
		
		return taskDAO.selectTaskByTaskNo(tasc_no);
	}
	@Override
	public void registTask(TaskCommand taskComand,PerformerVO performer,int[] ta_no,String id,String upload) throws Exception {
		
		
		if(ta_no != null) {
			String key = fileService.registFile(ta_no, id, upload,"task");
			taskComand.setTask_attckey(key);
			performer.setPerf_attckey(key);
		}
		
		int seq = taskDAO.selectTaskSequenceNextValue();
		
		taskComand.setTasc_no(seq);
		
		taskDAO.insertTask(taskComand);	
		
		for(int i = 0; i<taskComand.getPerf_empid().length; i++) {
			performer.setPerf_empid(taskComand.getPerf_empid()[i]);
			performerService.registPerformer(performer, seq);
		}
		
		}
	@Override
	public void modifyTask(TaskCommand taskComand,PerformerVO performer,int[] ta_no,String id,String upload,int[]delfile) throws Exception,SQLException {
		String beforeKey = taskDAO.selectTaskByTaskNo(taskComand.getTasc_no()).getTask_attckey();
		
		
		if(delfile != null) {
			for(int i =0; i<delfile.length; i++) {
				AttachVO attach = new AttachVO();
				attach.setAttc_no(delfile[i]);
				fileService.removeFile(attach);
			}
			taskComand.setTask_attckey(beforeKey);
			performer.setPerf_attckey(beforeKey);
		}
		taskComand.setTask_attckey(beforeKey);
		performer.setPerf_attckey(beforeKey);
		
		
		if(ta_no != null) {
			
		String key = fileService.registFile(ta_no, id, upload,"task");
		Map<String, Object> map = new HashMap<>();
			
		if(!key.equals("실패")) {
				if(beforeKey == null) {
					taskComand.setTask_attckey(key);
					performer.setPerf_attckey(key);
					
				}else {
					fileService.deleteKey(beforeKey);
					map.put("attc_key", key);
					map.put("before_key", beforeKey);
					fileService.updateKey(map);
					taskComand.setTask_attckey(key);
					performer.setPerf_attckey(key);
				}
			}
		}
		
		taskDAO.modifyTask(taskComand);

		performerService.removeModifyPerformer(taskComand.getTasc_no());
		
		TaskVO task = taskDAO.selectTaskByTaskNo(taskComand.getTasc_no()); 
		for(int i=0; i<taskComand.getPerf_newempid().length; i++) {
			
			PerformerVO per = new PerformerVO();
			per.setPerf_empid(taskComand.getPerf_newempid()[i]);
			per.setPerf_tascno(taskComand.getTasc_no());
			
			if(task.getTask_attckey() != null) {
				per.setPerf_attckey(task.getTask_attckey());
			}
			
			perDAO.insertPerformer(per);
		}
		}
		
	@Override
	public void removeTask(int taskNo,int perf_tascno) throws SQLException {
		taskDAO.deleteTask(taskNo);
		performerService.removePerformer(perf_tascno);
		
		
		}


	@Override
	public List<TaskVO> selectTaskReceiveList(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.selectTaskReceiveList(cri);
		
	}
	@Override
	public List<AttachVO> selectFileList(int tasc_no) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.selectFileList(tasc_no);
	}
	
	@Override 
	public Map<String, Object>selectTaskReciveByTaskNo(int tasc_no) throws SQLException {

		Map<String, Object> map = new HashMap<>();
		
		List<PerformerVO> per = taskDAO.selectTaskRecevie(tasc_no);
		TaskVO task = taskDAO.selectTaskByTaskNo(tasc_no);
		List<TaskVO> taskAll = taskDAO.selectTaskReciveByTaskNo(tasc_no);
		
		map.put("taskAll", taskAll);
		map.put("performerList", per);
		map.put("task", task);
		
		return map;
	}
	@Override
	public void BusinessApprovalTask(TaskCommand taskComand) throws SQLException {
		// TODO Auto-generated method stub
		taskDAO.BusinessApprovalTask(taskComand);
		
	}
	@Override
	public void BusinessApprovalTaskBack(TaskCommand taskComand) throws SQLException {
		// TODO Auto-generated method stub
		taskDAO.BusinessApprovalTaskBack(taskComand);
		
	}
	@Override
	public List<TaskVO> selectworkreturnList(SearchCriteria2 cri) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.selectworkreturnList(cri);
	}
	@Override
	public List<TaskVO> NmgReceiverList(int tasc_no) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.NmgReceiverList(tasc_no);
	}
	@Override
	public TaskVO selectTaskNoOne(TaskVO task) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.selectTaskNoOne(task);
	}
	@Override
	public TaskVO selectReceiverGetOne(TaskVO task) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.selectReceiverGetOne(task);
	}
	@Override
	public List<TaskVO> selectWidgetNum(String perf_empid) throws SQLException {
		// TODO Auto-generated method stub
		return taskDAO.selectWidgetNum(perf_empid);
	}

}

