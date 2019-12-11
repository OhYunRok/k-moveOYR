package com.oyr.webapp.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oyr.webapp.dto.ProductDto;

public interface ProductService {
	public int productInsert(ProductDto dto);
	int productListTotalCnt();
	public List<ProductDto> productList(int limit, int offset);
	public ProductDto productDetail(int productId);
	public int productUpdate(ProductDto dto);
	public int productDelete(ProductDto dto);
	public int productInsertFile(ProductDto dto, MultipartFile file) throws Exception;
	int productUpdateFile(ProductDto dto, MultipartFile file) throws Exception;
}
