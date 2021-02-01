package com.gr.cg.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.gr.cg.command.PageMaker2;

public class VacationVO extends PageMaker2 {

	 	private int vact_no     ; // 휴가번호(시퀸스)
	    private String vact_id     ; // 휴가 사용 id
	    private String vact_nm; //휴가 사용자 이름
	    private String vact_deptnm; //휴가 사용자부서이름
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date vact_satymd ; // 휴가 시작일자
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date vact_endymd ; // 휴가 종료일자
	    private String vact_gb     ; // 휴가 구분
	    private String vact_reason ; // 휴가 사유
	    private String vact_criy   ; // 기준 연도
	    private double vact_days   ; // 휴가 일수
	    private String vact_regid  ; // 등록자id
	    private Date vact_regdt  ; // 등록일자
	    private String vact_udtid  ; // 수정자 id
	    private Date vact_udtdt  ; //수정일자
	  
		private String vact_aprvyn; //승인여부
		private String vact_delyn; //삭제여부
		private int vact_compno; // 회사번호
		
		
		private Date vact_aplymd; //신청일자
		private Date vact_apludtymd; //신청수정일자
		
	    private double vact_occurcnt; //발생 연차 수
		private double vact_usecnt; //사용 연차 갯수
		private double vact_remcnt; //잔여 연차 갯수
		
		private int vact_edno; //전자 결재번호
		
		
		public VacationVO() {
			// TODO Auto-generated constructor stub
		}
		
		
		public String getVact_nm() {
			return vact_nm;
		}


		public void setVact_nm(String vact_nm) {
			this.vact_nm = vact_nm;
		}


		public String getVact_deptnm() {
			return vact_deptnm;
		}


		public void setVact_deptnm(String vact_deptnm) {
			this.vact_deptnm = vact_deptnm;
		}


		public int getVact_no() {
			return vact_no;
		}
		public void setVact_no(int vact_no) {
			this.vact_no = vact_no;
		}
		public String getVact_id() {
			return vact_id;
		}
		public void setVact_id(String vact_id) {
			this.vact_id = vact_id;
		}
		public Date getVact_satymd() {
			return vact_satymd;
		}
		public void setVact_satymd(Date vact_satymd) {
			this.vact_satymd = vact_satymd;
		}
		public Date getVact_endymd() {
			return vact_endymd;
		}
		public void setVact_endymd(Date vact_endymd) {
			this.vact_endymd = vact_endymd;
		}
		public String getVact_gb() {
			return vact_gb;
		}
		public void setVact_gb(String vact_gb) {
			this.vact_gb = vact_gb;
		}
		public String getVact_reason() {
			return vact_reason;
		}
		public void setVact_reason(String vact_reason) {
			this.vact_reason = vact_reason;
		}
		public String getVact_criy() {
			return vact_criy;
		}
		public void setVact_criy(String vact_criy) {
			this.vact_criy = vact_criy;
		}
		public double getVact_days() {
			return vact_days;
		}
		public void setVact_days(double vact_days) {
			this.vact_days = vact_days;
		}
		public String getVact_regid() {
			return vact_regid;
		}
		public void setVact_regid(String vact_regid) {
			this.vact_regid = vact_regid;
		}
		public Date getVact_regdt() {
			return vact_regdt;
		}
		public void setVact_regdt(Date vact_regdt) {
			this.vact_regdt = vact_regdt;
		}

		
		public String getVact_udtid() {
			return vact_udtid;
		}


		public void setVact_udtid(String vact_udtid) {
			this.vact_udtid = vact_udtid;
		}


		public Date getVact_udtdt() {
			return vact_udtdt;
		}


		public void setVact_udtdt(Date vact_udtdt) {
			this.vact_udtdt = vact_udtdt;
		}


		public Date getVact_uptdt() {
			return vact_udtdt;
		}
		public void setVact_uptdt(Date vact_uptdt) {
			this.vact_udtdt = vact_uptdt;
		}
		public double getVact_useCnt() {
			return vact_usecnt;
		}
		public void setVact_useCnt(double vact_useCnt) {
			this.vact_usecnt = vact_useCnt;
		}
		public double getVact_remCnt() {
			return vact_remcnt;
		}
		public void setVact_remCnt(double vact_remCnt) {
			this.vact_remcnt = vact_remCnt;
		}
		
		
		public String getVact_delyn() {
			return vact_delyn;
		}
		public void setVact_delyn(String vact_delyn) {
			this.vact_delyn = vact_delyn;
		}
		public String getVact_aprvyn() {
			return vact_aprvyn;
		}
		public void setVact_aprvyn(String vact_aprvyn) {
			this.vact_aprvyn = vact_aprvyn;
		}
		
		
		public int getVact_compno() {
			return vact_compno;
		}
		public void setVact_compno(int vact_compno) {
			this.vact_compno = vact_compno;
		}


	

		public double getVact_occurcnt() {
			return vact_occurcnt;
		}


		public void setVact_occurcnt(double vact_occurcnt) {
			this.vact_occurcnt = vact_occurcnt;
		}


		public double getVact_usecnt() {
			return vact_usecnt;
		}


		public void setVact_usecnt(double vact_usecnt) {
			this.vact_usecnt = vact_usecnt;
		}


		public double getVact_remcnt() {
			return vact_remcnt;
		}


		public void setVact_remcnt(double vact_remcnt) {
			this.vact_remcnt = vact_remcnt;
		}

		
		

		public Date getVact_aplymd() {
			return vact_aplymd;
		}


		public void setVact_aplymd(Date vact_aplymd) {
			this.vact_aplymd = vact_aplymd;
		}


		public Date getVact_apludtymd() {
			return vact_apludtymd;
		}


		public void setVact_apludtymd(Date vact_apludtymd) {
			this.vact_apludtymd = vact_apludtymd;
		}


		public int getVact_edno() {
			return vact_edno;
		}


		public void setVact_edno(int vact_edno) {
			this.vact_edno = vact_edno;
		}

		public VacationVO(int vact_no, String vact_id, String vact_nm, String vact_deptnm, Date vact_satymd,
				Date vact_endymd, String vact_gb, String vact_reason, String vact_criy, double vact_days,
				String vact_regid, Date vact_regdt, String vact_udtid, Date vact_udtdt, String vact_aprvyn,
				String vact_delyn, int vact_compno, Date vact_aplymd, Date vact_apludtymd, double vact_occurcnt,
				double vact_usecnt, double vact_remcnt, int vact_edno) {
			super();
			this.vact_no = vact_no;
			this.vact_id = vact_id;
			this.vact_nm = vact_nm;
			this.vact_deptnm = vact_deptnm;
			this.vact_satymd = vact_satymd;
			this.vact_endymd = vact_endymd;
			this.vact_gb = vact_gb;
			this.vact_reason = vact_reason;
			this.vact_criy = vact_criy;
			this.vact_days = vact_days;
			this.vact_regid = vact_regid;
			this.vact_regdt = vact_regdt;
			this.vact_udtid = vact_udtid;
			this.vact_udtdt = vact_udtdt;
			this.vact_aprvyn = vact_aprvyn;
			this.vact_delyn = vact_delyn;
			this.vact_compno = vact_compno;
			this.vact_aplymd = vact_aplymd;
			this.vact_apludtymd = vact_apludtymd;
			this.vact_occurcnt = vact_occurcnt;
			this.vact_usecnt = vact_usecnt;
			this.vact_remcnt = vact_remcnt;
			this.vact_edno = vact_edno;
		}


		@Override
		public String toString() {
			return "VacationVO [vact_no=" + vact_no + ", vact_id=" + vact_id + ", vact_nm=" + vact_nm + ", vact_deptnm="
					+ vact_deptnm + ", vact_satymd=" + vact_satymd + ", vact_endymd=" + vact_endymd + ", vact_gb="
					+ vact_gb + ", vact_reason=" + vact_reason + ", vact_criy=" + vact_criy + ", vact_days=" + vact_days
					+ ", vact_regid=" + vact_regid + ", vact_regdt=" + vact_regdt + ", vact_udtid=" + vact_udtid
					+ ", vact_udtdt=" + vact_udtdt + ", vact_aprvyn=" + vact_aprvyn + ", vact_delyn=" + vact_delyn
					+ ", vact_compno=" + vact_compno + ", vact_aplymd=" + vact_aplymd + ", vact_apludtymd="
					+ vact_apludtymd + ", vact_occurcnt=" + vact_occurcnt + ", vact_usecnt=" + vact_usecnt
					+ ", vact_remcnt=" + vact_remcnt + ", vact_edno=" + vact_edno + "]";
		}

		
		
		
}
