package com.kh.medic.vacation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class VacationVo implements Serializable{

	private String vCode;
	private Date vDate;
	private Date vDateEnd;
	private String vContent;
	private String empName;
	private String vYn;
	private int empNo;
	public VacationVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VacationVo(String vCode, Date vDate, Date vDateEnd, String vContent, String empName, String vYn, int empNo) {
		super();
		this.vCode = vCode;
		this.vDate = vDate;
		this.vDateEnd = vDateEnd;
		this.vContent = vContent;
		this.empName = empName;
		this.vYn = vYn;
		this.empNo = empNo;
	}
	public String getvCode() {
		return vCode;
	}
	public void setvCode(String vCode) {
		this.vCode = vCode;
	}
	public Date getvDate() {
		return vDate;
	}
	public void setvDate(Date vDate) {
		this.vDate = vDate;
	}
	public Date getvDateEnd() {
		return vDateEnd;
	}
	public void setvDateEnd(Date vDateEnd) {
		this.vDateEnd = vDateEnd;
	}
	public String getvContent() {
		return vContent;
	}
	public void setvContent(String vContent) {
		this.vContent = vContent;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getvYn() {
		return vYn;
	}
	public void setvYn(String vYn) {
		this.vYn = vYn;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "VacationVo [vCode=" + vCode + ", vDate=" + vDate + ", vDateEnd=" + vDateEnd + ", vContent=" + vContent
				+ ", empName=" + empName + ", vYn=" + vYn + ", empNo=" + empNo + "]";
	}
	
	
	
	
	
	
}
