package com.kh.medic.mailMit.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class MailMitListVo implements Serializable{
	
	private int empNo;
	private String empName;
	private String deptCode;
	private String jobCode;
	private String deptTitle;
	private String jobTitle;
	private String empEmail;
	
	public MailMitListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MailMitListVo(int empNo, String empName, String deptCode, String jobCode, String deptTitle, String jobTitle,
			String empEmail) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
		this.deptTitle = deptTitle;
		this.jobTitle = jobTitle;
		this.empEmail = empEmail;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getDeptTitle() {
		return deptTitle;
	}
	public void setDeptTitle(String deptTitle) {
		this.deptTitle = deptTitle;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	@Override
	public String toString() {
		return "MailMitListVo [empNo=" + empNo + ", empName=" + empName + ", deptCode=" + deptCode + ", jobCode="
				+ jobCode + ", deptTitle=" + deptTitle + ", jobTitle=" + jobTitle + ", empEmail=" + empEmail + "]";
	}
	
	

}
