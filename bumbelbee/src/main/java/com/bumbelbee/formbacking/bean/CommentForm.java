package com.bumbelbee.formbacking.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CommentForm {

	private long bugId;
	private String description;
	private List<MultipartFile> myfile;

	public long getBugId() {
		return bugId;
	}

	public void setBugId(long bugId) {
		this.bugId = bugId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<MultipartFile> getMyfile() {
		return myfile;
	}

	public void setMyfile(List<MultipartFile> myfile) {
		this.myfile = myfile;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentForm [bugId=");
		builder.append(bugId);
		builder.append(", description=");
		builder.append(description);
		builder.append(", myfile=");
		builder.append(myfile);
		builder.append("]");
		return builder.toString();
	}

}