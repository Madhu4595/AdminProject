package com.app.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.entity.Employee_allowance;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_allowanceRepo;

@Controller
public class EmployeeController {

	@Autowired
	private Employee_allowanceRepo employee_allowanceRepo;
	@Autowired
	private EmployeeRepo employeeRepo;

	@RequestMapping("/em pNSForm")
	public String empNSForm() {
		return "empNSForm";
	}

	@RequestMapping("/empNSPrint")
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

			List<Employee_allowance> listEmpAllowances = new ArrayList<Employee_allowance>();
			Integer totalAmout = 0;
			for (int i = 0; i < requestno.length; i++) {
				System.out.println(requestno[i]);

				Optional<Employee_allowance> empAllowance = employee_allowanceRepo
						.findById(Integer.parseInt(requestno[i]));
				if (!empAllowance.isPresent()) {
					model.addAttribute("msg", requestno[i] + " Request Number is not found!!!");
					return "empNSForm";
				}
				if (empAllowance.isPresent()) {
					if (empAllowance.get().getNoofchilds().equalsIgnoreCase("1")) {
						if (Integer.parseInt(amount_approved[i]) <= empAllowance.get().getAmount_claimed()) {
							System.out.println(
									"Integer.parseInt(amount_approved[i]) <= empAllowance.get().getAmount_claimed()");
							empAllowance.get().setAmount_approve(Integer.parseInt(amount_approved[i]));
							empAllowance.get().setNoteStatus(true);
							empAllowance.get().setNsDate(LocalDateTime.now());
							totalAmout = totalAmout + Integer.parseInt(amount_approved[i]);
							employee_allowanceRepo.save(empAllowance.get());
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
								totalAmout = totalAmout + Integer.parseInt(amount_approved[i]);
							} else {
								model.addAttribute("msg", requestno[i]
										+ " Request Number Approved Amount should not more than Amount Claimed");
								return "empNSForm";
							}
						}
						if (empAllowance.get().getName_class_of_child2().equalsIgnoreCase(name_class_of_child[i])) {
							if (Integer.parseInt(amount_approved[i]) <= empAllowance.get().getCea_amount_child2()) {
								empAllowance.get().setAmount_approve2(Integer.parseInt(amount_approved[i]));
								totalAmout = totalAmout + Integer.parseInt(amount_approved[i]);
							} else {
								model.addAttribute("msg", requestno[i]
										+ " Request Number Approved Amount should not more than Amount Claimed");
								return "empNSForm";
							}
						}
						empAllowance.get().setNoteStatus(true);
						empAllowance.get().setNsDate(LocalDateTime.now());
						empAllowance.get().setAmount_approve(totalAmout);
						employee_allowanceRepo.save(empAllowance.get());

					}
				}

				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				String todaydate = formatter.format(date);
				model.addAttribute("todaydate", todaydate);

				model.addAttribute("totalAmout", totalAmout);

			}

			List<String> list = Arrays.asList(requestno);
			List<String> reqList = list.stream().distinct().collect(Collectors.toList());

			reqList.stream()
					.forEach(a -> listEmpAllowances.add(employee_allowanceRepo.findById(Integer.parseInt(a)).get()));
			model.addAttribute("listEmpAllowances", listEmpAllowances);
			model.addAttribute("empsList", employeeRepo.findAll());
			System.out.println("listEmpAllowances size==> " + listEmpAllowances.size());

		} else {
			System.out.println("input lengths are not equal");
			model.addAttribute("msg", "Something went wrong, Please try Again!");
			return "empNSForm";
		}

		return "NSs/empNSPrint";
	}

	// Sanction Order
	@RequestMapping("/empSOForm")
	public String empSOForm() {
		return "empSOForm";
	}

	@RequestMapping("/empSOPrint")
	public String empSOPrint(HttpServletRequest request, Model model) {

		System.out.println("requestNo==> " + request.getParameter("requestno"));
		System.out.println("so_noList==> " + request.getParameter("soNumber"));

		String[] requestno = request.getParameter("requestno").split(",");
		System.out.println("requestNo length => " + requestno.length);
		// String[] so_no = request.getParameter("so_noList").split(",");

		String SOnumber = request.getParameter("soNumber");

		if (SOnumber == null || SOnumber == "") {

			System.out.println("input lengths are not equal");
			model.addAttribute("msg", "Sanction Order Number Should not be Empty!");
			return "empNSForm";

		} else {

			System.out.println("input lengths are equal");

			List<Employee_allowance> listEmpAllowances = new ArrayList<Employee_allowance>();
			Integer totAmt = 0;
			
			List<String> list = Arrays.asList(requestno);
			List<String> reqList = list.stream().distinct().collect(Collectors.toList());
			
			String[] str = new String[reqList.size()];
			 
	        for (int i = 0; i < reqList.size(); i++) {
	            str[i] = reqList.get(i);
	        }
			for (int i = 0; i < str.length; i++) {
				System.out.println("request number=> "+str[i]);

				Optional<Employee_allowance> empAllowance = employee_allowanceRepo.findById(Integer.parseInt(str[i]));

				if (!empAllowance.isPresent()) {
					model.addAttribute("msg", str[i] + " Request Number is not found!!!");
					return "empNSForm";
				}
				if (empAllowance.isPresent()) {
					
					empAllowance.get().setSo_no(SOnumber);
					model.addAttribute("SONumber", SOnumber);
					empAllowance.get().setSoDate(LocalDateTime.now());
					empAllowance.get().setSanctionStatus(true);
					
					if (empAllowance.get().getNoofchilds().equalsIgnoreCase("1")) {
						totAmt = totAmt + empAllowance.get().getAmount_approve();
					}
					if (empAllowance.get().getNoofchilds().equalsIgnoreCase("2")) {
						totAmt = totAmt + empAllowance.get().getAmount_approve();
					}
					
					employee_allowanceRepo.save(empAllowance.get());
				}
			}
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			String todaydate = formatter.format(date);
			model.addAttribute("todaydate", todaydate);

			System.out.println("totAmt==> " + totAmt);
			model.addAttribute("totAmt", totAmt);

			reqList.stream()
					.forEach(a -> listEmpAllowances.add(employee_allowanceRepo.findById(Integer.parseInt(a)).get()));
			model.addAttribute("listEmpAllowances", listEmpAllowances);
			model.addAttribute("empsList", employeeRepo.findAll());
			System.out.println("listEmpAllowances size==> " + listEmpAllowances.size());
		}

		return "SOs/empSOPrint";
	}
}
