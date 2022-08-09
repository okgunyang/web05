package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.HomeDAO;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.NavbarDTO;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	HomeDAO homeDAO;
	
	@Override
	public List<NavbarDTO> navList() throws Exception {
		return homeDAO.navList();
	}

	@Override
	public List<GoodsDTO> latestGoods() throws Exception {
		return homeDAO.latestGoods();
	}

	@Override
	public int navCount(String navparam) throws Exception {
		return homeDAO.navCount(navparam);
	}

	@Override
	public void addCate(NavbarDTO navbar) throws Exception {
		homeDAO.addCate(navbar);
	}

	@Override
	public void delCate(int idx) throws Exception {
		homeDAO.delCate(idx);
	}
	
}
