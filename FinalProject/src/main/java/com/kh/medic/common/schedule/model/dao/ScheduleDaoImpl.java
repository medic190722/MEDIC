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
	public List<Schedule> scheduleList(int empNo) {
		return sqlSession.selectList("schedule.scheduleList", empNo);
	}

	@Override
	public int updateSchedule(Schedule sc) {
		return sqlSession.update("schedule.updateSchedule", sc);
	}

	@Override
	public int deleteScehdule(int scno) {
		return sqlSession.delete("schedule.deleteSchedule", scno);
	}
}
