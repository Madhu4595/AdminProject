package com.app.repo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.app.entity.AppUser;

@Repository
public interface AppUserRepo extends JpaRepository<AppUser, Long>{
	
	AppUser findByEmail(String email);

	@Query(value = "select * from appusers where id not in('1')",nativeQuery = true)
	List<AppUser> getEmpDetails();
	
	@Transactional
	@Modifying
	@Query(value="update appusers set password=:pwd where id=:id",nativeQuery = true)
	int updatePwdDetails(Long id, String pwd);
}
