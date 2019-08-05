package com.kh.medic.common.schedule.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.common.schedule.model.service.ScheduleService;
import com.kh.medic.common.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService ScService;
	
	
	@RequestMapping("/common/schedule/insertSchedule.do")
	public String insertSchedule(@RequestParam int empNo,
			@RequestParam long scstart, @RequestParam String sccontent) {
		
		Date scDate = new Date(scstart);
		
		Schedule sc = new Schedule(scDate, sccontent, empNo);
		System.out.println(sc);
		
		ScService.insertSchedule(sc);
		
		return "index";
	}
	
	@RequestMapping("/common/schedule/updateSchedule.do")
	public String updateSchedule(@RequestParam int empNo) {
		
		
		return "index";
	}
	
}
