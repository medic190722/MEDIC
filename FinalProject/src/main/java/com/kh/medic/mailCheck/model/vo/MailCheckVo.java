package com.kh.medic.mailCheck.model.vo;

import java.io.Serializable;

public class MailCheckVo implements Serializable{
	private String emailId;
	private String emailPwd;
	public MailCheckVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MailCheckVo(String emailId, String emailPwd) {
		super();
		this.emailId = emailId;
		this.emailPwd = emailPwd;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailPwd() {
		return emailPwd;
	}
	public void setEmailPwd(String emailPwd) {
		this.emailPwd = emailPwd;
	}
	
	

	
	
}
