package com.kh.medic.acceptance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.acceptance.model.dao.AcceptanceDao;
import com.kh.medic.patient.model.vo.Patient;

@Service
public class AcceptanceServiceImpl implements AcceptanceService {

	@Autowired
	AcceptanceDao acceptanceDao;

	@Override
	public List<Patient> selectPatient(String p_name) {
		return acceptanceDao.selectPatient(p_name);
	}
	
	
}
