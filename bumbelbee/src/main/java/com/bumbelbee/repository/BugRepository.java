package com.bumbelbee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Bug;

public interface BugRepository extends JpaRepository<Bug, Long>{

	@Transactional
	@Query("SELECT b " +
		   "FROM Bug b " +
		   "WHERE b.synopsis LIKE %?1% OR " +
		   "b.description LIKE %?1%")
	public List<Bug> findAllLike(@Param("searchString") String searchString);
	
}
