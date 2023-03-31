package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.Transactions;


public interface TransactionsRepo extends JpaRepository<Transactions, Integer>{

	@Query(value="SELECT * FROM public.transactionss where request_no >= :approval_from and request_no <= :approval_to", nativeQuery = true)
	public List<Transactions> gettransinrange(Integer approval_from, Integer approval_to);
}
