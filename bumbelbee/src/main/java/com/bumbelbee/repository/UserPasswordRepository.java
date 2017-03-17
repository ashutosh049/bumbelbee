package com.bumbelbee.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bumbelbee.model.UserPassword;

@Repository
public interface UserPasswordRepository extends JpaRepository<UserPassword, Long> {

}
