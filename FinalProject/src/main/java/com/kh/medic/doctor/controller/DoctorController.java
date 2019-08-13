package com.kh.medic.doctor.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.medic.common.util.doctorUtils;
import com.kh.medic.doctor.model.service.DoctorService;
import com.kh.medic.doctor.model.vo.Medical;
import com.kh.medic.medicine.model.vo.MedicineVo;
import com.kh.medic.nurse.model.vo.Nurse;
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
			@RequestParam(value="medCode", required=false) String medCode,
			@RequestParam(value="medName", required=false) String medName,
			@RequestParam(value="oneDose", required=false) String oneDose,
			@RequestParam(value="oneDayDose", required=false) String oneDayDose,
			@RequestParam(value="totalDose", required=false) String totalDose,
			@RequestParam(value="etc", required=false) String etc,
			@RequestParam("mHistory") String mHistory,
			@RequestParam(value="mExamination", required=false) String mExamination,
			Model model
			) {
		
		String[] medCodeArr = medCode.split(",");
		String[] medNameArr = medName.split(",");
		String[] oneDoseArr = oneDose.split(",");
		String[] oneDayDoseArr = oneDayDose.split(",");
		String[] totalDoseArr = totalDose.split(",");
		String[] etcArr = etc.split(",");
		
		String mMedList = "";
		
		if(etc != "") {
			for(int i = 0; i < etcArr.length; i++) {
				mMedList += medCodeArr[i] + "/" + medNameArr[i] + "/" + oneDoseArr[i] + "/" + oneDayDoseArr[i]
						+ "/" + totalDoseArr[i] + "/" + etcArr[i];
				if(i != etcArr.length - 1) {
					mMedList += "<br>";
				}
			}
		}
		
		Medical medical = new Medical(mCode, pNo, pName, mDate, empNo, empName, mHistory, mExamination, mMedList);

		drService.medicalSave(medical);
		
		drService.medicalY(pNo);
		drService.insertACC(medical);
		
		model.addAttribute("msg", "진료 완료");
		model.addAttribute("loc", "/doctor/prescription.do");
		
		return "common/msg";
		
	}
	
	@RequestMapping("/doctor/admission.do")
	public String admission(
			@RequestParam("mCode") String mCode,
			@RequestParam("mDate") Date mDate,
			@RequestParam("pNo") int pNo,
			@RequestParam("pName") String pName,
			@RequestParam("empNo") int empNo,
			@RequestParam("empName") String empName,
			@RequestParam("mHistory") String mHistory,
			Model model) {
		
		Medical medical = new Medical(mCode, pNo, pName, mDate, empNo, empName, mHistory);
		
		drService.admissionMedicalSave(medical);
		
		drService.admissionY(pNo);
		drService.medicalY(pNo);
		
		model.addAttribute("msg", "입원 신청 완료");
		model.addAttribute("loc", "/doctor/prescription.do");
		
		return "common/msg";
		
	}
	
	@RequestMapping("/doctor/certificate.do")
	public String certificate() {
		
		return "doctor/certificate";
		
	}
	
	@RequestMapping("/doctor/certificateDetail.do")
	public String certificatedetail(@RequestParam("pNo") int pNo, Model model) {
		
		Patient p = drService.patientOne(pNo);
		
		model.addAttribute("p", p);
		
		return "doctor/certificatedetail";
		
	}
	
	@RequestMapping("/doctor/patientSearch.do")
	@ResponseBody
	public List<Patient> patientSearch(@RequestParam("pName") String pName) {
		
		String name = "%" + pName + "%";
		
		List<Patient> pList = drService.patientSearch(name);
		
		return pList;
		
	}
	
	@RequestMapping("/doctor/myPatientCare.do")
	public String myFatientCare(@RequestParam("empNo") int empNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int limit = 10;
		
		int listCount = drService.myPatientCount(empNo);
		
		List<Patient> pList = drService.myPatientCareList(cPage, limit, empNo);
		
		String pageBar = doctorUtils.getPageBar(listCount, cPage, limit, "myPatientCare.do?empNo=" + empNo);
		
		model.addAttribute("totalContents", listCount).addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar);
		
		if(pList.size() == 0) {
			model.addAttribute("msg", "담당 환자가 없습니다.");
			model.addAttribute("loc", "/index.do");
			
			return "common/msg";
		} else {
			model.addAttribute("pList", pList);
			
			return "doctor/myPatientCare";
		}
		
	}
	
	@RequestMapping("/doctor/pMedicalList.do")
	public String pMedicalList(@RequestParam("pNo") int pNo, Model model) {
		
		List<Medical> mList = drService.pMedicalList(pNo);
		
		model.addAttribute("mList", mList);
		
		return "doctor/pMedicalList";
	}
	
	@RequestMapping("/doctor/myAdmissionCare.do")
	public String myAdmissionCare(@RequestParam("empNo") int empNo,
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int limit = 10;
		
		int listCount = drService.myAdmissionCount(empNo);
		
		List<Patient> pList = drService.myAdmissionCareList(cPage, limit, empNo);
		
		String pageBar = doctorUtils.getPageBar(listCount, cPage, limit, "myAdmissionCare.do?empNo=" + empNo);
		
		model.addAttribute("totalContents", listCount).addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar);
		
		if(pList.size() == 0) {
			model.addAttribute("msg", "담당 환자가 없습니다.");
			model.addAttribute("loc", "/index.do");
			
			return "common/msg";
		} else {
			model.addAttribute("pList", pList);
			
			return "doctor/myAdmissionCare";
		}
		
	}
	
	@RequestMapping("/doctor/doctorOrderSave.do")
	public String doctorOrderSave(
			@RequestParam("pNo") int pNo,
			@RequestParam("wardCode") int wardCode,
			@RequestParam("empNo") int empNo,
			@RequestParam("orderEx") String orderExamination,
			@RequestParam("drOrder") String doctorOrder,
			Model model) {
		
		Nurse order = new Nurse(pNo, wardCode, empNo, orderExamination, doctorOrder);
		
		drService.doctorOrderSave(order);
		
		model.addAttribute("msg", "전송 완료");
		model.addAttribute("loc", "/doctor/myAdmissionCare.do?empNo=" + empNo);
		
		return "common/msg";
		
	}
	
}
