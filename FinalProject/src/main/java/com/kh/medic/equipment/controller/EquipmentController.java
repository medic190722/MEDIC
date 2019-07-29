package com.kh.medic.equipment.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.util.Utils;
import com.kh.medic.equipment.model.service.EquipmentService;
import com.kh.medic.equipment.model.vo.EquipmentVo;

@Controller
public class EquipmentController {

	@Autowired
	EquipmentService equipmentService;
	
	@RequestMapping("/equipment/equipmentList.do")
	public String selectEquipment(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		int limit = 10; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(equipmentService.selectEquipmentList(cPage, limit));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = equipmentService.selectEquipmentTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "equipmentList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "equipment/equipmentList";
	}
	
	
	
	@RequestMapping("/equipment/equipmentView.do")
	public String selectOneEquipment(@RequestParam String no, Model model) {
		
		model.addAttribute("equipment",equipmentService.selectOneEquipment(no));
		
		return "/equipment/equipmentView";
	}
	
	@RequestMapping("/equipment/equipmentForm.do")
	public void equipmentForm() {
		
	}
	
	@RequestMapping("/equipment/equipmentFormEnd.do")
	public String insertEquipment(EquipmentVo equipment,Model model) {
		int result;

		System.out.println("ddd"+equipment);
		System.out.println("ccc"+equipment.getEqCode());
		
		result=equipmentService.insertEquipment(equipment);

		String loc="/equipment/equipmentList.do";
		String msg="";
		
		if(result>0 ) {
			msg="추가 완료";
		} else {
			msg="추가 실패";
		}
		
		model.addAttribute("loc",loc).addAttribute("msg",msg);
		return "common/msg";
	
	}
	
	@RequestMapping("/equipment/updateEquipment.do")
	public String equipmentUpdate(EquipmentVo equipment) {
		int result=equipmentService.updateEquipment(equipment);
		
		return "redirect:/equipment/equipmentList.do";
	}
	
	@RequestMapping("/equipment/deleteEquipment.do")
	public String deleteEquipment(EquipmentVo equipment) {
		
		System.out.println("q1"+equipment);
		String eqCode=equipment.getEqCode();
		System.out.println("q2"+equipment);
		
		int result=equipmentService.deleteEquipment(eqCode);
		
		return "redirect:/equipment/equipmentList.do";
	}
	
	
	
}





















