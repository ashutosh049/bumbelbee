package com.bumbelbee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumbelbee.model.Project;
import com.bumbelbee.repository.ProjectRepository;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectRepository projectRepository;
	
	@Resource
	private UserRepository userRepository;
	
	public Project save(Project project) {
		return projectRepository.save(project);
	}

	public Project findByProjectId(Long projectId) {
		return projectRepository.findOne(projectId);
	}

	public List<Project> findAll() {
		return projectRepository.findAll();
	}

	public List<Project> findAllByProjectName(String projectName) {
		return null;
	}

	public List<Project> findAllByUserId(Long userId) {
//		return projectRepository.findAllByUserId(userId);
		return null;
	}

}
