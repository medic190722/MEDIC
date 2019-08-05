package com.kh.medic.doctor.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.doctor.model.dao.DoctorDao;
import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.patient.model.vo.Patient;

@Service
public class DoctorServiceImpl implements DoctorService {
	
	@Autowired
	DoctorDao drDao;
	
	@Override
	public List<Patient> patientList() {
		
		return drDao.patientList();
		
	}
	
	@Override
	public List<MedicineVo> medicineList() {
		
		return drDao.medicineList();
		
	}
	
	@Override
	public String medicalCode() {
		
		return drDao.medicalCode();
		
	}
	
	@Override
	public void medicalSave(Medical medical) {
		
		drDao.medicalSave(medical);
		
	}
	
	@Override
	public void admissionY() {
		
		drDao.admissionY();
		
	}
	
	@Override
	public void insertACC(Medical medical) {
		
		drDao.insertACC(medical);
		
	}
	
	@Override
	public void medicalY() {
		
		drDao.medicalY();
		
	}

}
