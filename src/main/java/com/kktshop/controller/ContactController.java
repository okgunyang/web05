package com.kktshop.controller;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kktshop.dto.CounselDTO;

@Controller
@RequestMapping("/contact/")
public class ContactController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);
	
	//다음 서비스 작업 객체를 주입
	@Autowired
	private JavaMailSender mailSender;
	
	//상담 목록 불러오기
	@RequestMapping(value="list.do", method = RequestMethod.GET)
    public String goodsList(Model model) throws Exception {
        return "contact/contactList";
    }

	@RequestMapping(value="onlineCounselForm.do", method = RequestMethod.GET)
    public String onlineCounselForm(Model model) throws Exception {
        return "contact/onlineCounselForm";
    }
	
	//네이버 이메일 보내기
	@RequestMapping(value="onlineCounsel.do", method = RequestMethod.POST)
    public String onlineCounsel(CounselDTO cdto, Model model) throws Exception {
	       try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");            
	            mailHelper.setFrom(cdto.getFrom());
	            mailHelper.setTo(cdto.getTo());
	            mailHelper.setSubject(cdto.getSubject());
	            mailHelper.setText(cdto.getContent(), true);
	            mailSender.send(mail);
	            logger.info("이메일 전송이 완료되었습니다.");
	        } catch(Exception e) {
	        	logger.info("이메일 전송이 실패되었습니다.");
	            e.printStackTrace();
	        }
			return "redirect:/";
    }
	
	//구글 이메일 보내기
/*	@RequestMapping("sendGoogleMail.do")
	public String sendGoogleEmail(CounselDTO ddto, Model model) throws Exception {
        try {
            MimeMessage mail = mailSender4.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");            
            mailHelper.setFrom(ddto.getFrom());
            mailHelper.setTo(ddto.getTo());
            mailHelper.setSubject(ddto.getSubject());
            mailHelper.setText(ddto.getContent(), true);
            mailSender4.send(mail);
            logger.info("이메일 전송이 완료되었습니다.");
        } catch(Exception e) {
        	logger.info("이메일 전송이 실패되었습니다.");
            e.printStackTrace();
        }
		return "redirect:/";
	}
*/
	//다음 이메일 보내기
/*	@RequestMapping("sendDaumMail.do")
	public String sendDaumEmail(CounselDTO edto, Model model) throws Exception {
        try {
            MimeMessage mail = mailSender5.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");            
            mailHelper.setFrom(edto.getFrom());
            mailHelper.setTo(edto.getTo());
            mailHelper.setSubject(edto.getSubject());
            mailHelper.setText(edto.getContent(), true);
            mailSender5.send(mail);
            logger.info("이메일 전송이 완료되었습니다.");
        } catch(Exception e) {
        	logger.info("이메일 전송이 실패되었습니다.");
            e.printStackTrace();
        }
		return "redirect:/";
	}
*/
}