package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.ReviewDAO;
import com.kktshop.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public List<ReviewDTO> reviewAllList() throws Exception {
		return reviewDAO.reviewAllList();
	}

	@Override
	public List<ReviewDTO> reviewList(int gnum) throws Exception {
		return reviewDAO.reviewList(gnum);
	}

	@Override
	public int reviewCount() throws Exception {
		return reviewDAO.reviewCount();
	}

	@Override
	public int reviewUserCount(int gnum, String userid) throws Exception {
		return reviewDAO.reviewUserCount(gnum, userid);
	}

	@Override
	public void addReview(ReviewDTO review) throws Exception {
		reviewDAO.addReview(review);
	}

	@Override
	public void updateReview(ReviewDTO review) throws Exception {
		reviewDAO.updateReview(review);
	}

	@Override
	public void deleteReview(ReviewDTO review) throws Exception {
		reviewDAO.deleteReview(review);
	}
}
