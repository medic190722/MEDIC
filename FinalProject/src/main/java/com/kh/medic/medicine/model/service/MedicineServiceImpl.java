package com.kh.medic.medicine.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.medicine.model.MedicineException;
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
		int result=0;
		
		result=medicineDao.insertMedicine(medicine);
		if(result==0) {
			throw new MedicineException();
		}
		
		return result;
	}

	@Override
	public MedicineVo selectOneMedicine(String medCode) {

		return medicineDao.selectOneMedicine(medCode);
	}

	@Override
	public int updateMedicine(MedicineVo medicine) {

		return medicineDao.updateMedicine(medicine);
	}

	@Override
	public int deleteMedicine(String medCode) {
			
		return medicineDao.deleteMedicine(medCode);
	}

}
