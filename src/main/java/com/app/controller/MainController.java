package com.app.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.AuthenticationRequest;
import com.app.entity.AppUser;
import com.app.entity.Roles;
import com.app.repo.AppUserRepo;


@Controller
public class MainController {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	private AppUserRepo appUsersRepo;
	
	
	@RequestMapping("/login")
	public String login(@ModelAttribute AuthenticationRequest authenticationRequest) {
		System.out.println("/login===> "+authenticationRequest.toString());
		try {
			System.out.println("authenticate");
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(),
					authenticationRequest.getPassword()));
			System.out.println("aaaaaaaaaaaaaaaaaa");
		} catch (BadCredentialsException e) {
			//e.printStackTrace();
			System.out.println("Exception is ==============> Bad Credentials");
		}
		return "login";
	}
	
	@RequestMapping("/")
	public String home(HttpSession session) {
		System.out.println("11111111111111111111111");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		//System.out.println("login=======> "+email);
		
		AppUser user = appUsersRepo.findByEmail(email);
		//System.out.println("user===> "+user.toString());
		
		Collection<Roles> roles = user.getRoles();
		roles.stream().forEach(a-> session.setAttribute("role", a.getName()));
		//System.out.println("role===>"+session.getAttribute("role"));
		return "home";
	}
	
	@RequestMapping("/testt")
	public String test() {
		System.out.println("asdfasdfasdfasdfsadf");
		return "NewFile";
	}
	 
	 
}

