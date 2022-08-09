package com.kktshop.service;

import java.util.List;

import com.kktshop.dto.GoodsDTO;

public interface LatestService {
	/* 최신 상품 */
	public List<GoodsDTO> latestGoods() throws Exception;
	
	/* 베스트 상품 */
	public List<GoodsDTO> bestGoods() throws Exception;
	
	/* 추천 상품 */
	public List<GoodsDTO> chuGoods() throws Exception;
	
	/* 최신 게시글 */
}