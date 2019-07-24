package com.kh.medic.patient.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.patient.model.dao.PatientDao;
import com.kh.medic.patient.model.vo.Patient;

@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	PatientDao patientDao;
	
	@Override
	public int insertOutPatient(Patient patient) {
		return patientDao.insertOutPatient(patient);
	}

	@Override
	public int insertInpatient(Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Patient selectPatient(String p_name, String p_rrn) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Patient> selectPatientList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOutPatient(Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInPatient(Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}

}
