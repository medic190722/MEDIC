package com.kh.medic.vacation.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.vacation.model.VacationException;
import com.kh.medic.vacation.model.dao.VacationDao;
import com.kh.medic.vacation.model.vo.VacationVo;

@Service
public class VacationServiceImpl implements VacationService {

	@Autowired
	private VacationDao vacationDao;
	
	@Override
	public List<Map<String, String>> selectVacationList(int cPage, int limit) {

		return vacationDao.selectVacationList(cPage, limit);
	}
	
	@Override
	public List<Map<String, String>> selectVacationListSearch(int cPage, int limit,String vName) {

		return vacationDao.selectVacationListSearch(cPage, limit,vName);
	}

	@Override
	public int selectVacationTotalContents() {

		return vacationDao.selectVacationTotalContents();
	}

	@Override
	public int insertVacation(VacationVo vacation) {
		int result=0;
		
		result=vacationDao.insertVacation(vacation);
		if(result==0) {
			throw new VacationException();
		}
		
		return result;
	}

	@Override
	public VacationVo selectOneVacation(String vCode) {

		return vacationDao.selectOneVacation(vCode);
	}

	@Override
	public int updateVacationYes(VacationVo vacation) {

		return vacationDao.updateVacationYes(vacation);
	}

	@Override
	public int deleteVacation(String vCode) {

		return vacationDao.deleteVacation(vCode);
	}

	@Override
	public int updateVacationNo(VacationVo vacation) {
		
		return vacationDao.updateVacationNo(vacation);
	}

}
