package com.kh.medic.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.attendance.model.dao.AttendanceDao;
import com.kh.medic.attendance.model.vo.Attendance;
import com.kh.medic.member.model.vo.Member;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	AttendanceDao attendanceDao;
	
	@Override
	public int insertAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Map<String, String>> selectAttendance(int cPage, int limit, int empNo) {
		// TODO Auto-generated method stub	
		return attendanceDao.selectAttendance(cPage,limit,empNo);
	}


	@Override
	public List<Map<String, String>> selectAttendanceList(int cPage, int limit) {
		return attendanceDao.selectAttendanceList(cPage, limit);
	}

	@Override
	public int selectAttendanceTotalContents() {
		return attendanceDao.selectAttendanceTotalContents();
	}

	@Override
	public int selectAttendanceOneTotalContents() {
		// TODO Auto-generated method stub
		return attendanceDao.selectAttendanceOneTotalContents();
	}

	@Override
	public int insertAttend(int empNo) {
		// TODO Auto-generated method stub
		return attendanceDao.insertAttend(empNo);
	}

	@Override
	public int insertLeave(int empNo) {
		// TODO Auto-generated method stub
		return attendanceDao.insertLeave(empNo);
	}

	@Override
	public int todayAttend(int empNo) {
		// TODO Auto-generated method stub
		return attendanceDao.todayAttend(empNo);
	}

	@Override
	public int todayLeave(int empNo) {
		// TODO Auto-generated method stub
		return attendanceDao.todayLeave(empNo);
	}

}
