package com.kh.medic.mail.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medic.mail.model.vo.MailVo;




@Controller
public class MailController {
	
	@RequestMapping("/mail/mail.do")
	public String Mail(Model model) throws AddressException, MessagingException {
		List<MailVo> list = PostCan.open();
		
		System.out.println("가"+list);
		
		model.addAttribute("list",list);
		
		return "mail/mailList";
	}
	
}
