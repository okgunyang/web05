package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.NavbarDTO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NavbarDTO> navList() throws Exception {
		return sqlSession.selectList("home.navbarList");
	}

	@Override
	public List<GoodsDTO> latestGoods() throws Exception {
		return sqlSession.selectList("home.latestGoods");
	}

	@Override
	public int navCount(String navparam) throws Exception {
		return sqlSession.selectOne("home.navCount", navparam);
	}

	@Override
	public void addCate(NavbarDTO navbar) throws Exception {
		sqlSession.selectOne("home.addCate", navbar);
	}

	@Override
	public void delCate(int idx) throws Exception {
		sqlSession.delete("home.delCate", idx);
	}
	
}
