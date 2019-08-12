package com.kh.medic.mailMit.controller;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medic.mailCheck.model.vo.MailCheckVo;
import com.kh.medic.mailMit.model.vo.MailMitVo;

@Controller
public class MailMitController {

	@Autowired
	private JavaMailSenderImpl mailSender;


	@RequestMapping(value = "/mailMit/mailSending.do")
	public void navermailtest(HttpServletRequest request,MailMitVo mail, ModelMap mo) throws Exception {
		HttpSession session2 = request.getSession();
		MailCheckVo mailChecks = (MailCheckVo) session2.getAttribute("name");
		
		System.out.println("이건 멀까"+mailChecks.getEmailId());
		
		
		System.out.println("확인하기 : "+mail.getEmpEmail());
		
		// 메일 관련 정보
		String host = "smtp.naver.com";
		final String username = mailChecks.getEmailId(); // 네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
		final String password = mailChecks.getEmailPwd(); // 네이버 이메일 비밀번호를 기재합니다.
		int port = 465; // 메일 내용
		String recipient = mail.getTomail(); // 메일을 발송할 이메일 주소를 기재해 줍니다.
		String subject = mail.getTitle();
		String body = mail.getContent();
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // for debug
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(mail.getEmpEmail()));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		System.out.println(new Date());
		mimeMessage.setSentDate(new Date());
		Transport.send(mimeMessage);
	}

}
