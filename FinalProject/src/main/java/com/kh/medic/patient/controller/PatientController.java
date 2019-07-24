package com.kh.medic.patient.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.medic.patient.model.service.PatientService;
import com.kh.medic.patient.model.vo.Patient;

@Controller
public class PatientController {

	@Autowired
	PatientService patientService;
	
	@RequestMapping("/patient/outPatientReceipt.do")
	public String outPatientRecipt() {
		
		return "patient/outPatientReceipt";
	}
	
	@RequestMapping("/patient/firstOutPatientReceipt.do")
	public String firstOutPatientReceipt(Patient patient, Model model) {
		
		System.out.println("OutPatient 확인 : " + patient);
		
		int result = patientService.insertOutPatient(patient);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) msg="환자접수 성공!";
		else msg = "환자접수 실패!";		
		
		return "index";
		
	}
	
	@RequestMapping("/patient/inPatientReceipt.do")
	public String inPatientRecipt() {
		return "patient/inPatientReceipt";
	}
	
	
	
	
}
