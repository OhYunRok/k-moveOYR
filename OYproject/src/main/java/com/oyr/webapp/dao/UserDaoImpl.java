package com.oyr.webapp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.oyr.webapp.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int userRegister(UserDto userDto) {

		String sql = "INSERT INTO USER "
				+ " (USER_NAME, USER_PASSWORD, USER_EMAIL, USER_REGISTER_DATE) "
				+ " VALUES (?,?,?,now() )";
		return jdbcTemplate.update(sql, userDto.getUserName(), userDto.getUserPassword(), userDto.getUserEmail()
				);
	}

	@Override
	public UserDto login(String userEmail) {
		UserDto dto= null;
		String sql = "SELECT USER_SEQ, USER_NAME, USER_PASSWORD, USER_EMAIL, USER_REGISTER_DATE , AU_CODE " + "  FROM USER " + " WHERE USER_EMAIL = ? ";
		
		try {
			dto = jdbcTemplate.queryForObject(sql, new UserMapper(), userEmail);
		} catch (org.springframework.dao.EmptyResultDataAccessException e) {
			dto= null;
		}
		return dto;
	}
}
