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
import com.kh.medic.patient.model.vo.Ward;

@Controller
public class PatientController {

	@Autowired
	PatientService patientService;
	
	// 접수 페이지로 이동
	@RequestMapping("/patient/patientReceipt.do")
	public String outPatientRecipt() {
		
		return "patient/receipt";
	}
	
	// 환자 접수를 위해 환자 이름으로 검색하여 환자 조회
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
		
		String loc = "";
		
		if(result > 0) loc="patient/receipt";
		else loc="patient/enrollPatient";		
		
		return loc;
		
	}
	
	// 외래 환자 접수 성공
	@RequestMapping("/patient/outPatientReceipt.do")
	public String outPatientReceipt(@RequestParam int p_no,@RequestParam String p_name, Model model) {
		
		System.out.println("외래 접수  환자 이름: " + p_name + ", 외래 접수 환자 번호 : " + p_no);
		
		int result = patientService.updateOutPatient(p_no);
		
		String loc="/";
		String msg="";
		
		if(result > 0) {
			msg="외래 환자 접수 성공!"; 
			loc="/patient/patientReceiptSuccess.do?p_name="+p_name;
		}
		else {
			msg = "외래 환자 접수 실패!";
			loc="/patient/patientReceipt.do";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";		
	}
	
	// 외래 환자 접수(마지막 진료 날짜 업데이트)
	@RequestMapping("/patient/patientReceiptSuccess.do")
	public String patientReceiptSuccess(@RequestParam String p_name, Model model){
		
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
	
	// 환자 업데이트 수정 화면 띄우기
	 @RequestMapping("/patient/updatePatientView.do") 
	 public String updatePatientView(@RequestParam int p_no, Model model) {
 
		 System.out.println("수정할 환자 번호 : " + p_no);
	
		 Patient patient = new Patient();
	 
		 patient = patientService.selectPatient(p_no);
		 
		 String loc = "";
		 
		 if(patient != null) { 
			 loc = "patient/updatePatientView";
		 } else {
			 loc = "patient/receipt";
		 }
	
		 model.addAttribute("patient", patient); 
	 
		 return loc;
	 
	 }
	 
	 // 환자 정보 업데이트
	 @RequestMapping("/patient/updatePatient.do")
	 public String updatePatient(Patient patient, Model model) {
		 
		 int result = patientService.updatePatient(patient);
		 
		 String msg = "";
		 String loc = "/";
		 
		 if(result > 0) {
			 msg = "회원 정보 수정 성공!";
			 loc = "/patient/searchPatient.do?p_name="+patient.getP_name();
		 } else {
			 msg = "회원 정보 수정 실패!";
			 loc = "/patient/updatePatientView.do?p_no="+patient.getP_no();
			 
		 }
		 
		 model.addAttribute("loc", loc);
		 model.addAttribute("msg", msg);
		 
		 return "common/msg";
		 
	 }
	
	 // 병실 전체 조회
	 @RequestMapping("/patient/wardList.do")
	 public String wardList(Model model) {
		
		 List<Ward> wardList = new ArrayList<>();
		 
		 wardList = patientService.selectWardList();
		 
		 for(Ward w : wardList) {
				int i = 0;
				System.out.println(i+ " : " +w.getWard_code() + " " + w.getCapacity() + " " + w.getCur_capacity());
				i++;
			}
			
			model.addAttribute("wardList", wardList);
			
			return "patient/wardList";
		 
	 }
	 
	 // 입원할 환자의 이름과 번호를 받아 정보를 불러와 페이지로 보내기
	 @RequestMapping("/patient/inPatient.do")
	 public String inPatientEnroll(@RequestParam String p_name, @RequestParam int p_no, Model model) {
		 
		 Patient patient = new Patient();
		 
		 patient = patientService.selectPatient(p_no);
		 List<Ward> wardList = new ArrayList<>();
		 
		 wardList = patientService.selectWard();
		 String loc = "/";
		 
		 if(patient != null) {
			 loc = "patient/inPatientReceipt";
		 } else {
			 loc = "patient/searchPatient.do?p_name="+p_name;
		 }
		 
		 model.addAttribute("patient", patient);
		 model.addAttribute("wardList", wardList);
		 
		 return loc;
		 
	 }
	 
	 @RequestMapping("/patient/inPatientReceipt.do")
	 public String inPatientReceipt(Patient patient, Model model) {
		 
		 int result = patientService.updateInPatient(patient);
		 
		 String msg = "";
		 String loc = "/";
		 
		 if(result > 0) {
			 msg = "입원 접수 성공!";
			 loc = "/patient/patientReceipt.do";
		 } else {
			 msg = "입원 접수 실패!";
			 loc = "/patient/searchPatient.do?p_name="+patient.getP_name();
		 }
		 
		 model.addAttribute("msg", msg);
		 model.addAttribute("loc", loc);
		 
		 return "common/msg";
		 
	 }
	 
	/*
	 * @RequestMapping("/patient/updatePatientView1.do") public String
	 * updatePatientView1(@RequestParam int p_no, Model model) {
	 * 
	 * 
	 * Patient patient = new Patient();
	 * 
	 * patient = patientService.selectUpdatePatient(p_no);
	 * 
	 * model.addAttribute("patient", patient);
	 * 
	 * return "patient/updatePatientView"; }
	 * 
	 * @RequestMapping("/patient/updatePatientView.do") public String
	 * updatePatientView(@RequestParam int p_no, Model model) {
	 * 
	 * System.out.println("수정할 환자 번호 : " + p_no);
	 * 
	 * Patient patient = new Patient();
	 * 
	 * patient = patientService.selectUpdatePatient(p_no);
	 * 
	 * String msg = ""; String loc = "/";
	 * 
	 * if(patient != null) { msg = "환자 정보 불러오기 성공!"; loc =
	 * "/patient/updatePatientView1.do?p_no="+p_no; } else { loc = "/"; msg =
	 * "환자 정보 불러오기 실패!"; }
	 * 
	 * model.addAttribute("patient", patient); model.addAttribute("loc", loc);
	 * model.addAttribute("msg", msg);
	 * 
	 * return "common/msg";
	 * 
	 * }
	 */
	
	
}
