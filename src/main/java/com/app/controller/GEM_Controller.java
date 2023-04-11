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
	@RequestMapping("/generateGEMNoteSheet")
	public String generateGEMNoteSheet(@RequestParam("requestno") String requestno, Model model) {
		System.out.println("/generateGEMNoteSheet==> requestno===> "+requestno);
		try {
			model.addAttribute("oldGem", service.getGEMById(requestno));
			return "gemVehicleNoteSheetPrint";
		} catch (Exception e) {
			model.addAttribute("msg", "Given Request Number Not Found or Something Went Wrong");
			return "home";

		}
		
	}
	

}
