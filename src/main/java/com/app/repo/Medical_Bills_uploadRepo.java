package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.Medical_Bills_upload;


public interface Medical_Bills_uploadRepo extends JpaRepository<Medical_Bills_upload, Integer>{

	@Query(value="SELECT * FROM public.medical_bills_upload where request_no >= :approval_from and request_no <= :approval_to and tot_amount_approved is not null", nativeQuery = true)
	public List<Medical_Bills_upload> getbillsinrange(Integer approval_from, Integer approval_to);
	
	@Query(value="SELECT * FROM public.medical_bills_upload", nativeQuery = true)
	public List<Medical_Bills_upload> helprequestnosearch();
	
	@Query(value="SELECT * FROM public.medical_bills_upload where siodate = :siodate", nativeQuery = true)
	public Medical_Bills_upload findBySO(String siodate);
}
