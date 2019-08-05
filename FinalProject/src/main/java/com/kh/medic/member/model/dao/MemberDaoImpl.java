package com.kh.medic.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	@Override
	public Member selectMember(int empNo) {
		return sqlSession.selectOne("member.selectMember", empNo);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public int deleteMember(int empNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.deleteMember",empNo);
	}

	@Override
	public int checkIdDuplicate(int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updatePassword", member);
	}

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int limit) {
		// TODO Auto-generated method stub
		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("member.selectMemberList", null, rows);
	}

	@Override
	public int selectMemberTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectMemberTotalContents");
	}

	@Override
	public List<Member> selectSearchMember(String e_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.selectSearchMember",e_name);
	}

	@Override
	public int updatePrivacy(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updatePrivacy",member);
	}

	@Override
	public List<Map<String, String>> leaveMemverList(int cPage, int limit) {
		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("member.selectLeaveMember", null, rows);
	}

	@Override
	public int leaveMemberTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.leaveMemberTotalContents");
	}
	
	
}
