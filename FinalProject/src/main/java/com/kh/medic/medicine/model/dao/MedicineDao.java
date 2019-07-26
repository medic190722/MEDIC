package com.kh.medic.medicine.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.medicine.model.vo.MedicineVo;

public interface MedicineDao {

	List<Map<String,String>> selectMedicineList(int cPage,int limit);
	
	int selectMedicineTotalContents();
	
	int insertMedicine(MedicineVo medicine);
	
	MedicineVo selectOneMedicine(String medCode);
	
	int updateMedicine(MedicineVo medicine);
	
	int deleteMedicine(String medCode);

	
	
	
	
	
}
