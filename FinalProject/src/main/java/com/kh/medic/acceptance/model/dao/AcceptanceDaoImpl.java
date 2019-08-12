package com.kh.medic.acceptance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.acceptance.model.vo.Acceptance;
import com.kh.medic.patient.model.vo.Patient;

@Repository
public class AcceptanceDaoImpl implements AcceptanceDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Patient> selectPatient(String p_name) {
		return sqlSession.selectList("acceptance.selectPatient", p_name);
	}

	@Override
	public Patient selectPayPatient(String m_code) {
		return sqlSession.selectOne("acceptance.selectPayPatient", m_code);
	}

	@Override
	public int updateAcceptance(Acceptance acceptance) {
		return sqlSession.update("acceptance.updateAcceptance",acceptance);
	}

	@Override
	public int updatePatient(int p_no) {
		return sqlSession.update("acceptance.updatePatient", p_no);
	}

	@Override
	public int selectInjection(int p_no) {
		
		/*
		 * System.out.println(p_no); int result =
		 * sqlSession.selectOne("acceptance.selectInjection", p_no);
		 * System.out.println(result);
		 */
		
		return sqlSession.selectOne("acceptance.selectInjection", p_no);
	}

	@Override
	public int selectAnesthesia(int p_no) {
		return sqlSession.selectOne("acceptance.selectAnesthesia", p_no);
	}

	@Override
	public int selectTreatementAndSurgery(int p_no) {
		return sqlSession.selectOne("acceptance.selectTreatementAndSurgery", p_no);
	}

	@Override
	public int selectInpection(int p_no) {
		return sqlSession.selectOne("acceptance.selectInpection", p_no);
	}

	@Override
	public int selectImage(int p_no) {
		return sqlSession.selectOne("acceptance.selectImage", p_no);
	}

	@Override
	public int selectRadiation(int p_no) {
		return sqlSession.selectOne("acceptance.selectRadiation", p_no);
	}

	@Override
	public int selectTreatment(int p_no) {
		return sqlSession.selectOne("acceptance.selectTreatment", p_no);
	}

	@Override
	public int updateDischargeDate(int p_no) {
		return sqlSession.update("acceptance.updateDischargeDate", p_no);
	}

	@Override
	public int updateAdmissionPatient(int p_no) {
		return sqlSession.update("acceptance.updateAdmissionPatient", p_no);
	}
	
}
