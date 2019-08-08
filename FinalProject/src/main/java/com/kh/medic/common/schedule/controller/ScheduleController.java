package com.kh.medic.common.schedule.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.medic.common.schedule.model.service.ScheduleService;
import com.kh.medic.common.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService ScService;
	
	
	@RequestMapping("/common/schedule/insertSchedule.do")
	@ResponseBody
	public int insertSchedule(@RequestParam int empNo,
			@RequestParam long scstart, @RequestParam String sccontent, @RequestParam String backcolor, @RequestParam String bordercolor) {
		
		Date scDate = new Date(scstart);
		
		Schedule sc = new Schedule(scDate, sccontent, empNo, backcolor, bordercolor);
		System.out.println("등록시 : " + sc);
		
		int scno = ScService.insertSchedule(sc);
		
		return scno;
	}
	
	@RequestMapping("/common/schedule/updateSchedule.do")
	public String updateSchedule(@RequestParam int scno, @RequestParam long scstart, @RequestParam long scend) {
		
		Date scDate1 = new Date(scstart);
		Date scDate2 = new Date(scend);
		
		Schedule sc = new Schedule(scno, scDate1, scDate2);
		System.out.println("수정시 : " + sc);
		
		ScService.updateSchedule(sc);
		
		return "index";
	}
	
	@RequestMapping("/common/schedule/deleteSchedule.do")
	public String deleteSchedule(@RequestParam int scno) {
		
		ScService.deleteScehdule(scno);
		
		return "index";
	}
	
}
