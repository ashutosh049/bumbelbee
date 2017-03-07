package com.bumbelbee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Project;
import com.bumbelbee.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	@Transactional
	@Query("SELECT u FROM User u WHERE u.email =  ?1")
	public List<User> findByEmail(@Param("email") String email);

	@Transactional
	@Query("SELECT u FROM User u WHERE u.username =  ?1")
	public List<User> findAllByUsername(@Param("username") String username);
	
	User findByUsername(String username);
	
	@Transactional
	@Query("SELECT u " +
		   "FROM User u " +
		   "INNER JOIN u.projects pr " +
		   "WHERE u.Id=?1")
	public List<User> findAllByUserId(@Param("userId") Long userId);
}
