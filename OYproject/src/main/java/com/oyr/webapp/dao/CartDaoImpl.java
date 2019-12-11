package com.oyr.webapp.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.oyr.webapp.dto.CartDto;

@Repository
public class CartDaoImpl implements CartDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int cartInsert(CartDto dto) {
		 KeyHolder keyHolder = new GeneratedKeyHolder();
	      
	      String sql = 
	              "insert into cart ( "
	            + "USER_SEQ, PRODUCT_ID, AMOUNT) "
	            + "values ( ?, ?, ?)";
	      
	      
	      jdbcTemplate.update(connection -> {
	         PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	         ps.setString(1, dto.getUserSeq());
	         ps.setInt(2, dto.getProductId());
	         ps.setInt(3, dto.getAmount());
	         return ps;
	      }, keyHolder);
	    
	      return keyHolder.getKey().intValue();

	   }

	@Override
	public int cartUpdate(CartDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int cartDelete(CartDto dto) {
			      String sql = 
			              "delete from cart "
			            + "where CART_ID = ? ";
			      
			      return jdbcTemplate.update(
			            sql, 
			            dto.getCartId()
			      );
	}

	@Override
	public List<CartDto> cartList(String userSeq) {
		
		String sql = " SELECT c.PRODUCT_ID, " + " c.USER_SEQ, "
				+ " U.USER_NAME, " + " p.PRICE, " +" pf.FILE_URL, "+" c.CART_ID ,"+ " c.AMOUNT, p.TITLE "
				+ " FROM product p, user u, cart c, product_file pf "
				+ " WHERE c.USER_SEQ = ? and u.USER_SEQ = c.USER_SEQ and p.PRODUCT_ID = c.PRODUCT_ID and p.PRODUCT_ID = pf.PRODUCT_ID " + " ORDER BY PRODUCT_ID DESC "
				;
		return jdbcTemplate.query(sql, new CartMapper(), userSeq);
	}



}
