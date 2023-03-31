package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Type_of_allowances;
import com.app.repo.Type_of_allowancesRepo;
import com.app.service.IType_of_allowancesServices;


@Service
public class Type_of_allowancesServiceImpl implements IType_of_allowancesServices{
	
	@Autowired private Type_of_allowancesRepo repo;

	@Override
	public List<Type_of_allowances> getAllAllow() {
		return repo.findAll();
	}

	@Override
	public Type_of_allowances getAllowById(Integer id) {
		return repo.getById(id);
	}
	
	

}
