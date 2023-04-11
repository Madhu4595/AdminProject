package com.app.service;

import java.util.List;

import com.app.entity.GEM;

public interface GEM_Service {
	
	public GEM saveGEM(GEM gem);
	
	public GEM getGEMById(String requestno);
	public List<GEM> getAllGEMs();
	
	public void deleteGEMById(String requestno);
	
	public boolean isGEM_Exists(String requestno);

}
