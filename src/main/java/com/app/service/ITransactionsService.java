package com.app.service;

import com.app.entity.Transactions;

public interface ITransactionsService {
	
	public Transactions save(Transactions transaction);
	public Transactions getById(Integer request_no);
	public boolean transactionExists(Integer request_no);

}
