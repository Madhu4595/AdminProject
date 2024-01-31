package com.app.controller;

import java.util.Base64;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.AuthenticationRequest;
import com.app.entity.AppUser;
import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.Roles;
import com.app.repo.AppUserRepo;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;



@Controller
public class MainController {
	
	@Autowired private AuthenticationManager authenticationManager;
	@Autowired private AppUserRepo appUsersRepo;
	@Autowired private Employee_Family_Repo employee_Family_Repo;
	@Autowired private EmployeeRepo employeeRepo;
	
	
	@RequestMapping("/login")
	public String login(@ModelAttribute AuthenticationRequest authenticationRequest,HttpServletRequest request) {
		System.out.println("/login===> "+authenticationRequest.toString());
		try {
			System.out.println("authenticate");
			
			String loginType = request.getParameter("loginType");
			System.out.println("loginType=>"+loginType);
			
			AppUser user = appUsersRepo.findByEmail(authenticationRequest.getUsername());
			System.out.println("user=>"+user);
			
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
	public String home(HttpSession session,Model model) {
		System.out.println("11111111111111111111111");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("login=======> "+email);
		String photo="";
		AppUser user = appUsersRepo.findByEmail(email);
		session.setAttribute("user", user);
		
		Collection<Roles> roles = user.getRoles();
		roles.stream().forEach(a-> session.setAttribute("role", a.getName()));
		System.out.println("role===>"+session.getAttribute("role"));
		
		String role = (String) session.getAttribute("role");
		if(role.equalsIgnoreCase("ROLE_EMP")) {
			Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
			if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
			else { model.addAttribute("msg", "Employee Details or not founded"); }
			System.out.println("emp is--->"+emp.get().getEmpPhoto());
			if(emp.get().getEmpPhoto()==null) {}
			else{photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());}
			model.addAttribute("photo", photo);
			
			List<Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
			System.out.println("empFamily=>"+empFamily.toString());
			model.addAttribute("empFamily", empFamily);
		}
		
		return "home";
	}
	
	@RequestMapping("/loginEmp")
	public String loginEmp(@ModelAttribute AuthenticationRequest authenticationRequest,HttpServletRequest request) {
		System.out.println("/login===> "+authenticationRequest.getUsername());
		try {
			System.out.println("ghkgkgfhg"+authenticationRequest.getPassword());
			AppUser appUser= appUsersRepo.findByEmail(authenticationRequest.getUsername());
			//appUser.getId()
//			if(authenticationRequest.getPassword().equals(appUser.get)) {
//			
//			}
				
				
				authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authenticationRequest.getUsername(),
					authenticationRequest.getUsername()));
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			System.out.println("aaaaaaaaaaaaaaaaaa"+authentication.getName());
			HttpSession session=request.getSession();
			session.setAttribute("name", authenticationRequest.getUsername());
		} catch (BadCredentialsException e) {
			//e.printStackTrace();
			System.out.println("Exception is ==============> Bad Credentials");
			
		}

		return "redirect:/empHome";
	}
	
	
	@RequestMapping("/empHome")
	public String empHome(HttpSession session,Model model) {
		System.out.println("11111111111111111111111");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = ""+session.getAttribute("name");
		System.out.println("login=======> "+email);
		
		AppUser user = appUsersRepo.findByEmail(email);
		session.setAttribute("user", user);
		
		Collection<Roles> roles = user.getRoles();
		roles.stream().forEach(a-> session.setAttribute("role", a.getName()));
		System.out.println("role===>"+session.getAttribute("role"));
		
		String role = (String) session.getAttribute("role");
		if(role.equalsIgnoreCase("ROLE_EMP")) {
			Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
			if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
			else { model.addAttribute("msg", "Employee Details or not founded"); }
			
			String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
			model.addAttribute("photo", photo);
			
			List<Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
			System.out.println("empFamily=>"+empFamily.toString());
			model.addAttribute("empFamily", empFamily);
		}
		
		return "home";
	}
	
	@RequestMapping("/testt")
	public String test() {
		System.out.println("asdfasdfasdfasdfsadf");
		return "Test";
	}
	
	
	 
	 
	 
}

