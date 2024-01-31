package com.app.controller;


import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.GEM;
import com.app.repo.GEM_Repo;
import com.app.service.GEM_Service;

@Controller
public class GEM_Controller {

	@Autowired private GEM_Service service;
	@Autowired private GEM_Repo repo;
	
	//GEM Vehicle

	// New
	@RequestMapping("/gemVehicleForm")
	public String gemVehicleForm(Model model) {
		model.addAttribute("gem", new GEM());
		return "gemVehicleForm";
	}

	@RequestMapping("/saveGem")
	public String saveGem(@ModelAttribute("gem") GEM gem, Model model) {
		System.out.println("/saveGem====> " + gem.toString());
		String msg = "";
		try {
			gem.setType("V");
			gem.setNoteStatus(false);
			gem.setSanctionStatus(false);
			gem.setEntryDate(LocalDateTime.now());
			
			GEM savedGEM = service.saveGEM(gem);
			msg = "GEM - Vehicle Details are Added SUCCESSFULLY with Request Number is " + savedGEM.getRequestno();
			model.addAttribute("msg", msg);
			return "home";

		} catch (Exception e) {

			msg = "Something Went Wrong While Saving Details, Please Try Again!!!";
			model.addAttribute("msg", msg);
			return "gemVehicleForm";

		}

	}

	// Modify
	@RequestMapping("/gemVehicleEditForm")
	public String gemVehicleEditForm(Model model) {
		model.addAttribute("gem", new GEM());
		return "gemVehicleEditForm";
	}

	@RequestMapping("/updateGEM")
	public String updateGEM(@ModelAttribute("gem") GEM gem, Model model) {
		System.out.println("/updateGEM==>");
		System.out.println("gem==> " + gem.toString());
		String msg = "";

		try {
			GEM oldGem = repo.getGemVehicleForEdit(gem.getRequestno());
			
			oldGem.setMonthYear(gem.getMonthYear());
			oldGem.setPeriod(gem.getPeriod());
			oldGem.setBillno(gem.getBillno());
			oldGem.setBilldate(gem.getBilldate());
			oldGem.setAmount(gem.getAmount());
			oldGem.setEditDate(LocalDateTime.now());
			
			service.saveGEM(oldGem);
			msg = "GEM - Vehicle Details are Updated SUCCESSFULLY";
			model.addAttribute("msg", msg);
			return "home";
		} catch (Exception e) {

			msg = "Something Went Wrong While Saving Details, Please Try Again!!!";
			model.addAttribute("msg", msg);
			return "gemVehicleForm";

		}

	}

	// Note Sheet
	@RequestMapping("/gemVehicleNoteSheet")
	public String gemVehicleNoteSheet() {
		return "gemVehicleNoteSheetForm";
	}
	@RequestMapping("/generateGEMVehicleNoteSheet")
	public String generateGEMNoteSheet(@RequestParam("requestno") String requestno, Model model) {
		System.out.println("/generateGEMNoteSheet==> requestno===> "+requestno);
		try {
			GEM gem =  repo.getGemVehicleForNS(requestno);
			
			gem.setNoteStatus(true);
			gem.setNoteNumber(Integer.parseInt(requestno.substring(3)));
			gem.setNsDate(LocalDateTime.now());
			
			GEM oldGem = service.saveGEM(gem);
			
			model.addAttribute("oldGem", oldGem);
			
			return "NSs/gemVehicleNoteSheetPrint";
		} catch (Exception e) {
			model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
			return "home";

		}
		
	}
	
	//Sanction Order
	@RequestMapping("/gemVehicleSOForm")
	public String gemVehicleSOForm() {
		return "gemVehicleSOForm";
	}
	
	@RequestMapping("/generateGEMVehicleSOPrint")
	public String generateGEMVehicleSOPrint(@RequestParam("requestno") String requestno,
			@RequestParam("SONum") String SONum,Model model) {
		
		System.out.println("/generateGEMNoteSheet==> requestno===> "+requestno);
		System.out.println("/generateGEMNoteSheet==> SONum===> "+SONum);
		
		try {
			GEM oldGem = repo.getGemVehicleForSO(requestno);
			
			oldGem.setSanctionNumber(SONum);
			oldGem.setSanctionStatus(true);
			oldGem.setSoDate(LocalDateTime.now());
			
			GEM updatedGem = service.saveGEM(oldGem);
			
			model.addAttribute("gem", updatedGem);
			
			return "SOs/generateGEMVehicleSOPrint";
		} catch (Exception e) {
			model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
			return "home";

		}
		
	}
	
	
	//GEM Outsourcing 
	//NEW
	@RequestMapping("/gemOutsourceForm")
	public String gemOutsourceForm(Model model) {
		model.addAttribute("gem", new GEM());
		return "gemOutsourceForm";
	}
	
	@RequestMapping("/saveGemOutsourcing")
	public String saveGemOutsourcing(@ModelAttribute("gem") GEM gem, Model model) {
		System.out.println("/saveGem====> " + gem.toString());
		String msg = "";
		try {
			gem.setType("O");
			gem.setEntryDate(LocalDateTime.now());
			gem.setNoteStatus(false);
			gem.setSanctionStatus(false);
			
			GEM savedGEM = service.saveGEM(gem);
			msg = "GEM - Outsourcing Details are Added SUCCESSFULLY with Request Number is " + savedGEM.getRequestno();
			
			model.addAttribute("msg", msg);
			return "home";
		} catch (Exception e) {
			msg = "Something Went Wrong While Saving Details, Please Try Again!!!";
			model.addAttribute("msg", msg);
			return "gemOutsourceForm";

		}

	}
	
	//GEM Outsourcing EDIT
	// Modify
		@RequestMapping("/gemOutsourceEditForm")
		public String gemOutsourceEditForm(Model model) {
			model.addAttribute("gem", new GEM());
			return "gemOutsourceEditForm";
		}

		@RequestMapping("/updateGEMOutsourcing")
		public String updateGEMOutsourcing(@ModelAttribute("gem") GEM gem, Model model) {
			System.out.println("/updateGEM==>");
			System.out.println("gem==> " + gem.toString());
			String msg = "";

			try {
				GEM oldGem = repo.getGemOutsourceForEdit(gem.getRequestno());
				
				oldGem.setMonthYear(gem.getMonthYear());
				oldGem.setPeriod(gem.getPeriod());
				oldGem.setBillno(gem.getBillno());
				oldGem.setBilldate(gem.getBilldate());
				oldGem.setAmount(gem.getAmount());
				oldGem.setEditDate(LocalDateTime.now());
				
				service.saveGEM(oldGem);
				msg = "GEM - Outsourcing Details are Updated SUCCESSFULLY";
				model.addAttribute("msg", msg);
				return "home";
			} catch (Exception e) {

				msg = "Something Went Wrong While Saving Details, Please Try Again!!!";
				model.addAttribute("msg", msg);
				return "gemVehicleEditForm";

			}

		}
		
		
		//Outsourcing Notesheet
		@RequestMapping("/gemOutsourcingNoteSheet")
		public String gemOutsourcingNoteSheet() {
			return "gemOutsourcingNoteSheetForm";
		}
	
		@RequestMapping("/generateGEMOutsourceNoteSheet")
		public String generateGEMOutsourceNoteSheet(
				@RequestParam("requestno") String requestno, Model model) {
			System.out.println("/generateGEMOutsourceNoteSheet==> requestno===> "+requestno);
			try {
				GEM gem =  repo.getGemOutsourceForNS(requestno);
				
				gem.setNoteStatus(true);
				gem.setNsDate(LocalDateTime.now());
				gem.setNoteNumber(Integer.parseInt(requestno.substring(3)));
				
				GEM oldGem = service.saveGEM(gem);
				
				model.addAttribute("oldGem", oldGem);
				
				return "NSs/generateGEMOutsourceNoteSheet";
			} catch (Exception e) {
				model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
				return "home";

			}
			
		}
		
		//Outsourcing Sanction Order
		@RequestMapping("/gemOutsourcingSOForm")
		public String gemOutsourcingSOForm() {
			return "gemOutsourcingSOForm";
		}
		
		@RequestMapping("/generateGEMOutsourceSOPrint")
		public String generateGEMOutsourceSOPrint(
				@RequestParam("requestno") String requestno,
				@RequestParam("sanctionNumber") String sanctionNumber,
				Model model) {
			
			System.out.println("/generateGEMOutsourceSOPrint==> requestno===> "+requestno);
			System.out.println("/generateGEMOutsourceSOPrint==> SONum===> "+sanctionNumber);
			
			try {
				GEM oldGem = repo.getGemOutsourceForSO(requestno);
				
				oldGem.setSanctionNumber(sanctionNumber);
				oldGem.setSanctionStatus(true);
				oldGem.setSoDate(LocalDateTime.now());
				
				GEM updatedGem = service.saveGEM(oldGem);
				System.out.println("saved successfully=> updatedGem=> "+updatedGem.toString());
				
				model.addAttribute("gem", updatedGem);
				System.out.println("saved successfully=> updatedGem=> ");
				return "SOs/generateGEMOutsourceSOPrint";
			} catch (Exception e) {
				model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong or Already Approved");
				return "home";

			}
			
		}
		
		
		//=======PRINTS====VEHICLE==============NOTESHEET====================================
		@RequestMapping("/gemVehicleNSPrints")
		public String gemVehicleNSPrints() {
			return "NSsPrintForms/gemVehicleNSPrints";
		}
		@RequestMapping("/generateGEMVehicleNSPrints")
		public String generateGEMVehicleNSPrints(@RequestParam("requestno") String requestno, Model model) {
			System.out.println("/generateGEMNoteSheet==> requestno===> "+requestno);
			try {
				GEM gem =  repo.getGemVehicleForNSPrints(requestno);
				model.addAttribute("oldGem", gem);
				return "NSsPrints/gemVehicleNoteSheetPrints";
			} catch (Exception e) {
				model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
				return "home";

			}
			
		}
		//=======PRINTS====OUTSOURCE==============NOTESHEET====================================
				@RequestMapping("/gemOutsourcingNSPrints")
				public String gemOutsourcingNSPrints() {
					return "NSsPrintForms/gemOutsourcingNSPrints";
				}
				@RequestMapping("/generateGEMOutsourceNSPrints")
				public String generateGEMOutsourceNSPrints(@RequestParam("requestno") String requestno, Model model) {
					System.out.println("/generateGEMNoteSheet==> requestno===> "+requestno);
					try {
						GEM gem =  repo.getGemOutsourceNSPrints(requestno);
						model.addAttribute("oldGem", gem);
						return "NSsPrints/generateGEMOutsourceNSPrints";
						//return "NSs/generateGEMOutsourceNoteSheet";
					} catch (Exception e) {
						model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
						return "home";

					}
					
				}
		 
		//=======PRINTS====VEHICLE==============SANCTION ORDER====================================
		@RequestMapping("/gemVehicleSOPrints")
		public String gemVehicleSOPrints() {
			return "SOsPrintsForms/gemVehicleSOPrints";
		}
		@RequestMapping("/generateGEMVehicleSOPrints")
		public String generateGEMVehicleSOPrints(@RequestParam("requestno") String requestno, Model model) {
			
			System.out.println("/generateGEMNoteSheet==> requestno===> "+requestno);
			
			try {
				GEM oldGem = repo.getGemVehicleForSOPrints(requestno);
				model.addAttribute("gem", oldGem);
				return "SOsPrints/generateGEMVehicleSOPrints";
				//return "SOs/generateGEMVehicleSOPrint";
			} catch (Exception e) {
				model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
				return "home";

			}
			
		}
		//=======PRINTS====OUTSOURCE==============SANCTION ORDER====================================
		@RequestMapping("/gemOutsourcingSOPrints")
		public String gemOutsourcingSOPrints() {
			return "SOsPrintsForms/gemOutsourcingSOPrints";
		}
		@RequestMapping("/generateGEMOutsourceSOPrints")
		public String generateGEMOutsourceSOPrints(@RequestParam("requestno") String requestno, Model model) {
			
			System.out.println("/generateGEMOutsourceSOPrint==> requestno===> "+requestno);
			try {
				GEM oldGem = repo.getGemOutsourceSOPrints(requestno);
				model.addAttribute("gem", oldGem);
				return "SOsPrints/generateGEMOutsourceSOPrints";
				//return "SOs/generateGEMOutsourceSOPrint";
			} catch (Exception e) {
				model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong or Already Approved");
				return "home";

			}
			
		}

}
