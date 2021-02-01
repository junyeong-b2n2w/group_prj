package com.gr.cg.dto;

import java.util.Arrays;
import java.util.Date;

public class NoticeVO {
	private int ntc_no;
	private String ntc_title;
	private String ntc_cont; //공지 내용
	private Date ntc_regdt; 
	private Date ntc_regudt; //수정일자
	private String ntc_popyn; //팝여여부
	private String ntc_popsatymd; //팝업시작일시
	private String ntc_popendymd; //팝업 종료일시
	private int ntc_views; //조회수
	private String ntc_delyn; //삭제여부
	private String ntc_writerid; //작성자 아이디
	private String ntc_attckey; //첨부키
	private int ntc_compno; //회사번호
	private int[] ta_no;//임시저장 첨부번호
	
	public NoticeVO() {
		super();
	}

	

	public NoticeVO(int ntc_no, String ntc_title, String ntc_cont, Date ntc_regdt, Date ntc_regudt, String ntc_popyn,
			String ntc_popsatymd, String ntc_popendymd, int ntc_views, String ntc_delyn, String ntc_writerid,
			String ntc_attckey, int ntc_compno, int[] ta_no) {
		super();
		this.ntc_no = ntc_no;
		this.ntc_title = ntc_title;
		this.ntc_cont = ntc_cont;
		this.ntc_regdt = ntc_regdt;
		this.ntc_regudt = ntc_regudt;
		this.ntc_popyn = ntc_popyn;
		this.ntc_popsatymd = ntc_popsatymd;
		this.ntc_popendymd = ntc_popendymd;
		this.ntc_views = ntc_views;
		this.ntc_delyn = ntc_delyn;
		this.ntc_writerid = ntc_writerid;
		this.ntc_attckey = ntc_attckey;
		this.ntc_compno = ntc_compno;
		this.ta_no = ta_no;
	}



	public int getNtc_no() {
		return ntc_no;
	}

	public void setNtc_no(int ntc_no) {
		this.ntc_no = ntc_no;
	}

	public String getNtc_title() {
		return ntc_title;
	}

	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}

	public String getNtc_cont() {
		return ntc_cont;
	}

	public void setNtc_cont(String ntc_cont) {
		this.ntc_cont = ntc_cont;
	}

	

	public Date getNtc_regdt() {
		return ntc_regdt;
	}

	public void setNtc_regdt(Date ntc_regdt) {
		this.ntc_regdt = ntc_regdt;
	}

	public Date getNtc_regudt() {
		return ntc_regudt;
	}

	public void setNtc_regudt(Date ntc_regudt) {
		this.ntc_regudt = ntc_regudt;
	}

	public void setNtc_popsatymd(String ntc_popsatymd) {
		this.ntc_popsatymd = ntc_popsatymd;
	}

	public String getNtc_popyn() {
		return ntc_popyn;
	}

	public void setNtc_popyn(String ntc_popyn) {
		this.ntc_popyn = ntc_popyn;
	}


	public String getNtc_popendymd() {
		return ntc_popendymd;
	}

	public void setNtc_popendymd(String ntc_popendymd) {
		this.ntc_popendymd = ntc_popendymd;
	}

	public int getNtc_views() {
		return ntc_views;
	}

	public void setNtc_views(int ntc_views) {
		this.ntc_views = ntc_views;
	}

	public String getNtc_delyn() {
		return ntc_delyn;
	}

	public void setNtc_delyn(String ntc_delyn) {
		this.ntc_delyn = ntc_delyn;
	}

	public String getNtc_writerid() {
		return ntc_writerid;
	}

	public void setNtc_writerid(String ntc_writerid) {
		this.ntc_writerid = ntc_writerid;
	}

	public String getNtc_attckey() {
		return ntc_attckey;
	}

	public void setNtc_attckey(String ntc_attckey) {
		this.ntc_attckey = ntc_attckey;
	}

	
	public int[] getTa_no() {
		return ta_no;
	}

	public void setTa_no(int[] ta_no) {
		this.ta_no = ta_no;
	}

	public String getNtc_popsatymd() {
		return ntc_popsatymd;
	}
	
	

	public int getNtc_compno() {
		return ntc_compno;
	}



	public void setNtc_compno(int ntc_compno) {
		this.ntc_compno = ntc_compno;
	}



	@Override
	public String toString() {
		return "NoticeVO [ntc_no=" + ntc_no + ", ntc_title=" + ntc_title + ", ntc_cont=" + ntc_cont + ", ntc_regdt="
				+ ntc_regdt + ", ntc_regudt=" + ntc_regudt + ", ntc_popyn=" + ntc_popyn + ", ntc_popsatymd="
				+ ntc_popsatymd + ", ntc_popendymd=" + ntc_popendymd + ", ntc_views=" + ntc_views + ", ntc_delyn="
				+ ntc_delyn + ", ntc_writerid=" + ntc_writerid + ", ntc_attckey=" + ntc_attckey + ", ntc_compno="
				+ ntc_compno + ", ta_no=" + Arrays.toString(ta_no) + "]";
	}
	
}
