package com.app.service;

import com.app.entity.Medical_Bills_upload;

public interface IMedical_Bills_uploadService {
	
	public Medical_Bills_upload saveMedical_Bills_upload(Medical_Bills_upload bills_upload);
	public Medical_Bills_upload getById(Integer request_no);

}
