package com.kh.medic.empsal.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class EmpsalVo implements Serializable{
	private int empNo;
	private String empName;
	private int salary;
	private String deptCode;
	private String jobCode;
	private String deptTitle;
	private String jobTitle;
	public EmpsalVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EmpsalVo(int empNo, String empName, int salary, String deptCode, String jobCode, String deptTitle,
			String jobTitle) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.salary = salary;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
		this.deptTitle = deptTitle;
		this.jobTitle = jobTitle;
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
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
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
	@Override
	public String toString() {
		return "EmpsalVo [empNo=" + empNo + ", empName=" + empName + ", salary=" + salary + ", deptCode=" + deptCode
				+ ", jobCode=" + jobCode + ", deptTitle=" + deptTitle + ", jobTitle=" + jobTitle + "]";
	}
	
	
	
}
