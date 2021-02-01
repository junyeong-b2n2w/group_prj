package com.gr.cg.dto;

public class RankVO {
	private int rank_no;
	private int rank_uprank;
	private String rank_nm;
	private int rank_compno;
	private String rank_upnm; //상위직책명
	private String rank_regid;
	private String rank_regymd;
	private String rank_udtid;
	private String rank_udtymd;
	
	public RankVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RankVO(int rank_no, int rank_uprank, String rank_nm, int rank_compno, String rank_upnm, String rank_regid, String rank_regymd, String rank_udtid, String rank_udtymd) {
		super();
		this.rank_no = rank_no;
		this.rank_uprank = rank_uprank;
		this.rank_nm = rank_nm;
		this.rank_compno = rank_compno;
		this.rank_upnm = rank_upnm;
		this.rank_regid = rank_regid;
		this.rank_regymd = rank_regymd;
		this.rank_udtid = rank_udtid;
		this.rank_udtymd = rank_udtymd;
	}

	public int getRank_no() {
		return rank_no;
	}

	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}

	public int getRank_uprank() {
		return rank_uprank;
	}

	public void setRank_uprank(int rank_uprank) {
		this.rank_uprank = rank_uprank;
	}

	public String getRank_nm() {
		return rank_nm;
	}

	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}

	public int getRank_compno() {
		return rank_compno;
	}

	public void setRank_compno(int rank_compno) {
		this.rank_compno = rank_compno;
	}

	public String getRank_upnm() {
		return rank_upnm;
	}

	public void setRank_upnm(String rank_upnm) {
		this.rank_upnm = rank_upnm;
	}

	public String getRank_regid() {
		return rank_regid;
	}

	public void setRank_regid(String rank_regid) {
		this.rank_regid = rank_regid;
	}

	public String getRank_regymd() {
		return rank_regymd;
	}

	public void setRank_regymd(String rank_regymd) {
		this.rank_regymd = rank_regymd;
	}

	public String getRank_udtid() {
		return rank_udtid;
	}

	public void setRank_udtid(String rank_udtid) {
		this.rank_udtid = rank_udtid;
	}

	public String getRank_udtymd() {
		return rank_udtymd;
	}

	public void setRank_udtymd(String rank_udtymd) {
		this.rank_udtymd = rank_udtymd;
	}

	@Override
	public String toString() {
		return "RankVO [rank_no=" + rank_no + ", rank_uprank=" + rank_uprank + ", rank_nm=" + rank_nm + ", rank_compno=" + rank_compno + ", rank_upnm=" + rank_upnm + ", rank_regid=" + rank_regid + ", rank_regymd=" + rank_regymd + ", rank_udtid=" + rank_udtid + ", rank_udtymd=" + rank_udtymd + "]";
	}

}
