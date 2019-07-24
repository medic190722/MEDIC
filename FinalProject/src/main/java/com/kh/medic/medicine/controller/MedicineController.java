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




@Controller
public class MedicineController {
	
	@Autowired
	MedicineService medicineService;
	
	@RequestMapping("/medicine/medcineList.do")
	public String selectMedicineList(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
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
	
	
	
	@RequestMapping("/medicine/medicineView.do")
	public String selectOneMedicine(@RequestParam String no, Model model) {
		
		model.addAttribute("medicine",medicineService.selectOneMedicine(no));
		
		
		return "/medicine/medicineView";
	}
	

}
