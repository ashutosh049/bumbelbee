package com.bumbelbee.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "attachment")
public class Attachment implements Serializable {

	private static final long serialVersionUID = 5258711957098377604L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "attachment_id", nullable = false)
	private long attachmentId;

	@Column(name = "attachment_type")
	private String attachmentType;

	@Column(name = "attachment_name")
	private String attachmentName;

	@Column(name = "attachment_data")
	private byte[] attachmentData;

	public long getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(long attachmentId) {
		this.attachmentId = attachmentId;
	}

	public String getAttachmentType() {
		return attachmentType;
	}

	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}

	public String getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	public byte[] getAttachmentData() {
		return attachmentData;
	}

	public void setAttachmentData(byte[] attachmentData) {
		this.attachmentData = attachmentData;
	}

}
