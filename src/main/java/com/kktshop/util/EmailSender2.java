package com.kktshop.util;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender2 {
	@Autowired
	protected JavaMailSender mailSender;
	public void SendEmail(Email2 email) throws Exception {
		MimeMessage msg = mailSender.createMimeMessage();
		try { 
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		} catch(MessagingException e) {  
			System.out.println("MessagingException");
			e.printStackTrace();
		}     
		try {
			mailSender.send(msg);
		} catch(MailException e) {
			System.out.println("MailException발생");
			e.printStackTrace();
		}
	}
}