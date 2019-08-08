package com.kh.medic.attendance.model.vo;

import java.io.Serializable;


public class Attendance implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1000L;
	
	private int empNo;
	private String empName;
	private String attend;
	private String leave;
	
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attendance(int empNo, String empName, String attend, String leave) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.attend = attend;
		this.leave = leave;
	}

	@Override
	public String toString() {
		return "Attendance [empNo=" + empNo + ", empName=" + empName + ", attend=" + attend + ", leave=" + leave + "]";
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

	public String getAttend() {
		return attend;
	}

	public void setAttend(String attend) {
		this.attend = attend;
	}

	public String getLeave() {
		return leave;
	}

	public void setLeave(String leave) {
		this.leave = leave;
	}
	
	
}
