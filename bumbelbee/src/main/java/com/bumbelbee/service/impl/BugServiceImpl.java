package com.bumbelbee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Bug;
import com.bumbelbee.repository.BugRepository;
import com.bumbelbee.service.BugService;

@Service
@Transactional
public class BugServiceImpl implements BugService {

	@Autowired
	BugRepository bugRepository;
	
	private static final int PAGE_SIZE = 3;
	
	public Bug save(Bug bug) {
		return bugRepository.save(bug);
	}

	public List<Bug> findAll() {
		return bugRepository.findAll();
	}

	
	public Bug findById(long bugId) {
		return bugRepository.findOne(bugId);
	}

	public Bug update(Bug bug) {
		Bug updatingBug=bugRepository.findOne(bug.getBugId());
		if(updatingBug!=null){
			updatingBug.setAssignto(bug.getAssignto());
			updatingBug.setAttachments(bug.getAttachments());
			updatingBug.setCcto(bug.getCcto());
			updatingBug.setCreateDate(bug.getCreateDate());
			updatingBug.setDescription(bug.getDescription());
			updatingBug.setPlatform(bug.getPlatform());
			updatingBug.setProjectId(bug.getProjectId());
			updatingBug.setSecurityVulnerability(bug.isSecurityVulnerability());
			updatingBug.setSeverity(bug.getSeverity());
			updatingBug.setStatus(bug.getStatus());
			updatingBug.setSynopsis(bug.getSynopsis());
			updatingBug.setVersion(bug.getVersion());
		}
		return updatingBug;
	}
	
	public Page<Bug> findAllByUserId(Integer pageNumber, int resultSize, String sortByParam){
		PageRequest pageRequest = new PageRequest(pageNumber-1, resultSize, Sort.Direction.ASC, sortByParam);
		Page<Bug>  searchList = bugRepository.findAll(pageRequest);
		return searchList;
	}
	
	public Page<Bug> findAllByUserId(long userId, Integer pageNumber, int resultSize, String sortByParam){
		PageRequest pageRequest = new PageRequest(pageNumber-1, resultSize, Sort.Direction.ASC, sortByParam);
		Page<Bug>  searchList = bugRepository.findAllByUserId(userId, pageRequest);
		return searchList;
	}
	
	

}
