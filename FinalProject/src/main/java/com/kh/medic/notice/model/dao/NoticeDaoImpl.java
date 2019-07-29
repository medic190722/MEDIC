package com.kh.medic.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.notice.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int limit) {
		
		RowBounds rows = new RowBounds((cPage-1)*limit, limit);

		return sqlSession.selectList("notice.selectNoticeList", null, rows);

	}

	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("notice.selectNoticeTotalContents");
	}

	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.insert("notice.insertNotice", notice);
	}

	@Override
	public Notice selectOneNotice(int nno) {
		return sqlSession.selectOne("notice.selectOneNotice", nno);
	}

	@Override
	public int updateNotice(Notice notice) {
		return sqlSession.update("notice.updateNotice", notice);
	}

	@Override
	public int deleteNotice(int nno) {
		return sqlSession.delete("notice.deleteNotice", nno);
	}

}
