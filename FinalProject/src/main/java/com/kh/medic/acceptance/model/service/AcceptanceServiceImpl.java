package com.kh.medic.acceptance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.acceptance.model.dao.AcceptanceDao;
import com.kh.medic.acceptance.model.vo.Acceptance;
import com.kh.medic.patient.model.vo.Patient;

@Service
public class AcceptanceServiceImpl implements AcceptanceService {

	@Autowired
	AcceptanceDao acceptanceDao;

	@Override
	public List<Patient> selectPatient(String p_name) {
		return acceptanceDao.selectPatient(p_name);
	}

	@Override
	public Patient selectPayPatient(String m_code) {
		return acceptanceDao.selectPayPatient(m_code);
	}

	@Override
	public int updateAcceptance(Acceptance acceptance) {
		return acceptanceDao.updateAcceptance(acceptance);
	}

	@Override
	public int updatePatient(int p_no) {
		return acceptanceDao.updatePatient(p_no);
	}

	@Override
	public int selectInjection(int p_no) {
		return acceptanceDao.selectInjection(p_no);
	}

	@Override
	public int selectAnesthesia(int p_no) {
		return acceptanceDao.selectAnesthesia(p_no);
	}

	@Override
	public int selectTreatementAndSurgery(int p_no) {
		return acceptanceDao.selectTreatementAndSurgery(p_no);
	}

	@Override
	public int selectInpection(int p_no) {
		return acceptanceDao.selectInpection(p_no);
	}

	@Override
	public int selectImage(int p_no) {
		return acceptanceDao.selectImage(p_no);
	}

	@Override
	public int selectRadiation(int p_no) {
		return acceptanceDao.selectRadiation(p_no);
	}

	@Override
	public int selectTreatment(int p_no) {
		return acceptanceDao.selectTreatment(p_no);
	}

	@Override
	public int updateDischargeDate(int p_no) {
		return acceptanceDao.updateDischargeDate(p_no);
	}

	@Override
	public int updateAdmissionPatient(int p_no) {
		return acceptanceDao.updateAdmissionPatient(p_no);
	}
	
	
}
