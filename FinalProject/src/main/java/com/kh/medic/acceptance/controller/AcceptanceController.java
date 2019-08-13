package com.kh.medic.acceptance.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.medic.acceptance.model.service.AcceptanceService;
import com.kh.medic.acceptance.model.vo.Acceptance;
import com.kh.medic.patient.model.vo.Patient;

@Controller
public class AcceptanceController {

	@Autowired
	AcceptanceService acceptanceService;

	// 수납 환자 조회창
	@RequestMapping("/acceptance/acceptanceSearch.do")
	public String acceptanceSearch() {

		return "acceptance/acceptanceSearch";
	}

	// 수납환자 조회
	@RequestMapping("/acceptance/patientSearch.do")
	public String patientSearch(@RequestParam String p_name, Model model) {

		List<Patient> patientList = new ArrayList<>();

		patientList = acceptanceService.selectPatient(p_name);

		model.addAttribute("patientList", patientList);

		return "acceptance/acceptanceSearch";

	}

	// 환자의 검사내역 조회해서 값 넘기기
	@RequestMapping("/acceptance/patientAcceptanceInsert.do")
	public ModelAndView patientAcceptanceInsert(@RequestParam String m_code) {

		ModelAndView mv = new ModelAndView();

		Patient patient = new Patient();

		patient = acceptanceService.selectPayPatient(m_code);
		
		int Cash = 0;
		int Card = 0;
		int acc_amount = 0;
		int injection_count = 0; // 주사 투여 횟수
		int anesthesia_count = 0; // 마취 횟수
		int treatmentAndSurgery_count = 0; // 처치 및 수술 횟수
		int inspection_count = 0; // 혈액 검사 횟수
		int image_count = 0; // 영상 진단 횟수
		int radiation_count = 0; // 방사선 진단 횟수
		int treatment_count = 0; // 물리 치료 횟수
		
		List<String> examination = new ArrayList<>();

		System.out.println("수납 환자 정보 조회 : " + patient);
		System.out.println("환자의 입원여부 조회 : " + patient.getP_admission_yn());
		
		if (patient.getP_admission_yn().equals("N")) {
			System.out.println("입원안했어!");
			if (patient.getM_examination() != null) {
				String[] examination_Array = patient.getM_examination().split(",");
				for (int i = 0; i < examination_Array.length; i++) {
					examination.add(examination_Array[i]);
				}
			}

			if (patient != null) {
				
				System.out.println(examination.size());
				for (String s : examination) {
					System.out.println(s);
				}

				mv.addObject("patient", patient);
				mv.addObject("examination", examination);
				System.out.println(examination);
				mv.addObject("Cash", Cash);
				mv.addObject("Card", Card);
				mv.addObject("acc_amount", acc_amount);
				mv.setViewName("acceptance/acceptanceView");

			} else {
				mv.setViewName("acceptance/acceptanceSearch");
			}
		} else /* if(patient.getP_admission_yn().equals("Y")) */ {
			
			injection_count = acceptanceService.selectInjection(patient.getP_no());
			anesthesia_count = acceptanceService.selectAnesthesia(patient.getP_no());
			treatmentAndSurgery_count = acceptanceService.selectTreatementAndSurgery(patient.getP_no());
			inspection_count = acceptanceService.selectInpection(patient.getP_no());
			image_count = acceptanceService.selectImage(patient.getP_no());
			radiation_count = acceptanceService.selectRadiation(patient.getP_no());
			treatment_count = acceptanceService.selectTreatment(patient.getP_no());
			System.out.println("환자 번호 : " + patient.getP_no());
			System.out.println("select 값 조회 ");
			System.out.println("injection_count : " + injection_count);
			System.out.println("anesthesia_count : " + anesthesia_count);
			System.out.println("treatmentAndSurgery_count : " + treatmentAndSurgery_count);
			System.out.println("inspection_count : " + inspection_count);
			System.out.println("image_count : " + image_count);
			System.out.println("radiation_count : " + radiation_count);
			System.out.println("treatment_count : " + treatment_count);
			
			mv.addObject("injection_count", injection_count);
			mv.addObject("anesthesia_count", anesthesia_count);
			mv.addObject("treatmentAndSurgery_count", treatmentAndSurgery_count);
			mv.addObject("inspection_count", inspection_count);
			mv.addObject("image_count", image_count);
			mv.addObject("radiation_count", radiation_count);
			mv.addObject("treatment_count", treatment_count);
			mv.addObject("patient", patient);
			mv.addObject("Cash", Cash);
			mv.addObject("Card", Card);
			mv.addObject("acc_amount", acc_amount);
			mv.setViewName("acceptance/acceptanceView");
		}
		
		return mv;
	}

	// 수납 금액 받아서 수납 성공시키기
	@RequestMapping("/acceptance/acceptanceView.do")
	public String acceptance(@RequestParam int acc_amount, @RequestParam int acc_total_amount,
			@RequestParam String m_code, @RequestParam int p_no, @RequestParam int Cash, @RequestParam int Card,
			@RequestParam String p_admission_yn,
			Model model) {

		System.out.println("받아온 정보 확인 - 실납부금액 : " + acc_amount + "총납부금액 :" + acc_total_amount + "미납금액 : "
				+ (acc_total_amount - acc_amount) + "진료코드 :" + m_code + "환자번호  :" + p_no);

		int acc_unpaid_amount = acc_total_amount - acc_amount;

		Acceptance acceptance = new Acceptance(m_code, acc_amount, acc_total_amount, acc_unpaid_amount);

		int result = acceptanceService.updateAcceptance(acceptance);
		int result1 = 0;

		if(p_admission_yn.equals("Y")) {
			int dischargeDate = acceptanceService.updateDischargeDate(p_no);
			int admissionPatient = acceptanceService.updateAdmissionPatient(p_no);
		}
		
		String loc = "/";
		String msg = "";

		if (result > 0) {
			result1 = acceptanceService.updatePatient(p_no);
			if (result1 > 0) {
				System.out.println("환자 정보 업데이트 완료");
			}
			loc = "/acceptance/acceptanceEnd.do?m_code=" + m_code + "&cash=" + Cash + "&card=" + Card + "&acc_amount="
					+ acc_amount;
			msg = "수납 성공!";
		} else {
			loc = "/acceptance/patientAcceptanceInsert.do?m_code=" + m_code;
			msg = "수납 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";

	}

	// 영수증 화면에 값 띄우기
	@RequestMapping("/acceptance/acceptanceEnd.do")
	public ModelAndView acceptanceEnd(@RequestParam String m_code, @RequestParam int cash, @RequestParam int card,
			@RequestParam int acc_amount) {

		ModelAndView mv = new ModelAndView();

		Patient patient = new Patient();
		
		int injection_count = 0; // 주사 투여 횟수
		int anesthesia_count = 0; // 마취 횟수
		int treatmentAndSurgery_count = 0; // 처치 및 수술 횟수
		int inspection_count = 0; // 혈액 검사 횟수
		int image_count = 0; // 영상 진단 횟수
		int radiation_count = 0; // 방사선 진단 횟수
		int treatment_count = 0; // 물리 치료 횟수

		patient = acceptanceService.selectPayPatient(m_code);

		List<String> examination = new ArrayList<>();

		if(patient.getP_admission_yn().equals("N")) {
			if (patient.getM_examination() != null) {
				String[] examination_Array = patient.getM_examination().split(",");
				for (int i = 0; i < examination_Array.length; i++) {
					examination.add(examination_Array[i]);
				}
			}

			mv.addObject("patient", patient);
			mv.addObject("examination", examination);
			mv.addObject("Cash", cash);
			mv.addObject("Card", card);
			mv.addObject("acc_amount", acc_amount);
			mv.setViewName("acceptance/acceptanceView");
		} else {
			injection_count = acceptanceService.selectInjection(patient.getP_no());
			anesthesia_count = acceptanceService.selectAnesthesia(patient.getP_no());
			treatmentAndSurgery_count = acceptanceService.selectTreatementAndSurgery(patient.getP_no());
			inspection_count = acceptanceService.selectInpection(patient.getP_no());
			image_count = acceptanceService.selectImage(patient.getP_no());
			radiation_count = acceptanceService.selectRadiation(patient.getP_no());
			treatment_count = acceptanceService.selectTreatment(patient.getP_no());
			
			mv.addObject("injection_count", injection_count);
			mv.addObject("anesthesia_count", anesthesia_count);
			mv.addObject("treatmentAndSurgery_count", treatmentAndSurgery_count);
			mv.addObject("inspection_count", inspection_count);
			mv.addObject("image_count", image_count);
			mv.addObject("radiation_count", radiation_count);
			mv.addObject("treatment_count", treatment_count);
			mv.addObject("patient", patient);
			mv.addObject("Cash", cash);
			mv.addObject("Card", card);
			mv.addObject("acc_amount", acc_amount);
			mv.setViewName("acceptance/acceptanceView");
		}
		return mv;

	}

}
