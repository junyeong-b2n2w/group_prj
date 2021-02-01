package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.RankVO;

public interface RankDAO {
	List<RankVO> selectRankList(SearchCriteria cri) throws SQLException;
	RankVO selectRankByRankNo(int rankNo) throws SQLException;
	void insertRank(RankVO rank) throws SQLException;
	void updateRank(RankVO rank) throws SQLException;
	void deleteRank(int rankNo) throws SQLException;
	void registSuperRank(RankVO rank) throws SQLException;
	int selectRankSeq() throws SQLException;
}

