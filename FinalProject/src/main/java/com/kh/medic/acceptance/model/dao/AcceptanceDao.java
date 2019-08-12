package com.kh.medic.acceptance.model.dao;

import java.util.List;

import com.kh.medic.acceptance.model.vo.Acceptance;
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
	Patient selectPayPatient(String m_code);

	/**
	 * 납부 금액을 업데이트하는 메소드
	 * @param acceptance
	 * @return
	 */
	int updateAcceptance(Acceptance acceptance);

	/**
	 * 납부 완료 시 환자 정보 업데이트
	 * @param p_no
	 * @return
	 */
	int updatePatient(int p_no);
	
	/**
	 * 입원 환자의 주사 투여 횟수
	 * @param p_no
	 * @return
	 */
	int selectInjection(int p_no);

	/**
	 * 입원 환자의 마취 횟수
	 * @param p_no
	 * @return
	 */
	int selectAnesthesia(int p_no);

	/**
	 * 입원환자의 처치 및 수술 횟수
	 * @param p_no
	 * @return
	 */
	int selectTreatementAndSurgery(int p_no);

	/**
	 * 입원환자의 혈액 검사 횟수
	 * @param p_no
	 * @return
	 */
	int selectInpection(int p_no);

	/**
	 * 입원 환자의 영상 검사 횟수
	 * @param p_no
	 * @return
	 */
	int selectImage(int p_no);

	/**
	 * 입원 환자의 방사선 진단 횟수
	 * @param p_no
	 * @return
	 */
	int selectRadiation(int p_no);

	/**
	 * 입원 환자의 물리 치료 횟수
	 * @param p_no
	 * @return
	 */
	int selectTreatment(int p_no);
	
	/**
	 * 입원환자의 퇴원 날짜와 퇴원여부를 수정
	 * @param p_no
	 * @return
	 */
	int updateDischargeDate(int p_no);

	/**
	 * 환자의 퇴원 여부 수정
	 * @param p_no
	 * @return
	 */
	int updateAdmissionPatient(int p_no);


}
