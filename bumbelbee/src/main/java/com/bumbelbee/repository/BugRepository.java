package com.bumbelbee.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Bug;
import com.bumbelbee.service.BugStatus;

@Repository
@Transactional
public interface BugRepository extends JpaRepository<Bug, Long>{

	@Query("SELECT b " +
		   "FROM Bug b " +
		   "WHERE b.synopsis LIKE %?1% OR " +
		   "b.description LIKE %?1%")
	public List<Bug> findAllLike(@Param("searchString") String searchString);
	
	@Query("SELECT b " +
		   "FROM Bug b " +
		   "WHERE b.userId = ?1")
	public Page<Bug> findAllByUserId(@Param("userId") long userId, Pageable paramPageable);
	
	@Modifying
	@Query("UPDATE Bug b SET b.status = ?1 WHERE b.bugId = ?2")
	int updateBugStatus(BugStatus status, Long bugId);
	
}
