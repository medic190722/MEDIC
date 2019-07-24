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
	private String p_admission_yn; // 입원 여부
	private int ward_code; // 병실 번호
	private Date p_admission_date; // 입원 날짜
	private Date p_discharge_date; // 퇴원 날짜
	private Date p_firstdate; 	// 초진 날짜
	private Date p_lastdate; 	// 마지막 검진 날짜
	
	public Patient() {}

	// 외래진료 환자 접수(초진)
	public Patient(int p_no, String p_name, int p_age, String p_gender, String p_rrn, String p_address, String[] p_phone,
			String p_admission_yn, Date p_firstdate) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_rrn = p_rrn;
		this.p_address = p_address;
		this.p_phone = p_phone;
		this.p_admission_yn = p_admission_yn;
		this.p_firstdate = p_firstdate;
	}

	// 외래진료 환자 접수(재진)
	public Patient(int p_no, String p_name, int p_age, String p_address, String[] p_phone, String p_admission_yn,
			Date p_lastdate) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_address = p_address;
		this.p_phone = p_phone;
		this.p_admission_yn = p_admission_yn;
		this.p_lastdate = p_lastdate;
	}

	// 입원진료 환자 접수(초진)
	public Patient(int p_no, String p_name, int p_age, String p_gender, String p_rrn, String p_address, String[] p_phone,
			String p_admission_yn, int ward_code, Date p_admission_date, Date p_firstdate) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_rrn = p_rrn;
		this.p_address = p_address;
		this.p_phone = p_phone;
		this.p_admission_yn = p_admission_yn;
		this.ward_code = ward_code;
		this.p_admission_date = p_admission_date;
		this.p_firstdate = p_firstdate;
	}

	// 입원진료 환자 접수(재진)
	public Patient(int p_no, String p_name, int p_age, String p_address, String[] p_phone, String p_admission_yn,
			int ward_code, Date p_admission_date, Date p_lastdate) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_address = p_address;
		this.p_phone = p_phone;
		this.p_admission_yn = p_admission_yn;
		this.ward_code = ward_code;
		this.p_admission_date = p_admission_date;
		this.p_lastdate = p_lastdate;
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

	public String getP_admission_yn() {
		return p_admission_yn;
	}

	public void setP_admission_yn(String p_admission_yn) {
		this.p_admission_yn = p_admission_yn;
	}

	public int getWard_code() {
		return ward_code;
	}

	public void setWard_code(int ward_code) {
		this.ward_code = ward_code;
	}

	public Date getP_admission_date() {
		return p_admission_date;
	}

	public void setP_admission_date(Date p_admission_date) {
		this.p_admission_date = p_admission_date;
	}

	public Date getP_discharge_date() {
		return p_discharge_date;
	}

	public void setP_discharge_date(Date p_discharge_date) {
		this.p_discharge_date = p_discharge_date;
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

	@Override
	public String toString() {
		return "Patient [p_no=" + p_no + ", p_name=" + p_name + ", p_age=" + p_age + ", p_gender=" + p_gender
				+ ", p_rrn=" + p_rrn + ", p_address=" + p_address + ", p_phone=" + Arrays.toString(p_phone)
				+ ", p_admission_yn=" + p_admission_yn + ", ward_code=" + ward_code + ", p_admission_date="
				+ p_admission_date + ", p_discharge_date=" + p_discharge_date + ", p_firstdate=" + p_firstdate
				+ ", p_lastdate=" + p_lastdate + "]";
	}

	
	
	
}
