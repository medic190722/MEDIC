package com.kh.medic.patient.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.patient.model.vo.Patient;

public interface PatientService {
	
	/**
	 * 환자등록용 메소드
	 * @param patient
	 * @return
	 */
	int insertPatient(Patient patient);
	
	/**
	 * 환자 조회용 메소드
	 * @return
	 */
	List<Patient> selectPatientList(String p_name);
	
	/**
	 * 재진 환자 접수용 메소드(외래)
	 * @param patient
	 * @return
	 */
	int updateOutPatient(Patient patient);
	
	/**
	 * 재진 환자 접수용 메소드(입원)
	 * @param patient
	 * @return
	 */
	int updateInPatient(Patient patient);
	
	
}
