package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.empapplyforms.EmpGPFApplyForm;

public interface EmpGPFApplyFormRepo  extends JpaRepository<EmpGPFApplyForm, Long>{

	List<EmpGPFApplyForm> findByEmpCode(Integer empCode);
 }
