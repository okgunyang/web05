package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kktshop.dto.ReviewDTO;
import com.kktshop.dto.SalesDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ReviewDTO> reviewAllList() throws Exception {
		return sqlSession.selectList("review.reviewAllList");
	}

	@Override
	public List<ReviewDTO> reviewList(int gnum) throws Exception {
		return sqlSession.selectList("review.reviewList", gnum);
	}

	@Override
	public int reviewCount() throws Exception {
		return sqlSession.selectOne("review.reviewCount");
	}
	
	@Override
	public int reviewUserCount(int gnum, String userid) throws Exception {
		SalesDTO sales = new SalesDTO();
		sales.setGno(gnum);
		sales.setUserid(userid);
		return sqlSession.selectOne("review.reviewUserCount", sales);
	}

	@Override
	public void addReview(ReviewDTO review) throws Exception {
		sqlSession.insert("review.addReview", review);		
	}

	@Override
	public void updateReview(ReviewDTO review) throws Exception {
		sqlSession.update("review.updateReview", review);
	}

	@Override
	public void deleteReview(ReviewDTO review) throws Exception {
		sqlSession.delete("review.deleteReview", review);
	}
}
