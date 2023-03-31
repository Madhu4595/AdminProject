package com.app.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.entity.Vendor;


public interface VendorRepo extends JpaRepository<Vendor, String>{

}
