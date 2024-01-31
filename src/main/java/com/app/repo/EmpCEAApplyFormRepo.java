package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.empapplyforms.EmpCEAApplyForm;

public interface EmpCEAApplyFormRepo  extends JpaRepository<EmpCEAApplyForm, Long>{
	
	List<EmpCEAApplyForm> findByEmpCode(Integer empCode);

}
