package com.kh.medic.nurse.model.dao;

import java.util.List;
import java.util.Map;


public interface NurseDao {
	
	List<Map<String,String>> selectOrderList(int cPage,int limit);
	int selectOrderTotalContents();
	int updateOrderYn(int pNo);
}
