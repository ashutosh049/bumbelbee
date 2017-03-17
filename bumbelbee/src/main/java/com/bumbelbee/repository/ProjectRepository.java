package com.bumbelbee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Project;
import com.bumbelbee.model.User;
@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {

	/*@Transactional
	@Query("SELECT project " +
		   "FROM Project project " +
		   "LEFT JOIN project.user pu " +
		   "WHERE pu.project_id=p.project_id " +
		   "AND pu.user_id=?1")
	public List<Project> findAllByUserId(@Param("userId") Long userId);*/
	
	
/*	@Transactional
	@Query("SELECT u " +
		   "FROM User u " +
		   "INNER JOIN u.projects pr " +
		   "WHERE u.Id=?1")
	public List<User> findAllByUserId(@Param("userId") Long userId);*/
	
	@Transactional
	@Query("SELECT p " +
		   "FROM Project p " +
		   "INNER JOIN p.user u " +
		   "WHERE u.Id=?1")
	public List<Project> findAllByUserId(@Param("userId") Long userId);
	
}
