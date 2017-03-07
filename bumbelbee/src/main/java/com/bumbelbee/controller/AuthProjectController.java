package com.bumbelbee.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bumbelbee.model.Bug;
import com.bumbelbee.model.Project;
import com.bumbelbee.model.User;
import com.bumbelbee.repository.ProjectRepository;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.BugService;
import com.bumbelbee.service.ProjectService;
import com.bumbelbee.service.SecurityService;
import com.bumbelbee.service.UserService;

@RestController
@RequestMapping("/auth/project")
public class AuthProjectController {

	@Autowired
	private UserService userService;

	@Autowired
	UserRepository userRepository;

	@Autowired
	private ProjectService projectService;

	@Autowired
	ProjectRepository projectRepository;
	
	@Autowired
	BugService bugService;

	@Autowired
	private SecurityService securityService;

	private final Logger logger = LoggerFactory
			.getLogger(AuthProjectController.class);

	ObjectError error;
	FieldError fieldError;

	@RequestMapping({ "/reportBugByPManager" })
	public ModelAndView reportBugByAdmin(final Model model, final Locale locale, HttpSession session) {
        User userInContext = (User)session.getAttribute("userInContext");
        model.addAttribute("userInContext", userInContext);
        //add all projects by this manager to view
        List<Project>  projectList= projectRepository.findAllByUserId(userInContext.getId());
        model.addAttribute("projectList", projectList);
        model.addAttribute("project", new Project());
		return new ModelAndView("report-bug-page");
	}

	@RequestMapping(value = "/ceateProject", method = RequestMethod.POST)
	public ModelAndView ceateProject(ModelMap model, @ModelAttribute @Valid Project project, BindingResult result,
			final RedirectAttributes redirectAttributes,  HttpSession session) {
		    User userInContext = (User)session.getAttribute("userInContext");
	        project.setUser(userInContext);
	        projectService.save(project);
		return new ModelAndView("redirect:reportBugByPManager");
	}
	
	@RequestMapping(value = "/reportBug", method = RequestMethod.POST, headers = "Accept=application/json", produces = "application/json")
	public @ResponseBody Bug reportBugAjaxSubmit(@RequestBody Bug bug) {
		logger.info("[Locking bug# "+bug.getBugId()+" ]"+bug.toString());
		Bug bug_ = bugService.save(bug);
		return bug_;
	}
	
	
}
