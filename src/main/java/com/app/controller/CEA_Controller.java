package com.app.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.entity.CEA;
import com.app.model.DistinctNoteNumbers;
import com.app.model.DistinctSanctionOrderNumbers;
import com.app.repo.CEARepo;
import com.app.repo.EmployeeRepo;

@Controller
public class CEA_Controller {
	
	@Autowired private CEARepo repo;
	@Autowired private EmployeeRepo employeeRepo;
	
	@RequestMapping("/empceaform")
	public String empCeaForm(Model model) throws SQLException {
		model.addAttribute("cea", new CEA());
		return "empCEAForm";
	}
	
	@RequestMapping("/empCEASave")
	public String empCEASave(@ModelAttribute("cea") CEA cea,Model model,MultipartFile doc) {
		System.out.println("UR IN /empCEASave");
		System.out.println("ModelAttribute==> CEA=> "+cea.toString());
		try {
			cea.setEntryDate(LocalDateTime.now());
			cea.setNoteStatus(false);
			cea.setSanctionStatus(false);
			
			if(doc == null) {
				
			}else {
				cea.setDocument(doc.getBytes());
			}
			
			CEA savedCEA = repo.save(cea);
			System.out.println("Saved Record==> "+savedCEA.toString());
			model.addAttribute("msg", "Employee CEA Allowance is Successfully, Added with Request Number: "+savedCEA.getRequestno());
		
		}catch(Exception e) {
			model.addAttribute("msg", "Something Went Wrong, Please Try Again Once.");
		}
		return "empCEAForm";
	}
	
	@RequestMapping("/empCEAEditForm")
	public String empCEAEditForm(Model model) throws SQLException {
		model.addAttribute("cea", new CEA());
		return "empCEAEditForm";
	}
	
	@RequestMapping("/updateCEA")
	public String updateCEA(@ModelAttribute("cea") CEA cea, Model model,MultipartFile doc) {
		System.out.println("updateCEA==> "+cea.toString());
		
		try {
		Optional<CEA> oldCEA = repo.findById(cea.getRequestno());

		if(doc == null) {
			
		}else {
			oldCEA.get().setDocument(doc.getBytes());
		}
		
		if(!oldCEA.isPresent()) {
			model.addAttribute("msg", "Given Request Number is Not Found!!!");
		}else {
			if(cea.getNoofchilds().equalsIgnoreCase("1")) {
				oldCEA.get().setName_class_of_child1(cea.getName_class_of_child1());
				oldCEA.get().setPeriod_of_claim_child1(cea.getPeriod_of_claim_child1());
				oldCEA.get().setCea_type_child1(cea.getCea_type_child1());
				oldCEA.get().setCea_amount_child1(cea.getCea_amount_child1());
				oldCEA.get().setAmount_claimed(cea.getAmount_claimed());
				
				oldCEA.get().setEditDate(LocalDateTime.now());
				
				repo.save(oldCEA.get());
			}
			if(cea.getNoofchilds().equalsIgnoreCase("2")) {
				oldCEA.get().setName_class_of_child1(cea.getName_class_of_child1());
				oldCEA.get().setPeriod_of_claim_child1(cea.getPeriod_of_claim_child1());
				oldCEA.get().setCea_type_child1(cea.getCea_type_child1());
				oldCEA.get().setCea_amount_child1(cea.getCea_amount_child1());
				oldCEA.get().setAmount_claimed(cea.getAmount_claimed());
				
				oldCEA.get().setName_class_of_child2(cea.getName_class_of_child2());
				oldCEA.get().setPeriod_of_claim_child2(cea.getPeriod_of_claim_child2());
				oldCEA.get().setCea_type_child2(cea.getCea_type_child2());
				oldCEA.get().setCea_amount_child2(cea.getCea_amount_child2());
				oldCEA.get().setAmount_claimed(cea.getAmount_claimed());
				
				oldCEA.get().setEditDate(LocalDateTime.now());
				
				repo.save(oldCEA.get());
			}
			model.addAttribute("msg", "ALLOWANCE DETAILS ARE UPDATED SUCCESSFULLY!!!");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "empCEAEditForm";
	}
	
	@RequestMapping("/empCEANSForm")
	public String empCEANSForm() {
		return "empCEANSForm";
	}
	
	@RequestMapping("/empCEANSPrint")
	public String empNSPrint(HttpServletRequest request, Model model) {

		System.out.println("requestNo==> " + request.getParameter("requestno"));
		System.out.println("code==> " + request.getParameter("codeList"));
		System.out.println("name_class_of_childList==> " + request.getParameter("name_class_of_childList"));
		System.out.println("amount_claimedList==> " + request.getParameter("amount_claimedList"));
		System.out.println("amount_approvedList==> " + request.getParameter("amount_approvedList"));

		String[] requestno = request.getParameter("requestno").split(",");
		System.out.println("requestNo length => " + requestno.length);
		String[] code = request.getParameter("codeList").split(",");
		String[] name_class_of_child = request.getParameter("name_class_of_childList").split(",");
		String[] amount_claimed = request.getParameter("amount_claimedList").split(",");
		String[] amount_approved = request.getParameter("amount_approvedList").split(",");

		if (requestno.length == code.length && requestno.length == name_class_of_child.length
				&& requestno.length == amount_claimed.length && requestno.length == amount_approved.length) {
			System.out.println("input lengths are equal");

			List<CEA> listEmpAllowances = new ArrayList<CEA>();
			
			
			Date date2 = new Date();
	        SimpleDateFormat formatter2 = new SimpleDateFormat("MM/dd/yyyy");
	        String strDate = formatter2.format(date2);
	        formatter2 = new SimpleDateFormat("ddMMyyhhmmss");
	        strDate = formatter2.format(date2);
	        System.out.println("Date Format with dd-M-yyyy hh:mm:ss : " + strDate);
	        
	        Integer totalAmout = 0;
	        Integer totalAmout2 = 0;
	        
			for (int i = 0; i < requestno.length; i++) {
				System.out.println(requestno[i]);

				Optional<CEA> empAllowance = repo.findById(requestno[i]);
				if (!empAllowance.isPresent()) {
					model.addAttribute("msg", requestno[i] + " Request Number is not found!!!");
					return "empNSForm";
				}
				if (empAllowance.isPresent()) {
					if (empAllowance.get().getNoofchilds().equalsIgnoreCase("1")) {
						
						if (Integer.parseInt(amount_approved[i]) <= empAllowance.get().getAmount_claimed()) {
							System.out.println( "Integer.parseInt(amount_approved[i]) <= empAllowance.get().getAmount_claimed()");
							empAllowance.get().setAmount_approve1(Integer.parseInt(amount_approved[i]));
							empAllowance.get().setNoteStatus(true);
							empAllowance.get().setNsDate(LocalDateTime.now());
							totalAmout = totalAmout + Integer.parseInt(amount_approved[i]);
							empAllowance.get().setAmount_approved(totalAmout);
							empAllowance.get().setNoteNumber(Long.parseLong(strDate));
							repo.save(empAllowance.get());
						} else {
							model.addAttribute("msg", requestno[i]
									+ " Request Number Approved Amount should not more than Amount Claimed");
							return "empNSForm";
						}
					}
					if (empAllowance.get().getNoofchilds().equalsIgnoreCase("2")) {
						
						if (empAllowance.get().getName_class_of_child1().equalsIgnoreCase(name_class_of_child[i])) {
							
							if (Integer.parseInt(amount_approved[i]) <= empAllowance.get().getCea_amount_child1()) {
								empAllowance.get().setAmount_approve1(Integer.parseInt(amount_approved[i]));
								totalAmout2 = totalAmout2 + Integer.parseInt(amount_approved[i]);
							} else {
								model.addAttribute("msg", requestno[i]
										+ " Request Number Approved Amount should not more than Amount Claimed");
								return "empNSForm";
							}
						}
						if (empAllowance.get().getName_class_of_child2().equalsIgnoreCase(name_class_of_child[i])) {
							
							if (Integer.parseInt(amount_approved[i]) <= empAllowance.get().getCea_amount_child2()) {
								empAllowance.get().setAmount_approve2(Integer.parseInt(amount_approved[i]));
								totalAmout2 = totalAmout2 + Integer.parseInt(amount_approved[i]);
							} else {
								model.addAttribute("msg", requestno[i]
										+ " Request Number Approved Amount should not more than Amount Claimed");
								return "empNSForm";
							}
						}
						empAllowance.get().setNoteStatus(true);
						empAllowance.get().setNsDate(LocalDateTime.now());
						empAllowance.get().setAmount_approved(totalAmout2);
						empAllowance.get().setNoteNumber(Long.parseLong(strDate));
						repo.save(empAllowance.get());

					}
				}

				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				String todaydate = formatter.format(date);
				model.addAttribute("todaydate", todaydate);

				model.addAttribute("totalAmout", totalAmout+totalAmout2);

			}

			List<String> list = Arrays.asList(requestno);
			List<String> reqList = list.stream().distinct().collect(Collectors.toList());

			reqList.stream()
					.forEach(a -> listEmpAllowances.add(repo.findById( a).get()));
			model.addAttribute("listEmpAllowances", listEmpAllowances);
			model.addAttribute("empsList", employeeRepo.findAll());
			System.out.println("listEmpAllowances size==> " + listEmpAllowances.size());

		} else {
			System.out.println("input lengths are not equal");
			model.addAttribute("msg", "Something went wrong, Please try Again!");
			return "empNSForm";
		}

		return "NSs/empCEANSPrint";
	}
	
	// Sanction Order
		@RequestMapping("/empCEASOForm")
		public String empCEASOForm() {
			return "empCEASOForm";
		}
		
		@RequestMapping("/empCEASOPrint")
		public String empSOPrint(HttpServletRequest request, Model model) {

			System.out.println("requestNo==> " + request.getParameter("requestno"));
			System.out.println("so_noList==> " + request.getParameter("soNumber"));

			String[] requestno = request.getParameter("requestno").split(",");
			System.out.println("requestNo length => " + requestno.length);
			// String[] so_no = request.getParameter("so_noList").split(",");

			String SOnumber = request.getParameter("soNumber");
			
			List<CEA> cea =repo.findBySanctionNumber(SOnumber);
			if(!cea.isEmpty()) {
				System.out.println("input lengths are not equal");
				model.addAttribute("msg", "Sanction Order Number Already Allocated!");
				return "empNSForm";
			}

			if (SOnumber == null || SOnumber == "") {

				System.out.println("input lengths are not equal");
				model.addAttribute("msg", "Sanction Order Number Should not be Empty!");
				return "empNSForm";

			} else {

				System.out.println("input lengths are equal");

				List<CEA> listEmpAllowances = new ArrayList<CEA>();
				Integer totAmt = 0;
				
				List<String> list = Arrays.asList(requestno);
				List<String> reqList = list.stream().distinct().collect(Collectors.toList());
				
				String[] str = new String[reqList.size()];
				 
		        for (int i = 0; i < reqList.size(); i++) {
		            str[i] = reqList.get(i);
		        }
				for (int i = 0; i < str.length; i++) {
					System.out.println("request number=> "+str[i]);

					Optional<CEA> empAllowance = repo.findById(str[i]);

					if (!empAllowance.isPresent()) {
						model.addAttribute("msg", str[i] + " Request Number is not found!!!");
						return "empNSForm";
					}
					if (empAllowance.isPresent()) {
						
						empAllowance.get().setSanctionNumber(SOnumber);
						model.addAttribute("SONumber", SOnumber);
						empAllowance.get().setSoDate(LocalDateTime.now());
						empAllowance.get().setSanctionStatus(true);
						
						if (empAllowance.get().getNoofchilds().equalsIgnoreCase("1")) {
							totAmt = totAmt + empAllowance.get().getAmount_approve1();
						}
						if (empAllowance.get().getNoofchilds().equalsIgnoreCase("2")) {
							totAmt = totAmt + empAllowance.get().getAmount_approve1();
							totAmt = totAmt + empAllowance.get().getAmount_approve2();
						}
						empAllowance.get().setAmount_approved(totAmt);
						repo.save(empAllowance.get());
					}
				}
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				String todaydate = formatter.format(date);
				model.addAttribute("todaydate", todaydate);

				System.out.println("totAmt==> " + totAmt);
				model.addAttribute("totAmt", totAmt);

				reqList.stream().forEach(a -> listEmpAllowances.add(repo.findById( a).get()));
				model.addAttribute("listEmpAllowances", listEmpAllowances);
				model.addAttribute("empsList", employeeRepo.findAll());
				System.out.println("listEmpAllowances size==> " + listEmpAllowances.size());
			}

			return "SOs/empCEASOPrint";
		}
		
		
		//============Prints Notesheet
		@RequestMapping("/ceaNSPrints")
		public String ceaNSPrints() {
			return "NSsPrintForms/ceaNSPrints";
		}
		//generateCEANSPrints
		@RequestMapping("/generateCEANSPrints")
		public String generateCEANSPrints(@RequestParam Long noteNumber, Model model) {
			
			
			DistinctNoteNumbers reqnos = repo.getDistinctNotenumbersbyNoteNumber(noteNumber);
			String[] requestno = reqnos.getRequestno().split(",");
			 
				List<CEA> listEmpAllowances = new ArrayList<CEA>();
				
				List<String> list = Arrays.asList(requestno);
				List<String> reqList = list.stream().distinct().collect(Collectors.toList());
				System.out.println("reqList"+reqList.toString());

				reqList.stream().forEach(a -> listEmpAllowances.add(repo.findById(a.replaceAll("\\s+", "")).get()));
				listEmpAllowances.stream().forEach(a-> System.out.println("111==> "+a.toString()));
				
				model.addAttribute("listEmpAllowances", listEmpAllowances);
				model.addAttribute("empsList", employeeRepo.findAll());
				System.out.println("listEmpAllowances size==> " + listEmpAllowances.size());
				
			return "NSsPrints/empCEANSPrints";
		}
		@RequestMapping("/ceaSOPrintForm")
		public String ceaSOPrintForm() {
			return "SOsPrintsForms/ceaSOPrintForm";
		}
		@RequestMapping("/generateCEASOPrints")
		public String generateCEASOPrints(@RequestParam String sanctionNumber,Model model) {
			
			System.out.println("sanctionNumber=>"+sanctionNumber);
			
				DistinctSanctionOrderNumbers sonumber = repo.getDistinctSanctionOrderNumbersbySanctionNumber(sanctionNumber);
				String[] requestno = sonumber.getRequestno().split(",");
			
				List<String> list = Arrays.asList(requestno);
				List<String> reqList = list.stream().distinct().collect(Collectors.toList());
				System.out.println("reqList"+reqList.toString());
				
				List<CEA> listEmpAllowances = new ArrayList<CEA>();
				
				reqList.stream().forEach(a -> listEmpAllowances.add(repo.findById( a.replaceAll("\\s+", "")).get()));
				
				model.addAttribute("listEmpAllowances", listEmpAllowances);
				model.addAttribute("empsList", employeeRepo.findAll());
				model.addAttribute("SONumber", sanctionNumber);
				
				System.out.println("listEmpAllowances size==> " + listEmpAllowances.size());
			
			return "SOsPrints/generateCEASOPrints";
		}
}

