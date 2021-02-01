package com.gr.cg.dto;

import java.sql.Date;

public class AttachKeyVO {
	private String ak         ;
	private String ak_writer  ;
	private Date ak_regdt   ;
	private String ak_usetable;
	private String ak_useyn;
	
	public String getAk_useyn() {
		return ak_useyn;
	}
	public void setAk_useyn(String ak_useyn) {
		this.ak_useyn = ak_useyn;
	}
	public String getAk() {
		return ak;
	}
	public void setAk(String ak) {
		this.ak = ak;
	}
	public String getAk_writer() {
		return ak_writer;
	}
	public void setAk_writer(String ak_writer) {
		this.ak_writer = ak_writer;
	}
	public Date getAk_regdt() {
		return ak_regdt;
	}
	public void setAk_regdt(Date ak_regdt) {
		this.ak_regdt = ak_regdt;
	}
	public String getAk_usetable() {
		return ak_usetable;
	}
	public void setAk_usetable(String ak_usetable) {
		this.ak_usetable = ak_usetable;
	}
	
	
}                             
