package com.app.service;

import java.util.List;

import com.app.entity.Type_of_allowances;


public interface IType_of_allowancesServices {
	public List<Type_of_allowances> getAllAllow();
	public Type_of_allowances getAllowById(Integer id);

}
