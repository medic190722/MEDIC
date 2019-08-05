package com.kh.medic.acceptance.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.acceptance.model.service.AcceptanceService;
import com.kh.medic.patient.model.vo.Patient;

@Controller
public class AcceptanceController {

	@Autowired
	AcceptanceService acceptanceService;
	
	@RequestMapping("/acceptance/acceptanceSearch.do")
	public String acceptanceSearch() {
		
		return "acceptance/acceptanceSearch";
	}
	
	@RequestMapping("/acceptance/patientSearch.do")
	public String patientSearch(@RequestParam String p_name, Model model) {
		
		List<Patient> patientList = new ArrayList<>();
		
		patientList = acceptanceService.selectPatient(p_name);
		
		model.addAttribute("patientList", patientList);
		
		return "acceptance/acceptanceSearch";
		
	}
	
}
