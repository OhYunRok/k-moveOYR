package com.oyr.webapp.dto;

import java.util.Date;

public class UserDto {
	private int userSeq;
	private String userName;
	private String userPassword;
	private String userEmail;
	private Date userRegisterDate;
	private String auCode;

	public String getAuCode() {
		return auCode;
	}

	public void setAuCode(String auCode) {
		this.auCode = auCode;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserRegisterDate() {
		return userRegisterDate;
	}

	public void setUserRegisterDate(Date userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}
}