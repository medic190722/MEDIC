package com.kh.medic.doctor.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.patient.model.vo.Patient;

public interface DoctorDao {
	
	public List<Patient> patientList();

	public List<MedicineVo> medicineList();
	
	public String medicalCode();

	public void medicalSave(Medical medical);

	public void admissionY(int pNo);

	public void insertACC(Medical medical);

	public void medicalY(int pNo);

	public List<Patient> patientListAll();

	public Patient patientOne(HashMap<String, String> hmap);

}
