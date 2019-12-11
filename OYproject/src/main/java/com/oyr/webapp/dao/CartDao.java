package com.oyr.webapp.dao;

import java.util.List;

import com.oyr.webapp.dto.CartDto;

public interface CartDao {
   int cartInsert(CartDto dto);
   int cartUpdate(CartDto dto);
   int cartDelete(CartDto dto);
List<CartDto> cartList(String userSeq);

}