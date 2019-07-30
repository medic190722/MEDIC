package com.kh.medic.doctor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.patient.model.vo.Patient;

@Repository
public class DoctorDaoImpl implements DoctorDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Patient> patientList() {
		
		return session.selectList("Doctor.patientList");
		
	}

}
