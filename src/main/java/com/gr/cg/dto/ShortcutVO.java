package com.gr.cg.dto;

public class ShortcutVO {
	private int shc_no;
	private String shc;
	private String shc_save;
	private String shc_id;
	
	public ShortcutVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShortcutVO(int shc_no, String shc, String shc_save, String shc_id) {
		super();
		this.shc_no = shc_no;
		this.shc = shc;
		this.shc_save = shc_save;
		this.shc_id = shc_id;
	}

	public int getShc_no() {
		return shc_no;
	}

	public void setShc_no(int shc_no) {
		this.shc_no = shc_no;
	}

	public String getShc() {
		return shc;
	}

	public void setShc(String shc) {
		this.shc = shc;
	}

	public String getShc_save() {
		return shc_save;
	}

	public void setShc_save(String shc_save) {
		this.shc_save = shc_save;
	}

	public String getShc_id() {
		return shc_id;
	}

	public void setShc_id(String shc_id) {
		this.shc_id = shc_id;
	}

	@Override
	public String toString() {
		return "ShortcutVO [shc_no=" + shc_no + ", shc=" + shc + ", shc_save=" + shc_save + ", shc_id=" + shc_id + "]";
	}
	
}
