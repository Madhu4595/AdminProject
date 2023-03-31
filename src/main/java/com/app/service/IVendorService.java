package com.app.service;

import com.app.entity.Vendor;

public interface IVendorService {

	public Vendor saveVendor(Vendor vendor);
	public Vendor getById(String code);
	public Boolean existOrNot(String code);
}
