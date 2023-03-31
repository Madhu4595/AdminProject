package com.app.service;

import com.app.entity.Bills_Upload;

public interface IBills_UploadService {
	
	public Bills_Upload saveBills_Upload(Bills_Upload b_Upload);
	public Bills_Upload getById(Integer request_no);

}
