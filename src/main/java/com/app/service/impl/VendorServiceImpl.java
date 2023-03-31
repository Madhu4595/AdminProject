package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Vendor;
import com.app.repo.VendorRepo;
import com.app.service.IVendorService;

@Service
public class VendorServiceImpl implements IVendorService{
	
	@Autowired private VendorRepo repo;

	@Override
	public Vendor saveVendor(Vendor vendor) {
		return repo.save(vendor);
	}

	@Override
	public Vendor getById(String code) {
		return repo.getById(code);
	}

	@Override
	public Boolean existOrNot(String code) {
		// TODO Auto-generated method stub
		return repo.existsById(code);
	}

	 

}
