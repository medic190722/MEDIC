package com.kh.medic.equipment.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.equipment.model.dao.EquipmentDao;
import com.kh.medic.equipment.model.vo.EquipmentVo;

@Service
public class EquipmentServiceImpl implements EquipmentService {

	
	@Autowired
	private EquipmentDao equipmentDao;
	
	
	@Override
	public List<Map<String, String>> selectEquipmentList(int cPage, int limit) {

		return equipmentDao.selectEquipmentList(cPage, limit);
	}

	@Override
	public int selectEquipmentTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertEquipment(EquipmentVo equipment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EquipmentVo selectOneEquipment(String eqCode) {

		return equipmentDao.selectOneEquipment(eqCode);
	}

	@Override
	public int updateEquipment(EquipmentVo equipment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEquipment(String edCode) {
		// TODO Auto-generated method stub
		return 0;
	}

}
