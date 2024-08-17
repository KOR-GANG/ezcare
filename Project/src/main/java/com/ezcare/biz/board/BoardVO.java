package com.ezcare.biz.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private List<MultipartFile> multiFileList;

	public List<MultipartFile> getUploadFileList() {
		return multiFileList;
	}

	public void setUploadFile(List<MultipartFile> multiFileList) {
		this.multiFileList = multiFileList;
	}
	
}
