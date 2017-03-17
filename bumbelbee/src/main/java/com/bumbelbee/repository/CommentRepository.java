package com.bumbelbee.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bumbelbee.model.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>{
	
}
