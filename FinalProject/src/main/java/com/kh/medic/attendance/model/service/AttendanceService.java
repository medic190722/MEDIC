package com.kh.medic.attendance.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.attendance.model.vo.Attendance;
import com.kh.medic.member.model.vo.Member;

public interface AttendanceService {
	
	int insertAttendance(Attendance attendance);
	
	List<Map<String,String>> selectAttendanceList(int cPage,int limit);
	int selectAttendanceTotalContents();
	List<Map<String, String>> selectAttendance(int cPage, int limit, int empNo);
	int selectAttendanceOneTotalContents();
	
	int insertAttend(int empNo);
	int insertLeave(int empNo);
	
	int todayAttend(int empNo);
	int todayLeave(int empNo);
}
