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
	
	@Autowired
	EmpsalVo empsal;
	
	@Override
	public List<Map<String, String>> selectEmpsalList(int cPage, int limit) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("empsal.selectEmpsalList",null,rows);
	}
	
	@Override
	public List<Map<String, String>> selectEmpsalListSearch(int cPage, int limit,String empName) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("empsal.selectEmpsalListSearch",empName,rows);
	}

	@Override
	public int selectEmpsalTotalContents() {

		return sqlSession.selectOne("empsal.selectEmpsalTotalContents");
	}

	@Override
	public EmpsalVo selectOneEmpsal(String empNo) {

		return sqlSession.selectOne("empsal.selectOneEmpsal",empNo);
	}

	@Override
	public int updateEmpsal(int empNo, int salary) {
		
		System.out.println("ddd"+empNo+salary);
		System.out.println("ccc"+empsal);
		empsal.setEmpNo(empNo);
		empsal.setSalary(salary);
		
		System.out.println("bbb"+empsal);
		return sqlSession.update("empsal.updateEmpsalSal",empsal);
	}

}
