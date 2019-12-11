package com.oyr.webapp.dao;

import java.util.List;

import com.oyr.webapp.dto.ProductDto;
import com.oyr.webapp.dto.ProductFileDto;

public interface ProductDao {
   int productInsert(ProductDto dto);
   List<ProductDto> productList(int limit, int offset);

   int productListTotalCnt();
   ProductDto productDetail(int productId);
   int productUpdate(ProductDto dto);
   int productDelete(ProductDto dto);
   int productDeleteFile(int productId);
   int productInsertFile(ProductFileDto dto);
   List<ProductFileDto> productDetailFileList(int productId);
   List<String> productDeleteFileUrl(int productId);

}