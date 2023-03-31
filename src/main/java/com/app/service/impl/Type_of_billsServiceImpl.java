package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Type_of_bills;
import com.app.repo.Type_of_billsRepo;
import com.app.service.Type_of_billsService;

@Service
public class Type_of_billsServiceImpl implements Type_of_billsService{
	
	@Autowired private Type_of_billsRepo repo;

	@Override
	public Type_of_bills getById(Integer tid) {
		return repo.getById(tid);
		
	}
}
