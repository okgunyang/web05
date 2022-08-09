package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kktshop.dto.NoticeDTO;
import com.kktshop.util.PageMaker;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> noticeList() throws Exception {
		return sqlSession.selectList("notice.noticeList");
	}

	@Override
	public List<NoticeDTO> noticePageList(PageMaker page) throws Exception {
		System.out.println("페이지 시작 글 : "+page.getStartPost());
		System.out.println("한 페이지 글 개수 : "+page.getBnum());
		return sqlSession.selectList("notice.noticePageList", page);
	}

	@Override
	@Transactional
	public NoticeDTO noticeRead(int seq) throws Exception {
		sqlSession.update("notice.viewCountUp", seq);
		return sqlSession.selectOne("notice.noticeRead", seq);
	}

	@Override
	public int noticeCount() throws Exception {
		return sqlSession.selectOne("notice.noticeCount");
	}

	@Override
	public void addNotice(NoticeDTO notice) throws Exception {
		sqlSession.insert("notice.addNotice", notice);
	}

	@Override
	public void deleteNotice(NoticeDTO notice) throws Exception {
		sqlSession.delete("notice.deleteNotice", notice);
	}

	@Override
	public void updateNotice(NoticeDTO notice) throws Exception {
		sqlSession.update("notice.updateNotice", notice);
	}
}