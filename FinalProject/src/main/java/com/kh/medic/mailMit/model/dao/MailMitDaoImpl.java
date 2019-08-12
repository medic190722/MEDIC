package com.kh.medic.mailMit.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.mailMit.model.vo.MailMitListVo;
import com.kh.medic.member.model.vo.Member;

@Repository
public class MailMitDaoImpl implements MailMitDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	MailMitListVo mailMit;
	
	@Override
	public List<Map<String, String>> selectMailMitList(int cPage, int limit) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("mailMit.selectMailMitList",null,rows);
	}

	@Override
	public List<Map<String, String>> selectMailMitListSearch(int cPage, int limit, String empName) {
		
		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("mailMit.selectMailMitListSearch",empName,rows);
	}

	@Override
	public int selectMailMitTotalContents() {
		
		return sqlSession.selectOne("mailMit.selectMailMitTotalContents");
	}

	@Override
	public MailMitListVo selectOneMailMit(String empNo) {
		
		return sqlSession.selectOne("mailMit.selectOneMailMit",empNo);
	}

}
