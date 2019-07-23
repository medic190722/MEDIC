package com.kh.medic.member.model.service;

import com.kh.medic.member.model.vo.Member;

public interface MemberService {
	
	/**
	 * 
	 * 회원 가입용 메소드
	 * @param membr
	 * @return
	 */
	
	int insertMember(Member member);
	
	/**
	 * 회원 정보 조회용 메소드
	 * @param userId
	 * @return
	 */
	Member selectMember(int empNo);
	
	/**
	 * 회원 정보 수정용 메소드
	 * @param member
	 * @return
	 */
	int updateMember(Member member);
	
	/**
	 * 회원 정보 삭제용 메소드
	 * @param userId
	 * @return
	 */
	int deleteMember(int empNo);
	
	/**
	 * 회원 아이디 중복 확인용 메소드
	 * @param userId
	 * @return
	 */
	int checkIdDuplicate(int empNo);
}
