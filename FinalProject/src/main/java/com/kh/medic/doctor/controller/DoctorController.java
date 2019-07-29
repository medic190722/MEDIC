package com.kh.medic.doctor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DoctorController {
	
	@RequestMapping("/doctor/prescription.do")
	public String prescription() {
		
		return "doctor/prescription";
		
	}
	
	@RequestMapping("/doctor/prescriptionDetail.do")
	public String prescriptionDetail() {
		
		
		
		return "";
				
	}
	
	
}
