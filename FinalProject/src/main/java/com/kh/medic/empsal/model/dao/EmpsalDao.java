package com.kh.medic.empsal.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.empsal.model.vo.EmpsalVo;

public interface EmpsalDao {
	List<Map<String, String>> selectEmpsalList(int cPage, int limit);

	int selectEmpsalTotalContents();

	EmpsalVo selectOneEmpsal(String empNo);

	int updateEmpsal(EmpsalVo empsal);
}
