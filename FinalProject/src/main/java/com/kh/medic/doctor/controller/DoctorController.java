package com.kh.medic.doctor.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.doctor.model.service.DoctorService;
import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.patient.model.vo.Patient;

@Controller
public class DoctorController {
	
	@Autowired
	DoctorService drService;
	
	@RequestMapping("/doctor/prescription.do")
	public String prescription(Model model) {
		
		List<Patient> pList = drService.patientList();
		
		model.addAttribute("pList", pList);
		
		return "doctor/prescription";
		
	}
	
	@RequestMapping("/doctor/prescriptionDetail.do")
	public String prescriptionDetail(@RequestParam("pNo") int pNo, @RequestParam("pName") String pName, Model model) {
		
		model.addAttribute("pNo", pNo);
		model.addAttribute("pName", pName);
		
		List<MedicineVo> medList = drService.medicineList();
		
		model.addAttribute("medList", medList);
		
		String M_Code = drService.medicalCode();
		
		model.addAttribute("M_Code", M_Code);
		
		return "doctor/prescriptionDetail";
				
	}
	
	@RequestMapping("/doctor/prescriptionSave.do")
	public String prescriptionSave(
			@RequestParam("mCode") String mCode,
			@RequestParam("mDate") Date mDate,
			@RequestParam("pNo") int pNo,
			@RequestParam("pName") String pName,
			@RequestParam("empNo") int empNo,
			@RequestParam("empName") String empName,
			@RequestParam("admission") String admission,
			@RequestParam("medCode") String medCode,
			@RequestParam("medName") String medName,
			@RequestParam("oneDose") String oneDose,
			@RequestParam("oneDayDose") String oneDayDose,
			@RequestParam("totalDose") String totalDose,
			@RequestParam("etc") String etc
			) {
		
		String[] medCodeArr = medCode.split(",");
		String[] medNameArr = medName.split(",");
		String[] oneDoseArr = oneDose.split(",");
		String[] oneDayDoseArr = oneDayDose.split(",");
		String[] totalDoseArr = totalDose.split(",");
		String[] etcArr = etc.split(",");
		
		String mHistory = "";
		
		for(int i = 0; i < etcArr.length; i++) {
			mHistory += "약품 코드 : " + medCodeArr[i] + " , 약품 명 : " + medNameArr[i] + ", 1회 투약량 : " + oneDoseArr[i]
					 + " , 1일 투여횟수 : " + oneDayDoseArr[i] + " , 총 투약 일수 : " + totalDoseArr[i] + " , 용법 : "
					 + etcArr[i];
			if(i != etcArr.length-1) {
				mHistory += " / ";
			}
		}
		
		Medical medical = new Medical(mCode, pNo, pName, mDate, empNo, empName, mHistory);

		if(admission == "Y") {
			drService.admissionY();
		}

		drService.medicalSave(medical);
		
		drService.medicalY();
		drService.insertACC(medical);
		
		return "index";
		
	}
	
	@RequestMapping("/doctor/certificate.do")
	public String certificate() {
		
		return "doctor/certificate";
		
	}
	
}
