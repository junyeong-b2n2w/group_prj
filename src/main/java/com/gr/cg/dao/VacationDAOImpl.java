package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.VacationVO;

public class VacationDAOImpl implements VacationDAO{

	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	
	@Override
	public List<VacationVO> selectVcatListFromManager(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return session.selectList("Vacation-Mapper.selectVcatListFromManager", cri, rowBounds);
	}

	@Override
	public int selectVcatListCntFromManager(SearchCriteria cri) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVcatListCntFromManager", cri);
	}

	@Override
	public VacationVO selectVcatFromManage(VacationVO vacation) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVcatFromManage", vacation);
	}

	@Override
	public void insertVcat(VacationVO vacation) throws SQLException {
		session.update("Vacation-Mapper.insertVcatById", vacation);
		
	}

	@Override
	public void updtVcat(VacationVO vacation) throws SQLException {
		session.update("Vacation-Mapper.updtVcat", vacation);
		
	}

	@Override
	public void deleteVcat(int vact_no) throws SQLException {
		session.update("Vacation-Mapper.deleteVcat",vact_no);
		
	}

	@Override
	public int selectVcatCheckDplDate(VacationVO vacation) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVcatCheckDplDate", vacation);
	}

	@Override
	public List<VacationVO> selectVcatAllList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return session.selectList("Vacation-Mapper.selectVcatAllList", cri, rowBounds);
	}

	@Override
	public int selectVcatAllListCnt(SearchCriteria cri) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVcatAllListCnt", cri);
	}

	@Override
	public void updateVactConfirm(int vactno, int gb) throws SQLException {
		VacationVO vacation = new VacationVO();
		vacation.setVact_no(vactno);
		if(gb == 1) {
			vacation.setVact_aprvyn("Y");
			vacation.setVact_delyn("N");
		}else {
			vacation.setVact_aprvyn("N");
			vacation.setVact_delyn("Y");
		}
		session.update("Vacation-Mapper.updateVactConfirm",vacation);
	}

	@Override
	public List<VacationVO> selectVcatByVactId(SearchCriteria2 cri) throws SQLException {
		return session.selectList("Vacation-Mapper.selectVcatByVactId", cri);
	}

	@Override
	public void updateMyVcatByVactId(VacationVO vacation) throws SQLException {
		session.update("Vacation-Mapper.updateMyVcatByVactId",vacation);
		
	}


	@Override
	public VacationVO selectAnnualCntByCompno(String vact_id) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Vacation-Mapper.selectAnnualCntByCompno", vact_id);
	}


	@Override
	public List<Map<String, Object>> selectVactIngEmpCount(int vact_compno) throws SQLException {
		
		return session.selectList("Vacation-Mapper.selectVactIngEmpCount", vact_compno);
	}


	@Override
	public List<Map<String, Object>> selectVactAptvByDeptNo() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Vacation-Mapper.selectVactAprvByDeptNo");
	}


	@Override
	public List<Map<String, Object>> selectVactAptvByRankNo() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Vacation-Mapper.selectVactAprvByRankNo");
	}


	@Override
	public List<Map<String, Object>> selectVactRemCntByDeptNoAndRankNo() throws SQLException {
		return session.selectList("Vacation-Mapper.selectVactRemCntByDeptNoAndRankNo");
	}


	@Override
	public int selectWaitAprvCount(int comp_no) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectWaitAprvCount", comp_no);
	}


	@Override
	public int selectVacatIngToday(int comp_no) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVacatIngToday", comp_no);
	}


	@Override
	public int selectAprvIsNCount(int comp_no) throws SQLException {
		return session.selectOne("Vacation-Mapper.selectAprvIsNCount", comp_no);
	}


	@Override
	public int selectVacationSeq() throws SQLException {
		return session.selectOne("Vacation-Mapper.selectVacationSeq");
	}

}
