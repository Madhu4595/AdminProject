package com.app.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
import org.springframework.web.multipart.MultipartFile;

import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.LTC;
import com.app.model.LtcAdvanceTableFamilyDetails;
import com.app.repo.Employee_Family_Repo;
import com.app.repo.LTCRepo;
import com.app.service.IEmployeeService;
import com.app.service.LTCService;

@Controller
public class LTCController {

	@Autowired private LTCService service;
	@Autowired private IEmployeeService employeeService;
	@Autowired private LTCRepo repo;
	@Autowired private Employee_Family_Repo employee_Family_Repo;
	
	//===========================EL-Encashment==========NEW
	@RequestMapping("/ltcEnacachment")
	public String ltcEnacachment(Model model) {
		model.addAttribute("ltcEnacachment", new LTC());
		return "ltcEnacachment";
	}

	@RequestMapping("/saveltcEnacachment")
	public String saveltcEnacachment(@ModelAttribute("saveltcEnacachment") LTC ltc, Model model,
			MultipartFile doc) {
		System.out.println("ltc=> " + ltc.toString());

		String saveltcEnacachmentMsg = "";

		try {
			ltc.setEntry_date(LocalDateTime.now());
			ltc.setNote_status(false);
			ltc.setSanction_status(false);
			
			if(doc == null) {
				
			}else {
				ltc.setDocument(doc.getBytes());
			}
			
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

	//===========================EL-Encashment==========EDIT
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
				LTC savedLtc = repo.getLTCEncashForEdit(updateltc.getRequestno());
				
				savedLtc.setBlockyear(updateltc.getBlockyear());
				savedLtc.setLocation(updateltc.getLocation());
				savedLtc.setVisitplace(updateltc.getVisitplace());
				savedLtc.setClaimedfor(updateltc.getClaimedfor());
				savedLtc.setVisitperiod(updateltc.getVisitperiod());
				savedLtc.setLeavedetails(updateltc.getLeavedetails());
				savedLtc.setEncashment(updateltc.getEncashment());
				savedLtc.setAmountadvance(updateltc.getAmountadvance());
				
				savedLtc.setEdit_date(LocalDateTime.now());
				
				service.save(savedLtc);
				
				saveltcEnacachmentMsg = "LTC - EL Enacachment is Successfully Updated!";
				model.addAttribute("msg", saveltcEnacachmentMsg);
			 

		} catch (Exception e) {
			e.printStackTrace();
			saveltcEnacachmentMsg = "LTC - EL Enacachment is not Updated, Please Try Again Once";
			model.addAttribute("msg", saveltcEnacachmentMsg);
			return "ltcEnacachment";
		}

		return "home";
	}

	//===========================EL-Encashment==========NOTESHEET
	@RequestMapping("/ltcElEnacachmentNSForm")
	public String ltcElEnacachmentNotesheetForm() {
		return "ltcElEnacachmentNSForm";
	}
	@RequestMapping("/ltcElEncachementNSPrint")
	public String ltcElEncachementNSPrint(HttpServletRequest request, Model model) {
		System.out.println("ltcElEncachementNotesheetPrint=> requestno=> " + request.getParameter("requestno"));
		
		String msg = "";
		
		try {
					LTC ltc = repo.getLTCForNS(request.getParameter("requestno"));
					
					ltc.setNote_status(true);
					ltc.setNote_date(LocalDateTime.now());
					ltc.setNote_number(Integer.parseInt(request.getParameter("requestno").substring(3)));
					
					LTC updatedLTC = repo.save(ltc);
					
					Employee emp = employeeService.getById(updatedLTC.getEmpcode());
					
					model.addAttribute("ltc", updatedLTC);
					model.addAttribute("emp", emp);
					
					return "NSs/ltcElEncachementNotesheetPrint";
					
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "LTC or Employee Details are not available with given Request Number: "
					+ request.getParameter("requestno") + " OR ALREADY APPROVED!";
			model.addAttribute("msg", msg);
			
			return "ltcElEnacachmentNSForm";
		}
		
	}
	
	//===========================EL-Encashment==========SANCTION ORDER
	@RequestMapping("/ltcELEnacachmentSOForm")
	public String ltcELEnacachmentSOForm() {
		return "ltcELEnacachmentSOForm";
	}
	@RequestMapping("/ltcElEncachementSOPrint")
	public String ltcElEncachementSOPrint(HttpServletRequest request, Model model) {
		System.out.println("ltcElEncachementSanctionOrderPrint=> requestno=> " + request.getParameter("requestno"));
		System.out.println("ltcElEncachementSanctionOrderPrint=> da=> " + request.getParameter("da"));
		System.out.println("ltcElEncachementSanctionOrderPrint=> so=> " + request.getParameter("so"));
		
		String msg = "";
		
		
		try {
					LTC ltc = repo.getLTCForSO(request.getParameter("requestno"));
					
					Employee emp = employeeService.getById(ltc.getEmpcode());
					
					ltc.setSanctionorderno(request.getParameter("so"));
					ltc.setSanction_status(true);
					ltc.setSanction_date(LocalDateTime.now());
					
					LTC updaedLTC = service.save(ltc);
					
					model.addAttribute("ltc", updaedLTC);
					model.addAttribute("emp", emp);
					model.addAttribute("da", Integer.parseInt(request.getParameter("da")));
					
					if(updaedLTC.getTotalfare() == null) {
						return "SOs/ltcElEncachementSanctionOrderPrint";
					}else {
						//model.addAttribute("empFamily", employee_Family_Service.getAllEmpcode(ltc.getEmpcode()));
						List<LtcAdvanceTableFamilyDetails> list = new ArrayList<LtcAdvanceTableFamilyDetails>();
						int sno = 1;
						
						String[] names = updaedLTC.getClaimedfor().split(",");
						
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
								Employee_Family empf = employee_Family_Repo.getRelation(updaedLTC.getEmpcode(), name1);
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
				 
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "LTC or Employee Details are not available with given Request Number: "
					+ request.getParameter("requestno") + " OR Something went Wrong!";
			model.addAttribute("msg", msg);
			
			return "ltcELEnacachmentSOForm";
		}
		
	}
	
	//====================================Advance Encashment=============NEW
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
			ltc.setEntry_date(LocalDateTime.now());
			ltc.setNote_status(false);
			ltc.setSanction_status(false);
			
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
	
	//====================================Advance Encashment=============EDIT
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
					LTC savedLtc = repo.getLTCForNS(updateltc.getRequestno());
					
					savedLtc.setBlockyear(updateltc.getBlockyear());
					savedLtc.setLocation(updateltc.getLocation());
					savedLtc.setVisitplace(updateltc.getVisitplace());
					savedLtc.setClaimedfor(updateltc.getClaimedfor());
					savedLtc.setVisitperiod(updateltc.getVisitperiod());
					savedLtc.setLeavedetails(updateltc.getLeavedetails());
					//savedLtc.setEncashment(updateltc.getEncashment());
					savedLtc.setTotalfare(updateltc.getTotalfare());
					savedLtc.setAmountadvance(updateltc.getAmountadvance());
					
					savedLtc.setEdit_date(LocalDateTime.now());
					
					service.save(savedLtc);
					
					saveltcEnacachmentMsg = "LTC - Advance Enacachment is Successfully Updated!";
					model.addAttribute("msg", saveltcEnacachmentMsg);

			} catch (Exception e) {
				e.printStackTrace();
				saveltcEnacachmentMsg = "LTC - Advance Enacachment is not Updated, Please Try Again Once";
				model.addAttribute("msg", saveltcEnacachmentMsg);
				return "ltcEnacachment";
			}

			return "home";
		}
		//====================================Advance Encashment=============NOTESHEET
		@RequestMapping("/ltcAdvanceNSForm")
		public String ltcAdvanceNSForm() {
			return "ltcAdvanceNSForm";
		}
		@RequestMapping("/ltcAdvanceNSPrint")
		public String ltcAdvanceNSPrint(HttpServletRequest request, Model model) {
			String msg = "";
			
			try {
						LTC ltc = repo.getLTCAdvanceForEdit(request.getParameter("requestno"));
						
						ltc.setNote_status(true);
						ltc.setNote_date(LocalDateTime.now());
						ltc.setNote_number(Integer.parseInt(request.getParameter("requestno").substring(3)));
						
						LTC updatedLTC = repo.save(ltc);
						
						Employee emp = employeeService.getById(updatedLTC.getEmpcode());
						
						model.addAttribute("ltc", updatedLTC);
						model.addAttribute("emp", emp);
						
						return "NSs/ltcElEncachementNotesheetPrint";
						
				
			} catch (Exception e) {
				e.printStackTrace();
				msg = "LTC or Employee Details are not available with given Request Number: "
						+ request.getParameter("requestno") + " OR ALREADY APPROVED!";
				model.addAttribute("msg", msg);
				return "ltcElEnacachmentNSForm";
			}
		}
		
		//====================================Advance Encashment=============SANCTION ORDER
		@RequestMapping("/ltcAdvanceSOForm")
		public String ltcAdvanceSOForm() {
			return "ltcAdvanceSOForm";
		}
		
		//======PRINTS===============ENCASHMENT======NOTESHEET
		@RequestMapping("/ltcEncashmentsNSPrints")
		public String ltcEncashmentsNSPrints() {
			return "NSsPrintForms/ltcEncashmentsNSPrints";
		}
		@RequestMapping("/getLTCEncashForNSPrints")
		public String getLTCEncashForNSPrints(HttpServletRequest request, Model model) {
			System.out.println("ltcElEncachementNotesheetPrint=> requestno=> " + request.getParameter("requestno"));
			String msg = "";
			try {
						LTC ltc = repo.getLTCEncashForNSPrints(request.getParameter("requestno"));
						Employee emp = employeeService.getById(ltc.getEmpcode());
						model.addAttribute("ltc", ltc);
						model.addAttribute("emp", emp);
						return "NSsPrints/ltcElEncachementNotesheetPrints";
			} catch (Exception e) {
				e.printStackTrace();
				msg = "LTC or Employee Details are not available with given Request Number: "
						+ request.getParameter("requestno") + " OR ALREADY APPROVED!";
				model.addAttribute("msg", msg);
				return "ltcElEnacachmentNSForm";
			}
			
		}
		
		//=========PRINTS========ADVANCE=======NOTESHEET
		@RequestMapping("/ltcAdvanceNSPrints")
		public String ltcAdvanceNSPrints() {
			return "NSsPrintForms/ltcAdvanceNSPrints";
		}
		@RequestMapping("/getLTCAdvanceForNSPrints")
		public String getLTCAdvanceForNSPrints(HttpServletRequest request, Model model) {
			String msg = "";
			try {
						LTC ltc = repo.getLTCAdvanceForNSPrints(request.getParameter("requestno"));
						Employee emp = employeeService.getById(ltc.getEmpcode());
						model.addAttribute("ltc", ltc);
						model.addAttribute("emp", emp);
						return "NSsPrints/ltcElEncachementNotesheetPrints";
						//return "NSs/ltcElEncachementNotesheetPrint";
			} catch (Exception e) {
				e.printStackTrace();
				msg = "LTC or Employee Details are not available with given Request Number: "
						+ request.getParameter("requestno") + " OR ALREADY APPROVED!";
				model.addAttribute("msg", msg);
				
				return "ltcElEnacachmentNSForm";
			}
		}
		
		//=========PRINTS========ENCASHMENT=======SANCTION ORDER
		@RequestMapping("/ltcEncashmentsSOPrints")
		public String ltcEncashmentsSOPrints() {
			return "SOsPrintsForms/ltcEncashmentsSOPrints";
		}
		@RequestMapping("/getLTCEncashForSOPrints")
		public String getLTCEncashForSOPrints(HttpServletRequest request, Model model) {
			System.out.println("ltcElEncachementNotesheetPrint=> requestno=> " + request.getParameter("requestno"));
			
			String msg = "";
			
			try {
						LTC ltc = repo.getLTCEncashForSOPrints(request.getParameter("requestno"));
						Employee emp = employeeService.getById(ltc.getEmpcode());
						
						model.addAttribute("ltc", ltc);
						model.addAttribute("emp", emp);
						
						return "SOsPrints/ltcEncashNoteSheetPrints";
						//return "NSs/ltcElEncachementNotesheetPrint";
				
			} catch (Exception e) {
				e.printStackTrace();
				msg = "LTC or Employee Details are not available with given Request Number: "
						+ request.getParameter("requestno") + " OR ALREADY APPROVED!";
				model.addAttribute("msg", msg);
				
				return "ltcElEnacachmentNSForm";
			}
			
		}
		//=========PRINTS========ADVANCE=======SANCTION ORDER
		@RequestMapping("/ltcAdvanceSOPrints")
		public String ltcAdvanceSOPrints() {
			return "SOsPrintsForms/ltcAdvanceSOPrints";
		}
		
		@RequestMapping("/getLTCAdvanceForSOPrints")
		public String getLTCAdvanceForSOPrints(HttpServletRequest request, Model model) {
			System.out.println("ltcElEncachementNotesheetPrint=> requestno=> " + request.getParameter("requestno"));
			String msg = "";
			
			try {
						LTC ltc = repo.getLTCAdvanceForSOPrints(request.getParameter("requestno"));
						Employee emp = employeeService.getById(ltc.getEmpcode());
						
						
						model.addAttribute("ltc", ltc);
						model.addAttribute("emp", emp);
					 
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
							return "SOsPrints/ltcAdvanceElEncachementSOrderPrints";
							//return "ltcAdvanceElEncachementSOrderPrint";
					 
				
			} catch (Exception e) {
				e.printStackTrace();
				msg = "LTC or Employee Details are not available with given Request Number: "
						+ request.getParameter("requestno") + " OR Something went Wrong!";
				model.addAttribute("msg", msg);
				
				return "ltcElEnacachmentNSForm";
			}
			
		}
		
		
		
		
}
