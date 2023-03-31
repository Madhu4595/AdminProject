package com.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.Transactions;
import com.app.repo.TransactionsRepo;
import com.app.service.ITransactionsService;

@Service
public class TransactionsServiceImpl implements ITransactionsService{
	
	@Autowired private TransactionsRepo repo;

	@Override
	public Transactions save(Transactions transaction) {
		return repo.save(transaction);
	}

	@Override
	public Transactions getById(Integer request_no) {
		return repo.getById(request_no);
	}

	@Override
	public boolean transactionExists(Integer request_no) {
		return repo.existsById(request_no);
	}

}
