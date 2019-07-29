package com.kh.medic.empsal.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.empsal.model.vo.EmpsalVo;

@Repository
public class EmpsalDaoImpl implements EmpsalDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectEmpsalList(int cPage, int limit) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("empsal.selectEmpsalList",null,rows);
	}

	@Override
	public int selectEmpsalTotalContents() {

		return sqlSession.selectOne("empsal.selectEmpsalTotalContents");
	}

	@Override
	public EmpsalVo selectOneEmpsal(String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateEmpsal(EmpsalVo empsal) {
		// TODO Auto-generated method stub
		return 0;
	}

}
