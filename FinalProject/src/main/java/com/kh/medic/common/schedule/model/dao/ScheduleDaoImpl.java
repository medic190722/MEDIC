package com.kh.medic.common.schedule.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.common.schedule.model.vo.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	

	@Override
	public int insertSchedule(Schedule sc) {
		return sqlSession.insert("schedule.insertSchedule", sc);
	}

	@Override
	public List<Schedule> scheduleList(int scno) {
		return null;
	}

	@Override
	public int updateSchedule(Schedule sc) {
		return 0;
	}

	@Override
	public int deleteScehdule(int scno) {
		return 0;
	}
}
