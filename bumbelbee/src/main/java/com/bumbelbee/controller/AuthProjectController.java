package com.bumbelbee.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bumbelbee.formbacking.bean.BugForm;
import com.bumbelbee.formbacking.bean.UploadForm;
import com.bumbelbee.model.Attachment;
import com.bumbelbee.model.Bug;
import com.bumbelbee.model.Project;
import com.bumbelbee.model.User;
import com.bumbelbee.repository.ProjectRepository;
import com.bumbelbee.repository.UserRepository;
import com.bumbelbee.service.AttachmentService;
import com.bumbelbee.service.BugService;
import com.bumbelbee.service.ProjectService;
import com.bumbelbee.service.SecurityService;
import com.bumbelbee.service.UserService;
//import com.bumbelbee.model.Attachment;

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
	
	@Autowired
	AttachmentService attachmentService;

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
        model.addAttribute("uploadForm", new UploadForm());
        model.addAttribute("bug", new Bug());
        model.addAttribute("bugForm", new BugForm());
        
		return new ModelAndView("report-bug-page");
	}

	/*@RequestMapping(value = "/ceateProject", method = RequestMethod.POST)
	public ModelAndView ceateProject(ModelMap model, @ModelAttribute @Valid Project project, BindingResult result,
			final RedirectAttributes redirectAttributes,  HttpSession session) {
		    User userInContext = (User)session.getAttribute("userInContext");
	        project.setUser(userInContext);
	        projectService.save(project);
		return new ModelAndView("redirect:reportBugByPManager");
	}*/
	
	/*@RequestMapping(value = "/ceateProject", method = RequestMethod.POST)
	public ModelAndView ceateProject(ModelMap model, @ModelAttribute @Valid ProjectAttachmentBean projectAttachmentBean, BindingResult result,
			final RedirectAttributes redirectAttributes,  HttpSession session) throws IOException {
		    User userInContext = (User)session.getAttribute("userInContext");
		   
		    Project project = projectAttachmentBean.getProject();
		    MultipartFile fileUpload = projectAttachmentBean.getAttachment();
		  
		    if (fileUpload != null) {
	                System.out.println("Saving file: " + fileUpload.getOriginalFilename());
	                Attachment attachment = new Attachment();
	                attachment.setAttachmentName(fileUpload.getOriginalFilename());
	                attachment.setAttachmentType("BUG");
	                attachment.setAttachmentData(fileUpload.getBytes());
	                attachmentService.save(attachment);
	                project.setUser(userInContext);
	    	        projectService.save(project);
	                
	        }
		    
		  
		return new ModelAndView("redirect:reportBugByPManager");
	}*/
	
	
	
	@RequestMapping(value = "/reportBug_", method = RequestMethod.POST, headers = "Accept=application/json", produces = "application/json")
	public @ResponseBody Bug reportBugAjaxSubmit_(HttpServletRequest request,@RequestBody Bug bug, BindingResult result) throws IOException {
		
	/*	Bug bug = bugAttachmentBean;
		logger.info("[Locking bug# "+bug.getBugId()+" ]"+bug.toString());
		
		MultipartFile fileUpload = bugAttachmentBean.getAttachment();
		
		if (fileUpload != null) {
            System.out.println("Saving file: " + fileUpload.getOriginalFilename());
            Attachment attachment = new Attachment();
            attachment.setAttachmentName(fileUpload.getOriginalFilename());
            attachment.setAttachmentType("BUG");
            attachment.setAttachmentData(fileUpload.getBytes());
            attachmentService.save(attachment);
            bug = bugService.save(bug);
    }*/
		
		Attachment attachment = bug.getAttachments().iterator().next();
		attachment.setAttachmentName(""+new Random().nextInt());
		attachment.setAttachmentType("BUG");
//		attachment.setBug(bug);
		
		Set<Attachment> attachmentSet = new HashSet<Attachment>();
		attachmentSet.add(attachment);
		
		bug.setAttachments(bug.getAttachments());
		
		bug = bugService.save(bug);
		return bug;
	}
	
	/*@RequestMapping(value = "reportBug", method = RequestMethod.POST)
	public @ResponseBody ModelAndView reportBugAjaxSubmit(@ModelAttribute BugForm bugForm) throws IOException {
		System.out.println(bugForm.toString());
		return new ModelAndView("/reportBugByPManager");
	}*/
	
	 @RequestMapping(value = "upload-single", method = RequestMethod.POST)
	 public String uploadFileHandler(@RequestParam MultipartFile file, HttpServletRequest request) {
	        String url;
	        String storedFolderLocation = createStoredFolder(request);
	            String uploadedFileName = file.getOriginalFilename();
	            try {
	                byte[] bytes = file.getBytes();
	 
	                String storedFileLocation = storedFolderLocation + "/" + uploadedFileName;
	                // Create the file on server
	                File serverFile = new File(storedFileLocation);
	                BufferedOutputStream stream = new BufferedOutputStream(
	                        new FileOutputStream(serverFile));
	                stream.write(bytes);
	                stream.close();
	                url = getDomainName(request)
	                        + getRelativePath() + "/" + uploadedFileName;
	                if (isFileTypeImage(uploadedFileName)) {
	                   url= "<img src=\"" + url + "\" />";
	                } else {
	                    url= "<a href=\"" + url + "\">" + url + "</a>";
	                }
	 
	            } catch (Exception e) {
	                return e.getMessage();
	            }
	        return "Loaded File:"+url;
	    }

	
	 @RequestMapping(value = "/doUpload", method = RequestMethod.GET)
	    public String handleFileUpload(HttpServletRequest request,
	    		@RequestParam("fileUpload") CommonsMultipartFile[] fileUpload) throws Exception {
	          
	        if (fileUpload != null && fileUpload.length > 0) {
	            for (CommonsMultipartFile aFile : fileUpload){
	                System.out.println("Saving file: " + aFile.getOriginalFilename());
	                Attachment attachment = new Attachment();
	                attachment.setAttachmentName(aFile.getOriginalFilename());
	                attachment.setAttachmentType("BUG");
//	                attachment.setAttachmentData(aFile.getBytes());
	                attachmentService.save(attachment);
	                
	                /*UploadFile uploadFile = new UploadFile();
	                uploadFile.setFileName(aFile.getOriginalFilename());
	                uploadFile.setData(aFile.getBytes());
	                fileUploadDao.save(uploadFile);*/               
	            }
	        }
	  
	        return "Success";
	    }
	
	 private String createStoredFolder(HttpServletRequest request) {
	        String realPath = request.getSession().getServletContext().getRealPath("/");
	        String relativePath = getRelativePath();
	        String storedFolderLocation = realPath + relativePath;
	        File dir = new File(storedFolderLocation);
	        if (!dir.exists()) {
	            dir.mkdirs();
	        }
	        return storedFolderLocation;
	    }
	    private boolean isFileTypeImage(String fileName) {
	        String imagePattern =
	                "([^\\s]+(\\.(?i)(jpg|jpeg|png|gif|bmp))$)";
	        return Pattern.compile(imagePattern).matcher(fileName).matches();
	 
	    }
	    private String getRelativePath() {
	        String fileSeparator = "/";
	        return "/resources/uploads/"+new Random().nextInt(1000);
	    }
	    private String getDomainName(HttpServletRequest request) {
	        return request.getProtocol().toLowerCase().replaceAll("[0-9./]", "") + "://" +
	                request.getServerName() + ":" + request.getServerPort();
	    }
	
}
