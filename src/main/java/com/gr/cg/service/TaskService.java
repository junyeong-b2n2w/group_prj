package com.gr.cg.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TaskCommand;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;
import com.gr.cg.dto.TaskVO;

public interface TaskService {
	List<TaskVO> getTaskList(SearchCriteria2 cri) throws SQLException;
	List<TaskVO> selectTaskReceiveList(SearchCriteria2 cri) throws SQLException;
	Map<String, Object>selectTaskReciveByTaskNo(int tasc_no) throws SQLException;
	List<TaskVO> selectworkreturnList(SearchCriteria2 cri) throws SQLException;
	TaskVO getTaskByTaskNo(int tasc_no) throws SQLException;
	void registTask(TaskCommand taskComand,PerformerVO performer,int[] ta_no,String id,String upload) throws SQLException, Exception;
	void modifyTask(TaskCommand taskComand,PerformerVO performer,int[] ta_no,String id,String upload,int[]delfile) throws SQLException, Exception;
	void removeTask(int tasc_no,int perf_tascno) throws SQLException;
	void BusinessApprovalTask(TaskCommand taskComand) throws SQLException;
	void BusinessApprovalTaskBack(TaskCommand taskComand) throws SQLException;
	List<AttachVO> selectFileList(int tasc_no) throws SQLException;
	List<TaskVO> NmgReceiverList(int tasc_no) throws SQLException;
	TaskVO selectTaskNoOne(TaskVO task)throws SQLException;
	TaskVO selectReceiverGetOne(TaskVO task) throws SQLException;
	List<TaskVO> selectWidgetNum(String perf_empid) throws SQLException;
}
