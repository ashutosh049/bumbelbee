package com.bumbelbee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
	public Bug findById(long bugId) {
		return bugRepository.findOne(bugId);
	}

	@Transactional
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

}
