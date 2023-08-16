package com.app.service.impl;

import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.app.dto.UserRegistrationDto;
import com.app.entity.AppUser;
import com.app.entity.Roles;
import com.app.repo.AppUserRepo;
import com.app.service.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	private AppUserRepo appUserRepo;
	@Autowired private BCryptPasswordEncoder passwordEncoder;
	
	public UserServiceImpl(AppUserRepo appUserRepo) {
		super();
		this.appUserRepo = appUserRepo;
	}

	@Override
	public AppUser save(UserRegistrationDto userRegistrationDto) {
		
		AppUser user = new AppUser(
				userRegistrationDto.getFirstName(),
				userRegistrationDto.getLastName(),
				userRegistrationDto.getEmail(),
				passwordEncoder.encode(userRegistrationDto.getPassword()),
				Arrays.asList(new Roles("ROLE_DD"))
				);
		
		return appUserRepo.save(user);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("UserServiceImpl=> loadUserByUsername=>username=>"+username);
		AppUser user = appUserRepo.findByEmail(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("Invalid Email and Password "+username);
		}
		return new User(user.getEmail(), user.getPassword(), mapRolesToAuthorities(user.getRoles()));
	}
	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Roles> roles){
		return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}

}

