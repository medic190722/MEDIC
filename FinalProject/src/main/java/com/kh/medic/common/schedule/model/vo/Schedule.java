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
	private String sccontent; // 내용
	
	public Schedule() {}

	// 등록용
	public Schedule(Date scstart, String sccontent, int empno) {
		this.scstart = scstart;
		this.sccontent = sccontent;
		this.empno = empno;
	}

	// 조회용
	public Schedule(int scno, int empno, Date scstart, Date scend, String sccontent) {
		this.scno = scno;
		this.empno = empno;
		this.scstart = scstart;
		this.scend = scend;
		this.sccontent = sccontent;
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

	@Override
	public String toString() {
		return "Schedule [scno=" + scno + ", empno=" + empno + ", scstart=" + scstart + ", scend=" + scend
				+ ", sccontent=" + sccontent + "]";
	}
	
}
