package com.kh.medic.patient.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.patient.model.vo.Admission;
import com.kh.medic.patient.model.vo.Patient;
import com.kh.medic.patient.model.vo.Ward;

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
	 * @param p_no
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
	 * 환자 한 명 조회
	 * @param p_no
	 * @return
	 */
	Patient selectPatient(int p_no);

	/**
	 * 환자 정보 수정용 메소드
	 * @param patient
	 * @return
	 */
	int updatePatient(Patient patient);

	/**
	 * 병실 조회용 메소드(수용인원)
	 * @return
	 */
	List<Ward> selectWardList();
	
	/**
	 * 병실 조회용 메소드(수용가능인원)
	 * @return
	 */
	List<Ward> selectWard();

	/**
	 * 병동 입원환자 조회용 메소드
	 * @param ward_code
	 * @return
	 */
	List<Patient> selectWardPatientList(int ward_code);

	/**
	 * 환자 입원 등록 메소드
	 * @param admission
	 * @return
	 */
	int insertAdmission(Admission admission);
	
	
	
}
