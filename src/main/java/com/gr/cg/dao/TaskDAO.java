package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TaskCommand;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;
import com.gr.cg.dto.TaskVO;

public interface TaskDAO {
	List<TaskVO> selectTaskList(SearchCriteria2 cri) throws SQLException;
	List<TaskVO> selectTaskReceiveList(SearchCriteria2 cri) throws SQLException;
	List<TaskVO> selectworkreturnList(SearchCriteria2 cri) throws SQLException;
	List<TaskVO> selectWidgetNum(String perf_empid) throws SQLException;
	TaskVO selectTaskByTaskNo(int tasc_no) throws SQLException;
	List<PerformerVO> selectTaskRecevie(int perf_tascno) throws SQLException;
	List<TaskVO> selectTaskReciveByTaskNo(int tasc_no) throws SQLException;
	void insertTask(TaskCommand taskComand) throws SQLException;
	void modifyTask(TaskCommand taskComand) throws SQLException;
	void deleteTask(int tasc_no) throws SQLException;
	void BusinessApprovalTask(TaskCommand taskComand) throws SQLException;
	void BusinessApprovalTaskBack(TaskCommand taskComand) throws SQLException;
	int selectTaskSequenceNextValue() throws SQLException;
	List<AttachVO> selectFileList(int tasc_no) throws SQLException;
	List<TaskVO> NmgReceiverList(int tasc_no) throws SQLException;
	TaskVO selectTaskNoOne(TaskVO task) throws SQLException;
	TaskVO selectReceiverGetOne(TaskVO task) throws SQLException;
	
}

