package com.oyr.webapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.oyr.webapp.dto.ProductDto;

public class ProductMapper implements RowMapper<ProductDto>  {

	@Override
	public ProductDto mapRow(ResultSet rs, int count) throws SQLException {
		   ProductDto dto = new ProductDto();
		      dto.setProductId(rs.getInt("product_id"));
		      dto.setUserSeq(rs.getString("user_seq"));
		      dto.setUserName(rs.getString("user_name"));
		      dto.setTitle(rs.getString("title"));
		      dto.setContent(rs.getString("content"));
		      dto.setPrice(rs.getInt("price"));
		      dto.setQuantity(rs.getInt("quantity"));
		      dto.setFileUrl(rs.getString("FILE_URL"));
		      dto.setRegDt(rs.getDate("reg_dt"));
		      dto.setReadCount(rs.getInt("read_count"));
		      							//this argument == Mysql row name !!!
		      //System.out.println("dto.getRegDt :" + dto.getRegDt());
		      return dto;
	}

}
