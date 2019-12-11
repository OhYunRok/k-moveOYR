package com.oyr.webapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		logger.info("Welcome register! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "register";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(HttpSession session) {
		logger.info("/contact");
		/*
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		return "contact";
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(HttpSession session) {
		logger.info("/about");
		return "about";
	}

	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String boardDropzone(HttpSession session) {
		logger.info("/map");
		return "map/map";
	}
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String blog(HttpSession session) {
		logger.info("/blog");
		return "blog";
	}
	@RequestMapping(value = "/blogDetail", method = RequestMethod.GET)
	public String blogDetail(HttpSession session) {
		logger.info("/blogDetail");
		return "blogDetail";
	}
}
