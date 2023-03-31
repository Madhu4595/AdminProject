package com.app.service;

import java.util.List;

import com.app.entity.LTC;


public interface LTCService {
	
	public LTC save(LTC ltc);
	
	public LTC getLTCById(String requestno);
	public List<LTC> getAll();
	
	public void deleteById(String requestno);
	
	public boolean exists(String requestno);
	

}
