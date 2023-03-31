package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Bills_Upload;
import com.app.repo.Bills_UploadRepo;
import com.app.service.IBills_UploadService;


@Service
public class Bills_UploadServiceImpl implements IBills_UploadService{
	
	@Autowired private Bills_UploadRepo repo;

	@Override
	public Bills_Upload saveBills_Upload(Bills_Upload b_Upload) {
		return repo.save(b_Upload);
	}
	
	@Override
	public Bills_Upload getById(Integer request_no) {
		return repo.getById(request_no);
	}

	 
}
