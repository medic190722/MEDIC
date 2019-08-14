package com.kh.medic.nurse.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.nurse.model.dao.NurseDao;
import com.kh.medic.nurse.model.vo.Nurse;

@Service
public class NurseServiceImpl implements NurseService {
	
	@Autowired
	NurseDao nurseDao;
	
	@Override
	public List<Map<String, String>> selectOrderList(int cPage, int limit) {
		// TODO Auto-generated method stub
		return nurseDao.selectOrderList(cPage, limit);
	}

	@Override
	public int selectOrderTotalContents() {
		// TODO Auto-generated method stub
		return nurseDao.selectOrderTotalContents();
	}

	@Override
	public int updateOrderYn(Nurse nurse) {
		// TODO Auto-generated method stub
		return nurseDao.updateOrderYn(nurse);
	}

}
