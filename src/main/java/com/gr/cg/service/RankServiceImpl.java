package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dao.RankDAO;
import com.gr.cg.dto.RankVO;

public class RankServiceImpl implements RankService{

	private RankDAO rankDAO;
	
	public void setRankDAO(RankDAO rankDAO) {
		this.rankDAO = rankDAO;
	}
	@Override
	public List<RankVO> getRankList(SearchCriteria cri) throws SQLException {
		
		return rankDAO.selectRankList(cri);
	}
	@Override
	public RankVO GetRankByRankNo(int rankNo) throws SQLException {
		return rankDAO.selectRankByRankNo(rankNo);
	}
	@Override
	public void registRank(RankVO rank) throws SQLException {
		
		int num = rankDAO.selectRankSeq();
		rank.setRank_no(num);
		
		rankDAO.insertRank(rank);
		
	}
	@Override
	public void modifyRank(RankVO rank) throws SQLException {
		rankDAO.updateRank(rank);	}
	@Override
	public void removeRank(int rankNo) throws SQLException {
		rankDAO.deleteRank(rankNo);	}

}

