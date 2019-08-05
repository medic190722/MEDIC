package com.kh.medic.acceptance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.patient.model.vo.Patient;

@Repository
public class AcceptanceDaoImpl implements AcceptanceDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Patient> selectPatient(String p_name) {
		return sqlSession.selectList("acceptance.selectPatient", p_name);
	}
	
}
