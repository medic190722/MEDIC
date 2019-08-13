package com.kh.medic.doctor.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.nurse.model.vo.Nurse;
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
	public List<Patient> myPatientCareList(int cPage, int limit, int empNo) {
		
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		
		return session.selectList("Doctor.myPatientCareList", empNo, rows);
		
	}
	
	@Override
	public int myPatientCount(int empNo) {
		
		return session.selectOne("Doctor.myPatientCount", empNo);
		
	}
	
	@Override
	public List<Medical> pMedicalList(int pNo) {
		
		return session.selectList("Doctor.pMedicalList", pNo);
		
	}
	
	@Override
	public int myAdmissionCount(int empNo) {
		
		return session.selectOne("Doctor.myAdmissionCount", empNo);
		
	}
	
	@Override
	public List<Patient> myAdmissionCareList(int cPage, int limit, int empNo) {
		
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		
		return session.selectList("Doctor.myAdmissionCareList", empNo, rows);
		
	}
	
	@Override
	public void doctorOrderSave(Nurse order) {
		
		session.insert("Doctor.doctorOrderSave", order);
		
	}

}
