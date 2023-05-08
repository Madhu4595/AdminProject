package com.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

	@RequestMapping("/empNSForm")
	public String empNSForm() {
		return "empNSForm";
	}
	
	@RequestMapping("/empNSPrint")
	public String empNSPrint(HttpServletRequest request) {
		
		System.out.println("requestNo==> "+request.getParameter("requestno"));
		System.out.println("code==> "+request.getParameter("codeList"));
		System.out.println("name_class_of_childList==> "+request.getParameter("name_class_of_childList"));
		System.out.println("amount_claimedList==> "+request.getParameter("amount_claimedList"));
		System.out.println("amount_approvedList==> "+request.getParameter("amount_approvedList"));
		
		
		return "NSs/empNSPrint";
	}
}
