package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kktshop.dto.CategoryDTO;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.NavbarDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<GoodsDTO> goodsList() throws Exception {
		return sqlSession.selectList("goods.goodsList");
	}
	
	@Override
	public List<GoodsDTO> proList(String ccode) throws Exception {
		return sqlSession.selectList("goods.proList", ccode);
	}
	
	
	@Override
	public int proCount(String navparam) throws Exception {
		return sqlSession.selectOne("goods.proCount", navparam);
	}

	@Override
	public String navnameLoading(String navparam) throws Exception {
		return sqlSession.selectOne("goods.navnameLoading", navparam);
	}

	@Override
	public List<NavbarDTO> cateList(String navparam) throws Exception {
		return sqlSession.selectList("home.cateList", navparam);
	}

	@Override
	public GoodsDTO getGoods(int gnum) throws Exception {
		return sqlSession.selectOne("goods.getGoods", gnum);
	}

	@Override
	public int goodsCount() throws Exception {
		return sqlSession.selectOne("goods.goodsCount");
	}

	@Override
	public void addGoods(GoodsDTO goods) throws Exception {
		sqlSession.insert("goods.addGoods", goods);
	}

	@Override
	public void deleteGoods(GoodsDTO goods) throws Exception {
		sqlSession.delete("goods.deleteGoods", goods);
	}

	@Override
	public void updateGoods(GoodsDTO goods) throws Exception {
		sqlSession.update("goods.updateGoods", goods);
	}

	@Override
	public void addCategory(CategoryDTO category) throws Exception {
		sqlSession.insert("goods.addCategory", category);
	}
}