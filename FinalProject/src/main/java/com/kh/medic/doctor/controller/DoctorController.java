package com.kh.medic.doctor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.doctor.model.service.DoctorService;
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
	public String prescriptionDetail(@RequestParam int pNo, @RequestParam String pName, Model model) {
		
		System.out.println(pNo);
		System.out.println(pName);
		model.addAttribute("pNo", pNo);
		model.addAttribute("pName", pName);
		
		return "doctor/prescriptionDetail";
				
	}
	
	
}
