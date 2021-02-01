package com.gr.cg.dto;

public class EnglishVO {
	
	private String english      ;
	private String en_mean      ;
	private String application  ;
	private String app_mean     ;
	@Override
	public String toString() {
		return "EnglishVO [english=" + english + ", en_mean=" + en_mean + ", application=" + application + ", app_mean="
				+ app_mean + "]";
	}
	public String getEnglish() {
		return english;
	}
	public void setEnglish(String english) {
		this.english = english;
	}
	public String getEn_mean() {
		return en_mean;
	}
	public void setEn_mean(String en_mean) {
		this.en_mean = en_mean;
	}
	public String getApplication() {
		return application;
	}
	public void setApplication(String application) {
		this.application = application;
	}
	public String getApp_mean() {
		return app_mean;
	}
	public void setApp_mean(String app_mean) {
		this.app_mean = app_mean;
	}
	
	
}
