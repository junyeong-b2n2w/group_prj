package com.gr.cg.dto;

public class PersonGrMemVO {
	private int pgm_pgno;
	private String pgm_empid;
	
	public PersonGrMemVO() {
		super();
	}

	public PersonGrMemVO(int pgm_pgno, String pgm_empid) {
		super();
		this.pgm_pgno = pgm_pgno;
		this.pgm_empid = pgm_empid;
	}

	public int getPgm_pgno() {
		return pgm_pgno;
	}

	public void setPgm_pgno(int pgm_pgno) {
		this.pgm_pgno = pgm_pgno;
	}

	public String getPgm_empid() {
		return pgm_empid;
	}

	public void setPgm_empid(String pgm_empid) {
		this.pgm_empid = pgm_empid;
	}

	@Override
	public String toString() {
		return "PersonalGroupMemberVO [pgm_pgno=" + pgm_pgno + ", pgm_empid=" + pgm_empid + "]";
	}
	
}
