package com.kh.medic.equipment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.equipment.model.vo.EquipmentVo;

@Repository
public class EquipmentDaoImpl implements EquipmentDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> selectEquipmentList(int cPage, int limit) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("equipment.selectEquipmentList",null,rows);
	}

	@Override
	public int selectEquipmentTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertEquipment(EquipmentVo equipment) {
		
		return sqlSession.insert("equipment.insertEquipment",equipment);
	}

	@Override
	public EquipmentVo selectOneEquipment(String eqCode) {

		return sqlSession.selectOne("equipment.selectOneEquipment",eqCode);
	}

	@Override
	public int updateEquipment(EquipmentVo equipment) {

		return sqlSession.update("equipment.updateEquipment",equipment);
	}

	@Override
	public int deleteEquipment(String eqCode) {
		// TODO Auto-generated method stub
		return sqlSession.delete("equipment.deleteEquipment",eqCode);
	}

}
