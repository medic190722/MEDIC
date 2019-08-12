package com.kh.medic.mail.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medic.mail.model.vo.MailVo;




@Controller
public class MailController {
	
	@RequestMapping("/mail/mail.do")
	public String Mail(Model model,HttpServletRequest request) throws AddressException, MessagingException {
		System.out.println("여기까지 왔어요!!");
		List<MailVo> list = PostCan.open(request);
		
		//System.out.println("가"+list);
		
		model.addAttribute("list",list);
		
		return "mail/mailList";
	}
	
	@RequestMapping("/mail/mailOne.do")
	public String selectOneMail(MailVo mail,Model model) throws AddressException, MessagingException {
		
		List<MailVo> list = PostCan.open2(mail);
		model.addAttribute("mail",mail);
		
		//System.out.println(list);
		
		return "/mail/mailForm";
	}
	
	
}
