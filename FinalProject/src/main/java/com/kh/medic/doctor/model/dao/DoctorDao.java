package com.kh.medic.doctor.model.dao;

import java.util.List;

import com.kh.medic.patient.model.vo.Patient;

public interface DoctorDao {
	
	public List<Patient> patientList();

}
