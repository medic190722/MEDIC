package com.kh.medic.patient.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.patient.model.vo.Patient;

@Repository
public class PatientDaoImpl implements PatientDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertOutPatient(Patient patient) {
		return sqlSession.insert("patient.insertOutPatient", patient);
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
