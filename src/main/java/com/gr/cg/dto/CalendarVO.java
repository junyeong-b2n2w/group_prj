package com.gr.cg.dto;

import java.sql.Date;

public class CalendarVO {
	private int cal_no   ;
	private String cal_id   ;
	private String cal_title;
	private String cal_cont ;
	private String cal_color;
	private String cal_satdt;
	private String cal_enddt;
	private Date cal_regdt;
	private Date cal_udtdt;
	private String cal_rel  ;
	private String cal_ntfcyn;
	private String cal_place;
	private String cal_url  ;
	private String cal_delyn;
	
	public CalendarVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CalendarVO(int cal_no, String cal_id, String cal_title, String cal_cont, String cal_color, String cal_satdt, String cal_enddt, Date cal_regdt, Date cal_udtdt, String cal_rel, String cal_ntfcyn, String cal_place, String cal_url, String cal_delyn) {
		super();
		this.cal_no = cal_no;
		this.cal_id = cal_id;
		this.cal_title = cal_title;
		this.cal_cont = cal_cont;
		this.cal_color = cal_color;
		this.cal_satdt = cal_satdt;
		this.cal_enddt = cal_enddt;
		this.cal_regdt = cal_regdt;
		this.cal_udtdt = cal_udtdt;
		this.cal_rel = cal_rel;
		this.cal_ntfcyn = cal_ntfcyn;
		this.cal_place = cal_place;
		this.cal_url = cal_url;
		this.cal_delyn = cal_delyn;
	}

	public int getCal_no() {
		return cal_no;
	}

	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}

	public String getCal_id() {
		return cal_id;
	}

	public void setCal_id(String cal_id) {
		this.cal_id = cal_id;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public String getCal_cont() {
		return cal_cont;
	}

	public void setCal_cont(String cal_cont) {
		this.cal_cont = cal_cont;
	}

	public String getCal_color() {
		return cal_color;
	}

	public void setCal_color(String cal_color) {
		this.cal_color = cal_color;
	}

	public String getCal_satdt() {
		return cal_satdt;
	}

	public void setCal_satdt(String cal_satdt) {
		this.cal_satdt = cal_satdt;
	}

	public String getCal_enddt() {
		return cal_enddt;
	}

	public void setCal_enddt(String cal_enddt) {
		this.cal_enddt = cal_enddt;
	}

	public Date getCal_regdt() {
		return cal_regdt;
	}

	public void setCal_regdt(Date cal_regdt) {
		this.cal_regdt = cal_regdt;
	}

	public Date getCal_udtdt() {
		return cal_udtdt;
	}

	public void setCal_udtdt(Date cal_udtdt) {
		this.cal_udtdt = cal_udtdt;
	}

	public String getCal_rel() {
		return cal_rel;
	}

	public void setCal_rel(String cal_rel) {
		this.cal_rel = cal_rel;
	}

	public String getCal_ntfcyn() {
		return cal_ntfcyn;
	}

	public void setCal_ntfcyn(String cal_ntfcyn) {
		this.cal_ntfcyn = cal_ntfcyn;
	}

	public String getCal_place() {
		return cal_place;
	}

	public void setCal_place(String cal_place) {
		this.cal_place = cal_place;
	}

	public String getCal_url() {
		return cal_url;
	}

	public void setCal_url(String cal_url) {
		this.cal_url = cal_url;
	}

	public String getCal_delyn() {
		return cal_delyn;
	}

	public void setCal_delyn(String cal_delyn) {
		this.cal_delyn = cal_delyn;
	}

	@Override
	public String toString() {
		return "CalendarVO [cal_no=" + cal_no + ", cal_id=" + cal_id + ", cal_title=" + cal_title + ", cal_cont=" + cal_cont + ", cal_color=" + cal_color + ", cal_satdt=" + cal_satdt + ", cal_enddt=" + cal_enddt + ", cal_regdt=" + cal_regdt + ", cal_udtdt=" + cal_udtdt + ", cal_rel=" + cal_rel + ", cal_ntfcyn=" + cal_ntfcyn + ", cal_place=" + cal_place + ", cal_url=" + cal_url + ", cal_delyn=" + cal_delyn + "]";
	}
}
