package com.bumbelbee.service;

import java.util.List;

import com.bumbelbee.model.Bug;
import com.bumbelbee.model.Comment;

public interface CommentService {

	Comment save(Comment comment);

	List<Comment> findAll();

	Comment findById(long id);
	
	Comment update(Bug bug);
	
}
