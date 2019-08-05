package com.kh.medic.acceptance.model.dao;

import java.util.List;

import com.kh.medic.patient.model.vo.Patient;

public interface AcceptanceDao {

	/**
	 * 납부 환자 조회용 메소드
	 * @param p_name 
	 * @return
	 */
	List<Patient> selectPatient(String p_name);

	/**
	 * 납부환자 한 명 조회용 메소드
	 * @param p_no
	 * @return
	 */
	Patient selectPayPatient(int p_no);

}
