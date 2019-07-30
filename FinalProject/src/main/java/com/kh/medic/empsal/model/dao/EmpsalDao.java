package com.kh.medic.empsal.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.empsal.model.vo.EmpsalVo;

public interface EmpsalDao {
	List<Map<String, String>> selectEmpsalList(int cPage, int limit);
	
	List<Map<String, String>> selectEmpsalListSearch(int cPage, int limit,String empName);

	int selectEmpsalTotalContents();

	EmpsalVo selectOneEmpsal(String empNo);


	int updateEmpsal(int empNo, int salary);
}
