package com.kh.medic.nurse.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.nurse.model.vo.Nurse;


public interface NurseDao {
	
	List<Map<String,String>> selectOrderList(int cPage,int limit);
	int selectOrderTotalContents();
	int updateOrderYn(Nurse nurse);
}
