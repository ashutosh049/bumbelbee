package Project;

import org.springframework.web.multipart.MultipartFile;

import com.bumbelbee.model.Project;

public class ProjectAttachmentBean extends Project {

	Project project;
	MultipartFile attachment;

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public MultipartFile getAttachment() {
		return attachment;
	}

	public void setAttachment(MultipartFile attachment) {
		this.attachment = attachment;
	}

}
