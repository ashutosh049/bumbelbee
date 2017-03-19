package com.bumbelbee.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.bumbelbee.model.Bug;

public interface BugService {

	Bug save(Bug bug);

	List<Bug> findAll();

	Bug findById(long id);

	Bug update(Bug bug);

	Page<Bug> findAllByUserId(Integer pageNumber, int resultSize, String sortByParam);
	
	Page<Bug> findAllByUserId(long userId,Integer pageNumber, int resultSize, String sortByParam);

}
