package com.kktshop.dao;

import java.util.List;

import com.kktshop.dto.CategoryDTO;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.NavbarDTO;

public interface GoodsDAO {
	public List<GoodsDTO> goodsList() throws Exception;
	public List<GoodsDTO> proList(String ccode) throws Exception;
	public List<NavbarDTO> cateList(String navparam) throws Exception;
	public int proCount(String navparam) throws Exception;
	public String navnameLoading(String navparam) throws Exception;
	public GoodsDTO getGoods(int gnum) throws Exception;
	public int goodsCount() throws Exception;
	public void addGoods(GoodsDTO goods) throws Exception;
	public void deleteGoods(GoodsDTO goods) throws Exception;
	public void updateGoods(GoodsDTO goods) throws Exception;
	public void addCategory(CategoryDTO category) throws Exception;
}