package com.kh.medic.equipment.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class EquipmentVo implements Serializable{

	
	private String eqCode;
	private String eqName;
	private int eqCount;
	private Date eqDate;
	private String eqBrokenYn;
	public EquipmentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EquipmentVo(String eqCode, String eqName, int eqCount, Date eqDate, String eqBrokenYn) {
		super();
		this.eqCode = eqCode;
		this.eqName = eqName;
		this.eqCount = eqCount;
		this.eqDate = eqDate;
		this.eqBrokenYn = eqBrokenYn;
	}
	public String getEqCode() {
		return eqCode;
	}
	public void setEqCode(String eqCode) {
		this.eqCode = eqCode;
	}
	public String getEqName() {
		return eqName;
	}
	public void setEqName(String eqName) {
		this.eqName = eqName;
	}
	public int getEqCount() {
		return eqCount;
	}
	public void setEqCount(int eqCount) {
		this.eqCount = eqCount;
	}
	public Date getEqDate() {
		return eqDate;
	}
	public void setEqDate(Date eqDate) {
		this.eqDate = eqDate;
	}
	public String getEqBrokenYn() {
		return eqBrokenYn;
	}
	public void setEqBrokenYn(String eqBrokenYn) {
		this.eqBrokenYn = eqBrokenYn;
	}
	@Override
	public String toString() {
		return "EquipmentVo [eqCode=" + eqCode + ", eqName=" + eqName + ", eqCount=" + eqCount + ", eqDate=" + eqDate
				+ ", eqBrokenYn=" + eqBrokenYn + "]";
	}
	
	
	
	
	
}
