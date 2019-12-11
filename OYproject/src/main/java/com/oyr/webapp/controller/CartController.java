package com.oyr.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oyr.webapp.dto.CartDto;
import com.oyr.webapp.service.CartService;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	CartService cartService;
	
	@RequestMapping(value = "/cart/insert", method = RequestMethod.POST)
	@ResponseBody
	public int cartInsert(HttpSession session, CartDto dto) {
		logger.debug("/cart/insert");
		System.out.println(dto.getProductId());
		System.out.println(dto.getAmount());
		System.out.println(dto.getUserSeq());
		
		int i = dto.getAmount();
		
		if(i>0) {
			String cartCount = String.valueOf(session.getAttribute("cartCount"));
				System.out.println("1번"+cartCount);
				
			if(cartCount==null || "null".equals(cartCount)) {
				session.setAttribute("cartCount", "1");
				System.out.println(session.getAttribute("cartCount"));
			}else {
				int t = Integer.parseInt(cartCount);
				session.setAttribute("cartCount", t+1 + "");
			}
			/*
			 * if(cartCount.equals(null)) { session.setAttribute("cartCount", "1");
			 * System.out.println("2번"+cartCount); }else { int t =
			 * Integer.parseInt(cartCount); session.setAttribute("cartCount", t+1 + ""); }
			 */	
		}
		
		return cartService.cartInsert(dto);
	}
	
	@RequestMapping(value = "/cart/list", method = RequestMethod.GET)
	@ResponseBody
	public List<CartDto> cartList(String userSeq) {
		logger.debug("/cart/list");

		return cartService.cartList(userSeq);
	}
	@RequestMapping(value = "/cart/delete", method = RequestMethod.POST)
	@ResponseBody
	public int cartDelete(CartDto cartDto) {
		logger.debug("/cart/delete");
		
		return cartService.cartDelete(cartDto);
	}
}
