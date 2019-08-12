package com.kh.medic.acceptance.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Acceptance implements Serializable{
	
	private static final long serialVersionUID = 303L;
	
	private int acc_no; // 수납 코드
	private int p_no; 	// 환자 번호
	private String m_code;	// 진료 코드
	private int acc_amount; 	// 실납부 금액
	private int acc_total_amount; // 총납부 금액
	private int acc_unpaid_amount; //미납 금액
	private String acc_yn; 	// 납부 여부
	
	public Acceptance() {}

	
	
	public Acceptance(String m_code, int acc_amount, int acc_total_amount, int acc_unpaid_amount) {
		super();
		this.m_code = m_code;
		this.acc_amount = acc_amount;
		this.acc_total_amount = acc_total_amount;
		this.acc_unpaid_amount = acc_unpaid_amount;
	}



	public Acceptance(int acc_no, int p_no, String m_code, int acc_amount, int acc_total_amount, int acc_unpaid_amount,
			String acc_yn) {
		super();
		this.acc_no = acc_no;
		this.p_no = p_no;
		this.m_code = m_code;
		this.acc_amount = acc_amount;
		this.acc_total_amount = acc_total_amount;
		this.acc_unpaid_amount = acc_unpaid_amount;
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

	public int getAcc_amount() {
		return acc_amount;
	}

	public void setAcc_amount(int acc_amount) {
		this.acc_amount = acc_amount;
	}

	public int getAcc_total_amount() {
		return acc_total_amount;
	}

	public void setAcc_total_amount(int acc_total_amount) {
		this.acc_total_amount = acc_total_amount;
	}

	public int getAcc_unpaid_amount() {
		return acc_unpaid_amount;
	}

	public void setAcc_unpaid_amount(int acc_unpaid_amount) {
		this.acc_unpaid_amount = acc_unpaid_amount;
	}

	public String getAcc_yn() {
		return acc_yn;
	}

	public void setAcc_yn(String acc_yn) {
		this.acc_yn = acc_yn;
	}

	@Override
	public String toString() {
		return "Acceptance [acc_no=" + acc_no + ", p_no=" + p_no + ", m_code=" + m_code + ", acc_amount=" + acc_amount
				+ ", acc_total_amount=" + acc_total_amount + ", acc_unpaid_amount=" + acc_unpaid_amount + ", acc_yn="
				+ acc_yn + "]";
	}
	
	
}
