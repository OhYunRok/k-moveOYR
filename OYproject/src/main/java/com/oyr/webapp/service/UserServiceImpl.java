package com.oyr.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oyr.webapp.dao.UserDao;
import com.oyr.webapp.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userdao;
	
	@Override
	public int userRegister(UserDto userDto) {
		return userdao.userRegister(userDto);
	}

}
