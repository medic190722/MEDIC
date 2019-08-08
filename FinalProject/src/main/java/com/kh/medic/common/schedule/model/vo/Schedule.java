package com.kh.medic.common.schedule.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Schedule implements Serializable {

	private static final long serialVersionUID = 2000L;
	
	private int scno; // 일정번호
	private int empno; // 사번
	private Date scstart; // 시작일
	private Date scend; // 종료일 
	private String backcolor; // 배경색
	private String bordercolor; // 테두리색
	private String sccontent; // 내용
	
	public Schedule() {}

	// 등록용
	public Schedule(Date scstart, String sccontent, int empno, String backcolor, String bordercolor) {
		this.scstart = scstart;
		this.sccontent = sccontent;
		this.empno = empno;
		this.backcolor = backcolor;
		this.bordercolor = bordercolor;
	}
	
	// 수정용
	public Schedule(int scno, Date scstart, Date scend) {
		super();
		this.scno = scno;
		this.scstart = scstart;
		this.scend = scend;
	}
	
	// 조회용
	public Schedule(int scno, int empno, Date scstart, Date scend, String sccontent, String backcolor, String bordercolor) {
		this.scno = scno;
		this.empno = empno;
		this.scstart = scstart;
		this.scend = scend;
		this.sccontent = sccontent;
		this.backcolor = backcolor;
		this.bordercolor = bordercolor;
	}

	public int getScno() {
		return scno;
	}

	public void setScno(int scno) {
		this.scno = scno;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public Date getScstart() {
		return scstart;
	}

	public void setScstart(Date scstart) {
		this.scstart = scstart;
	}

	public Date getScend() {
		return scend;
	}

	public void setScend(Date scend) {
		this.scend = scend;
	}

	public String getSccontent() {
		return sccontent;
	}

	public void setSccontent(String sccontent) {
		this.sccontent = sccontent;
	}

	public String getBackcolor() {
		return backcolor;
	}

	public void setBackcolor(String backcolor) {
		this.backcolor = backcolor;
	}
	
	public String getBordercolor() {
		return bordercolor;
	}

	public void setBordercolor(String bordercolor) {
		this.bordercolor = bordercolor;
	}

	@Override
	public String toString() {
		return "Schedule [scno=" + scno + ", empno=" + empno + ", scstart=" + scstart + ", scend=" + scend
				+ ", backcolor=" + backcolor + ", bordercolor=" + bordercolor + ", sccontent=" + sccontent + "]";
	}
	
}
