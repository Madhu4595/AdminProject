package com.app.controller;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.Employee;
import com.app.entity.GPF;
import com.app.repo.GPF_Repo;
import com.app.service.IEmployeeService;

@Controller
public class GPF_Controller {
	
	@Autowired private GPF_Repo gpf_repo;
	@Autowired private IEmployeeService employeeService;
	
	//WithDraw
	//New
	@RequestMapping("/gpfWithDrawForm")
	public String gpfWithDrawForm(Model model) {
		model.addAttribute("gpf", new GPF());
		return "gpfWithDrawForm";
	}
	@RequestMapping("/saveWithDrawGpf")
	public String saveGpf(@ModelAttribute("gpf") GPF gpf, Model model) {
		System.out.println("/saveGpf=> gpf=> "+gpf.toString());
		
		try {
			gpf.setType("withdraw");
			gpf.setEntryDate(LocalDateTime.now());
			gpf.setNoteStatus(false);
			gpf.setSanctionStatus(false);
			
			GPF savedGPF = gpf_repo.save(gpf);
			model.addAttribute("msg", "Given GPF Details are Saved Successfully with ID: "+savedGPF.getRequestNo());
			
			return "home";
			
		}catch(Exception e) {
			System.out.println("exception from /saveGpf=> ");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
			
		}
	}
	//Modify
	@RequestMapping("/gpfWithDrawEditForm")
	public String gpfWithDrawEditForm(Model model) {
		model.addAttribute("gpf", new GPF());
		return "gpfWithDrawEditForm";
	}
	@RequestMapping("/updateGpf")
	public String updateGpf(@ModelAttribute("gpf") GPF gpf, Model model) {
		System.out.println("/saveGpf=> gpf=> "+gpf.toString());
		
		try {
			GPF oldGPF = gpf_repo.findById(gpf.getRequestNo()).get();
			
			oldGPF.setGpfNo(gpf.getGpfNo());
			oldGPF.setPurpose(gpf.getPurpose());
			oldGPF.setWithDrawAmt(gpf.getWithDrawAmt());
			oldGPF.setNetBalance(gpf.getNetBalance());
			oldGPF.setEditDate(LocalDateTime.now());
			gpf_repo.save(oldGPF);
			
			model.addAttribute("msg", "Given GPF Details are Updated Successfully");
			return "home";
			
		}catch(Exception e) {
			System.out.println("exception from /saveGpf=> ");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
			
		}
	}

	//Note Sheet
	@RequestMapping("/gpfWithDrawNSForm")
	public String gpfWithDrawNSForm() {
		return "gpfWithDrawNSForm";
	}
	
	@RequestMapping("/generateGPFWithdrawNS")
	public String generateGPFWithdrawNS(@RequestParam String requestNo,Model model) {
		System.out.println("/generateGPFWithdrawNS=> requestno=>"+requestNo);
		try {
			System.out.println("/generateGPFWithdrawNS=> try block=>");
			
			GPF oldGPF = gpf_repo.findById(requestNo).get();
			System.out.println("oldGPF=> "+oldGPF.toString());
			
			oldGPF.setNoteStatus(true);
			oldGPF.setNoteNumber(Integer.parseInt(requestNo.substring(3)));
			oldGPF.setNsDate(LocalDateTime.now());
			
			GPF updatedGPF = gpf_repo.save(oldGPF);
			System.out.println("updatedGPF=> "+updatedGPF.toString());
			
			Employee emp = employeeService.getById(updatedGPF.getEmpCode());
			System.out.println("emp=> "+emp.toString());
			
			model.addAttribute("gpf", updatedGPF);
			model.addAttribute("emp", emp);
			
			return "NSs/generateGPFWithdrawNS";
		}catch(Exception e) {
			System.out.println("Exception from => generateGPFWithdrawNS");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
		}
		
	}
	
	//Sanction Order
	@RequestMapping("/gpfWithdrawSOForm")
	public String gpfWithdrawSOForm() {
		return "gpfWithdrawSOForm";
	}
	
	@RequestMapping("/generateGPFWithdrawSOPrint")
	public String generateGPFWithdrawSOPrint(
			@RequestParam("requestNo") String requestNo, 
			@RequestParam("sanctionNumber") String sanctionNumber, 
			Model model ) {
		System.out.println("generateGPFWithdrawSOPrint=> requestNo=> "+requestNo);
		System.out.println("generateGPFWithdrawSOPrint=> soNum=> "+sanctionNumber);
		
		try {
			System.out.println("generateGPFWithdrawSOPrint=> in try block=> ");
		 
				GPF oldGPF = gpf_repo.getGPFWithdrawForSO(requestNo);
				oldGPF.setSanctionNumber(sanctionNumber);
				oldGPF.setSanctionStatus(true);
				oldGPF.setSoDate(LocalDateTime.now());
				
				GPF updatedGPF = gpf_repo.save(oldGPF);
				
				Employee emp = employeeService.getById(updatedGPF.getEmpCode());
				System.out.println("emp=> "+emp.toString());
				
				model.addAttribute("gpf", updatedGPF);
				model.addAttribute("emp", emp);
				
				return "SOs/generateGPFWithdrawSOPrint";
			
		}catch(Exception e) {
			System.out.println("Exception from => generateGPFWithdrawNS");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
		}
		
	}
	
	//=============Sanction Ordr Print=============
	@RequestMapping("/getGPFWithdrawSOPrint")
	public String getGPFWithdrawSOPrint(
			@RequestParam("requestNo") String requestNo,
			Model model ) {
		System.out.println("getGPFWithdrawSOPrint=> sanctionNumber=> "+requestNo);
		try {
			System.out.println("generateGPFWithdrawSOPrint=> in try block=> ");
		 
				Optional<GPF> oldGPF = gpf_repo.findById(requestNo);
				Employee emp = employeeService.getById(oldGPF.get().getEmpCode());
				System.out.println("emp=> "+emp.toString());
				
				model.addAttribute("gpf", oldGPF.get());
				model.addAttribute("emp", emp);
				
				return "SOs/generateGPFWithdrawSOPrint";
			
		}catch(Exception e) {
			System.out.println("Exception from => generateGPFWithdrawNS");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
		}
		
	}
	
	//====================GPF=======Withdraw=================
	@RequestMapping("/gpfWithdrawNSPrint")
	public String gpfWithdrawNSPrint() {
		return "NSsPrintForms/gpfWithdrawNSPrint";
	}
	@RequestMapping("/generateGPFWithdrawNSPrint")
	public String generateGPFWithdrawNSPrint(@RequestParam String requestNo,Model model) {
		System.out.println("/generateGPFWithdrawNS=> requestno=>"+requestNo);
		try {
			System.out.println("/generateGPFWithdrawNS=> try block=>");
			
			GPF oldGPF = gpf_repo.findById(requestNo).get();
			Employee emp = employeeService.getById(oldGPF.getEmpCode());
			System.out.println("emp=> "+emp.toString());
			
			model.addAttribute("gpf", oldGPF);
			model.addAttribute("emp", emp);
			
			return "NSsPrints/generateGPFWithdrawNSPrints";
		}catch(Exception e) {
			System.out.println("Exception from => generateGPFWithdrawNS");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
		}
		
	}
		
	@RequestMapping("/gpfWithdrawSOPrint")
	public String gpfWithdrawSOPrint() {
		return "SOsPrintsForms/gpfWithdrawSOPrint";
	}
	@RequestMapping("/getGPFWithdrawSOPrints")
	public String getGPFWithdrawSOPrints(
			@RequestParam("requestNo") String requestNo,
			Model model ) {
		System.out.println("getGPFWithdrawSOPrint=> sanctionNumber=> "+requestNo);
		try {
			System.out.println("generateGPFWithdrawSOPrint=> in try block=> ");
		 
				Optional<GPF> oldGPF = gpf_repo.findById(requestNo);
				Employee emp = employeeService.getById(oldGPF.get().getEmpCode());
				System.out.println("emp=> "+emp.toString());
				
				model.addAttribute("gpf", oldGPF.get());
				model.addAttribute("emp", emp);
				
				return "SOsPrints/generateGPFWithdrawSOPrints";
				//return "SOs/generateGPFWithdrawSOPrint";
			
		}catch(Exception e) {
			System.out.println("Exception from => generateGPFWithdrawNS");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
		}
		
	}
}
