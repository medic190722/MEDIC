package com.kh.medic.patient.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.patient.model.dao.PatientDao;
import com.kh.medic.patient.model.vo.Patient;
import com.kh.medic.patient.model.vo.Ward;

@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	PatientDao patientDao;
	
	@Override
	public int insertPatient(Patient patient) {
		return patientDao.insertPatient(patient);
	}

	@Override
	public List<Patient> selectPatientList(String p_name) {
		return patientDao.selectPatientList(p_name);
	}

	@Override
	public int updateOutPatient(int p_no) {
		return patientDao.updateOutPatient(p_no);
	}

	@Override
	public int updateInPatient(Patient patient) {
		return patientDao.updateInPatient(patient);
	}
	
	@Override
	public Patient selectPatient(int p_no) {
		return patientDao.selectPatient(p_no);
	}

	@Override
	public int updatePatient(Patient patient) {
		return patientDao.updatePatient(patient);
	}

	@Override
	public List<Ward> selectWardList() {
		return patientDao.selectWardList();
	}

	@Override
	public List<Ward> selectWard() {
		return patientDao.selectWard();
	}

	@Override
	public List<Patient> selectWardPatientList(int ward_code) {
		return patientDao.selectWardPatientList(ward_code);
	}


}
