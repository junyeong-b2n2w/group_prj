package com.gr.cg.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gr.cg.command.SearchCriteria;
import com.gr.cg.dto.RankVO;

public class RankDAOImpl implements RankDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public RankVO selectRankByRankNo(int rankNo) throws SQLException {
		return session.selectOne("Rank-Mapper.selectRankByRankNo", rankNo);
	}

	@Override
	public List<RankVO> selectRankList(SearchCriteria cri) throws SQLException {
		return session.selectList("Rank-Mapper.selectRankList", cri);
	}

	@Override
	public void insertRank(RankVO rank) throws SQLException {
		session.update("Rank-Mapper.registRank", rank);
	}

	@Override
	public void updateRank(RankVO rank) throws SQLException {
		session.update("Rank-Mapper.modifyRank", rank);
	}

	@Override
	public void deleteRank(int rank_no) throws SQLException {
		session.update("Rank-Mapper.removeRank", rank_no);
	}

	@Override
	public int selectRankSeq() throws SQLException {
		int cnt = session.selectOne("Rank-Mapper.selectRankSeq");
		return cnt;
	}

	@Override
	public void registSuperRank(RankVO rank) throws SQLException {
		session.update("Rank-Mapper.registSuperRank", rank);
	}

}

