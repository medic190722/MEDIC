package com.kh.medic.doctor.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Medical implements Serializable {
	
	private static final long serialVersionUID = 6001L;
	
	private String mCode;			// 진료 코드
	private int pNo;				// 환자 번호
	private String pName;			// 환자 이름
	private Date mDate;				// 진료 날짜
	private int empNo;				// 의사 사번
	private String empName;			// 담당 의사
	private String mHistory;		// 진료 내역
	private String mExamination;	// 검사 항목
	private String mMedList;		// 처방 약품
	
	public Medical() {}
	
	public Medical(String mCode, int pNo, String pName, Date mDate, String mHistory, String mExamination,
			String mMedList) {
		this.mCode = mCode;
		this.pNo = pNo;
		this.pName = pName;
		this.mDate = mDate;
		this.mHistory = mHistory;
		this.mExamination = mExamination;
		this.mMedList = mMedList;
	}

	public Medical(String mCode, int pNo, String pName, Date mDate, int empNo, String empName, String mHistory) {
		this.mCode = mCode;
		this.pNo = pNo;
		this.pName = pName;
		this.mDate = mDate;
		this.empNo = empNo;
		this.empName = empName;
		this.mHistory = mHistory;
	}

	public Medical(String mCode, int pNo, String pName, Date mDate, int empNo, String empName, String mHistory,
			String mExamination, String mMedList) {
		this.mCode = mCode;
		this.pNo = pNo;
		this.pName = pName;
		this.mDate = mDate;
		this.empNo = empNo;
		this.empName = empName;
		this.mHistory = mHistory;
		this.mExamination = mExamination;
		this.mMedList = mMedList;
	}

	@Override
	public String toString() {
		return "Medical [mCode=" + mCode + ", pNo=" + pNo + ", pName=" + pName + ", mDate=" + mDate + ", empNo=" + empNo
				+ ", empName=" + empName + ", mHistory=" + mHistory + ", mExamination=" + mExamination + ", mMedList="
				+ mMedList + "]";
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

	public String getmHistory() {
		return mHistory;
	}

	public void setmHistory(String mHistory) {
		this.mHistory = mHistory;
	}

	public String getmExamination() {
		return mExamination;
	}

	public void setmExamination(String mExamination) {
		this.mExamination = mExamination;
	}

	public String getmMedList() {
		return mMedList;
	}

	public void setmMedList(String mMedList) {
		this.mMedList = mMedList;
	}
	
}
