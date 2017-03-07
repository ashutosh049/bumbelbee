package com.bumbelbee.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bumbelbee.model.Bug;
import com.bumbelbee.model.Project;
import com.bumbelbee.model.User;
import com.bumbelbee.repository.BugRepository;
import com.bumbelbee.repository.ProjectRepository;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.BugService;
import com.bumbelbee.service.ProjectService;
import com.bumbelbee.service.SecurityService;
import com.bumbelbee.service.UserService;
import com.bumbelbee.util.ArrayUtils;

@RestController
@RequestMapping("/unauth/bug")
public class UnAuthProjectController {

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
	BugRepository bugRepository;

	@Autowired
	private SecurityService securityService;

	private final Logger logger = LoggerFactory
			.getLogger(UnAuthProjectController.class);

	ObjectError error;
	FieldError fieldError;

	@RequestMapping(value = "/show-bug", method = RequestMethod.GET)
	public ModelAndView reportBugByAdmin(final Model model, final Locale locale, HttpSession session,@RequestParam("Id") Long Id) {
        //, @PathParam("bugId") 
		Long bugId_ = Long.valueOf(9);
		Bug searchedBug = bugService.findById(Id);
		List<Bug> searchBugList = bugRepository.findAllLike(String.valueOf(Id));
		
		if(searchedBug==null){
			if(!ArrayUtils.isEmpty(searchBugList)){
				model.addAttribute("searchBugList",searchBugList);
				return new ModelAndView("show-bug-list");
			}else if(ArrayUtils.isOfSize1(searchBugList)){
				model.addAttribute("searchedBug",searchBugList.get(0));
				return new ModelAndView("show-bug");
			}
		}else{
			model.addAttribute("searchedBug",searchedBug);
			return new ModelAndView("show-bug");
		}
		
		return new ModelAndView("show-bug-not-found");
	}
/*
	@RequestMapping(value = "/show-bug", method = RequestMethod.GET)
	public ModelAndView showBug(final Model model, final Locale locale, HttpSession session) {
		Bug searchedBug = bugService.findById(Long.valueOf(9));
		model.addAttribute("searchedBug",searchedBug);
		return new ModelAndView("show-bug");
	}*/

	
}
