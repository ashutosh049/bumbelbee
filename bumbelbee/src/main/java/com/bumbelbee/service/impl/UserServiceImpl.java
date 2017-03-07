package com.bumbelbee.service.impl;

import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.Exception.UserNotFound;
import com.bumbelbee.model.User;
import com.bumbelbee.repository.RoleRepository;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.UserService;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Resource
	private UserRepository userRepository;

	@Transactional
	public User save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet(roleRepository.findAll()));
//		userRepository.save(user);
		return userRepository.save(user);
	}

	@Transactional(rollbackFor = UserNotFound.class)
	public User delete(long id) throws UserNotFound {
		User deletedUser = userRepository.findOne(id);
		if (deletedUser == null)
			throw new UserNotFound();
		userRepository.delete(deletedUser);
		return deletedUser;
	}

	@Transactional
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Transactional(rollbackFor = UserNotFound.class)
	public User update(User user) throws UserNotFound {
		User updatedUser = userRepository.findOne(user.getId());

		if (updatedUser == null)
			throw new UserNotFound();

		updatedUser.setEmail(user.getEmail());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setActive(user.isActive());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setConfirmPassword(user.getPassword());
		return updatedUser;
	}

	@Transactional
	public User findById(long id) {
		return userRepository.findOne(id);
	}

	public boolean ifExist(String fieldName, String fieldValue) {
		boolean exists = false;
		if (fieldName.equalsIgnoreCase("email")) {
			exists = userRepository.findByEmail(fieldValue).size() >= 1;
		} else if (fieldName.equalsIgnoreCase("username")) {
			exists = userRepository.findAllByUsername(fieldValue).size() >= 1;
		}
		return exists;
	}

	public List<User> findByEmail(String email) {
		return (List<User>) userRepository.findByEmail(email);
	}

	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

}
