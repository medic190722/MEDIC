package com.kh.medic.acceptance.model.service;

import java.util.List;

import com.kh.medic.patient.model.vo.Patient;

public interface AcceptanceService {

	/**
	 * 납부환자 조회용 메소드
	 * @param p_name 
	 * @return
	 */
	List<Patient> selectPatient(String p_name);

	/**
	 * 납부할 환자 한 명 조회용 메소드
	 * @return
	 */
	Patient selectPayPatient(int p_no);

	
}
