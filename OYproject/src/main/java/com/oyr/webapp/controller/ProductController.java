package com.oyr.webapp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oyr.webapp.dto.ProductDto;
import com.oyr.webapp.service.ProductService;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Locale locale, Model model) {
		logger.info("Welcome cart! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "cart";
	}
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public String wishlist(Locale locale, Model model) {
		logger.info("Welcome wishlist! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "wishlist";
	}
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String shop(Locale locale, Model model) {
		logger.info("Welcome shop! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "shop";
	}
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(HttpSession session) {
		logger.debug("/product");
		return "productFile";
	}

	@RequestMapping(value = "/productFile", method = RequestMethod.GET)
	public String productFile(HttpSession session) {
		logger.debug("/productFile");
		return "productFile";
	}

	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	@ResponseBody
	public int productInsert(ProductDto dto) {
		logger.debug("/product/insert");
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getPrice());
		System.out.println(dto.getQuantity());
		return productService.productInsert(dto);
	}

	@RequestMapping(value = "/product/insertFile", method = RequestMethod.POST)
	@ResponseBody
	public int productInsertFile(ProductDto dto, MultipartFile file) throws Exception {
		logger.debug("/product/insert");

		return productService.productInsertFile(dto, file);
	}

	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	@ResponseBody
	public List<ProductDto> productList(int limit, int offset) {
		logger.debug("/product/list");

		return productService.productList(limit, offset);
	}

	@RequestMapping(value = "/product/detail", method = RequestMethod.GET)
	@ResponseBody
	public ProductDto productDetail(ProductDto dto) {
		logger.debug("/product/detail");
		/*
		 * System.out.println(productId + "-----------");
		 * System.out.println(productService.productDetail(productId).toString());
		 */
		System.out.println(dto.getProductId());
		return productService.productDetail(dto.getProductId());
	}

	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	@ResponseBody
	public int productUpdate(ProductDto dto) {
		logger.debug("/product/update");
		System.out.println(dto.getContent() + dto.getTitle() + dto.getProductId() +dto.getPrice() + dto.getQuantity());
		return productService.productUpdate(dto);
	}

	@RequestMapping(value = "/product/delete", method = RequestMethod.POST)
	@ResponseBody
	public int productDelete(ProductDto dto) {
		logger.debug("/product/delete");

		return productService.productDelete(dto);
	}

	@RequestMapping(value = "/product/list/totalCnt", method = RequestMethod.GET)
	@ResponseBody
	public int productListCnt() {

		logger.debug("/product/listTotalCnt");

		return productService.productListTotalCnt();
	}

	@RequestMapping(value = "/product/updateFile", method = RequestMethod.POST)
	@ResponseBody
	public int productUpdateFile(ProductDto dto, MultipartFile file) throws Exception {

		logger.debug("/product/updateFile");

		return productService.productUpdateFile(dto, file);
	}
}
