package com.kh.medic.common.schedule.model.dao;

import java.util.List;

import com.kh.medic.common.schedule.model.vo.Schedule;

public interface ScheduleDao {

	List<Schedule> scheduleList(int empNo);

	int insertSchedule(Schedule sc);
	
	int updateSchedule(Schedule sc);
	
	int deleteScehdule(int scno);

	
}
