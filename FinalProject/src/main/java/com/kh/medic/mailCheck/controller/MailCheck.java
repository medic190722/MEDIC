package com.kh.medic.mailCheck.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.medic.mailCheck.model.vo.MailCheckVo;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

@Controller
public class MailCheck {
	@RequestMapping("/mailCheck/mailCheck.do")
	public String EmailCheck() {
		
		return "/mailCheck/mailLogin";
	}

	@RequestMapping("/mailCheck/emailAuth.do")
	public String emailAuth(HttpServletRequest request, HttpServletResponse response, MailCheckVo mailCheck, Model model) throws Exception {

		String email = mailCheck.getEmailId();
		String authNum = "";
		
		HttpSession session = request.getSession();
		session.setAttribute("name", mailCheck);
		
		authNum = RandomNum();
		sendEmail(email, authNum);
		model.addAttribute("email",email).addAttribute("authNum",authNum);
		return "/mailCheck/mailCheck";
	}

	private void sendEmail(String email,String authNum) {
		String host="smtp.naver.com";
		String subject ="인증 번호 전달";
		String fromName="관리자";
		String from=email;
		String to1=email;
		System.out.println("확인 : "+email);
		
		String content="인증번호 ["+ authNum + "]";
		
		try {
			Properties props=new Properties();
			
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.transport.protocol","smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class", 
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user",from);
			props.put("mail.smtp.auth","true");
			
			Session mailSession=Session.getInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("rlghvmffjqj@naver.com",
							"z2067211");
				}
			});
			Message msg=new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(
					fromName,"UTF-8","B")));
			
			InternetAddress[] address1= { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public String RandomNum() {
		StringBuffer buffer=new StringBuffer();
		for(int i=0; i<=6; i++) {
			int n=(int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}

}
