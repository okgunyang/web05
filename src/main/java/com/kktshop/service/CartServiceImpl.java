package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.CartDAO;
import com.kktshop.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	@Override
	public List<CartDTO> cartList(String userid) throws Exception {
		return cartDAO.cartList(userid);
	}

	@Override
	public CartDTO cartRead(CartDTO cart) throws Exception {
		return cartDAO.cartRead(cart);
	}

	@Override
	public int cartCount(String userid) throws Exception {
		return cartDAO.cartCount(userid);
	}

	@Override
	public void addCart(CartDTO cart) throws Exception {
		cartDAO.addCart(cart);
	}

	@Override
	public void deleteCart(CartDTO cart) throws Exception {
		cartDAO.deleteCart(cart);
	}

	@Override
	public void updateCart(CartDTO cart) throws Exception {
		cartDAO.updateCart(cart);
	}
}