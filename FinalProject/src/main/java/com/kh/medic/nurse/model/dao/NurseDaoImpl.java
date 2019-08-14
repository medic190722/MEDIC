package com.kh.medic.nurse.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.nurse.model.vo.Nurse;

@Repository
public class NurseDaoImpl implements NurseDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectOrderList(int cPage, int limit) {
		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("nurse.selectOrderList",null,rows);
	}

	@Override
	public int selectOrderTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("nurse.selectOrderTotalContents");
	}

	@Override
	public int updateOrderYn(Nurse nurse) {
		// TODO Auto-generated method stub
		return sqlSession.update("nurse.updateOrderYn", nurse);
	}

}
