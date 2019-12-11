package com.oyr.webapp.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.oyr.webapp.dto.ProductDto;
import com.oyr.webapp.dto.ProductFileDto;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public int productInsert(ProductDto dto) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	      
	      String sql = 
	              "insert into product ( "
	            + "USER_SEQ, TITLE, CONTENT, PRICE, QUANTITY, REG_DT, READ_COUNT) "
	            + "values ( ?, ?, ?, ?, ?, now(), 0 )";
	      
	      
	      jdbcTemplate.update(connection -> {
	         PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	         ps.setString(1, dto.getUserSeq());
	         ps.setString(2, dto.getTitle());
	         ps.setString(3, dto.getContent());
	         ps.setInt(4, dto.getPrice());
	         ps.setInt(5, dto.getQuantity());
	         return ps;
	         
	      }, keyHolder);
	    
	      return keyHolder.getKey().intValue();
	}

	@Override
	public List<ProductDto> productList(int limit, int offset) {
		
		String sql = "SELECT SQL_CALC_FOUND_ROWS A.* FROM ( " + " SELECT p.PRODUCT_ID, " + " p.USER_SEQ, "
				+ " U.USER_NAME, " + " p.TITLE, " + " p.CONTENT, "+ " p.PRICE, "+ " p.QUANTITY, " +" f.FILE_URL, " + " p.REG_DT, " + " p.READ_COUNT "
				+ " FROM product p, user u, product_file f " + " WHERE p.USER_SEQ = u.USER_SEQ and p.PRODUCT_ID = f.PRODUCT_ID" + " ORDER BY PRODUCT_ID DESC "
				+ ") A LIMIT ? OFFSET ?; ";
		return jdbcTemplate.query(sql, new ProductMapper(), limit, offset);
	}
	
	@Override
	public int productListTotalCnt() {
		String sql = "SELECT count(*) FROM product ";

		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	@Override
	public ProductDto productDetail(int productId) {
		String sql = " SELECT p.PRODUCT_ID, " + " p.USER_SEQ, "
				+ " U.USER_NAME, " + " p.TITLE, " + " p.CONTENT, "+ " p.PRICE, "+ " p.QUANTITY, " + " f.FILE_URL, " + " p.REG_DT, " + " p.READ_COUNT "
				+ " FROM product p, user u, product_file f " + " WHERE p.USER_SEQ = u.USER_SEQ and p.PRODUCT_ID = f.PRODUCT_ID"
				+ " AND p.PRODUCT_ID = ? ";

		return jdbcTemplate.queryForObject(sql, new ProductMapper(), productId);
	}

	@Override
	public int productUpdate(ProductDto dto) {
		String sql = " UPDATE product " + " set TITLE =?, CONTENT = ?, PRICE = ?, QUANTITY = ? " + " WHERE PRODUCT_ID = ? ";

		return jdbcTemplate.update(sql, dto.getTitle(), dto.getContent(), dto.getPrice(), dto.getQuantity(), dto.getProductId());
	}

	@Override
	public int productDelete(ProductDto dto) {
	      String sql = 
	              "delete from product "
	            + "where PRODUCT_ID = ? ";
	      
	      return jdbcTemplate.update(
	            sql, 
	            dto.getProductId()
	      );
	   }

	@Override
	public int productDeleteFile(int productId) {
	      String sql = 
	              "delete from product_file "
	            + "where PRODUCT_ID = ? ";
	      
	      return jdbcTemplate.update(
	            sql, 
	            productId
	      );
	   }
	@Override
	public int productInsertFile(ProductFileDto dto) {
	      String sql = 
	              "insert into product_file ( "
	            + "PRODUCT_ID, FILE_NAME, FILE_SIZE, FILE_CONTENT_TYPE, FILE_URL) "
	            + "values ( ?, ?, ?, ?, ? )";
	      
	      return jdbcTemplate.update(
	            sql, 
	            dto.getProductId(),
	            dto.getFileName(),
	            dto.getFileSize(),
	            dto.getFileContentType(),
	            dto.getFileUrl()
	      );
	   }

	@Override
	public List<ProductFileDto> productDetailFileList(int productId) {
	      String sql = 
		            "   SELECT  PRODUCT_ID,  " +
		            "         IMAGE_ID, " +
		            "           FILE_NAME, " +
		            "           FILE_SIZE, " +
		            "           FILE_CONTENT_TYPE, " +
		            "           FILE_URL, " +
		            "           REG_DT " +
		            "    FROM product_file " +
		            "   WHERE PRODUCT_ID = ? ";
		      
		      return jdbcTemplate.query(sql, new ProductFileListMapper(), productId);
		   }

	@Override
	public List<String> productDeleteFileUrl(int productId) {
	      String sql = 
	              "select file_url from product_file "
	            + "where PRODUCT_ID = ? ";
	      return jdbcTemplate.queryForList(sql, String.class, productId);
	   }

}
