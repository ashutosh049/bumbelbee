package com.bumbelbee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bumbelbee.model.Attachment;
import com.bumbelbee.model.Bug;
import com.bumbelbee.repository.AttachmentRepository;
import com.bumbelbee.service.AttachmentService;

@Service
public class AttachmentServiceImpl implements AttachmentService{

	@Autowired
	AttachmentRepository attachmentRepository;
	
	public Attachment save(Attachment attachment) {
		return attachmentRepository.save(attachment);
	}
	
	@Transactional
	public Attachment findById(long bugId) {
		return attachmentRepository.findOne(bugId);
	}

	@Transactional
	public Attachment update(Attachment attachment) {
		Attachment attachment_ = findById(attachment.getAttachmentId()); 
		attachment_.setAttachmentId(attachment.getAttachmentId());
		attachment_.setAttachmentType(attachment.getAttachmentType());
		attachment_.setAttachmentName(attachment.getAttachmentName());
		attachment_.setAttachmentData(attachment.getAttachmentData());
		return attachment_;
	}

}
