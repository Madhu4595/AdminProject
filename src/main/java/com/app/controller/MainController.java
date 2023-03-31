package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.AuthenticationRequest;


@Controller
public class MainController {
	
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@RequestMapping("/login")
	public String login(@ModelAttribute AuthenticationRequest authenticationRequest) {
		System.out.println("/login===> "+authenticationRequest.toString());
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
					authenticationRequest.getUsername(), authenticationRequest.getPassword()));
		} catch (BadCredentialsException e) {
			//e.printStackTrace();
			System.out.println("Exception is ==============> Bad Credentials");
		}
		return "login";
	}
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	 
	 
}

