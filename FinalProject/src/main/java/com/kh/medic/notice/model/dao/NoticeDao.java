package com.kh.medic.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.medic.notice.model.vo.Notice;

public interface NoticeDao {

	List<Map<String, String>> selectNoticeList(int cPage, int limit);
	
	int selectNoticeTotalContents();
	
	int insertNotice(Notice notice);
	
	Notice selectOneNotice(int nno);
	
	int updateNotice(Notice notice);
	
	int deleteBoard(int nno);
	
}
