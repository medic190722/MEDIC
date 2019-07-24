package com.kh.medic.medicine.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.medicine.model.dao.MedicineDao;
import com.kh.medic.medicine.model.vo.MedicineVo;

@Service
public class MedicineServiceImpl implements MedicineService {

	@Autowired
	private MedicineDao medicineDao;
	
	@Override
	public List<Map<String, String>> selectMedicineList(int cPage, int limit) {

		return medicineDao.selectMedicineList(cPage, limit);
	}

	@Override
	public int selectMedicineTotalContents() {

		return medicineDao.selectMedicineTotalContents();
	}

	@Override
	public int insertMedicine(MedicineVo medicine) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MedicineVo selectOneMedicine(String medCode) {

		return medicineDao.selectOneMedicine(medCode);
	}

	@Override
	public int updateMedicine(MedicineVo medicine) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMedicine(String medCode) {
		// TODO Auto-generated method stub
		return 0;
	}

}
