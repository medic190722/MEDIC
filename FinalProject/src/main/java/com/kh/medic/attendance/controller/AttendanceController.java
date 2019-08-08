package com.kh.medic.attendance.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.medic.attendance.model.service.AttendanceService;
import com.kh.medic.common.util.Utils;
import com.kh.medic.member.model.vo.Member;

@Controller
public class AttendanceController {
	
	@Autowired
	AttendanceService attendanceService;
	

	@RequestMapping("attendance/attendListOne.do")
	public String AttendListOne(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			int empNo,Model model) {
		
		int limit=10;
		
		ArrayList<Map<String,String>> list=new ArrayList<>(attendanceService.selectAttendance(cPage, limit,empNo));
		
		int totalContents= attendanceService.selectAttendanceOneTotalContents();
		
		String pageBar= Utils.getPageBar(totalContents, cPage, limit, "attendanceOne.do");
		System.out.println("list" + list);
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar);
		
		return "attendance/attendanceOne";
	}
	
	@RequestMapping("attendance/attendListView.do")
	public String AttendListView(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		
		int limit=10;
		
		ArrayList<Map<String,String>> list=new ArrayList<>(attendanceService.selectAttendanceList(cPage, limit));
		
		int totalContents= attendanceService.selectAttendanceTotalContents();
		
		String pageBar= Utils.getPageBar(totalContents, cPage, limit, "attendanceList.do");
		System.out.println("list" + list);
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar);
		
		return "attendance/attendanceList";
		
	}
	
	@RequestMapping("attendance/attendAdd.do")
	public String attendAdd(
			@RequestParam int empNo,Model model) {
		
		System.out.println(empNo);
		int result = attendanceService.insertAttend(empNo);
		 // 2. 실행 결과에 따른 화면 처리
	      String loc = "/index.do";
	      String msg = "";
	      
	      if(result > 0 ) {
	    	  msg = "출근 성공!";
	         
	         loc="/index.do";
	         /*
	          * if(result1>0) { System.out.println("수정된 비밀번호 : " + member.getEmpPwd()); }
	          */
	         
	         
	         
	      }else msg = "출근 실패!";
	      
	      model.addAttribute("loc", loc);
	      model.addAttribute("msg", msg);
	      
	      return "common/msg";
	}
	
	@RequestMapping("attendance/leaveAdd.do")
	public String leaveAdd(int empNo, Model model) {
		System.out.println(empNo);
		int result = attendanceService.insertLeave(empNo);
		 // 2. 실행 결과에 따른 화면 처리
	      String loc = "/index.do";
	      String msg = "";
	      
	      if(result > 0 ) {
	    	  msg = "퇴근 성공!";
	         
	         loc="/index.do";
	         /*
	          * if(result1>0) { System.out.println("수정된 비밀번호 : " + member.getEmpPwd()); }
	          */
	         
	         
	         
	      }else msg = "퇴근 실패!";
	      
	      model.addAttribute("loc", loc);
	      model.addAttribute("msg", msg);
	      
	      return "common/msg";
	}
	
	
	
}
