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

	
}
