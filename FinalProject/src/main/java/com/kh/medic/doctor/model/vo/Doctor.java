package com.kh.medic.doctor.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Doctor implements Serializable {
	
	private static final long serialVersionUID = 6001L;
	
	private String MCODE;		// 진료 코드
	private int PNO;			// 환자 번호
	private String PNAME;		// 환자 이름
	private Date MDATE;			// 진료 날짜
	private String EMPNAME;		// 담당 의사
	private String MHISTORY;	// 처방 내역
	
	public Doctor() {}

	public Doctor(String mCODE, int pNO, String pNAME, Date mDATE, String eMPNAME, String mHISTORY) {
		MCODE = mCODE;
		PNO = pNO;
		PNAME = pNAME;
		MDATE = mDATE;
		EMPNAME = eMPNAME;
		MHISTORY = mHISTORY;
	}

	@Override
	public String toString() {
		return "Doctor [MCODE=" + MCODE + ", PNO=" + PNO + ", PNAME=" + PNAME + ", MDATE=" + MDATE + ", EMPNAME="
				+ EMPNAME + ", MHISTORY=" + MHISTORY + "]";
	}

	public String getMCODE() {
		return MCODE;
	}

	public void setMCODE(String mCODE) {
		MCODE = mCODE;
	}

	public int getPNO() {
		return PNO;
	}

	public void setPNO(int pNO) {
		PNO = pNO;
	}

	public String getPNAME() {
		return PNAME;
	}

	public void setPNAME(String pNAME) {
		PNAME = pNAME;
	}

	public Date getMDATE() {
		return MDATE;
	}

	public void setMDATE(Date mDATE) {
		MDATE = mDATE;
	}

	public String getEMPNAME() {
		return EMPNAME;
	}

	public void setEMPNAME(String eMPNAME) {
		EMPNAME = eMPNAME;
	}

	public String getMHISTORY() {
		return MHISTORY;
	}

	public void setMHISTORY(String mHISTORY) {
		MHISTORY = mHISTORY;
	}
	
}
