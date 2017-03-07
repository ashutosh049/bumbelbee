package com.bumbelbee.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.UserPassword;
import com.bumbelbee.repository.UserPasswordRepository;
import com.bumbelbee.service.UserPasswordService;

@Service
public class UserPasswordServiceImpl implements UserPasswordService{

	@Resource
	UserPasswordRepository repo;
	
	@Transactional
	public UserPassword create(UserPassword userPassword) {
		return repo.save(userPassword);
	}

	@Transactional
	public UserPassword update(UserPassword userPassword){
		UserPassword password = repo.findOne(userPassword.getId());
		password.setEmail(userPassword.getEmail());
		password.setActivationToken(userPassword.getActivationToken());
		password.setActivationTokenTimestamp(userPassword.getPasswordTokenTimestamp());
		password.setPasswordToken(userPassword.getPasswordToken());
		password.setPasswordTokenTimestamp(userPassword.getPasswordTokenTimestamp());
		return password;
	}

	@Transactional
	public UserPassword findById(long id) {
		return repo.findOne(id);
	}

	@Transactional
	public boolean ifExist(String fieldName, String FieldValue) {
		return false;
	}

	@Transactional
	public void requestResetPassword(long beeId, String username, String password_token, Date create_date_time) {
	}

}
