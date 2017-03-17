package com.bumbelbee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Bug;
import com.bumbelbee.model.Comment;
import com.bumbelbee.repository.CommentRepository;
import com.bumbelbee.service.CommentService;

@Transactional
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentRepository commentRepository;
	
	
	public Comment save(Comment comment) {
		return commentRepository.save(comment);
	}

	public List<Comment> findAll() {
		return commentRepository.findAll();
	}

	public Comment findById(long id) {
		return commentRepository.findOne(id);
	}

	public Comment update(Bug bug) {
		return null;
	}

}
