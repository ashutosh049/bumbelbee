package com.bumbelbee.config;

import static org.apache.commons.lang3.RandomStringUtils.randomAlphabetic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;
import org.springframework.stereotype.Service;

import com.bumbelbee.model.User;
import com.bumbelbee.repository.UserRepository;

@Service
public class FacebookConnectionSignup implements ConnectionSignUp {

	@Autowired
	private UserRepository userRepository;

	public String execute(Connection<?> connection) {
		System.out.println("signup === ");
		final User user = new User();
		user.setUsername(connection.getDisplayName());
		user.setPassword(randomAlphabetic(8));
		userRepository.save(user);
		return user.getUsername();
	}

}
