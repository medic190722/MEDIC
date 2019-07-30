package com.kh.medic.doctor.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Medical implements Serializable {
	
	private static final long serialVersionUID = 6001L;
	
	private String mCode;		// 진료 코드
	private int pNo;			// 환자 번호
	private String pName;		// 환자 이름
	private Date mDate;			// 진료 날짜
	private String empNo;		// 의사 사번
	private String empName;		// 담당 의사
	private String mHistory;	// 처방 내역
	private char pAdmissionYN;	// 입원 여부
	
	public Medical() {}
	
	public Medical(String mCode, int pNo, String pName, Date mDate, String empNo, String empName, String mHistory,
			char pAdmissionYN) {
		this.mCode = mCode;
		this.pNo = pNo;
		this.pName = pName;
		this.mDate = mDate;
		this.empNo = empNo;
		this.empName = empName;
		this.mHistory = mHistory;
		this.pAdmissionYN = pAdmissionYN;
	}

	@Override
	public String toString() {
		return "Medical [mCode=" + mCode + ", pNo=" + pNo + ", pName=" + pName + ", mDate=" + mDate + ", empNo=" + empNo
				+ ", empName=" + empName + ", mHistory=" + mHistory + ", pAdmissionYN=" + pAdmissionYN + "]";
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getmCode() {
		return mCode;
	}

	public void setmCode(String mCode) {
		this.mCode = mCode;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getmHistory() {
		return mHistory;
	}

	public void setmHistory(String mHistory) {
		this.mHistory = mHistory;
	}

	public char getpAdmissionYN() {
		return pAdmissionYN;
	}

	public void setpAdmissionYN(char pAdmissionYN) {
		this.pAdmissionYN = pAdmissionYN;
	}
	
}
