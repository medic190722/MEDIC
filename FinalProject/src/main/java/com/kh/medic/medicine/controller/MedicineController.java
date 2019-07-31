package com.kh.medic.medicine.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.util.Utils;
import com.kh.medic.medicine.model.service.MedicineService;
import com.kh.medic.medicine.model.vo.MedicineVo;

@Controller
public class MedicineController {

	@Autowired
	MedicineService medicineService;

	@RequestMapping("/medicine/medicineList.do")
	public String selectMedicineList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {
		int limit = 10; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(medicineService.selectMedicineList(cPage, limit));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = medicineService.selectMedicineTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "medicineList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "medicine/medicineList";
	}

	@RequestMapping("/medicine/searchMedicine.do")
	public String selectMedicineListSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model,String medName) {
		int limit = 10; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(medicineService.selectMedicineListSearch(cPage, limit,medName));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = medicineService.selectMedicineTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "medicineList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "medicine/medicineList";
	}

	@RequestMapping("/medicine/medicineView.do")
	public String selectOneMedicine(@RequestParam String no, Model model) {

		model.addAttribute("medicine", medicineService.selectOneMedicine(no));

		return "/medicine/medicineView";
	}

	@RequestMapping("/medicine/medicineForm.do")
	public void medicineForm() {

	}

	@RequestMapping("/medicine/medicineFormEnd.do")
	public String insertMedicine(MedicineVo medicine, Model model) {

		int result;
		System.out.println("ddd" + medicine);
		System.out.println("ccc" + medicine.getMedCode());
		result = medicineService.insertMedicine(medicine);

		String loc = "/medicine/medicineList.do";
		String msg = "";

		if (result > 0) {
			msg = "추가 완료!";
		} else {
			msg = "추가 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";

	}

	@RequestMapping("/medicine/updateMedicine.do")
	public String medicineUpdate(MedicineVo medicine) {
		System.out.println("bbb" + medicine);
		int result = medicineService.updateMedicine(medicine);

		return "redirect:/medicine/medicineList.do";
	}

	@RequestMapping("/medicine/deleteMedicine.do")
	public String deleteMedicine(MedicineVo medicine) {
		String medCode = medicine.getMedCode();
		int result = medicineService.deleteMedicine(medCode);

		return "redirect:/medicine/medicineList.do";
	}

}
