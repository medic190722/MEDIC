package com.kh.medic.nurse.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.util.Utils;
import com.kh.medic.member.model.vo.Member;
import com.kh.medic.nurse.model.service.NurseService;
import com.kh.medic.nurse.model.vo.Nurse;

@Controller
public class NurseController {
	
	@Autowired
	NurseService nurseService;
	
	@RequestMapping("/nurse/orderList.do")
	public String orderList(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		int limit=10;
		
		ArrayList<Map<String,String>> list=new ArrayList<>(nurseService.selectOrderList(cPage, limit));
		
		int totalContents= nurseService.selectOrderTotalContents();
		
		String pageBar= Utils.getPageBar(totalContents, cPage, limit, "orderList.do");
		System.out.println("list" + list);
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar);
		
	
		return "/nurse/orderList";
	}
	
	@RequestMapping("/nurse/updateOrderYn.do")
	public String updateOrderYn(@RequestParam("pNo") int pNo, @RequestParam("doctorOrder") String doctorOrder, Model model) {
		System.out.println(pNo);
		System.out.println(doctorOrder);
		Nurse nurse = new Nurse(pNo, doctorOrder);
		
		int result = nurseService.updateOrderYn(nurse);
		// 2. 실행 결과에 따른 화면 처리
	      String loc = "/nurse/orderList.do";
	      String msg = "";
	      

	      
	      if(result > 0) {
	    	  msg = "업무를 이행하였습니다.!";
	         
	         loc="/nurse/orderList.do";
	         
	         
	      }else msg = "업무실패";

	      model.addAttribute("loc", loc);
	      model.addAttribute("msg", msg);
	      
		
		
		return "common/msg";
	}
}
