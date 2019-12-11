package com.oyr.webapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oyr.webapp.dto.UserDto;
import com.oyr.webapp.service.LoginService;
import com.oyr.webapp.service.LoginServiceImpl;
import com.oyr.webapp.service.UserService;

@Controller
public class LoginController {

   private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
   
   @Autowired
   LoginService loginService;

   @RequestMapping(value = "/login", method = RequestMethod.POST)
   @ResponseBody
   public boolean login(HttpSession session, String userEmail, String userPassword) {
      
      UserDto dto = loginService.login(userEmail);
      System.out.println("log this page"+userEmail+" : "+userEmail);
      if(dto.getUserPassword().equals(userPassword)) {
    	  System.out.println("session"+userEmail+" : "+userEmail);
         session.setAttribute("userDto", dto);
    	  return true;
      }else {
          return false;
      }
   }
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpSession session) {
	   System.out.println("logout this page");
	   //session.invalidate();
	   session.removeAttribute("userDto");
	   return "login";
   }
   
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String loginP() {
	   	System.out.println("go login page");
	      return "login";
	   }
   
   
   
}