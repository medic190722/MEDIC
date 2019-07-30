package com.kh.medic.equipment.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.equipment.model.vo.EquipmentVo;

public interface EquipmentDao {


	List<Map<String,String>> selectEquipmentList(int cPage,int limit);
	
	List<Map<String,String>> selectEquipmentListSearch(int cPage,int limit,String eqName);
	
	int selectEquipmentTotalContents();
	
	int insertEquipment(EquipmentVo equipment);
	
	EquipmentVo selectOneEquipment(String eqCode);
	
	int updateEquipment(EquipmentVo equipment);
	
	int deleteEquipment(String eqCode);
	
}
