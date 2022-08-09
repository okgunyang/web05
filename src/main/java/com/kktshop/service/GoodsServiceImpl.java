package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.GoodsDAO;
import com.kktshop.dto.CategoryDTO;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.NavbarDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsDAO goodsDAO;
	
	@Override
	public List<GoodsDTO> goodsList() throws Exception {
		return goodsDAO.goodsList();
	}

	@Override
	public List<GoodsDTO> proList(String ccode) throws Exception {
		return goodsDAO.proList(ccode);
	}

	@Override
	public int proCount(String navparam) throws Exception {
		return goodsDAO.proCount(navparam);
	}

	@Override
	public String navnameLoading(String navparam) throws Exception {
		return goodsDAO.navnameLoading(navparam);
	}

	@Override
	public List<NavbarDTO> cateList(String navparam) throws Exception {
		return goodsDAO.cateList(navparam);
	}

	@Override
	public GoodsDTO getGoods(int gnum) throws Exception {
		return goodsDAO.getGoods(gnum);
	}

	@Override
	public int goodsCount() throws Exception {
		return goodsDAO.goodsCount();
	}

	@Override
	public void addGoods(GoodsDTO goods) throws Exception {
		goodsDAO.addGoods(goods);
	}

	@Override
	public void deleteGoods(GoodsDTO goods) throws Exception {
		goodsDAO.deleteGoods(goods);
	}

	@Override
	public void updateGoods(GoodsDTO goods) throws Exception {
		goodsDAO.updateGoods(goods);
	}

	@Override
	public void addCategory(CategoryDTO category) throws Exception {
		goodsDAO.addCategory(category);
	}
}