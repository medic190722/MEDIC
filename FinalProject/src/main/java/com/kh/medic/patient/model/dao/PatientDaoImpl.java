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
	public int updateOutPatient(int p_no) {
		return sqlSession.update("patient.outPatientReceipt", p_no);
	}

	@Override
	public int updateInPatient(Patient patient) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Patient selectUpdatePatient(int p_no) {
		return sqlSession.selectOne("patient.selectUpdatePatient", p_no);
	}

	@Override
	public int updatePatient(int p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
