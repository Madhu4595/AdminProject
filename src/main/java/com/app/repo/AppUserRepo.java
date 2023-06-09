package com.app.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.entity.AppUser;

@Repository
public interface AppUserRepo extends JpaRepository<AppUser, Long>{
	
	AppUser findByEmail(String email);

}
