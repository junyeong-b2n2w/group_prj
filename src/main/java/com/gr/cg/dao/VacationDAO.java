package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.command.SearchCriteria2;
import com.gr.cg.dto.VacationVO;

public interface VacationDAO {
	

	/**
	 * 휴가관리정보를 관리하기 위해 등록된 휴가관리 목록을 조회한다.
	 */
	public List<VacationVO> selectVcatListFromManager(SearchCriteria cri) throws SQLException;

    /**
	 * 휴가관리목록 총 갯수를 조회한다.
	 */
    public int selectVcatListCntFromManager(SearchCriteria cri) throws SQLException;

	/**
	 * 등록된 휴가관리의 상세정보를 조회한다.
	 */
	public VacationVO selectVcatFromManage(VacationVO vacation)  throws SQLException;
	/**
	 * 휴가관리정보를 신규로 등록한다.
	 */
	public void insertVcat(VacationVO vacation) throws SQLException;

	/**
	 * 기 등록된 휴가관리정보를 수정한다.
	 */
	public void updtVcat(VacationVO vacation) throws SQLException;
	/**
	 * 기 등록된 휴가관리정보를 삭제한다.
	 */
	public void deleteVcat(int vact_no) throws SQLException;

    /**
	 * 휴가일자 중복여부 체크
	 */
    public int selectVcatCheckDplDate(VacationVO vacation) throws SQLException;
	
    /*** 승인관련 ***/	
	/**
	 * 휴가관리정보 승인 처리를 위해 신청된 휴가관리 목록을 조회한다.
	 */
	public List<VacationVO> selectVcatAllList(SearchCriteria cri) throws SQLException; //사용
    /**
	 * 휴가관리정보 승인 처리를 위해 신청된 휴가관리 목록 총 갯수를 조회한다.
	 */
    public int selectVcatAllListCnt(SearchCriteria cri) throws SQLException;
	/**
	 * 신청된 휴가를 승인/반려처리한다.
	 */
	public void updateVactConfirm(int vactno, int yngb) throws SQLException; //사용
	
	
    /*** 연차관련 ***/	
	/**
	 * 개인별 연차관리의 상세정보를 조회한다.
	 */
	public List<VacationVO> selectVcatByVactId(SearchCriteria2 cri) throws SQLException; //사용
	
	/**
	 * 연차정보를 수정처리한다.
	 */
	public void updateMyVcatByVactId(VacationVO vacation) throws SQLException; //사용


	/**
	 * 사원별 연차 발생 수 / 사용한 연차 수 / 잔여 연차 수를 가져온다
	 * */
	public VacationVO selectAnnualCntByCompno(String vact_id)throws SQLException; //사용

	
	public List<Map<String, Object>> selectVactIngEmpCount(int vact_compno) throws SQLException; //사용
	
	
	public List<Map<String, Object>> selectVactAptvByDeptNo() throws SQLException; //사용
	
	public List<Map<String, Object>> selectVactAptvByRankNo() throws SQLException; //사용
	
	public List<Map<String, Object>> selectVactRemCntByDeptNoAndRankNo() throws SQLException; //사용
	
	public int selectWaitAprvCount(int comp_no) throws SQLException; //사용
	public int selectVacatIngToday(int comp_no) throws SQLException; //사용
	public int selectAprvIsNCount(int comp_no) throws SQLException; //사용
	public int selectVacationSeq() throws SQLException; //사용
}
