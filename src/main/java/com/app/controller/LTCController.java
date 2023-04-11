package com.app.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.Employee_allowance;
import com.app.entity.LTC;
import com.app.model.LtcAdvanceTableFamilyDetails;
import com.app.repo.Employee_Family_Repo;
import com.app.repo.Employee_allowanceRepo;
import com.app.repo.LTCRepo;
import com.app.service.IEmployeeService;
import com.app.service.LTCService;

@Controller
public class LTCController {

	@Autowired
	private LTCService service;
	@Autowired
	private IEmployeeService employeeService;
	 
	@Autowired
	private LTCRepo repo;
	@Autowired
	private Employee_allowanceRepo employee_allowanceRepo;
	@Autowired
	private Employee_Family_Repo employee_Family_Repo;
	
	//EL-Encashment

	@RequestMapping("/ltcEnacachment")
	public String ltcEnacachment(Model model) {
		model.addAttribute("ltcEnacachment", new LTC());
		return "ltcEnacachment";
	}

	@RequestMapping("/saveltcEnacachment")
	public String saveltcEnacachment(@ModelAttribute("saveltcEnacachment") LTC ltc, Model model) {
		System.out.println("ltc=> " + ltc.toString());

		String saveltcEnacachmentMsg = "";

		try {
			LTC savedLtc = service.save(ltc);
			saveltcEnacachmentMsg = "LTC - EL Enacachment is Successfully Added with Request No: "
					+ savedLtc.getRequestno() + ".";
			model.addAttribute("msg", saveltcEnacachmentMsg);
		} catch (Exception e) {
			e.printStackTrace();
			saveltcEnacachmentMsg = "LTC - EL Enacachment is not Added, Please Try Again Once";
			model.addAttribute("msg", saveltcEnacachmentMsg);
			return "ltcEnacachment";
		}

		return "home";
	}

	// update
	@RequestMapping("/ltcEnacachmentedit")
	public String ltcEnacachmentedit(Model model) {
		model.addAttribute("ltc", new LTC());
		return "ltcEnacachmentedit";
	}

	@RequestMapping("/updateltcEnacachment")
	public String updateltcEnacachment(@ModelAttribute("updateltc") LTC updateltc, Model model) {

		System.out.println("updateltc=> " + updateltc.toString());

		String saveltcEnacachmentMsg = "";

		try {
			if (service.exists(updateltc.getRequestno())) {
				LTC savedLtc = service.getLTCById(updateltc.getRequestno());
				savedLtc.setBlockyear(updateltc.getBlockyear());
				savedLtc.setLocation(updateltc.getLocation());
				savedLtc.setVisitplace(updateltc.getVisitplace());
				savedLtc.setClaimedfor(updateltc.getClaimedfor());
				savedLtc.setVisitperiod(updateltc.getVisitperiod());
				savedLtc.setLeavedetails(updateltc.getLeavedetails());
				savedLtc.setEncashment(updateltc.getEncashment());
				savedLtc.setAmountadvance(updateltc.getAmountadvance());
				service.save(savedLtc);
				saveltcEnacachmentMsg = "LTC - EL Enacachment is Successfully Updated!";
				model.addAttribute("msg", saveltcEnacachmentMsg);
			} else {
				saveltcEnacachmentMsg = "LTC - EL Enacachment is not Found with Given Request Number";
				model.addAttribute("msg", saveltcEnacachmentMsg);
			}

		} catch (Exception e) {
			e.printStackTrace();
			saveltcEnacachmentMsg = "LTC - EL Enacachment is not Updated, Please Try Again Once";
			model.addAttribute("msg", saveltcEnacachmentMsg);
			return "ltcEnacachment";
		}

		return "home";
	}

	// Notesheet & Sanction Order
	@RequestMapping("/ltcElEnacachmentNotesheet")
	public String ltcElEnacachmentNotesheetForm() {
		return "ltcElEnacachmentNoteSheetForm";
	}

	@RequestMapping("/ltcElEncachementNotesheetPrint")
	public String ltcElEncachementNotesheetPrint(HttpServletRequest request, Model model) {
		System.out.println("ltcElEncachementNotesheetPrint=> requestno=> " + request.getParameter("requestno"));
		System.out.println("ltcElEncachementNotesheetPrint=> action=> " + request.getParameter("action"));
		System.out.println("ltcElEncachementNotesheetPrint=> da=> " + request.getParameter("da"));
		System.out.println("ltcElEncachementNotesheetPrint=> so=> " + request.getParameter("so"));

		String msg = "";
		String sanctionorderno = (String)request.getParameter("so");
		System.out.println("sanctionorderno----------> "+sanctionorderno);

		try {
			
			if(!service.exists(request.getParameter("requestno"))) {
				msg = "No Details Available with your Given Request Number is : "+request.getParameter("requestno");
				model.addAttribute("msg", msg);
				return "ltcElEnacachmentNoteSheetForm";
			}
			
			// notesheet
			if (request.getParameter("action").equalsIgnoreCase("notesheet")) {
				LTC ltc = service.getLTCById(request.getParameter("requestno"));
				Employee emp = employeeService.getById(ltc.getEmpcode());

				model.addAttribute("ltc", ltc);
				model.addAttribute("emp", emp);

				return "ltcElEncachementNotesheetPrint";

			}

			// sanction order
			if (request.getParameter("action").equalsIgnoreCase("sanctionorder")) {
				
				LTC soltc = repo.checkSO(sanctionorderno);
				Employee_allowance empallowance = employee_allowanceRepo.findBySO(sanctionorderno);
				
				if(soltc == null && empallowance == null) {
					
					LTC ltc = service.getLTCById(request.getParameter("requestno"));
					
					Employee emp = employeeService.getById(ltc.getEmpcode());
					ltc.setSanctionorderno(sanctionorderno);
					service.save(ltc);

					model.addAttribute("ltc", ltc);
					model.addAttribute("emp", emp);
					model.addAttribute("da", Integer.parseInt(request.getParameter("da")));
					
					if(ltc.getTotalfare() == null) {
						return "ltcElEncachementSanctionOrderPrint";
					}else {
						//model.addAttribute("empFamily", employee_Family_Service.getAllEmpcode(ltc.getEmpcode()));
						List<LtcAdvanceTableFamilyDetails> list = new ArrayList<LtcAdvanceTableFamilyDetails>();
						int sno = 1;
						
						String[] names = ltc.getClaimedfor().split(",");
						
							for(int j=0; j < names.length; j++) {
								String name1 = names[j];
								System.out.println("name1=====> "+name1);
								if(name1.equalsIgnoreCase("self")) {
									LtcAdvanceTableFamilyDetails self = new LtcAdvanceTableFamilyDetails();
									self.setSno(sno++);
									self.setPer_name(emp.getName());
									self.setRelation(name1);
									self.setAge(String.valueOf(Period.between(LocalDate.parse(emp.getDob(),DateTimeFormatter.ofPattern("d/MM/yyyy")), LocalDate.now()).getYears()+1));
									list.add(self);
								}else {
									LtcAdvanceTableFamilyDetails list2 = new LtcAdvanceTableFamilyDetails();
									Employee_Family empf = employee_Family_Repo.getRelation(ltc.getEmpcode(), name1);
									list2.setSno(sno++);
									list2.setPer_name(empf.getPer_name());
									list2.setRelation(empf.getRelation());
									list2.setAge(String.valueOf(Period.between(LocalDate.parse(empf.getDob()), LocalDate.now()).getYears()+1));
									list.add(list2);
								}
								
								System.out.println("list2======> "+list.size());
							}
						model.addAttribute("list", list);
						return "ltcAdvanceElEncachementSOrderPrint";
					}
				}else {
					msg = "Sanction Order Number is Already available";
					model.addAttribute("msg", msg);
					return "ltcElEnacachmentNoteSheetForm";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			msg = "LTC or Employee Details are not available with given Request Number: "
					+ request.getParameter("requestno") + " OR Something went Wrong!";
			model.addAttribute("msg", msg);

			return "ltcElEnacachmentNoteSheetForm";
		}

		return null;
	}
	
	//Advance Encashment
	@RequestMapping("/ltcAdvanceEnacachment")
	public String ltcAdvanceEnacachment(Model model) {
		model.addAttribute("ltcEnacachment", new LTC());
		return "ltcAdvanceEnacachment";
	}
	
	@RequestMapping("/saveltcadvanceEnacachment")
	public String saveltcadvanceEnacachment(@ModelAttribute("saveltcEnacachment") LTC ltc, Model model) {
		System.out.println("ltc=> " + ltc.toString());

		String saveltcEnacachmentMsg = "";

		try {
			LTC savedLtc = service.save(ltc);
			saveltcEnacachmentMsg = "LTC - Advance Enacachment is Successfully Added with Request No: "
					+ savedLtc.getRequestno() + ".";
			model.addAttribute("msg", saveltcEnacachmentMsg);
		} catch (Exception e) {
			e.printStackTrace();
			saveltcEnacachmentMsg = "LTC - Advance Enacachment is not Added, Please Try Again Once";
			model.addAttribute("msg", saveltcEnacachmentMsg);
			return "ltcAdvanceEnacachment";
		}

		return "home";
	}
	
	// update
		@RequestMapping("/ltcAdvanceEnacachmentedit")
		public String ltcAdvanceEnacachmentedit(Model model) {
			model.addAttribute("ltc", new LTC());
			return "ltcAdvanceEnacachmentedit";
		}

		@RequestMapping("/updateltcadvanceEnacachment")
		public String updateltcadvanceEnacachment(@ModelAttribute("updateltc") LTC updateltc, Model model) {

			System.out.println("updateltc=> " + updateltc.toString());

			String saveltcEnacachmentMsg = "";

			try {
				if (service.exists(updateltc.getRequestno())) {
					LTC savedLtc = service.getLTCById(updateltc.getRequestno());
					savedLtc.setBlockyear(updateltc.getBlockyear());
					savedLtc.setLocation(updateltc.getLocation());
					savedLtc.setVisitplace(updateltc.getVisitplace());
					savedLtc.setClaimedfor(updateltc.getClaimedfor());
					savedLtc.setVisitperiod(updateltc.getVisitperiod());
					savedLtc.setLeavedetails(updateltc.getLeavedetails());
					//savedLtc.setEncashment(updateltc.getEncashment());
					savedLtc.setTotalfare(updateltc.getTotalfare());
					savedLtc.setAmountadvance(updateltc.getAmountadvance());
					service.save(savedLtc);
					saveltcEnacachmentMsg = "LTC - Advance Enacachment is Successfully Updated!";
					model.addAttribute("msg", saveltcEnacachmentMsg);
				} else {
					saveltcEnacachmentMsg = "LTC - Advance Enacachment is not Found with Given Request Number";
					model.addAttribute("msg", saveltcEnacachmentMsg);
				}

			} catch (Exception e) {
				e.printStackTrace();
				saveltcEnacachmentMsg = "LTC - Advance Enacachment is not Updated, Please Try Again Once";
				model.addAttribute("msg", saveltcEnacachmentMsg);
				return "ltcEnacachment";
			}

			return "home";
		}
}
