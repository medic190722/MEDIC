package com.kh.medic.nurse.model.vo;

import java.io.Serializable;

public class Nurse implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1000L;
	
	private int pNo;
	private int wardCode;
	private String orderDate;
	private int empNo;
	private String orderExamination;
	private String doctorOrder;
	private String checkYn;
	private String empName;
	private String pName;
	private String pRrn;
	private String pGender;
	
	public Nurse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Nurse(int pNo, int wardCode, int empNo, String orderExamination, String doctorOrder) {
		this.pNo = pNo;
		this.wardCode = wardCode;
		this.empNo = empNo;
		this.orderExamination = orderExamination;
		this.doctorOrder = doctorOrder;
	}

	public Nurse(int pNo, int wardCode, String orderDate, int empNo, String orderExamination, String doctorOrder,
			String checkYn, String empName, String pName) {
		super();
		this.pNo = pNo;
		this.wardCode = wardCode;
		this.orderDate = orderDate;
		this.empNo = empNo;
		this.orderExamination = orderExamination;
		this.doctorOrder = doctorOrder;
		this.checkYn = checkYn;
		this.empName = empName;
		this.pName = pName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getWardCode() {
		return wardCode;
	}
	public void setWardCode(int wardCode) {
		this.wardCode = wardCode;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getOrderExamination() {
		return orderExamination;
	}
	public void setOrderExamination(String orderExamination) {
		this.orderExamination = orderExamination;
	}
	public String getDoctorOrder() {
		return doctorOrder;
	}
	public void setDoctorOrder(String doctorOrder) {
		this.doctorOrder = doctorOrder;
	}
	public String getCheckYn() {
		return checkYn;
	}
	public void setCheckYn(String checkYn) {
		this.checkYn = checkYn;
	}
	
	public String getpRrn() {
		return pRrn;
	}

	public void setpRrn(String pRrn) {
		this.pRrn = pRrn;
	}

	@Override
	public String toString() {
		return "Nurse [pNo=" + pNo + ", wardCode=" + wardCode + ", orderDate=" + orderDate + ", empNo=" + empNo
				+ ", orderExamination=" + orderExamination + ", doctorOrder=" + doctorOrder + ", checkYn=" + checkYn
				+ ", empName=" + empName + ", pName=" + pName + "]";
	}

	public String getpGender() {
		return pGender;
	}

	public void setpGender(String pGender) {
		this.pGender = pGender;
	}
	
	
	
}
