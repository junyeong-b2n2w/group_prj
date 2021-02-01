package com.gr.cg.dto;

import com.gr.cg.command.PageMaker2;

public class NotificationVO extends PageMaker2{
	
	private int noti_no     ; //알림번호
	private String noti_cont   ; //알림내용
	private String noti_type   ; //알림유형
	private String noti_recid  ; //알림수신자
	private String noti_recnm  ;
	private String noti_sendid ; //알림송신자
	private String noti_sendnm ;
	private String noti_regdt  ; //알림등록일자
	private String noti_readdt ; //알림확일일자
	private String noti_readyn ; //알림읽음여부
	private int noti_contno ; //알림 내용 번호
	private String noti_url    ; //알림해당하는 경로
	private int noti_compno ; //회사번호
	
	public NotificationVO() {
		// TODO Auto-generated constructor stub
	}
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public String getNoti_cont() {
		return noti_cont;
	}
	public void setNoti_cont(String noti_cont) {
		this.noti_cont = noti_cont;
	}
	public String getNoti_type() {
		return noti_type;
	}
	public void setNoti_type(String noti_type) {
		this.noti_type = noti_type;
	}
	public String getNoti_recid() {
		return noti_recid;
	}
	public void setNoti_recid(String noti_recid) {
		this.noti_recid = noti_recid;
	}
	public String getNoti_recnm() {
		return noti_recnm;
	}
	public void setNoti_recnm(String noti_recnm) {
		this.noti_recnm = noti_recnm;
	}
	public String getNoti_sendid() {
		return noti_sendid;
	}
	public void setNoti_sendid(String noti_sendid) {
		this.noti_sendid = noti_sendid;
	}
	public String getNoti_sendnm() {
		return noti_sendnm;
	}
	public void setNoti_sendnm(String noti_sendnm) {
		this.noti_sendnm = noti_sendnm;
	}
	public String getNoti_regdt() {
		return noti_regdt;
	}
	public void setNoti_regdt(String noti_regdt) {
		this.noti_regdt = noti_regdt;
	}
	public String getNoti_readdt() {
		return noti_readdt;
	}
	public void setNoti_readdt(String noti_readdt) {
		this.noti_readdt = noti_readdt;
	}
	public String getNoti_readyn() {
		return noti_readyn;
	}
	public void setNoti_readyn(String noti_readyn) {
		this.noti_readyn = noti_readyn;
	}
	public int getNoti_contno() {
		return noti_contno;
	}
	public void setNoti_contno(int noti_contno) {
		this.noti_contno = noti_contno;
	}
	public String getNoti_url() {
		return noti_url;
	}
	public void setNoti_url(String noti_url) {
		this.noti_url = noti_url;
	}
	public int getNoti_compno() {
		return noti_compno;
	}
	public void setNoti_compno(int noti_compno) {
		this.noti_compno = noti_compno;
	}
	public NotificationVO(int noti_no, String noti_cont, String noti_type, String noti_recid, String noti_recnm,
			String noti_sendid, String noti_sendnm, String noti_regdt, String noti_readdt, String noti_readyn,
			int noti_contno, String noti_url, int noti_compno) {
		super();
		this.noti_no = noti_no;
		this.noti_cont = noti_cont;
		this.noti_type = noti_type;
		this.noti_recid = noti_recid;
		this.noti_recnm = noti_recnm;
		this.noti_sendid = noti_sendid;
		this.noti_sendnm = noti_sendnm;
		this.noti_regdt = noti_regdt;
		this.noti_readdt = noti_readdt;
		this.noti_readyn = noti_readyn;
		this.noti_contno = noti_contno;
		this.noti_url = noti_url;
		this.noti_compno = noti_compno;
	}
	@Override
	public String toString() {
		return "NotificationVO [noti_no=" + noti_no + ", noti_cont=" + noti_cont + ", noti_type=" + noti_type
				+ ", noti_recid=" + noti_recid + ", noti_recnm=" + noti_recnm + ", noti_sendid=" + noti_sendid
				+ ", noti_sendnm=" + noti_sendnm + ", noti_regdt=" + noti_regdt + ", noti_readdt=" + noti_readdt
				+ ", noti_readyn=" + noti_readyn + ", noti_contno=" + noti_contno + ", noti_url=" + noti_url
				+ ", noti_compno=" + noti_compno + "]";
	}
	
	
	
	

}
