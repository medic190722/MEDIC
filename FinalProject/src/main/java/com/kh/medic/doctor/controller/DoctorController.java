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
			@RequestParam("medCode") String medCode,
			@RequestParam("medName") String medName,
			@RequestParam("oneDose") String oneDose,
			@RequestParam("oneDayDose") String oneDayDose,
			@RequestParam("totalDose") String totalDose,
			@RequestParam("etc") String etc,
			@RequestParam("medicalHistory") String medicalHistory,
			@RequestParam("selectMedical") String selectMedical
			) {
		
		String[] medCodeArr = medCode.split(",");
		String[] medNameArr = medName.split(",");
		String[] oneDoseArr = oneDose.split(",");
		String[] oneDayDoseArr = oneDayDose.split(",");
		String[] totalDoseArr = totalDose.split(",");
		String[] etcArr = etc.split(",");
		
		String mHistory = "";
		
		for(int i = 0; i < etcArr.length; i++) {
			mHistory += "1. 진료 내용 - " + medicalHistory + " 2. 검사 항목 - " + selectMedical + " 3. 처방약 - 약품 코드 : " + medCodeArr[i] + " , 약품 명 : " + medNameArr[i] + ", 1회 투약량 : " + oneDoseArr[i]
					 + " , 1일 투여횟수 : " + oneDayDoseArr[i] + " , 총 투약 일수 : " + totalDoseArr[i] + " , 용법 : "
					 + etcArr[i];
			if(i != etcArr.length-1) {
				mHistory += " / ";
			}
		}
		
		Medical medical = new Medical(mCode, pNo, pName, mDate, empNo, empName, mHistory);

		drService.medicalSave(medical);
		
		drService.medicalY(pNo);
		drService.insertACC(medical);
		
		return "index";
		
	}
	
	@RequestMapping("/doctor/admission.do")
	public String admission(
			@RequestParam("mCode") String mCode,
			@RequestParam("mDate") Date mDate,
			@RequestParam("pNo") int pNo,
			@RequestParam("pName") String pName,
			@RequestParam("empNo") int empNo,
			@RequestParam("empName") String empName,
			@RequestParam("medicalHistory") String medicalHistory,
			Model model) {
		
		Medical medical = new Medical(mCode, pNo, pName, mDate, empNo, empName, medicalHistory);
		
		drService.medicalSave(medical);
		
		drService.admissionY(pNo);
		drService.medicalY(pNo);
		
		model.addAttribute("msg", "입원 신청 완료");
		model.addAttribute("loc", "/doctor/prescription.do");
		
		return "common/msg";
		
	}
	
	@RequestMapping("/doctor/certificate.do")
	public String certificate(Model model) {
		
		return "doctor/certificate";
		
	}
	
	@RequestMapping("/doctor/certificateDetail.do")
	public String certificatedetail(@RequestParam("pName") String pName, @RequestParam("pRrn") String pRrn, Model model) {
		
		HashMap<String, String> hmap = new HashMap<>();
		
		hmap.put("pName", pName);
		hmap.put("pRrn", pRrn);
		
		Patient p = drService.patientOne(hmap);
		
		model.addAttribute("p", p);
		
		return "doctor/certificatedetail";
		
	}
	
}
