package com.gr.cg.command;

public class RoleAttendCommand extends PageMaker2 {
	
	private int attd_no          ;
	private String attd_empid       ;
	private String attd_gtwtime     ;
	private String attd_offwtime    ;   
	private String attd_lat         ;
	private String attd_lng         ;
	private String attd_area        ;
	private String attd_workshape   ;
	private String attd_wsnm        ;
	private String days             ;
	private int comp_no          ;
	private String emp_nm           ;
	private int dept_no          ;
	private String dept_nm          ;
	private int rank_no          ;
	private String rank_nm          ;
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
	public String getAttd_offwtime() {
		return attd_offwtime;
	}
	public void setAttd_offwtime(String attd_offwtime) {
		this.attd_offwtime = attd_offwtime;
	}
	public String getAttd_lat() {
		return attd_lat;
	}
	public void setAttd_lat(String attd_lat) {
		this.attd_lat = attd_lat;
	}
	public String getAttd_lng() {
		return attd_lng;
	}
	public void setAttd_lng(String attd_lng) {
		this.attd_lng = attd_lng;
	}
	public String getAttd_area() {
		return attd_area;
	}
	public void setAttd_area(String attd_area) {
		this.attd_area = attd_area;
	}
	public String getAttd_workshape() {
		return attd_workshape;
	}
	public void setAttd_workshape(String attd_workshape) {
		this.attd_workshape = attd_workshape;
	}
	public String getAttd_wsnm() {
		return attd_wsnm;
	}
	public void setAttd_wsnm(String attd_wsnm) {
		this.attd_wsnm = attd_wsnm;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public int getComp_no() {
		return comp_no;
	}
	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public int getRank_no() {
		return rank_no;
	}
	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}
	public String getRank_nm() {
		return rank_nm;
	}
	public void setRank_nm(String rank_nm) {
		this.rank_nm = rank_nm;
	}
	public RoleAttendCommand(int attd_no, String attd_empid, String attd_gtwtime, String attd_offwtime, String attd_lat,
			String attd_lng, String attd_area, String attd_workshape, String attd_wsnm, String days, int comp_no,
			String emp_nm, int dept_no, String dept_nm, int rank_no, String rank_nm) {
		super();
		this.attd_no = attd_no;
		this.attd_empid = attd_empid;
		this.attd_gtwtime = attd_gtwtime;
		this.attd_offwtime = attd_offwtime;
		this.attd_lat = attd_lat;
		this.attd_lng = attd_lng;
		this.attd_area = attd_area;
		this.attd_workshape = attd_workshape;
		this.attd_wsnm = attd_wsnm;
		this.days = days;
		this.comp_no = comp_no;
		this.emp_nm = emp_nm;
		this.dept_no = dept_no;
		this.dept_nm = dept_nm;
		this.rank_no = rank_no;
		this.rank_nm = rank_nm;
	}
	@Override
	public String toString() {
		return "RoleAttendCommand [attd_no=" + attd_no + ", attd_empid=" + attd_empid + ", attd_gtwtime=" + attd_gtwtime
				+ ", attd_offwtime=" + attd_offwtime + ", attd_lat=" + attd_lat + ", attd_lng=" + attd_lng
				+ ", attd_area=" + attd_area + ", attd_workshape=" + attd_workshape + ", attd_wsnm=" + attd_wsnm
				+ ", days=" + days + ", comp_no=" + comp_no + ", emp_nm=" + emp_nm + ", dept_no=" + dept_no
				+ ", dept_nm=" + dept_nm + ", rank_no=" + rank_no + ", rank_nm=" + rank_nm + "]";
	}
	
	
	
	
}
