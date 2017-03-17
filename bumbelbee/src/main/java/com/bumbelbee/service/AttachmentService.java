package com.bumbelbee.service;

import com.bumbelbee.model.Attachment;

public interface AttachmentService {

	public Attachment save(Attachment attachment);
	public Attachment findById(long bugId);
	Attachment update(Attachment attachment); 
}
