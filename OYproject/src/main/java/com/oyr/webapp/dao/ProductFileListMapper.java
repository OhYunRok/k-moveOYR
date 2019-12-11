package com.oyr.webapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.jdbc.core.RowMapper;

import com.oyr.webapp.dto.ProductFileDto;

public class ProductFileListMapper implements RowMapper<ProductFileDto> {
	   @Override
	   public ProductFileDto mapRow(ResultSet rs, int count) throws SQLException {
	      ProductFileDto dto = new ProductFileDto();
	      dto.setProductId(rs.getInt("product_id"));
	      dto.setImageId(rs.getInt("image_id"));
	      dto.setFileName(rs.getString("file_name"));
	      dto.setFileContentType(rs.getString("file_content_type"));
	      dto.setFileSize(rs.getInt("file_size"));
	      dto.setFileUrl(rs.getString("file_url"));
	      Calendar cal = new GregorianCalendar();
	      dto.setRegDt(rs.getTimestamp("reg_dt", cal));
	      return dto;
	   }   
	}