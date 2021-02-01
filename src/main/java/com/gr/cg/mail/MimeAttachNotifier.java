package com.gr.cg.mail;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.gr.cg.command.SendMailCommand;


public class MimeAttachNotifier {
	private JavaMailSender mailSender;
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(SendMailCommand mail, String uploadPath) throws Exception {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		messageHelper.setTo(new InternetAddress(mail.getReceiver()));
		messageHelper.setFrom(mail.getSender(), "운영자");
		messageHelper.setSubject(mail.getTitle());
		messageHelper.setText(mail.getContent(), true);
		
		if(mail.getFile() != null && !mail.getFile().isEmpty()) {
			String fileName = mail.getFile().getOriginalFilename();
			DataSource dataSource = new FileDataSource(uploadPath+"/"+fileName);			
			messageHelper.addAttachment(MimeUtility.encodeText(fileName,"utf-8","B"), dataSource);
		}
		mailSender.send(message);
	}
}
