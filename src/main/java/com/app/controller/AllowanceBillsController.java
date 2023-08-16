package com.app.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.Employee;
import com.app.entity.Employee_allowance;
import com.app.entity.Transactions;
import com.app.repo.Employee_allowanceRepo;
import com.app.service.IEmployeeService;
import com.app.service.IEmployee_allowanceService;
import com.app.service.ITransactionsService;
import com.app.service.IType_of_allowancesServices;
import com.app.service.IVendorService;
import com.app.util.MyUtil;

@Controller
public class AllowanceBillsController {

	@Autowired
	private IVendorService vendorService;
	@Autowired
	private IEmployeeService employeeService;
	@Autowired
	private IType_of_allowancesServices type_of_allowances;
	@Autowired
	private IEmployee_allowanceService employee_allowanceService;
	@Autowired
	private Employee_allowanceRepo employee_allowanceRepo;
	@Autowired private ITransactionsService transactionsService;

	// Allowance / Bills
	// Employee
	// New
	@RequestMapping("/employee_allowance")
	public String employee_allowance(Employee_allowance employee_allowance, Model model) throws SQLException {
		int hit_count = MyUtil.hit_counter();
		model.addAttribute("hit_count", hit_count);
		model.addAttribute("allowancelist", type_of_allowances.getAllAllow());
		return "employee_allowance";
	}

	@RequestMapping("/empAllowanceSave")
	public String saveEmpAllowance(@ModelAttribute("employee_allowance") Employee_allowance employee_allowance,
			Model model) {
		System.out.println("in Employee_allowance");
		
		try {
		employee_allowance.setEntryDate(LocalDateTime.now());
		employee_allowanceService.saveEmpAllowance(employee_allowance);
		System.out.println("Employee_allowance saved successfully!");
		model.addAttribute("msg", "New Employee Allowance Inserted Succesfully");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("empAllowanceSaveSuccess", "Something went while Saving Allowance Please try again");
			return "msg";
		}
		return "home";
	}

	// Modify
	@RequestMapping("/employee_allowance_edit")
	public String employee_allowance_edit(Employee_allowance employee_allowance) {
		return "employee_allowance_edit";
	}

	@RequestMapping("/employeereqnosearch")
	public ResponseEntity<List<String>> employeereqnosearch(@RequestParam("request_no") String request_no,
			Model model) {
		System.out.println("in action => employeereqnosearch" + request_no);

		Employee_allowance empAllowance = employee_allowanceService.getByReqNo(Integer.parseInt(request_no));
		System.out.println("empAllowance=> " + empAllowance.getAllowance_type());

		String allowance_type = empAllowance.getAllowance_type();
		String code = empAllowance.getCode();
		String empcode = empAllowance.getCode();
		Integer requestno = empAllowance.getRequest_no();
		// String completed_service = empAllowance.getCompleted_service();
		String noofchilds = empAllowance.getNoofchilds();
		System.out.println("======noofchilds=======" + noofchilds);

		Employee emp = employeeService.getById(code);
		String empName = emp.getName();
		String empBasicPay = emp.getBasic_pay();

		List<String> list = new ArrayList<String>();

		list.add(allowance_type); // response[0]
		list.add(code); // response[1]
		list.add(empcode); // response[2]
		list.add(Integer.toString(requestno)); // response[3]
		list.add(empName); // response[4]
		list.add(empBasicPay); // response[5]

		if (allowance_type.equals("1")) {
			System.out.println("allowance_type==> 1");
			list.add(noofchilds); // response[6]
			list.add(empAllowance.getRemarks()); // response[7]

			if (noofchilds.equalsIgnoreCase("1")) {
				System.out.println("======noofchilds 1=======");
				list.add(empAllowance.getName_class_of_child1()); // response[8]
				list.add(empAllowance.getPeriod_of_claim_child1()); // response[9]
				list.add(empAllowance.getCea_type_child1()); // response[10]
				list.add(Integer.toString(empAllowance.getCea_amount_child1())); // response[11]
				list.add(Integer.toString(empAllowance.getAmount_claimed())); // response[12]

			}
			if (noofchilds.equals("2")) {
				System.out.println("======noofchilds 2=======");
				list.add(empAllowance.getName_class_of_child1()); // response[8]
				list.add(empAllowance.getPeriod_of_claim_child1()); // response[9]
				list.add(empAllowance.getCea_type_child1()); // response[10]
				list.add(Integer.toString(empAllowance.getCea_amount_child1())); // response[11]
				list.add(Integer.toString(empAllowance.getAmount_claimed())); // response[12]

				list.add(empAllowance.getName_class_of_child2()); // response[13]
				list.add(empAllowance.getPeriod_of_claim_child2()); // response[14]
				list.add(empAllowance.getCea_type_child2()); // response[15]
				list.add(Integer.toString(empAllowance.getCea_amount_child2())); // response[16]

				list.add(Integer.toString(empAllowance.getAmount_claimed())); // response[17]
				list.add(empAllowance.getRemarks()); // response[18]
				list.add(noofchilds); // response[19]
			}
		}
		if (allowance_type.equals("4")) {
			System.out.println("allowance_type==> 4");
			System.out.println("list " + list.toString());

			list.add(empAllowance.getBillno()); // response[7]
			list.add(empAllowance.getBilldate()); // response[8]
			list.add(empAllowance.getShopname()); // response[9]
			list.add(Integer.toString(empAllowance.getAmount_claimed())); // response[10]
			list.add(empAllowance.getRemarks()); // response[11]
			System.out.println("list " + list.toString());

		}

		return ResponseEntity.ok(list);
	}

	@RequestMapping("/getrequestnos")
	public String employeereqnosearch(Model model) {
		System.out.println("getrequestnos=========>calling");
		try {
			List<Employee_allowance> emp_allowance = employee_allowanceRepo.getEmpAllowWhereAmtApprIsnull();
			System.out.println("getrequestnos=========>" + emp_allowance.size());
			model.addAttribute("emp_allowance", emp_allowance);
			emp_allowance.forEach(e -> {
				System.out.println("emp_allowance=> " + e);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "emp_allow_modfy";
	}

	@RequestMapping("/employee_allowance_update")
	public String employee_allowance_update(@ModelAttribute("empAllowance") Employee_allowance empAllowance,
			Model model, HttpServletRequest request) {
		System.out.println("employee_allowance=> " + empAllowance.toString());
		System.out.println("=========employee_allowance_update=====Request_no=========" + empAllowance.getRequest_no());

try {
		Employee_allowance emp_allowance = employee_allowanceService.getByReqNo(empAllowance.getRequest_no());
		System.out.println("emp_allowance===Allowance Type====" + emp_allowance.getAllowance_type());

		if (emp_allowance.getAllowance_type().equalsIgnoreCase("1")) {
			String noofchilds = emp_allowance.getNoofchilds();
			System.out.println("=========noofchilds==============" + noofchilds);

			if (noofchilds.equalsIgnoreCase("1")) {
				System.out.println("=========noofchilds==============> 1");
				emp_allowance.setName_class_of_child1(empAllowance.getName_class_of_child1());
				emp_allowance.setPeriod_of_claim_child1(empAllowance.getPeriod_of_claim_child1());
				emp_allowance.setCea_type_child1(empAllowance.getCea_type_child1());
				emp_allowance.setCea_amount_child1(empAllowance.getCea_amount_child1());
				emp_allowance.setAmount_claimed(empAllowance.getAmount_claimed());
				emp_allowance.setRemarks(empAllowance.getRemarks());
				emp_allowance.setEditDate(LocalDateTime.now());
				
				employee_allowanceService.saveEmpAllowance(emp_allowance);
				System.out.println("emp allowance inserted");
				model.addAttribute("msg", "EMPLOYEE ALLOWANCE UPDATED SUCCESSFULLY!");

				return "home";
			}

			if (noofchilds.equalsIgnoreCase("2")) {
				System.out.println("=========noofchilds==============> 1");
				emp_allowance.setName_class_of_child1(empAllowance.getName_class_of_child1());
				emp_allowance.setPeriod_of_claim_child1(empAllowance.getPeriod_of_claim_child1());
				emp_allowance.setCea_type_child1(empAllowance.getCea_type_child1());
				emp_allowance.setCea_amount_child1(empAllowance.getCea_amount_child1());

				emp_allowance.setName_class_of_child2(empAllowance.getName_class_of_child2());
				emp_allowance.setPeriod_of_claim_child2(empAllowance.getPeriod_of_claim_child2());
				emp_allowance.setCea_type_child2(empAllowance.getCea_type_child2());
				emp_allowance.setCea_amount_child2(empAllowance.getCea_amount_child2());

				emp_allowance.setAmount_claimed(empAllowance.getAmount_claimed());
				emp_allowance.setRemarks(empAllowance.getRemarks());
				emp_allowance.setEditDate(LocalDateTime.now());

				employee_allowanceService.saveEmpAllowance(emp_allowance);
				System.out.println("emp allowance inserted");
				model.addAttribute("msg", "EMPLOYEE ALLOWANCE UPDATED SUCCESSFULLY!");

				return "home";
			}

			emp_allowance.setName_class_of_child1(request.getParameter("name_class_of_child1"));
			emp_allowance.setName_class_of_child2(request.getParameter("name_class_of_child2"));
			emp_allowance.setPeriod_of_claim_child1(request.getParameter("period_of_claim_child1"));
			emp_allowance.setPeriod_of_claim_child2(request.getParameter("period_of_claim_child2"));
			emp_allowance.setCea_type_child1(request.getParameter("cea_type_child1"));
			emp_allowance.setCea_type_child2(request.getParameter("cea_type_child2"));
			emp_allowance.setCea_amount_child1(Integer.parseInt(request.getParameter("cea_amount_child1")));
			emp_allowance.setCea_amount_child2(Integer.parseInt(request.getParameter("cea_amount_child2")));
			emp_allowance.setAmount_claimed(Integer.parseInt(request.getParameter("amount_claimed")));
			emp_allowance.setRemarks(request.getParameter("remarks"));
		}
		if (emp_allowance.getAllowance_type().equalsIgnoreCase("2")) {
			emp_allowance.setCompleted_service(request.getParameter("completed_service"));
			emp_allowance.setBalance_asper_accountsslip(
					Integer.parseInt(request.getParameter("balance_asper_accountsslip")));
			emp_allowance.setSubsequent_deposits(Integer.parseInt(request.getParameter("subsequent_deposits")));
			emp_allowance.setTotal(Integer.parseInt(request.getParameter("total")));
			emp_allowance.setSubsequent_withdrawals(Integer.parseInt(request.getParameter("subsequent_withdrawals")));
			emp_allowance.setBalance(Integer.parseInt(request.getParameter("balance")));
			emp_allowance.setAmount_claimed(Integer.parseInt(request.getParameter("amount_claimed")));
			emp_allowance.setRemarks(request.getParameter("remarks"));
		}
		if (emp_allowance.getAllowance_type().equalsIgnoreCase("3")) {
			emp_allowance.setClosing_balance_asper_accounts(
					Integer.parseInt(request.getParameter("closing_balance_asper_accounts")));
			emp_allowance.setSubsequent_deposits(Integer.parseInt(request.getParameter("subsequent_deposits")));
			emp_allowance.setTotal(Integer.parseInt(request.getParameter("total")));
			emp_allowance.setSubsequent_withdrawals(Integer.parseInt(request.getParameter("subsequent_withdrawals")));
			emp_allowance.setBalance(Integer.parseInt(request.getParameter("balance")));
			emp_allowance.setAmount_claimed(Integer.parseInt(request.getParameter("amount_claimed")));
			emp_allowance.setRemarks(request.getParameter("remarks"));
		}
		if (emp_allowance.getAllowance_type().equalsIgnoreCase("4")) {
			emp_allowance.setBillno(request.getParameter("billno"));
			emp_allowance.setBilldate(request.getParameter("billdate"));
			emp_allowance.setShopname(request.getParameter("shopname"));
			// emp_allowance.setLast_claimed(Integer.parseInt(request.getParameter("last_claimed")));
			emp_allowance.setAmount_claimed(Integer.parseInt(request.getParameter("amount_claimed")));
			emp_allowance.setRemarks(request.getParameter("remarks"));
			employee_allowanceService.saveEmpAllowance(emp_allowance);
			model.addAttribute("msg", "Employee Allowances are Updated Successfully");
		}
}catch(Exception e) {
	e.printStackTrace();
	model.addAttribute("msg", "Something went wrong while updating, Please try Again");
	return "home";
}
		return "home";
	}

	

	@RequestMapping("/home")
	public String vendor_searchsd(Transactions transactions, Model model) throws SQLException {
		int hit_count = MyUtil.hit_counter();
		model.addAttribute("hit_count", hit_count);
		return "vendor_search";
	}

	@RequestMapping("/transactionsave")
	public String GEM_notesheet(@ModelAttribute("transactions") Transactions transactions, Model model)
			throws IOException {
		System.out.println("===========transactionsave=======");
		String vno = transactions.getVendor_no();
		System.out.println("vno=======>" + vno);

		transactionsService.save(transactions);
		System.out.println("Transaction Saved Successfully");

		model.addAttribute("transactions", transactions);
		model.addAttribute("vendor", vendorService.getById(vno));

		return "GEM_notesheet";
	}

}
