package com.bumbelbee.service;

import java.util.Date;

import com.bumbelbee.model.UserPassword;

public interface UserPasswordService {
	public UserPassword create(UserPassword userPassword);
	public UserPassword update(UserPassword userPassword);
	public UserPassword findById(long id);
	public boolean ifExist(String fieldName, String FieldValue);
	public void requestResetPassword(long beeId, String username, String password_token, Date create_date_time);	
}
