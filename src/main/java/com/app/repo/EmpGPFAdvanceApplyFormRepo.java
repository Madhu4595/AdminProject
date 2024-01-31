package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.empapplyforms.EmpGPFAdvanceApplyForm;

public interface EmpGPFAdvanceApplyFormRepo extends JpaRepository<EmpGPFAdvanceApplyForm, Long>{
List<EmpGPFAdvanceApplyForm> findByEmpCode(Integer empCode);
 }
