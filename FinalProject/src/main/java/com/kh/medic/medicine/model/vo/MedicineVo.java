package com.kh.medic.medicine.model.vo;

import java.io.Serializable;

public class MedicineVo implements Serializable{
	private String medCode;
	private String medName;
	private int medCount;
	
	public MedicineVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedicineVo(String medCode, String medName, int medCount) {
		super();
		this.medCode = medCode;
		this.medName = medName;
		this.medCount = medCount;
	}

	public String getMedCode() {
		return medCode;
	}

	public void setMedCode(String medCode) {
		this.medCode = medCode;
	}

	public String getMedName() {
		return medName;
	}

	public void setMedName(String medName) {
		this.medName = medName;
	}

	public int getMedCount() {
		return medCount;
	}

	public void setMedCount(int medCount) {
		this.medCount = medCount;
	}

	@Override
	public String toString() {
		return "MedicineVo [medCode=" + medCode + ", medName=" + medName + ", medCount=" + medCount + "]";
	}
	
}
