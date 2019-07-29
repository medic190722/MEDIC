package com.kh.medic.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.notice.model.vo.Notice;

public interface NoticeService {

	/**
	 * 게시글 목록 조회용 메소드
	 * @param cPage
	 * @param limit
	 * @return
	 */
	List<Map<String, String>> selectNoticeList(int cPage, int limit);
	
	/**
	 * 페이지 처리를 위한 게시글 총 개수 
	 * @return
	 */
	int selectNoticeTotalContents();
	
	/**
	 * 게시글 추가 메소드
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);
	
	/**
	 * 게시글 내용 조회 메소드
	 * @param nno
	 * @return
	 */
	Notice selectOneNotice(int nno);
	
	/**
	 * 게시글 수정 메소드
	 * @param notice
	 * @param attachList
	 * @return
	 */
	int updateNotice(Notice notice);
	
	/**
	 * 게시글 삭제 메소드
	 * @param nno
	 * @return
	 */
	int deleteNotice(int nno);
	
}
