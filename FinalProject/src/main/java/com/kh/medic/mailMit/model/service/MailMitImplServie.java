package com.kh.medic.mailMit.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.medic.mailMit.model.dao.MailMitDao;
import com.kh.medic.mailMit.model.vo.MailMitListVo;
import com.kh.medic.mailMit.model.vo.MailMitVo;

@Service
public class MailMitImplServie implements MailMitService {

	@Autowired
	private MailMitDao mailMitDao;
	
	@Override
	public List<Map<String, String>> selectMailMitList(int cPage, int limit) {

		return mailMitDao.selectMailMitList(cPage,limit);
	}

	@Override
	public List<Map<String, String>> selectMailMitListSearch(int cPage, int limit, String empName) {

		return mailMitDao.selectMailMitListSearch(cPage, limit,empName);
	}

	@Override
	public int selectMailMitTotalContents() {

		return mailMitDao.selectMailMitTotalContents();
	}

	@Override
	public MailMitListVo selectOneMailMit(String empNo) {

		return mailMitDao.selectOneMailMit(empNo);
	}

}
