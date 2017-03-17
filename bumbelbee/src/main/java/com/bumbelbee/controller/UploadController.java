package com.bumbelbee.controller;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;

import com.bumbelbee.formbacking.bean.BugForm;
import com.bumbelbee.formbacking.bean.UploadForm;
import com.bumbelbee.model.Attachment;
import com.bumbelbee.model.Bug;
import com.bumbelbee.model.User;
import com.bumbelbee.service.AttachmentService;
import com.bumbelbee.service.BugService;
import com.bumbelbee.util.ArrayUtils;

@Controller
public class UploadController {

	@Autowired
	BugService bugService;
	
	@Autowired
	AttachmentService attachmentService;
	
	 @InitBinder
	  public void initBinder(WebDataBinder dataBinder) {
	      Object target = dataBinder.getTarget();
	      if (target == null) {
	          return;
	      }
	      System.out.println("Target=" + target);
	 
	      if (target.getClass() == UploadForm.class) {
	 
	          dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	      }
	  }

	//public String multiFileUpload(MultipartHttpServletRequest request,@RequestBody BugForm bugForm) throws IOException { 
    @RequestMapping(value = "/filerUpload/{attachmentcount}", method = RequestMethod.POST)
    public @ResponseBody String multiFileUpload(HttpSession session,@RequestBody Bug bug,@PathVariable("attachmentcount") int attachmentcount) throws IOException {
    	
    	User userInContext = (User)session.getAttribute("userInContext");
    	
    	if(userInContext!=null){
    		bug.setCreateDate(new Date());
    		bug.setReportedBy(userInContext.getUsername());
    		bug.setUserId(userInContext.getId());
    		
    		Set<Attachment> attachmentSet = new HashSet<Attachment>();
    		for(int i=0;i<=attachmentcount;i++){
    			Attachment attachment = new Attachment();
    			attachment.setAttachmentData(null);
    			attachment.setAttachmentName(null);
    			attachment.setAttachmentType(null);
    			attachmentSet.add(attachment);
    		}
    		bug.setAttachments(attachmentSet);
    		bug = bugService.save(bug);
    		return String.valueOf(bug.getBugId());
    	}
    	
    	return "error-no-user";
    } 
    
    @RequestMapping(value = "/myFormUpload", method = RequestMethod.POST)
    public @ResponseBody ModelAndView myFormUpload(@ModelAttribute UploadForm uploadForm) throws IOException {
    	if(uploadForm!=null){
    		List<MultipartFile> multipartFileList= uploadForm.getMyfile();
    		Bug bug = bugService.findById(uploadForm.getBugId());
    		if(bug!=null && !ArrayUtils.isEmpty(multipartFileList)){
    			Set<Attachment> attachments = bug.getAttachments();
				int i=0;
				for (Attachment attached : attachments) {
					MultipartFile multipartFile = multipartFileList.get(i++);
					attached.setAttachmentData(multipartFile.getBytes());
    				attached.setAttachmentName(multipartFile.getOriginalFilename());
    				attached.setAttachmentType("BUG");
    				attachmentService.update(attached);
				}
    		}
    		return new ModelAndView("redirect:unauth/bug/show-bug?Id="+bug.getBugId());//"success";
    	}
    	return new ModelAndView("error");
    }

    
}