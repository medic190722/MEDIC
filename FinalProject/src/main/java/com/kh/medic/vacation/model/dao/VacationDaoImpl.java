package com.kh.medic.vacation.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.vacation.model.vo.VacationVo;


@Repository
public class VacationDaoImpl implements VacationDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> selectVacationList(int cPage, int limit) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("vacation.selectVacationList",null,rows);
	}
	
	@Override
	public List<Map<String, String>> selectVacationListSearch(int cPage, int limit,String vName) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("vacation.selectVacationListSearch",vName,rows);
	}

	@Override
	public int selectVacationTotalContents() {

		return sqlSession.selectOne("vacation.selectVacationTotalContents");
	}

	@Override
	public int insertVacation(VacationVo vacation) {

		return sqlSession.insert("vacation.insertVacation",vacation);
	}

	@Override
	public VacationVo selectOneVacation(String vCode) {

		return sqlSession.selectOne("vacation.selectOneVacation",vCode);
	}

	@Override
	public int updateVacationYes(VacationVo vacation) {

		return sqlSession.update("vacation.updateVacationYes",vacation);
	}

	@Override
	public int deleteVacation(String vCode) {

		return sqlSession.delete("vacation.deleteVacation",vCode);
	}

	@Override
	public int updateVacationNo(VacationVo vacation) {

		return sqlSession.update("vacation.updateVacationNo",vacation);
	}

}
