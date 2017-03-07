package com.bumbelbee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumbelbee.model.Bug;
import com.bumbelbee.repository.BugRepository;
import com.bumbelbee.service.BugService;

@Service
public class BugServiceImpl implements BugService {

	@Autowired
	BugRepository bugRepository;
	
	public Bug save(Bug bug) {
		return bugRepository.save(bug);
	}

	public List<Bug> findAll() {
		return bugRepository.findAll();
	}

	public Bug findById(long bugId) {
		return bugRepository.findOne(bugId);
	}

}
