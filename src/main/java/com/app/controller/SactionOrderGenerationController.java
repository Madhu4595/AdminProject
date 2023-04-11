package com.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.Employee;
import com.app.entity.Employee_allowance;
import com.app.entity.Medical_Bills_upload;
import com.app.entity.Type_of_allowances;
import com.app.repo.Employee_allowanceRepo;
import com.app.repo.Medical_Bills_uploadRepo;
import com.app.service.IEmployeeService;
import com.app.service.IEmployee_allowanceService;
import com.app.service.IMedical_Bills_uploadService;
import com.app.service.IType_of_allowancesServices;

@Controller
public class SactionOrderGenerationController {

	@Autowired
	private Medical_Bills_uploadRepo medical_Bills_uploadRepo;
	@Autowired
	private Employee_allowanceRepo employee_allowanceRepo;
	// @Autowired private TransactionsRepo transactionsRepo;
	@Autowired
	private IType_of_allowancesServices type_of_allowances;
	@Autowired
	private IEmployee_allowanceService employee_allowanceService;
	@Autowired
	private IEmployeeService employeeService;
	 
	@Autowired
	private IMedical_Bills_uploadService medical_Bills_uploadService;

	@RequestMapping("/sanction_approve")
	public String sanction_approve() {
		return "sanction_approve";
	}

	@RequestMapping("/approvalsearch")
	public String approvalsearch(@RequestParam("approval_from") Integer approval_from,
			@RequestParam("approval_to") Integer approval_to, Model model) {

		System.out.println("=======approval_from=======" + approval_from);
		System.out.println("=======approval_to=======" + approval_to);

		List<Medical_Bills_upload> medical_Bills_upload = medical_Bills_uploadRepo.getbillsinrange(approval_from,
				approval_to);
		List<Employee_allowance> employee_allowances = employee_allowanceRepo.getallowancesinrange(approval_from,
				approval_to);

		for (Employee_allowance list : employee_allowances) {
			System.out.println("employee_allowances=list " + list.getAllowance_type());
			Type_of_allowances allowanceType = type_of_allowances
					.getAllowById(Integer.parseInt(list.getAllowance_type()));
			list.setAllowance_type(allowanceType.getName());
		}

		model.addAttribute("medical_Bills_upload", medical_Bills_upload);
		model.addAttribute("employee_allowances", employee_allowances);

		return "sanction_bill_data";
	}

	@RequestMapping("/generate_sanction_data")
	public String generate_sanction_data(@RequestParam("request_no") String request_no,
			@RequestParam("allowance_type") String allowance_type, @RequestParam("siodate") String siodate,
			Model model) {

		System.out.println(
				"===request_no,allowance_type,siodate======" + request_no + "," + allowance_type + "," + siodate);
		try {
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			String todaydate = formatter.format(date);

			if (allowance_type.equalsIgnoreCase("CEA")) {
				System.out.println("allowance type CEA");
				Employee_allowance employee_allowance = employee_allowanceService
						.getByReqNo(Integer.parseInt(request_no));
				Employee employee = employeeService.getById(employee_allowance.getCode());

				employee_allowance.setStatus("1");
				employee_allowance.setSiodate(siodate);
				employee_allowanceService.saveEmpAllowance(employee_allowance);
				System.out.println("=======CEA employee_allowance Updated Successfully");

				model.addAttribute("todaydate", todaydate);
				model.addAttribute("employee", employee);
				model.addAttribute("employee_allowance", employee_allowance);

				return "cea_sanction_order";
			}
			if (allowance_type.equalsIgnoreCase("BRIEF CASE")) {
				System.out.println("allowance type BRIEF CASE");
				Employee_allowance employee_allowance = employee_allowanceService
						.getByReqNo(Integer.parseInt(request_no));
				Employee employee = employeeService.getById(employee_allowance.getCode());

				employee_allowance.setStatus("1");
				employee_allowance.setSiodate(siodate);
				employee_allowanceService.saveEmpAllowance(employee_allowance);

				model.addAttribute("employee_allowance", employee_allowance);
				model.addAttribute("employee", employee);
				model.addAttribute("allowance_type", allowance_type);

				System.out.println("=======BRIEF CASE employee_allowance Updated Successfully");
				return "briefcase_approve";
			}

			if (allowance_type.equalsIgnoreCase("CGHS") || allowance_type.equalsIgnoreCase("AMA")) {
				System.out.println("allowance type AMA or CGHS");

				Medical_Bills_upload medical_Bills = medical_Bills_uploadService
						.getById(Integer.parseInt(request_no));
				medical_Bills.setSiodate(siodate);
				Medical_Bills_upload medical_Bills_upload = medical_Bills_uploadService.saveMedical_Bills_upload(medical_Bills);
				System.out.println("medical_Bills_upload" + medical_Bills_upload.toString());
				Employee employee = employeeService.getById(medical_Bills_upload.getEmp_code());

				model.addAttribute("medical_Bills_upload", medical_Bills_upload);
				model.addAttribute("siodate", siodate);
				model.addAttribute("todaydate", todaydate);
				model.addAttribute("employee", employee);

				return "medical_sanction_order";
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg",
					"Something Went Wrong While Generating Data, Check Once Details are Given Correctly");
			return "home";
		}
		return "";
	}

}
