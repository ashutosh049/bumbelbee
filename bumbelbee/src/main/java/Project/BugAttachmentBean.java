package Project;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bumbelbee.model.Bug;
import com.bumbelbee.service.BugPlatform;
import com.bumbelbee.service.BugSeverity;
import com.bumbelbee.service.BugStatus;

public class BugAttachmentBean extends Bug{

	private static final long serialVersionUID = -4386687065148906895L;
	
	private MultipartFile attachment;
	private long bugId;
	private String projectId;
	private String synopsis;
	private BugSeverity severity;
	private BugStatus status;
	private String version;
	private BugPlatform platform;
	boolean securityVulnerability;
	private String description;
	private ArrayList<String> assignto;
	private ArrayList<String> ccto;
	private Date createDate;
	
	public BugAttachmentBean() {
		// TODO Auto-generated constructor stub
	}

	public MultipartFile getAttachment() {
		return attachment;
	}

	public void setAttachment(MultipartFile attachment) {
		this.attachment = attachment;
	}

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

	public BugStatus getStatus() {
		return status;
	}

	public void setStatus(BugStatus status) {
		this.status = status;
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
	
	
	
}
