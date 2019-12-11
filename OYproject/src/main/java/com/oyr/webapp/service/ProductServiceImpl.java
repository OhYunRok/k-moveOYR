package com.oyr.webapp.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.oyr.webapp.controller.ProductController;
import com.oyr.webapp.dao.ProductDao;
import com.oyr.webapp.dto.ProductDto;
import com.oyr.webapp.dto.ProductFileDto;

@Service
public class ProductServiceImpl implements ProductService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public int productInsert(ProductDto dto) {
	
		return productDao.productInsert(dto);
	}

	@Override
	public int productListTotalCnt() {
		int cnt = productDao.productListTotalCnt();
		return cnt;
	}

	@Override
	public List<ProductDto> productList(int limit, int offset) {
		return productDao.productList(limit, offset);
	}

	@Override
	public ProductDto productDetail(int productId) {
		ProductDto dto = productDao.productDetail(productId);
		List<ProductFileDto> fileList = productDao.productDetailFileList(productId);
		dto.setFileList(fileList);
		return dto;
	}
	@Override
	public int productUpdate(ProductDto dto) {
		return productDao.productUpdate(dto);
		}

	@Override
	@Transactional("txManager")
	public int productDelete(ProductDto dto) {
		List<String> fileUrlList = productDao.productDeleteFileUrl(dto.getProductId());
		for (String fileUrl : fileUrlList) {
			File file = new File(productDeleteRealPath, fileUrl);
			logger.debug("file : " + file.getName());

			if (file.exists()) {
				file.delete();
			}
		}

		productDao.productDeleteFile(dto.getProductId());
		int ret = productDao.productDelete(dto);

		return ret;
	}
	
	String productDeleteRealPath = 
	         "D:" + File.separator + "OYR" + File.separator + "OYproject" + File.separator + 
	         "src" + File.separator + "main" + File.separator + "webapp";
	
	String productUploadRealPath = "D:" + File.separator + "OYR" + File.separator + "OYproject" + File.separator + "src"
			+ File.separator + "main" + File.separator + "webapp" + File.separator + "resources" + File.separator
			+ "productFiles";

	String productFileFolder = "resources/productFiles";

	@Override
	@Transactional("txManager")
	public int productInsertFile(ProductDto dto, MultipartFile file) throws Exception {
		int productId = productDao.productInsert(dto);
		logger.debug("productId : " + productId);

		if (file != null) {
			// Random Fild Id
			UUID uuid = UUID.randomUUID();

			// file extention
			String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // vs FilenameUtils.getBaseName()

			String savingFileName = uuid + "." + extension;

			File saveFile = new File(productUploadRealPath, savingFileName);
			file.transferTo(saveFile);

			// File Save to folder
			ProductFileDto fileDto = new ProductFileDto();
			fileDto.setFileContentType(file.getContentType());

			logger.debug("fileDto.getFileContentType : " + fileDto.getFileContentType());

			fileDto.setFileName(file.getOriginalFilename());
			fileDto.setFileSize(file.getSize());

			String productFileUrl = productFileFolder + "/" + savingFileName;
			fileDto.setFileUrl(productFileUrl);

			fileDto.setProductId(productId);

			productDao.productInsertFile(fileDto);
		}

		return productId;
	}

	@Override
	@Transactional("txManager")
	public int productUpdateFile(ProductDto dto, MultipartFile file) throws Exception {
		int ret = productDao.productUpdate(dto);

		if (file != null) {
			// delete first
			productDao.productDeleteFile(dto.getProductId());

			// Random Fild Id
			UUID uuid = UUID.randomUUID();

			// file extention
			String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // vs FilenameUtils.getBaseName()

			String savingFileName = uuid + "." + extension;

			File saveFile = new File(productUploadRealPath, savingFileName);
			file.transferTo(saveFile);

			// File Save to folder
			ProductFileDto fileDto = new ProductFileDto();
			fileDto.setFileContentType(file.getContentType());

			logger.debug("fileDto.getFileContentType : " + fileDto.getFileContentType());

			fileDto.setFileName(file.getOriginalFilename());
			fileDto.setFileSize(file.getSize());

			String boardFileUrl = productFileFolder + "/" + savingFileName;
			fileDto.setFileUrl(boardFileUrl);

			fileDto.setProductId(dto.getProductId());

			productDao.productInsertFile(fileDto);
		}

		return ret;
	}

}
