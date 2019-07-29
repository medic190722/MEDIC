package com.kh.medic.vacation.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.util.Utils;
import com.kh.medic.vacation.model.service.VacationService;
import com.kh.medic.vacation.model.vo.VacationVo;

@Controller
public class VacationController {

	@Autowired
	VacationService vacationService;
	
	@RequestMapping("/vacation/vacationList.do")
	public String selectVacationList(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		int limit = 10; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(vacationService.selectVacationList(cPage, limit));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = vacationService.selectVacationTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "vacationList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "vacation/vacationList";
	}
	
	@RequestMapping("/vacation/vacationOne.do")
	public String selectOneVacation(@RequestParam String vCode, Model model) {
		model.addAttribute("vacation",vacationService.selectOneVacation(vCode));
		return "/vacation/vacationForm";
	}
	
	@RequestMapping("/vacation/vacationYes.do")
	public String vacationupdateYes(VacationVo vacation) {
		
		int result=vacationService.updateVacationYes(vacation);
		return "redirect:/vacation/vacationList.do";
	}
	
	@RequestMapping("/vacation/vacationNo.do")
	public String vacationupdateNo(VacationVo vacation) {
		
		int result=vacationService.updateVacationNo(vacation);
		return "redirect:/vacation/vacationList.do";
	}
	
	@RequestMapping("/vacation/deleteVacation.do")
	public String deleteVacation(VacationVo vacation) {
		String vCode=vacation.getvCode();
		int result=vacationService.deleteVacation(vCode);
		return "redirect:/vacation/vacationList.do";
	}
	
	@RequestMapping("/vacation/vacationInset.do")
	public void vacationInset() {
		
	}
	
	@RequestMapping("/vacation/vacationFormEnd.do")
	public String insertVacation(VacationVo vacation, Model model) {
		int result;
		result=vacationService.insertVacation(vacation);
		
		String loc="/vacation/vacationList.do";
		String msg="";
		
		if(result>0) {
			msg="추가 완료!";
		} else {
			msg="추가 실패!";
		}
		
		model.addAttribute("loc",loc).addAttribute("msg",msg);
		
		return "common/msg";
	}
	
	
	
	
	
	
}
