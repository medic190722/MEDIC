package com.kh.medic.patient.model.dao;

import java.util.List;

import com.kh.medic.patient.model.vo.Patient;

public interface PatientDao {

	/**
	 * 초진 환자 접수용 메소드(외래)
	 * @param patient
	 * @return
	 */
	int insertOutPatient(Patient patient);
	
	/**
	 * 초진 환자 접수용 메소드(입원)
	 * @param patient
	 * @return
	 */
	int insertInpatient(Patient patient);
	
	/**
	 * 환자 한 명 조회용 메소드
	 * @param p_name
	 * @param p_rrn
	 * @return
	 */
	Patient selectPatient(String p_name, String p_rrn);
	
	/**
	 * 환자 조회용 메소드
	 * @return
	 */
	List<Patient> selectPatientList();
	
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
