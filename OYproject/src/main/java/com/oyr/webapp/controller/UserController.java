package com.oyr.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oyr.webapp.dto.UserDto;
import com.oyr.webapp.service.UserService;

@Controller
public class UserController {
   
   @Autowired
   UserService userService;
   
   
   @RequestMapping(value = "/user", method = RequestMethod.POST)
   @ResponseBody
   public int register(UserDto userDto) {
//      Logger.debug("/user");
      
      return userService.userRegister(userDto);
      
   }

}