package com.bumbelbee.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.bumbelbee.security.BugPlatform;
import com.bumbelbee.security.BugSeverity;

@Entity
@Table(name = "Bug")
public class Bug implements Serializable{

	private static final long serialVersionUID = 7136014474465478653L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "bug_id")
	private long bugId;
	
	@Column(name = "project_id")
	String projectId;
	
	@Column(name = "synopsis")
	String synopsis;
	
	@Column(name = "severity")
	BugSeverity severity;
	
	@Column(name = "version")
	String version;
	
	@Column(name = "platform")
	BugPlatform platform;
	
	@Column(name = "sec_vulnerability")
	boolean securityVulnerability;
	
	@Column(name = "description")
	String description;
	
	@Column(name = "assign_to")
	ArrayList<String> assignto;
	
	@Column(name = "cc_to")
	ArrayList<String> ccto;
	
	@Column(name = "create_date")
	Date createDate;

	public long getBugId() {
		return bugId;
	}

	public void setBugId(long bugId) {
		this.bugId = bugId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public BugSeverity getSeverity() {
		return severity;
	}

	public void setSeverity(BugSeverity severity) {
		this.severity = severity;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public BugPlatform getPlatform() {
		return platform;
	}

	public void setPlatform(BugPlatform platform) {
		this.platform = platform;
	}

	public boolean isSecurityVulnerability() {
		return securityVulnerability;
	}

	public void setSecurityVulnerability(boolean securityVulnerability) {
		this.securityVulnerability = securityVulnerability;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<String> getAssignto() {
		return assignto;
	}

	public void setAssignto(ArrayList<String> assignto) {
		this.assignto = assignto;
	}

	public ArrayList<String> getCcto() {
		return ccto;
	}

	public void setCcto(ArrayList<String> ccto) {
		this.ccto = ccto;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Bug [bugId=" + bugId + ", projectId=" + projectId
				+ ", synopsis=" + synopsis + ", severity=" + severity
				+ ", version=" + version + ", platform=" + platform
				+ ", securityVulnerability=" + securityVulnerability
				+ ", description=" + description + ", assignto=" + assignto
				+ ", ccto=" + ccto + ", createDate=" + createDate + "]";
	}
	
	
	
	
}
