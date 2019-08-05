package com.kh.medic.patient.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Admission implements Serializable{

	private static final long serialVersionUID = 3087L;
	
	private int p_no; //환자번호
	private int ward_code; // 병실번호
	private Date admission_date; // 입원날짜
	
	public Admission() {}

	public Admission(int p_no, int ward_code, Date admission_date) {
		super();
		this.p_no = p_no;
		this.ward_code = ward_code;
		this.admission_date = admission_date;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getWard_code() {
		return ward_code;
	}

	public void setWard_code(int ward_code) {
		this.ward_code = ward_code;
	}

	public Date getAdmission_date() {
		return admission_date;
	}

	public void setAdmission_date(Date admission_date) {
		this.admission_date = admission_date;
	}

	@Override
	public String toString() {
		return "Admission [p_no=" + p_no + ", ward_code=" + ward_code + ", admission_date=" + admission_date + "]";
	}	
	
}
