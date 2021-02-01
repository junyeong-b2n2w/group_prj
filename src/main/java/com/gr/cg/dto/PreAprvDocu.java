package com.gr.cg.dto;

public class PreAprvDocu {
	private int pd_edno;
	private int pd_ed;
	
	public PreAprvDocu() {
		super();
	}

	public PreAprvDocu(int pd_edno, int pd_ed) {
		super();
		this.pd_edno = pd_edno;
		this.pd_ed = pd_ed;
	}

	public int getPd_edno() {
		return pd_edno;
	}

	public void setPd_edno(int pd_edno) {
		this.pd_edno = pd_edno;
	}

	public int getPd_ed() {
		return pd_ed;
	}

	public void setPd_ed(int pd_ed) {
		this.pd_ed = pd_ed;
	}

	@Override
	public String toString() {
		return "PreAprvDocu [pd_edno=" + pd_edno + ", pd_ed=" + pd_ed + "]";
	}
	
}
