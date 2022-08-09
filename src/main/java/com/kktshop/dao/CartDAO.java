package com.kktshop.dao;

import java.util.List;

import com.kktshop.dto.CartDTO;

public interface CartDAO {
	public List<CartDTO> cartList(String userid) throws Exception;
	public CartDTO cartRead(CartDTO cart) throws Exception; 
	public int cartCount(String userid) throws Exception;
	public void addCart(CartDTO cart) throws Exception;
	public void deleteCart(CartDTO cart) throws Exception;
	public void updateCart(CartDTO cart) throws Exception;
}