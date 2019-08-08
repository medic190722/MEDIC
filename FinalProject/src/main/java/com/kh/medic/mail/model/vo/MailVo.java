package com.kh.medic.mail.model.vo;

import java.io.Serializable;
import java.util.Arrays;

import javax.mail.Address;



public class MailVo implements Serializable {

	private String mailTitle;
	private String mailContent;
	private String mailSender;
	private String mailDate;
	public MailVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MailVo(String mailTitle, String mailContent, String mailSender, String mailDate) {
		super();
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
		this.mailSender = mailSender;
		this.mailDate = mailDate;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public String getMailSender() {
		return mailSender;
	}
	public void setMailSender(String mailSender) {
		this.mailSender = mailSender;
	}
	public String getMailDate() {
		return mailDate;
	}
	public void setMailDate(String mailDate) {
		this.mailDate = mailDate;
	}
	@Override
	public String toString() {
		return "MailVo [mailTitle=" + mailTitle + ", mailContent=" + mailContent + ", mailSender=" + mailSender
				+ ", mailDate=" + mailDate + "]";
	}
	
	
	
	
	
	
}