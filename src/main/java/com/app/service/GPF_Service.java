package com.app.service;

import java.util.List;

import com.app.entity.GPF;


public interface GPF_Service {

	public GPF saveGEM(GPF gpf);
	
	public GPF getGEMById(String requestno);
	public List<GPF> getAllGEMs();
	
	public void deleteGEMById(String requestno);
	
	public boolean isGEM_Exists(String requestno);
}
