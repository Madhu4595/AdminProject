package com.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.LTC;
import com.app.repo.LTCRepo;
import com.app.service.LTCService;
@Service
public class LTCServiceImpl implements LTCService{
	
	@Autowired private LTCRepo repo;

	@Override
	public LTC save(LTC ltc) {
		// TODO Auto-generated method stub
		return repo.save(ltc);
	}

	@Override
	public LTC getLTCById(String requestno) {
		// TODO Auto-generated method stub
		return repo.findById(requestno).get();
	}

	@Override
	public List<LTC> getAll() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public void deleteById(String requestno) {
		// TODO Auto-generated method stub
		repo.deleteById(requestno);
	}

	@Override
	public boolean exists(String requestno) {
		// TODO Auto-generated method stub
		return repo.existsById(requestno);
	}


}
