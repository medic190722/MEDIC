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
	public int selectEmpsalTotalContents() {

		return empsalDao.selectEmpsalTotalContents();
	}

	@Override
	public EmpsalVo selectOneEmpsal(String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateEmpsal(EmpsalVo empsal) {
		// TODO Auto-generated method stub
		return 0;
	}

}
