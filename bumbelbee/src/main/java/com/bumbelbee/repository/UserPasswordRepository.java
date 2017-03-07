package com.bumbelbee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bumbelbee.model.UserPassword;

public interface UserPasswordRepository extends JpaRepository<UserPassword, Long> {

}
