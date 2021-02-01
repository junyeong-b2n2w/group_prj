package com.gr.cg.dto;

public class AttendanceVO{
	private int attd_no       ;
	private String attd_empid    ;
	private String attd_gtwtime  ;
	private String attd_offwtime ;
	private int attd_lat      ;
	private int attd_lng      ;
	private String attd_area     ;
	private String attd_workshape;
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
	public int getAttd_lat() {
		return attd_lat;
	}
	public void setAttd_lat(int attd_lat) {
		this.attd_lat = attd_lat;
	}
	public int getAttd_lng() {
		return attd_lng;
	}
	public void setAttd_lng(int attd_lng) {
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
	@Override
	public String toString() {
		return "{attd_no:'" + attd_no + "', attd_empid:'" + attd_empid + "', attd_gtwtime:'" + attd_gtwtime
				+ "', attd_offwtime:'" + attd_offwtime + "', attd_lat:'" + attd_lat + "', attd_lng:'" + attd_lng
				+ "', attd_area:'" + attd_area + "', attd_workshape:'" + attd_workshape + "'}";
	}
	
	
	
}
