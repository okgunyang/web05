package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kktshop.dto.CartDTO;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.SalesDTO;
@Repository
public class SalesDAOImpl implements SalesDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<SalesDTO> salesList() throws Exception {
		return sqlSession.selectList("sales.salesAllList");
	}

	@Override
	public List<SalesDTO> salesList(String userid) throws Exception {
		return sqlSession.selectList("sales.salesList", userid);
	}

	@Override
	public SalesDTO salesRead(int ono) throws Exception {
		return sqlSession.selectOne("sales.salesRead", ono);
	}

	@Override
	public int salesCount(String userid) throws Exception {
		return sqlSession.selectOne("sales.salesCount", userid);
	}

	@Transactional
	@Override
	public void addSales(SalesDTO sales) throws Exception { //주문시 주문정보 추가와 상품개수 변경을 동시에
		GoodsDTO goods = new GoodsDTO();
		goods.setGnum(sales.getGno());
		goods.setGstock(sales.getAmount());
		System.out.println("상품번호 : "+goods.getGnum());
		System.out.println("구입수량 : "+goods.getGstock());
		sqlSession.insert("sales.addSales", sales);
		sqlSession.update("sales.salesGoodsUpdate", goods);
	}
	
	@Transactional
	@Override
	public void addSales(SalesDTO sales, int bno) throws Exception { //장바구니에서 구매시에는 주문정보 추가와 상품 정보에서 상품개수 변경, 장바구니 정보 삭제를 동시에
		GoodsDTO goods = new GoodsDTO();
		goods.setGnum(sales.getGno());
		goods.setGstock(sales.getAmount());
		System.out.println("상품번호 : "+goods.getGnum());
		System.out.println("구입수량 : "+goods.getGstock());
		CartDTO cart = new CartDTO();
		cart.setBno(bno);
		sqlSession.insert("sales.addSales", sales);
		sqlSession.update("sales.salesGoodsUpdate", goods);
		sqlSession.delete("sales.salesCartUpdate", cart);
	}

	@Override
	public void addShipping(SalesDTO sales) throws Exception {
		sqlSession.update("sales.addShipping", sales);
	}

	@Transactional
	@Override
	public void deleteSales(SalesDTO sales) throws Exception { //주문취소시 주문정보 삭제와 상품개수 변경을 동시에
		GoodsDTO goods = new GoodsDTO();
		goods.setGnum(sales.getGno());
		goods.setGstock(sales.getAmount());
		sqlSession.delete("sales.deleteSales", sales);
		sqlSession.update("sales.returnGoodsUpdate", goods);
	}

	@Override
	public void updateSales(SalesDTO sales) throws Exception {
		sqlSession.update("sales.updateSales", sales);
	}
}