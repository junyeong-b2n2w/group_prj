package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.command.TaskCommand;
import com.gr.cg.dto.AttachVO;
import com.gr.cg.dto.PerformerVO;
import com.gr.cg.dto.TaskVO;

public class TaskDAOImpl implements TaskDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public TaskVO selectTaskByTaskNo(int tasc_no) throws SQLException {
		return session.selectOne("Task-Mapper.selectTaskByTaskNo", tasc_no);
	}

	@Override
	public List<TaskVO> selectTaskList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("Task-Mapper.selectTaskList", cri);
	}

	@Override
	public void insertTask(TaskCommand taskComand) throws SQLException {
		
		
		session.update("Task-Mapper.insertTask", taskComand);
	}

	@Override
	public void modifyTask(TaskCommand taskComand) throws SQLException {
		session.update("Task-Mapper.modifyTask", taskComand);
	}

	@Override
	public void deleteTask(int task_no) throws SQLException {
		session.update("Task-Mapper.deleteTask", task_no);
	}

	@Override
	public int selectTaskSequenceNextValue() throws SQLException {
		int seq = session.selectOne("Task-Mapper.selectTaskSequenceNextValue");
		return seq;
	}

	@Override
	public List<TaskVO> selectTaskReceiveList(SearchCriteria2 cri) throws SQLException {
		return session.selectList("Task-Mapper.selectTaskReceiveList",cri);
	}

	@Override
	public List<AttachVO> selectFileList(int tasc_no) throws SQLException {
		return session.selectList("Task-Mapper.selectFileList",tasc_no);
	}

	@Override
	public List<TaskVO> selectTaskReciveByTaskNo(int tasc_no) throws SQLException {
		return session.selectList("Task-Mapper.selectTaskReciveByTaskNo",tasc_no);
	}

	@Override
	public void BusinessApprovalTask(TaskCommand taskComand) throws SQLException {

		 session.update("Task-Mapper.BusinessApprovalTask",taskComand);
	}

	@Override
	public void BusinessApprovalTaskBack(TaskCommand taskComand) throws SQLException {

		session.update("Task-Mapper.BusinessApprovalTaskBack",taskComand);
	}

	@Override
	public List<TaskVO> selectworkreturnList(SearchCriteria2 cri) throws SQLException {
		
		return session.selectList("Task-Mapper.selectworkreturnList",cri);
	}

	@Override
	public List<PerformerVO> selectTaskRecevie(int perf_tascno) throws SQLException{
		// TODO Auto-generated method stub
		return session.selectList("Task-Mapper.selectTaskRecevie",perf_tascno);
	}

	@Override
	public List<TaskVO> NmgReceiverList(int tasc_no) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Task-Mapper.NmgReceiverList",tasc_no);
	}

	@Override
	public TaskVO selectTaskNoOne(TaskVO task) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Task-Mapper.selectTaskNoOne",task);
	}

	@Override
	public TaskVO selectReceiverGetOne(TaskVO task) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Task-Mapper.selectReceiverGetOne",task);
	}

	@Override
	public List<TaskVO> selectWidgetNum(String perf_empid) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Task-Mapper.selectWidgetNum",perf_empid);
	}

}

