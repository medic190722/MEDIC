package com.kh.medic.mailMit.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.mailMit.model.vo.MailMitListVo;

public interface MailMitService {

	List<Map<String, String>> selectMailMitList(int cPage, int limit);

	List<Map<String, String>> selectMailMitListSearch(int cPage, int limit, String empName);

	int selectMailMitTotalContents();

	MailMitListVo selectOneMailMit(String empNo);

}
