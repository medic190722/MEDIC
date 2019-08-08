package com.kh.medic.mailMit.model.vo;

import java.io.Serializable;

public class MailMitVo implements Serializable {
	
	private String tomail;
	private String title;
	private String content;
	private String contents;
	private String originalFileName;
	private String renamedFileName;
	public MailMitVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MailMitVo(String tomail, String title, String content, String contents, String originalFileName,
			String renamedFileName) {
		super();
		this.tomail = tomail;
		this.title = title;
		this.content = content;
		this.contents = contents;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
	}
	public String getTomail() {
		return tomail;
	}
	public void setTomail(String tomail) {
		this.tomail = tomail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenamedFileName() {
		return renamedFileName;
	}
	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}
	@Override
	public String toString() {
		return "MailVo [tomail=" + tomail + ", title=" + title + ", content=" + content + ", contents=" + contents
				+ ", originalFileName=" + originalFileName + ", renamedFileName=" + renamedFileName + "]";
	}
	
	
	
}
