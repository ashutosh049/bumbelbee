package com.bumbelbee.service;

import java.util.Date;
import java.util.List;

import com.bumbelbee.Exception.UserNotFound;
import com.bumbelbee.model.User;

public interface UserService {

	public User save(User user);
	
	User findByUsername(String username);
	
	public User delete(long id) throws UserNotFound;

	public List<User> findAll();

	public User update(User user) throws UserNotFound;

	public User findById(long id);

	public boolean ifExist(String fieldName, String FieldValue);
	
	 public List<User> findByEmail(String email);

}
