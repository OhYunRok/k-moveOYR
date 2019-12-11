package com.oyr.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oyr.webapp.dao.CartDao;
import com.oyr.webapp.dto.CartDto;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDao cartDao;

	
	@Override
	public int cartInsert(CartDto dto) {
		
		return cartDao.cartInsert(dto);
		
	}

	@Override
	public int cartUpdate(CartDto dto) {
		return cartDao.cartUpdate(dto);
	}
	
	@Override
	@Transactional("txManager")
	public int cartDelete(CartDto dto) {
		int ret = cartDao.cartDelete(dto);
		return ret;
	}

	@Override
	public List<CartDto> cartList(String userSeq) {
		
			return cartDao.cartList(userSeq);
		
	}

}
