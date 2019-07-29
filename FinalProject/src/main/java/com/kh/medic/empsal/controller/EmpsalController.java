package com.kh.medic.empsal.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.util.Utils;
import com.kh.medic.empsal.model.service.EmpsalService;

@Controller
public class EmpsalController {

	@Autowired
	EmpsalService empsalService;
	
	@RequestMapping("/empsal/empsalList.do")
	public String selectEmpsalList(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		
		int limit=10;
		
		ArrayList<Map<String,String>> list=new ArrayList<>(empsalService.selectEmpsalList(cPage, limit));
		
		int totalContents=empsalService.selectEmpsalTotalContents();
		
		String pageBar= Utils.getPageBar(totalContents, cPage, limit, "empsalList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar);

		return "empsal/empsalList";
		
		
	}
	
	@RequestMapping("/empsal/empsalForm.do")
	public void empsalOne() {
		
	}
	
	
}
