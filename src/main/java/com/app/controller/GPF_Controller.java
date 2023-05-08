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
			
			oldGPF.setNSDate(LocalDateTime.now().toString());
			oldGPF.setRecordStatus("NS");
			
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
	public String generateGPFWithdrawSOPrint(@RequestParam String requestNo, @RequestParam String soNum, Model model ) {
		System.out.println("generateGPFWithdrawSOPrint=> requestNo=> "+requestNo);
		System.out.println("generateGPFWithdrawSOPrint=> soNum=> "+soNum);
		
		try {
			System.out.println("generateGPFWithdrawSOPrint=> in try block=> ");
			
			Optional<GPF> gpf = gpf_repo.findById(requestNo);
			
			if(!gpf.isPresent()) {
				model.addAttribute("msg", "No GPF Details are Found with Given Request Number");
				return "home";
			}else {
				GPF oldGPF = gpf_repo.findById(requestNo).get();
				
				oldGPF.setSODate(LocalDateTime.now().toString());
				oldGPF.setSoNum(soNum);
				oldGPF.setRecordStatus("SO");
				GPF updatedGPF = gpf_repo.save(oldGPF);
				
				Employee emp = employeeService.getById(updatedGPF.getEmpCode());
				System.out.println("emp=> "+emp.toString());
				
				model.addAttribute("gpf", updatedGPF);
				model.addAttribute("emp", emp);
				
				return "SOs/generateGPFWithdrawSOPrint";
			}
			
			
		}catch(Exception e) {
			System.out.println("Exception from => generateGPFWithdrawNS");
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong Please Try Again!!");
			return "home";
		}
		
	}
}
