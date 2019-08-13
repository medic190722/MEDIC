package com.kh.medic.doctor.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.doctor.model.dao.DoctorDao;
import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.nurse.model.vo.Nurse;
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
	public void admissionY(int pNo) {
		
		drDao.admissionY(pNo);
		
	}
	
	@Override
	public void insertACC(Medical medical) {
		
		drDao.insertACC(medical);
		
	}
	
	@Override
	public void medicalY(int pNo) {
		
		drDao.medicalY(pNo);
		
	}
	
	@Override
	public Patient patientOne(int pNo) {
		
		return drDao.patientOne(pNo);
		
	}
	
	@Override
	public void admissionMedicalSave(Medical medical) {
		
		drDao.admissionMedicalSave(medical);
		
	}
	
	@Override
	public List<Patient> patientSearch(String pName) {
		
		return drDao.patientSearch(pName);
		
	}
	
	@Override
	public List<Patient> myPatientCareList(int cPage, int limit, int empNo) {
		
		return drDao.myPatientCareList(cPage, limit, empNo);
		
	}
	
	@Override
	public int myPatientCount(int empNo) {
		
		return drDao.myPatientCount(empNo);
		
	}
	
	@Override
	public List<Medical> pMedicalList(int pNo) {
		
		return drDao.pMedicalList(pNo);
		
	}
	
	@Override
	public int myAdmissionCount(int empNo) {
		
		return drDao.myAdmissionCount(empNo);
		
	}
	
	@Override
	public List<Patient> myAdmissionCareList(int cPage, int limit, int empNo) {
		
		return drDao.myAdmissionCareList(cPage, limit, empNo);
		
	}
	
	@Override
	public void doctorOrderSave(Nurse order) {
		
		drDao.doctorOrderSave(order);
		
	}
	
}
