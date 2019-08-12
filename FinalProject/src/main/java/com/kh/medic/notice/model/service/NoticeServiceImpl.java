package com.kh.medic.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.notice.model.dao.NoticeDao;
import com.kh.medic.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao nDao;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int limit) {
		return nDao.selectNoticeList(cPage, limit);
	}

	@Override
	public int selectNoticeTotalContents() {
		return nDao.selectNoticeTotalContents();
	}

	@Override
	public int insertNotice(Notice notice) {
		return nDao.insertNotice(notice);
	}

	@Override
	public Notice selectOneNotice(int nno) {
		return nDao.selectOneNotice(nno);
	}

	@Override
	public int updateNotice(Notice notice) {
		return nDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int nno) {
		return nDao.deleteNotice(nno);
	}

	@Override
	public List<Notice> noticeTop5() {
		return nDao.noticeTop5();
	}

}
