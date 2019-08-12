package com.kh.medic.doctor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.patient.model.vo.Patient;

@Repository
public class DoctorDaoImpl implements DoctorDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Patient> patientList() {
		
		return session.selectList("Doctor.patientList");
		
	}
	
	@Override
	public List<MedicineVo> medicineList() {
		
		return session.selectList("Doctor.medicineList");
		
	}
	
	@Override
	public String medicalCode() {
		
		return session.selectOne("Doctor.medicalCode");
		
	}
	
	@Override
	public void medicalSave(Medical medical) {
		
		session.insert("Doctor.medicalSave", medical);
		
	}
	
	@Override
	public void admissionY(int pNo) {
		
		session.update("Doctor.admissionY", pNo);
		
	}
	
	@Override
	public void insertACC(Medical medical) {
		
		session.insert("Doctor.insertACC", medical);
		
	}
	
	@Override
	public void medicalY(int pNo) {
		
		session.update("Doctor.medicalY", pNo);
		
	}
	
	@Override
	public Patient patientOne(int pNo) {
		
		return session.selectOne("Doctor.patientOne", pNo);
		
	}
	
	@Override
	public void admissionMedicalSave(Medical medical) {
		
		session.insert("Doctor.admissionMedicalSave", medical);
		
	}
	
	@Override
	public List<Patient> patientSearch(String pName) {
		
		return session.selectList("Doctor.patientSearch", pName);
		
	}
	
	@Override
	public List<Medical> myFatientCareList(int empNo) {
		
		return session.selectList("Doctor.myFatientCareList", empNo);
		
	}
	
	@Override
	public int myFatientCount(int empNo) {
		
		return session.selectOne("Doctor.myFatientCount", empNo);
		
	}

}
