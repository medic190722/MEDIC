package com.kh.medic.acceptance.model.vo;

import java.io.Serializable;

public class Acceptance implements Serializable{
	
	private static final long serialVersionUID = 303L;
	
	private int acc_no; // 수납 코드
	private int p_no; 	// 환자 번호
	private String m_code;	// 진료 코드
	private int acc_mount; 	// 납부 금액
	private String acc_yn; 	// 납부 여부
	
	public Acceptance() {}

	public Acceptance(int acc_no, int p_no, String m_code, int acc_mount, String acc_yn) {
		super();
		this.acc_no = acc_no;
		this.p_no = p_no;
		this.m_code = m_code;
		this.acc_mount = acc_mount;
		this.acc_yn = acc_yn;
	}

	public int getAcc_no() {
		return acc_no;
	}

	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public int getAcc_mount() {
		return acc_mount;
	}

	public void setAcc_mount(int acc_mount) {
		this.acc_mount = acc_mount;
	}

	public String getAcc_yn() {
		return acc_yn;
	}

	public void setAcc_yn(String acc_yn) {
		this.acc_yn = acc_yn;
	}

	@Override
	public String toString() {
		return "Acceptance [acc_no=" + acc_no + ", p_no=" + p_no + ", m_code=" + m_code + ", acc_mount=" + acc_mount
				+ ", acc_yn=" + acc_yn + "]";
	}
	
	
	
}
