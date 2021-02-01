package com.gr.cg.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gr.cg.command.PageMaker2;

public class PostVO extends PageMaker2{
	private int post_no;
	private int post_brdno;
	private String post_title;
	private String post_cont;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date post_regdt;
	private Date post_udtdt;
	private String post_pbls;
	private Integer post_ppost;
	private String post_delyn;
	private int post_views;
	private String post_attckey;
	private int level;
	private int post_compno;
	 
	
	public int getPost_compno() {
		return post_compno;
	}

	public void setPost_compno(int post_compno) {
		this.post_compno = post_compno;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public PostVO() {
		super();
	}

	public PostVO(int level,int post_no, int post_brdno, String post_title, String post_cont, Date post_regdt, Date post_udtdt,
			String post_pbls, Integer post_ppost, String post_delyn, int post_views, String post_attckey) {
		super();
		this.level = level;
		this.post_no = post_no;
		this.post_brdno = post_brdno;
		this.post_title = post_title;
		this.post_cont = post_cont;
		this.post_regdt = post_regdt;
		this.post_udtdt = post_udtdt;
		this.post_pbls = post_pbls;
		this.post_ppost = post_ppost;
		this.post_delyn = post_delyn;
		this.post_views = post_views;
		this.post_attckey = post_attckey;
	}

	
	
	
	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getPost_brdno() {
		return post_brdno;
	}

	public void setPost_brdno(int post_brdno) {
		this.post_brdno = post_brdno;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_cont() {
		return post_cont;
	}

	public void setPost_cont(String post_cont) {
		this.post_cont = post_cont;
	}

	public Date getPost_regdt() {
		return post_regdt;
	}

	public void setPost_regdt(Date post_regdt) {
		this.post_regdt = post_regdt;
	}

	public Date getPost_udtdt() {
		return post_udtdt;
	}

	public void setPost_udtdt(Date post_udtdt) {
		this.post_udtdt = post_udtdt;
	}

	public String getPost_pbls() {
		return post_pbls;
	}

	public void setPost_pbls(String post_pbls) {
		this.post_pbls = post_pbls;
	}

	public Integer getPost_ppost() {
		return post_ppost;
	}

	public void setPost_ppost(Integer post_ppost) {
		this.post_ppost = post_ppost;
	}

	public String getPost_delyn() {
		return post_delyn;
	}

	public void setPost_delyn(String post_delyn) {
		this.post_delyn = post_delyn;
	}

	public int getPost_views() {
		return post_views;
	}

	public void setPost_views(int post_views) {
		this.post_views = post_views;
	}

	public String getPost_attckey() {
		return post_attckey;
	}

	public void setPost_attckey(String post_attckey) {
		this.post_attckey = post_attckey;
	}

	@Override
	public String toString() {
		return "PostVO [post_no=" + post_no + ", post_brdno=" + post_brdno + ", post_title=" + post_title
				+ ", post_cont=" + post_cont + ", post_regdt=" + post_regdt + ", post_udtdt=" + post_udtdt
				+ ", post_pbls=" + post_pbls + ", post_ppost=" + post_ppost + ", post_delyn=" + post_delyn
				+ ", post_views=" + post_views + ", post_attckey=" + post_attckey + ", level=" + level
				+ ", post_compno=" + post_compno + "]";
	}
	
}
