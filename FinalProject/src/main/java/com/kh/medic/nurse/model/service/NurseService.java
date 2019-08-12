package com.kh.medic.nurse.model.service;

import java.util.List;
import java.util.Map;

public interface NurseService {
	List<Map<String,String>> selectOrderList(int cPage,int limit);
	int selectOrderTotalContents();
	int updateOrderYn(int pNo);
}
