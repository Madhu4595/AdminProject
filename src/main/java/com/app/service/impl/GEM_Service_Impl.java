package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.GEM;
import com.app.repo.GEM_Repo;
import com.app.service.GEM_Service;
@Service
public class GEM_Service_Impl implements GEM_Service{
	
	@Autowired private GEM_Repo repo;

	@Override
	public GEM saveGEM(GEM gem) {
		// TODO Auto-generated method stub
		return repo.save(gem);
	}

	@Override
	public GEM getGEMById(String requestno) {
		// TODO Auto-generated method stub
		return repo.findById(requestno).get();
	}

	@Override
	public List<GEM> getAllGEMs() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public void deleteGEMById(String requestno) {
		// TODO Auto-generated method stub
		repo.deleteById(requestno);
		
	}

	@Override
	public boolean isGEM_Exists(String requestno) {
		// TODO Auto-generated method stub
		return repo.existsById(requestno);
	}

}
