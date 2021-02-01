package com.gr.cg.scheduler;

import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.gr.cg.service.MandateService;
import com.gr.cg.service.NotificationService;

@Component
public class TestScheduler{
	
	private MandateService mandateService;
	private NotificationService notificationService;
	public void setMandateService(MandateService mandateService) {
		this.mandateService = mandateService;
	}
	
	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}
	
	public void mandateCheck() throws SQLException {
		mandateService.turnOnMandate();
		mandateService.turnOffMandate();
	}
	
	public void setActvyn() throws SQLException{
		mandateService.setActvyn();
	}
	public void setAutoReadYnIsN() throws SQLException, ParseException{
		notificationService.setAutoReadYnIsN();
	}
	public void checkReadDate() throws SQLException,ParseException{
		notificationService.checkReadDate();
	}
	
	
	public void checkAlramList() throws SQLException{
		notificationService.checkAlramList();
	}
	

}
