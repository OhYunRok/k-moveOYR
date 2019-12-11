package com.oyr.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oyr.webapp.dao.UserDao;
import com.oyr.webapp.dto.UserDto;


@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	UserDao userdao;

	
	@Override
	public UserDto login(String userEmail) {
		return userdao.login(userEmail);
	}

}
