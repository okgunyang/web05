package com.kktshop.service;

import java.util.List;

import com.kktshop.dto.CartDTO;

public interface CartService {
	public List<CartDTO> cartList(String userid) throws Exception;
	public CartDTO cartRead(CartDTO cart) throws Exception; 
	public int cartCount(String userid) throws Exception;
	public void addCart(CartDTO cart) throws Exception;
	public void deleteCart(CartDTO cart) throws Exception;
	public void updateCart(CartDTO cart) throws Exception;
}
