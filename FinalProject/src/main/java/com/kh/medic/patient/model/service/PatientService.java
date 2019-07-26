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
	int updateOutPatient(int p_no);
	
	/**
	 * 재진 환자 접수용 메소드(입원)
	 * @param patient
	 * @return
	 */
	int updateInPatient(Patient patient);
	
	/**
	 * 정보 수정 환자 내용 조회
	 * @param p_no
	 * @return
	 */
	Patient selectUpdatePatient(int p_no);

	/**
	 * 환자 정보 수정용 메소드
	 * @param p_no
	 * @return
	 */
	int updatePatient(int p_no);
	
}
