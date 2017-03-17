package com.bumbelbee.formbacking.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadForm {

	private long bugId;
	private List<MultipartFile> myfile;

	public List<MultipartFile> getMyfile() {
		return myfile;
	}

	public void setMyfile(List<MultipartFile> myfile) {
		this.myfile = myfile;
	}

	public long getBugId() {
		return bugId;
	}

	public void setBugId(long bugId) {
		this.bugId = bugId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UploadForm [bugId=");
		builder.append(bugId);
		builder.append(", myfile=");
		builder.append(myfile);
		builder.append("]");
		return builder.toString();
	}

}