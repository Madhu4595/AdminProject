package com.app.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.app.dto.UserRegistrationDto;
import com.app.entity.AppUser;

public interface UserService extends UserDetailsService{
	
	AppUser save(UserRegistrationDto userRegistrationDto);

}
