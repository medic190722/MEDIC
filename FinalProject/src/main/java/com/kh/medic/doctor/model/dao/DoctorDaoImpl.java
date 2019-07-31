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

}
