package com.gr.cg.dto;

public class MenuVO {
	private String menu_no;
	private String menu_upmenuno;
	private String menu_nm;
	private String menu_url;
	private String menu_icon;
	
	public MenuVO() {
		super();
	}

	public MenuVO(String menu_no, String menu_upmenuno, String menu_nm, String menu_url, String menu_icon) {
		super();
		this.menu_no = menu_no;
		this.menu_upmenuno = menu_upmenuno;
		this.menu_nm = menu_nm;
		this.menu_url = menu_url;
		this.menu_icon = menu_icon;
	}

	public String getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}

	public String getMenu_upmenuno() {
		return menu_upmenuno;
	}

	public void setMenu_upmenuno(String menu_upmenuno) {
		this.menu_upmenuno = menu_upmenuno;
	}

	public String getMenu_nm() {
		return menu_nm;
	}

	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public String getMenu_icon() {
		return menu_icon;
	}

	public void setMenu_icon(String menu_icon) {
		this.menu_icon = menu_icon;
	}

	@Override
	public String toString() {
		return "MenuVO [menu_no=" + menu_no + ", menu_upmenuno=" + menu_upmenuno + ", menu_nm=" + menu_nm
				+ ", menu_url=" + menu_url + ", menu_icon=" + menu_icon + "]";
	}

}
