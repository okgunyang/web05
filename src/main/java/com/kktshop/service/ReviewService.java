package com.kktshop.service;

import java.util.List;

import com.kktshop.dto.ReviewDTO;

public interface ReviewService {
	public List<ReviewDTO> reviewAllList() throws Exception;
	public List<ReviewDTO> reviewList(int gnum) throws Exception;
	public int reviewCount() throws Exception;
	public int reviewUserCount(int gnum, String userid) throws Exception;
	public void addReview(ReviewDTO review) throws Exception;
	public void updateReview(ReviewDTO review) throws Exception;
	public void deleteReview(ReviewDTO review) throws Exception;
}
