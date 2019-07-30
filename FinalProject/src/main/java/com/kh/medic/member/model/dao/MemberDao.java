package com.kh.medic.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.member.model.vo.Member;

public interface MemberDao {
	
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
	
	/**
	 * 회원비밀번호자동업데이트
	 * @param empNo
	 * @return
	 */
	int updatePassword(Member member);
	
	
	List<Map<String, String>> selectMemberList(int cPage, int limit);
	int selectMemberTotalContents();
	
	List<Member> selectSearchMember(String e_name);
}
