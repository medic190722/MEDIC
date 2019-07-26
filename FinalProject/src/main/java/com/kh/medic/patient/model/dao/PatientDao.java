package com.kh.medic.patient.model.dao;

import java.util.List;

import com.kh.medic.patient.model.vo.Patient;

public interface PatientDao {

	/**
	 * 환자 등록용 메소드
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
