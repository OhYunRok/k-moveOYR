package com.oyr.webapp.dao;

import com.oyr.webapp.dto.UserDto;

public interface UserDao {
	   public int userRegister(UserDto userDto);
	   
	   public UserDto login(String userEmail);
}
