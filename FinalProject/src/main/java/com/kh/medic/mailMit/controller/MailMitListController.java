package com.kh.medic.mailMit.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.util.Utils;
import com.kh.medic.mailMit.model.service.MailMitService;

@Controller
public class MailMitListController {

	@Autowired
	MailMitService mailMitService;

	@RequestMapping("/mailMit/mailMitList.do")
	public String selectMailMitList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		int limit = 10;

		ArrayList<Map<String, String>> list = new ArrayList<>(mailMitService.selectMailMitList(cPage, limit));

		int totalContents = mailMitService.selectMailMitTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "mailMitList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "mailMit/mailMitList";
	}

	@RequestMapping("/mailMit/searchMailMit.do")
	public String selectMailMitListSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, String empName) {

		int limit = 10;

		ArrayList<Map<String, String>> list = new ArrayList<>(
				mailMitService.selectMailMitListSearch(cPage, limit, empName));

		int totalContents = mailMitService.selectMailMitTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "mailMitList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "mailMit/mailMitList";
	}

	@RequestMapping("/mailMit/mailMitOne.do")
	public String selectOneEmpsal(@RequestParam String empNo, Model model) {
		model.addAttribute("mailMit", mailMitService.selectOneMailMit(empNo));
		
		return "/mailMit/mailSend";
	}

}
