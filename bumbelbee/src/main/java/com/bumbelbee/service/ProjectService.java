package com.bumbelbee.service;

import java.util.List;

import com.bumbelbee.model.Project;

public interface ProjectService {

	public Project save(Project project);
	
	Project findByProjectId(Long projectId);
	
	List<Project> findAllByProjectName(String projectName);
	
	public List<Project> findAll();
	
	public List<Project> findAllByUserId(Long userId);
	
}
