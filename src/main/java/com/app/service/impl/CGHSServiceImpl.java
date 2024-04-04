package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.CGHS;
import com.app.repo.CGHSRepo;
import com.app.service.CGHSService;

@Service
public class CGHSServiceImpl implements CGHSService{

	@Autowired private CGHSRepo cGHSRepo;
	
	@Override
	public List<CGHS> getAllCghs() {
		// TODO Auto-generated method stub
		return cGHSRepo.findAll();
	}
}
