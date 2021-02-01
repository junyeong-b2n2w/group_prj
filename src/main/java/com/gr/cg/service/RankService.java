package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.RankVO;

public interface RankService {
	List<RankVO> getRankList(SearchCriteria cri) throws SQLException;
	RankVO GetRankByRankNo(int rankNo) throws SQLException;
	void registRank(RankVO rank) throws SQLException;
	void modifyRank(RankVO rank) throws SQLException;
	void removeRank(int rankNo) throws SQLException;
}
