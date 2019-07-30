package com.kh.medic.doctor.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.doctor.model.dao.DoctorDao;
import com.kh.medic.patient.model.vo.Patient;

@Service
public class DoctorServiceImpl implements DoctorService {
	
	@Autowired
	DoctorDao drDao;
	
	@Override
	public List<Patient> patientList() {
		
		return drDao.patientList();
		
	}

}
