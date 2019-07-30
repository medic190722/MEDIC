package com.kh.medic.patient.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.patient.model.vo.Patient;
import com.kh.medic.patient.model.vo.Ward;

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
		return sqlSession.update("patient.inPatientReceipt", patient);
	}
	
	@Override
	public Patient selectPatient(int p_no) {
		return sqlSession.selectOne("patient.selectUpdatePatient", p_no);
	}

	@Override
	public int updatePatient(Patient patient) {
		return sqlSession.update("patient.updatePatient", patient);
	}

	@Override
	public List<Ward> selectWardList() {
		return sqlSession.selectList("patient.selectWardList");
	}

	@Override
	public List<Ward> selectWard() {
		return sqlSession.selectList("patient.selectWard");
	}

}
