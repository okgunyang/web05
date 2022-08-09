package com.kktshop.service;

import java.util.List;

import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.NavbarDTO;

public interface HomeService {
	public List<NavbarDTO> navList() throws Exception;
	public List<GoodsDTO> latestGoods() throws Exception;
	public int navCount(String navparam) throws Exception;
	public void addCate(NavbarDTO navbar) throws Exception;
	public void delCate(int idx) throws Exception;
}