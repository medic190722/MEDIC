package com.kh.medic.vacation.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.vacation.model.vo.VacationVo;

public interface VacationDao {

	List<Map<String,String>> selectVacationList(int cPage, int limit);
	
	List<Map<String,String>> selectVacationListSearch(int cPage, int limit,String vName);
	
	int selectVacationTotalContents();
	
	int insertVacation(VacationVo vacation);
	
	VacationVo selectOneVacation(String vCode);
	
	int updateVacationYes(VacationVo vacation);
	
	int updateVacationNo(VacationVo vacation);
	
	int deleteVacation(String vCode);
	
}
