package com.oyr.webapp.dto;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardDto {
	private int boardId;
	private String userSeq;
	private String userName;

	private String title;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date regDt;
	private int readCount;

	private List<BoardFileDto> fileList;

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public List<BoardFileDto> getFileList() {
		return fileList;
	}

	public void setFileList(List<BoardFileDto> fileList) {
		this.fileList = fileList;
	}

	/*
	 * private int boardId; private String userSeq; private String userName;
	 * 
	 * private String title; private String content;
	 * 
	 * @JsonFormat(pattern = "yyyy-MM-dd hh:mm") private Date regDt; private int
	 * readCount;
	 * 
	 * private int fileId; private String fileName; private long fileSize; private
	 * String fileContentType;
	 * 
	 * @Override public String toString() { return "BoardDto [boardId=" + boardId +
	 * ", userSeq=" + userSeq + ", userName=" + userName + ", title=" + title +
	 * ", content=" + content + ", regDt=" + regDt + ", readCount=" + readCount +
	 * ", fileId=" + fileId + ", fileName=" + fileName + ", fileSize=" + fileSize +
	 * ", fileContentType=" + fileContentType + "]"; } public int getBoardId() {
	 * return boardId; } public void setBoardId(int boardId) { this.boardId =
	 * boardId; } public String getUserSeq() { return userSeq; } public void
	 * setUserSeq(String userSeq) { this.userSeq = userSeq; } public String
	 * getUserName() { return userName; } public void setUserName(String userName) {
	 * this.userName = userName; } public String getTitle() { return title; } public
	 * void setTitle(String title) { this.title = title; } public String
	 * getContent() { return content; } public void setContent(String content) {
	 * this.content = content; } public Date getRegDt() { return regDt; } public
	 * void setRegDt(Date regDt) { this.regDt = regDt; } public int getReadCount() {
	 * return readCount; } public void setReadCount(int readCount) { this.readCount
	 * = readCount; } public int getFileId() { return fileId; } public void
	 * setFileId(int fileId) { this.fileId = fileId; } public String getFileName() {
	 * return fileName; } public void setFileName(String fileName) { this.fileName =
	 * fileName; } public long getFileSize() { return fileSize; } public void
	 * setFileSize(long fileSize) { this.fileSize = fileSize; } public String
	 * getFileContentType() { return fileContentType; } public void
	 * setFileContentType(String fileContentType) { this.fileContentType =
	 * fileContentType; }
	 */

}