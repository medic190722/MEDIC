package com.kh.medic.empsal.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.empsal.model.dao.EmpsalDao;
import com.kh.medic.empsal.model.vo.EmpsalVo;

@Service
public class EmpsalServiceImpl implements EmpsalService {

	@Autowired
	private EmpsalDao empsalDao;
	
	@Override
	public List<Map<String, String>> selectEmpsalList(int cPage, int limit) {

		return empsalDao.selectEmpsalList(cPage, limit);
	}
	
	@Override
	public List<Map<String, String>> selectEmpsalListSearch(int cPage, int limit,String empName) {

		return empsalDao.selectEmpsalListSearch(cPage, limit,empName);
	}

	@Override
	public int selectEmpsalTotalContents() {

		return empsalDao.selectEmpsalTotalContents();
	}

	@Override
	public EmpsalVo selectOneEmpsal(String empNo) {

		return empsalDao.selectOneEmpsal(empNo);
	}

	@Override
	public int updateEmpsal(int empNo,int salary) {

		return empsalDao.updateEmpsal(empNo,salary);
	}

}
