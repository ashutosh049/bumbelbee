package com.bumbelbee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bumbelbee.formbacking.bean.CommentForm;
import com.bumbelbee.model.Attachment;
import com.bumbelbee.model.Bug;
import com.bumbelbee.model.Comment;
import com.bumbelbee.model.User;
import com.bumbelbee.repository.BugRepository;
import com.bumbelbee.repository.ProjectRepository;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.AttachmentService;
import com.bumbelbee.service.BugService;
import com.bumbelbee.service.CommentService;
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

	@Autowired
	AttachmentService attachmentService;
	
	@Autowired
	CommentService commentService;
	
	private final Logger logger = LoggerFactory
			.getLogger(UnAuthProjectController.class);

	ObjectError error;
	FieldError fieldError;

	@RequestMapping(value = "/show-bug", method = RequestMethod.GET)
	public ModelAndView reportBugByAdmin(final Model model, final Locale locale, HttpSession session,@RequestParam("Id") Long Id) {
        //, @PathParam("bugId") 
		Bug searchedBug = bugService.findById(Id);
		List<Bug> searchBugList = bugRepository.findAllLike(String.valueOf(Id));
		User userInContext = (User)session.getAttribute("userInContext");
		model.addAttribute("userInContext",userInContext);
		if(searchedBug==null){
			if(!ArrayUtils.isEmpty(searchBugList)){
				model.addAttribute("searchBugList",searchBugList);
				return new ModelAndView("show-bug-list");
			}else if(ArrayUtils.isOfSize1(searchBugList)){
				model.addAttribute("searchedBug",searchBugList.get(0));
				return new ModelAndView("show-bug");
			}
		}else{
			
			Map<Long,String> attachmentList = new HashMap<Long,String>();
			for (Attachment attachment : searchedBug.getAttachments()) {
				attachmentList.put(attachment.getAttachmentId(), attachment.getAttachmentName());
			}
			
			List<Comment> commentList = new ArrayList<Comment>(searchedBug.getComments());
			
			model.addAttribute("searchedBug",searchedBug);
			model.addAttribute("attachmentList",attachmentList);
			model.addAttribute("commentForm",new CommentForm());
			model.addAttribute("commentList",commentList);
			return new ModelAndView("show-bug");
		}
		
		return new ModelAndView("show-bug-not-found");
	}
	
	@RequestMapping(value = "/download/attachment/{attachment_id}", method = RequestMethod.GET)
    public void doDownload(HttpServletRequest request,  HttpServletResponse response,@PathVariable("attachment_id") long attachment_id) throws IOException {
        Attachment att = attachmentService.findById(attachment_id);
        response.setContentType(att.getAttachmentType());
        response.setContentLength(att.getAttachmentData().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + att.getAttachmentName() +"\"");
        FileCopyUtils.copy(att.getAttachmentData(), response.getOutputStream());
    }

	
	@RequestMapping(value = "/postcomment/{bugId}", method = RequestMethod.POST)
    public @ResponseBody ModelAndView myFormUpload(@ModelAttribute CommentForm commentForm,@PathVariable("bugId") long bugId, HttpSession session) throws IOException {
    	
		User userInContext = (User)session.getAttribute("userInContext");
		
		if(userInContext!=null && commentForm!=null){
    		Bug bug = bugService.findById(bugId);
    		Set<Attachment> attachmentSet = new HashSet<Attachment>();
    		
    		for (MultipartFile file : commentForm.getMyfile()) {
    			Attachment attachment = new Attachment();
    			attachment.setAttachmentData(file.getBytes());
				attachment.setAttachmentName(file.getOriginalFilename());
				attachment.setAttachmentType("COMMENT");
				attachmentSet.add(attachment);
			}
    		
    		Comment comment = new Comment();
    		comment.setCommentedBy(userInContext.getUsername());
    		comment.setUserId(userInContext.getId());
    		comment.setCreateDate(new Date());
    		comment.setDescription(commentForm.getDescription());
    		comment.setBug(bug);
    		comment.setAttachments(attachmentSet);
    		
    		commentService.save(comment);
    		return new ModelAndView("redirect:/unauth/bug/show-bug?Id="+bug.getBugId());
    	}
    	return new ModelAndView("error");
    }
}
