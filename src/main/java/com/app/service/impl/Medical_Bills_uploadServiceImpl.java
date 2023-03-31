package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Medical_Bills_upload;
import com.app.repo.Medical_Bills_uploadRepo;
import com.app.service.IMedical_Bills_uploadService;

@Service
public class Medical_Bills_uploadServiceImpl implements IMedical_Bills_uploadService{
	
	@Autowired private Medical_Bills_uploadRepo repo;

	@Override
	public Medical_Bills_upload saveMedical_Bills_upload(Medical_Bills_upload bills_upload) {
		return repo.save(bills_upload);
	}

	@Override
	public Medical_Bills_upload getById(Integer request_no) {
		return repo.getById(request_no);
	}
}
