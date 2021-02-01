package com.gr.cg.command;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gr.cg.dto.AttendanceVO;

public class AttendCommand extends PageMaker2{
	
	private int attd_no       ;
	private String attd_empid    ;
	private String attd_gtwtime  ;
	private String attd_gtwymd   ;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="HH:mm:ss", timezone="Asia/Seoul")
	private String attd_gtwhms   ;
	private String attd_offwtime ;        
	private String attd_offwymd  ;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="HH:mm:ss", timezone="Asia/Seoul")
	private String attd_offhms   ; 
	private String totaltime     ; //총 근로 시간
	private String daynm         ; //요일명
	private String attd_workshape; //근무형태
	private String totalmin      ; //출퇴근 날짜 차이 분으로 표시
	public int getAttd_no() {
		return attd_no;
	}
	public void setAttd_no(int attd_no) {
		this.attd_no = attd_no;
	}
	public String getAttd_empid() {
		return attd_empid;
	}
	public void setAttd_empid(String attd_empid) {
		this.attd_empid = attd_empid;
	}
	public String getAttd_gtwtime() {
		return attd_gtwtime;
	}
	public void setAttd_gtwtime(String attd_gtwtime) {
		this.attd_gtwtime = attd_gtwtime;
	}
	public String getAttd_gtwymd() {
		return attd_gtwymd;
	}
	public void setAttd_gtwymd(String attd_gtwymd) {
		this.attd_gtwymd = attd_gtwymd;
	}
	public String getAttd_gtwhms() {
		return attd_gtwhms;
	}
	public void setAttd_gtwhms(String attd_gtwhms) {
		this.attd_gtwhms = attd_gtwhms;
	}
	public String getAttd_offwtime() {
		return attd_offwtime;
	}
	public void setAttd_offwtime(String attd_offwtime) {
		this.attd_offwtime = attd_offwtime;
	}
	public String getAttd_offwymd() {
		return attd_offwymd;
	}
	public void setAttd_offwymd(String attd_offwymd) {
		this.attd_offwymd = attd_offwymd;
	}
	public String getAttd_offhms() {
		return attd_offhms;
	}
	public void setAttd_offhms(String attd_offhms) {
		this.attd_offhms = attd_offhms;
	}
	public String getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(String totaltime) {
		this.totaltime = totaltime;
	}
	public String getDaynm() {
		return daynm;
	}
	public void setDaynm(String daynm) {
		this.daynm = daynm;
	}
	public String getAttd_workshape() {
		return attd_workshape;
	}
	public void setAttd_workshape(String attd_workshape) {
		this.attd_workshape = attd_workshape;
	}
	public String getTotalmin() {
		return totalmin;
	}
	public void setTotalmin(String totalmin) {
		this.totalmin = totalmin;
	}
	@Override
	public String toString() {
		return "AttendCommand [attd_no=" + attd_no + ", attd_empid=" + attd_empid + ", attd_gtwtime=" + attd_gtwtime
				+ ", attd_gtwymd=" + attd_gtwymd + ", attd_gtwhms=" + attd_gtwhms + ", attd_offwtime=" + attd_offwtime
				+ ", attd_offwymd=" + attd_offwymd + ", attd_offhms=" + attd_offhms + ", totaltime=" + totaltime
				+ ", daynm=" + daynm + ", attd_workshape=" + attd_workshape + ", totalmin=" + totalmin + "]";
	}
	public AttendCommand(int attd_no, String attd_empid, String attd_gtwtime, String attd_gtwymd, String attd_gtwhms,
			String attd_offwtime, String attd_offwymd, String attd_offhms, String totaltime, String daynm,
			String attd_workshape, String totalmin) {
		super();
		this.attd_no = attd_no;
		this.attd_empid = attd_empid;
		this.attd_gtwtime = attd_gtwtime;
		this.attd_gtwymd = attd_gtwymd;
		this.attd_gtwhms = attd_gtwhms;
		this.attd_offwtime = attd_offwtime;
		this.attd_offwymd = attd_offwymd;
		this.attd_offhms = attd_offhms;
		this.totaltime = totaltime;
		this.daynm = daynm;
		this.attd_workshape = attd_workshape;
		this.totalmin = totalmin;
	}

	
	
	public AttendanceVO toReadAttend() {
		AttendanceVO attend = new AttendanceVO();
		attend.setAttd_empid(this.attd_empid);
		attend.setAttd_gtwtime(this.attd_gtwtime);
		attend.setAttd_offwtime(this.attd_offwtime);
		attend.setAttd_workshape(this.attd_workshape);
		attend.setAttd_no(this.attd_no);
		
		return attend;
		
	}
}
