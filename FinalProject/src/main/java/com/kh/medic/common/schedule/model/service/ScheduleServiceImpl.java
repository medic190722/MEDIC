package com.kh.medic.common.schedule.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.common.schedule.model.dao.ScheduleDao;
import com.kh.medic.common.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleDao scDao;

	@Override
	public List<Schedule> scheduleList(int empNo) {
		return scDao.scheduleList(empNo);
	}

	@Override
	public int insertSchedule(Schedule sc) {
		int result = scDao.insertSchedule(sc);
		
		if(result > 0) {
			result = sc.getScno();
		} else {
			throw new RuntimeException();
		}
		
		return result; 
	}

	@Override
	public int updateSchedule(Schedule sc) {
		return scDao.updateSchedule(sc);
	}

	@Override
	public int deleteScehdule(int scno) {
		return scDao.deleteScehdule(scno);
	}

}
