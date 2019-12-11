package com.oyr.webapp.service;

import java.util.List;

import com.oyr.webapp.dto.CartDto;

public interface CartService {
	public int cartInsert(CartDto dto);
	
	public int cartUpdate(CartDto dto);
	
	public int cartDelete(CartDto dto);

	public List<CartDto> cartList(String userSeq);

}
