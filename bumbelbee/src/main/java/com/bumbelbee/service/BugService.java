package com.bumbelbee.service;

import java.util.List;

import com.bumbelbee.model.Bug;

public interface BugService {

	Bug save(Bug bug);

	List<Bug> findAll();

	Bug findById(long id);
	
	Bug update(Bug bug);
	
	

}
