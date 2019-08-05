package com.kh.medic.patient.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class Patient implements Serializable{
	
	private static final long serialVersionUID = 5000L;
	// 환자 관련 VO
	
	private int p_no;	// 환자 번호
	private String p_name; // 환자 이름
	private int p_age; 	// 환자 나이
	private String p_gender; // 환자 성별
	private String p_rrn; 	// 환자 주민번호
	private String p_address; // 환자 주소
	private String[] p_phone;  // 환자 전화번호
	private Date p_firstdate; 	// 초진 날짜
	private Date p_lastdate; 	// 마지막 검진 날짜
	private String p_acc_yn;	// 접수 여부
	private String p_medical_yn; // 진료 여부
	private String p_admission_yn; // 입원 여부	
	
	private Date admission_date; // 입원 날짜
	private String doctor; // 담당의사
	
	public Patient() {}

	public Patient(int p_no, String p_name, int p_age, String p_gender, String p_rrn, String p_address,
			String[] p_phone, Date p_firstdate, Date p_lastdate, String p_acc_yn, String p_medical_yn,
			String p_admission_yn) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_rrn = p_rrn;
		this.p_address = p_address;
		this.p_phone = p_phone;
		this.p_firstdate = p_firstdate;
		this.p_lastdate = p_lastdate;
		this.p_acc_yn = p_acc_yn;
		this.p_medical_yn = p_medical_yn;
		this.p_admission_yn = p_admission_yn;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_age() {
		return p_age;
	}

	public void setP_age(int p_age) {
		this.p_age = p_age;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_rrn() {
		return p_rrn;
	}

	public void setP_rrn(String p_rrn) {
		this.p_rrn = p_rrn;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String[] getP_phone() {
		return p_phone;
	}

	public void setP_phone(String[] p_phone) {
		this.p_phone = p_phone;
	}

	public Date getP_firstdate() {
		return p_firstdate;
	}

	public void setP_firstdate(Date p_firstdate) {
		this.p_firstdate = p_firstdate;
	}

	public Date getP_lastdate() {
		return p_lastdate;
	}

	public void setP_lastdate(Date p_lastdate) {
		this.p_lastdate = p_lastdate;
	}

	public String getP_acc_yn() {
		return p_acc_yn;
	}

	public void setP_acc_yn(String p_acc_yn) {
		this.p_acc_yn = p_acc_yn;
	}

	public String getP_medical_yn() {
		return p_medical_yn;
	}

	public void setP_medical_yn(String p_medical_yn) {
		this.p_medical_yn = p_medical_yn;
	}

	public String getP_admission_yn() {
		return p_admission_yn;
	}

	public void setP_admission_yn(String p_admission_yn) {
		this.p_admission_yn = p_admission_yn;
	}	
	
	public Date getAdmission_date() {
		return admission_date;
	}

	public void setAdmission_date(Date admission_date) {
		this.admission_date = admission_date;
	}
	
	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	@Override
	public String toString() {
		return "Patient [p_no=" + p_no + ", p_name=" + p_name + ", p_age=" + p_age + ", p_gender=" + p_gender
				+ ", p_rrn=" + p_rrn + ", p_address=" + p_address + ", p_phone=" + Arrays.toString(p_phone)
				+ ", p_firstdate=" + p_firstdate + ", p_lastdate=" + p_lastdate
				+ ", p_acc_yn=" + p_acc_yn + ", p_medical_yn=" + p_medical_yn + ", p_admission_yn=" + p_admission_yn
				+ "]";
	}

}