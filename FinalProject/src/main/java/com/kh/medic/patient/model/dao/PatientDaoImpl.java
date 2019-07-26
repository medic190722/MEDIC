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
	public int insertPatient(Patient patient) {
		return sqlSession.insert("patient.insertPatient", patient);
	}

	@Override
	public List<Patient> selectPatientList(String p_name) {
		return sqlSession.selectList("patient.selectPatientList", p_name);
	}

	@Override
	public int updateOutPatient(Patient patient) {
		return sqlSession.update("patient.outPatientReceipt", patient);
	}

	@Override
	public int updateInPatient(Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}

}
