package com.kh.medic.common.schedule.model.service;

import java.util.List;

import com.kh.medic.common.schedule.model.vo.Schedule;

public interface ScheduleService {

	List<Schedule> scheduleList(int scno);
	
	int insertSchedule(Schedule sc);
	
	int updateSchedule(Schedule sc);
	
	int deleteScehdule(int scno);

	
}
