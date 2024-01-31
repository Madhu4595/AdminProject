package com.app.controller;


import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.entity.BriefCase;
import com.app.repo.BriefCaseRepo;
import com.app.repo.EmployeeRepo;

@Controller
public class BriefCaseController {
	
	@Autowired private BriefCaseRepo briefCaseRepo;
	@Autowired private EmployeeRepo employeeRepo;
	
	
	@RequestMapping("/briefcaseForm")
	public String briefForm(Model model) {
		model.addAttribute("briefcase", new BriefCase());
		return "briefcaseForm";
	}
	
	@RequestMapping("/saveBriefCase")
	public String saveBriefCase(@ModelAttribute("briefcase") BriefCase briefcase,RedirectAttributes redirectAttributes) {
		System.out.println("briefcase=>"+briefcase.toString());
		
		briefcase.setEntryDate(LocalDateTime.now());
		briefcase.setNoteStatus(false);
		briefcase.setSanctionStatus(false);
		
		BriefCase bean = briefCaseRepo.save(briefcase);
		redirectAttributes.addFlashAttribute("msg", "BriefCase Details are Saved Successfully with ID:"+bean.getRequestno());
		
		return "redirect:/briefcaseForm"; 
	}
	
	@RequestMapping("/briefcaseNSForm")
	public String briefcaseNSForm() {
		return "/briefcaseNSForm";
	}
	
	@RequestMapping("/findbriefcase")
	public String findbriefcase(@RequestParam String requestnoo,@RequestParam String notesheet,RedirectAttributes redirectAttributes) {
		System.out.println("findbriefcase=requestno=>"+requestnoo);
		System.out.println("findbriefcase=notesheet=>"+notesheet);
		
		Optional<BriefCase> bean = briefCaseRepo.findById(requestnoo);
		
		if(notesheet.equals("NS")) {
			System.out.println("NS=>if");
			if(bean.isPresent()) {
				if(bean.get().getNoteStatus()) {
					redirectAttributes.addFlashAttribute("msg", "This request number is already approved and notesheet generated.");
				}else {
					redirectAttributes.addFlashAttribute("open", true);
					redirectAttributes.addFlashAttribute("bean", bean.get());
				}
			}else {
				redirectAttributes.addFlashAttribute("msg", "No data found with given request number");
			}
			return "redirect:/briefcaseNSForm";
			
		}
		
		if(notesheet.equals("SO")) {
			if(bean.isPresent()) {
				
				if(bean.get().getNoteStatus()) {
					if(bean.get().getSanctionStatus()) {
						redirectAttributes.addFlashAttribute("msg", "This request number sanction order already generated.");
					}else {
						redirectAttributes.addFlashAttribute("open", true);
						redirectAttributes.addFlashAttribute("bean", bean.get());
					}
					
				}else {
					redirectAttributes.addFlashAttribute("msg", "This request number is not approved.");
				}
				
			}else {
				redirectAttributes.addFlashAttribute("msg", "No data found with given request number");
			}
			return "redirect:/briefcaseSOForm";
		}
		if(notesheet.equals("EDIT")) {
			if(bean.isPresent()) {
				if(bean.get().getNoteStatus()) {
					redirectAttributes.addFlashAttribute("msg", "This request number is already approved and notesheet generated.");
				}else {
					redirectAttributes.addFlashAttribute("open", true);
					redirectAttributes.addFlashAttribute("bean", bean.get());
				}
				
			}else {
				redirectAttributes.addFlashAttribute("msg", "No data found with given request number");
			}
			return "redirect:/briefcaseEditForm";
		}
		return null;
	}
	
	
	@RequestMapping(value="/generateBriefNSPrint", method = RequestMethod.POST)
	public String generateBriefNSPrint(HttpServletRequest request,Model model,RedirectAttributes redirectAttributes) {
		String requestno = request.getParameter("requestno");
		String amountApproved = request.getParameter("amountApproved");
		System.out.println("generateBriefNSPrint=>requestno=>"+requestno);
		System.out.println("generateBriefNSPrint=>amountApproved=>"+amountApproved);
		
		Optional<BriefCase> bean = briefCaseRepo.findById(requestno);
		if(bean.isPresent()) {
			
			bean.get().setAmountApproved(amountApproved);
			bean.get().setNsDate(LocalDateTime.now());
			bean.get().setNoteNumber(requestno);
			bean.get().setNoteStatus(true);
			
			BriefCase savedBean =  briefCaseRepo.save(bean.get());
			model.addAttribute("bean", savedBean);
			model.addAttribute("emp", employeeRepo.findById(bean.get().getEmpCode()).get());
			
			Date date = new Date();  
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
			String todaydate=formatter.format(date);
			model.addAttribute("todaydate", todaydate);
			
			return "/briefcaseNSPrint";
		}else {
			redirectAttributes.addFlashAttribute("msg", "No data found with given request number");
			return "redirect:/briefcaseNSForm";
		}
	}
	
	@RequestMapping("/briefcaseSOForm")
	public String briefcaseSOForm() {
		return "briefcaseSOForm";
	}
	
	@RequestMapping(value="/generateBriefSOPrint", method = RequestMethod.POST)
	public String generateBriefSOPrint(HttpServletRequest request,Model model) {
		String requestno = request.getParameter("requestno");
		String sanctionNumber = request.getParameter("sanctionNumber");
		
		System.out.println("generateBriefNSPrint=>requestno=>"+requestno);
		System.out.println("generateBriefNSPrint=>sanctionNumber=>"+sanctionNumber);
		
		Optional<BriefCase> bean = briefCaseRepo.findById(requestno);
		if(bean.isPresent()) {
			bean.get().setSanctionNumber(sanctionNumber);
			bean.get().setSanctionStatus(true);
			bean.get().setSoDate(LocalDateTime.now());
			
			BriefCase savedBean = briefCaseRepo.save(bean.get());
			model.addAttribute("bean", savedBean);
			model.addAttribute("emp", employeeRepo.findById(bean.get().getEmpCode()).get());
		} 
		
		return "briefcaseSOPrint";
	}
	
	@RequestMapping("/briefcaseNSPrintForm")
	public String briefcaseNSPrintForm(Model model) {
		model.addAttribute("list", briefCaseRepo.findByNoteStatus(true));
		return "briefcaseNSPrintForm";
	}
	
	@RequestMapping("/generatebriefCaseNSPrintPrint")
	public String generatebriefCaseNSPrintPrint(@RequestParam String requestno,Model model) {
		
		Optional<BriefCase> bean = briefCaseRepo.findById(requestno);
		
		if(bean.isPresent()) {
			model.addAttribute("bean", bean.get());
			model.addAttribute("emp", employeeRepo.findById(bean.get().getEmpCode()).get());
		}
		return "briefCaseNSPrintPrint";
	}
	
	@RequestMapping("/briefcaseSOPrintForm")
	public String briefcaseSOPrintForm(Model model) {
		model.addAttribute("list", briefCaseRepo.findBySanctionStatus(true));
		return "briefcaseSOPrintForm";
	}
	
	@RequestMapping("/generatebriefCaseSOPrintPrint")
	public String generatebriefCaseSOPrintPrint(@RequestParam String requestno,Model model) {
		
		Optional<BriefCase> bean = briefCaseRepo.findById(requestno);
		
		if(bean.isPresent()) {
			model.addAttribute("bean", bean.get());
			model.addAttribute("emp", employeeRepo.findById(bean.get().getEmpCode()).get());
		}
		return "briefCaseSOPrintPrint";
	}
	
	@RequestMapping("/briefcaseEditForm")
	public String briefcaseEditForm(Model model) {
		model.addAttribute("briefcase", new BriefCase());
		return "briefcaseEditForm";
	}
	@RequestMapping("/saveEditBriefCase")
	public String saveEditBriefCase(@ModelAttribute("briefcase") BriefCase briefcase,RedirectAttributes redirectAttributes) {
		System.out.println("briefcase=>"+briefcase.toString());
		
		Optional<BriefCase> bean = briefCaseRepo.findById(briefcase.getRequestno());
		if(bean.isPresent()) {
			BriefCase previousBean = bean.get();
			previousBean.setEmpCode(briefcase.getEmpCode());
			previousBean.setInvoiceNo(briefcase.getInvoiceNo());
			previousBean.setInvoiceDate(briefcase.getInvoiceDate());
			previousBean.setAmountClaimed(briefcase.getAmountClaimed());
			previousBean.setShopName(briefcase.getShopName());
			previousBean.setEditDate(LocalDateTime.now());
			briefCaseRepo.save(previousBean);
			
			redirectAttributes.addFlashAttribute("msg", "Brief Case ID:<b style=\"color: blue;\">"+ briefcase.getRequestno() +"</b> details are updated Successfully");
			return "redirect:/briefcaseEditForm";
		}else {
			redirectAttributes.addFlashAttribute("msg", "No data found with given Request Number");
			return "redirect:/briefcaseEditForm";
		}
		
	}

}

