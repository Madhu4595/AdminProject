package com.app.repo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.Employee_allowance;

public interface Employee_allowanceRepo extends JpaRepository<Employee_allowance, Integer>{
	
	@Query(value="SELECT * FROM public.emp_allowance where amount_approved is null", nativeQuery = true)
	List<Employee_allowance> getEmpAllowWhereAmtApprIsnull();
	
	@Query(value="SELECT * FROM emp_allowance where request_no >= :approval_from and request_no <= :approval_to and amount_approve>0 order by request_no", nativeQuery = true)
	public List<Employee_allowance> getallowancesinrange(Integer approval_from, Integer approval_to);
	
	@Transactional
	@Modifying   
	@Query(value = "update emp_allowance set amount_approve=:amount_approve,amount_approve1 =:amount_approve1,amount_approve2=:amount_approve2 where request_no= :request_no order by request_no", nativeQuery = true)
	public void updateEA(Integer amount_approve,Integer amount_approve1,Integer amount_approve2,Integer request_no);
	
	@Query(value="SELECT * FROM public.emp_allowance where siodate = :siodate", nativeQuery = true)
	public Employee_allowance findBySO(String siodate);
	
	//notesheet
	@Query(value="SELECT * FROM public.emp_allowance order by code", nativeQuery = true)
	public List<Employee_allowance> getAllAllowancesForNS();
	
	
	

}
