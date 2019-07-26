package com.kh.medic.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.member.model.vo.Member;
import com.kh.medic.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public Member selectMember(int empNo) {
		return memberDao.selectMember(empNo);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIdDuplicate(int empNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return memberDao.updatePassword(member);
	}
	
	

}
