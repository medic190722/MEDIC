package com.kh.medic.patient.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.medic.patient.model.service.PatientService;
import com.kh.medic.patient.model.vo.Patient;

@Controller
public class PatientController {

	@Autowired
	PatientService patientService;
	
	// 접수 페이지로 이동
	@RequestMapping("/patient/patientReceipt.do")
	public String outPatientRecipt() {
		
		return "patient/receipt";
	}
	
	// 환자 조회
	@RequestMapping("/patient/searchPatient.do")
	public String searchPatient(@RequestParam String p_name, SessionStatus sessionStatus, Model model) {
		
		System.out.println(p_name);
		
		List<Patient> patientList = new ArrayList<>();
		
		patientList = patientService.selectPatientList(p_name);
		
		for(Patient p : patientList) {
			int i = 0;
			System.out.println(i + "번째 " + p);
			i++;
		}
		
		model.addAttribute("patientList", patientList);
		
		return "patient/receipt";
		
	}
	
	// 환자 등록 페이지로 이동
	@RequestMapping("/patient/enroll.do")
	public String outPatientReceipt() {
		return "patient/enrollPatient";
	}
	
	// 환자 등록
	@RequestMapping("/patient/enrollPatient.do")
	public String firstOutPatientReceipt(Patient patient, Model model) {
		
		System.out.println("Patient 정보 확인 : " + patient);
		
		int result = patientService.insertPatient(patient);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) msg="환자접수 성공!";
		else msg = "환자접수 실패!";		
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/patient/outPatientReceipt.do")
	public String outPatientReceipt(Patient patient, Model model) {
		
		System.out.println("외래 접수 환자 정보 확인 : " + patient);
		
		int result = patientService.updateOutPatient(patient);
		
		String loc="/";
		String msg="";
		
		if(result > 0) msg="외래 환자 접수 성공!";
		else msg = "외래 환자 접수 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";		
	}
	
	
	/* @RequestMapping("/patient/updatePatientReceipt.do") */
	
}
