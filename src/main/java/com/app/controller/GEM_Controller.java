package com.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.GEM;
import com.app.service.GEM_Service;

@Controller
public class GEM_Controller {

	@Autowired
	private GEM_Service service;
	@Autowired
	private HomeRestController homeRestController;
	
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
			gem.setRecord_status("New Entry");
			gem.setType("V");
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
			GEM oldGem = service.getGEMById(gem.getRequestno());
			oldGem.setMonthYear(gem.getMonthYear());
			oldGem.setPeriod(gem.getPeriod());
			oldGem.setBillno(gem.getBillno());
			oldGem.setBilldate(gem.getBilldate());
			oldGem.setAmount(gem.getAmount());
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
			GEM gem =  service.getGEMById(requestno);
			gem.setRecord_status("NS");
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
			boolean find = homeRestController.checkSO(SONum);
			System.out.println("/generateGEMVehicleSOPrint===> finddddddddd=> "+find);
			
			if(find) {
				model.addAttribute("msg", "Sanction Order Number is ALREADY ALLOCATED!!!");
				return "gemVehicleSOForm";
			}
			GEM oldGem = service.getGEMById(requestno);
			oldGem.setSONum(SONum);
			oldGem.setRecord_status("SO");
			GEM updatedGem = service.saveGEM(oldGem);
			model.addAttribute("gem", updatedGem);
			return "SOs/generateGEMVehicleSOPrint";
		} catch (Exception e) {
			model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
			return "home";

		}
		
	}
	
	
	//GEM Outsourcing NEW
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
			gem.setRecord_status("New Entry");
			gem.setType("O");
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
			return "gemVehicleEditForm";
		}

		@RequestMapping("/updateGEMOutsourcing")
		public String updateGEMOutsourcing(@ModelAttribute("gem") GEM gem, Model model) {
			System.out.println("/updateGEM==>");
			System.out.println("gem==> " + gem.toString());
			String msg = "";

			try {
				GEM oldGem = service.getGEMById(gem.getRequestno());
				oldGem.setMonthYear(gem.getMonthYear());
				oldGem.setPeriod(gem.getPeriod());
				oldGem.setBillno(gem.getBillno());
				oldGem.setBilldate(gem.getBilldate());
				oldGem.setAmount(gem.getAmount());
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
		public String generateGEMOutsourceNoteSheet(@RequestParam("requestno") String requestno, Model model) {
			System.out.println("/generateGEMOutsourceNoteSheet==> requestno===> "+requestno);
			try {
				GEM gem =  service.getGEMById(requestno);
				gem.setRecord_status("NS");
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
		public String generateGEMOutsourceSOPrint(@RequestParam("requestno") String requestno,
				@RequestParam("SONum") String SONum,Model model) {
			
			System.out.println("/generateGEMOutsourceSOPrint==> requestno===> "+requestno);
			System.out.println("/generateGEMOutsourceSOPrint==> SONum===> "+SONum);
			
			try {
				boolean find = homeRestController.checkSO(SONum);
				System.out.println("/generateGEMVehicleSOPrint===> finddddddddd=> "+find);
				
				if(find) {
					model.addAttribute("msg", "Sanction Order Number is ALREADY ALLOCATED!!!");
					return "gemVehicleSOForm";
				}
				GEM oldGem = service.getGEMById(requestno);
				oldGem.setSONum(SONum);
				oldGem.setRecord_status("SO");
				GEM updatedGem = service.saveGEM(oldGem);
				model.addAttribute("gem", updatedGem);
				return "SOs/generateGEMOutsourceSOPrint";
			} catch (Exception e) {
				model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
				return "home";

			}
			
		}
		
	

}
