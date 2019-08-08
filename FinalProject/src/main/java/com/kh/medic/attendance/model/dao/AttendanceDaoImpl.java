package com.kh.medic.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.attendance.model.vo.Attendance;
import com.kh.medic.member.model.vo.Member;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> selectAttendance(int cPage, int limit, int empNo) {
		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("attendance.selectAttendance", empNo, rows);
	}



	@Override
	public List<Map<String, String>> selectAttendanceList(int cPage, int limit) {
		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("member.selectMemberList", null, rows);
	}

	@Override
	public int selectAttendanceTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectMemberTotalContents");
	}

	@Override
	public int selectAttendanceOneTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("attendance.selectAttendanceTotalContents");
	}


	@Override
	public int insertAttend(int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attendance.insertAttend",empNo);
	}

	@Override
	public int insertLeave(int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("attendance.insertLeave",empNo);
	}

}
