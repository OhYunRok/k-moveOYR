package com.oyr.webapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.oyr.webapp.dto.CartDto;

public class CartMapper implements RowMapper<CartDto>  {

	@Override
	public CartDto mapRow(ResultSet rs, int count) throws SQLException {
		   CartDto dto = new CartDto();
		   	  dto.setUserSeq(rs.getString("user_seq"));
		   	  dto.setProductId(rs.getInt("product_id"));
		   	  dto.setAmount(rs.getInt("amount"));
		   	  dto.setPrice(rs.getInt("price"));
		   	  dto.setTitle(rs.getString("title"));
		   	  dto.setFileUrl(rs.getString("file_url"));
		   	  dto.setCartId(rs.getInt("cart_id"));
		   	  
		   	  //this argument == Mysql row name !!!
		      //System.out.println("dto.getRegDt :" + dto.getRegDt());
		      return dto;
	}

}
