package com.app.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.app.entity.Medical_Bills_upload;
import com.app.entity.Transactions;
import com.app.entity.Type_of_bills;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;
import com.app.service.IEmployeeService;
import com.app.service.IEmployee_allowanceService;
import com.app.service.IMedical_Bills_uploadService;
import com.app.service.ITransactionsService;
import com.app.service.Type_of_billsService;
import com.app.util.MyUtil;

@Controller
public class Approval_Details_Controller {
	
	@Autowired private ITransactionsService transactionsService;
	@Autowired private IEmployee_allowanceService employee_allowanceService;
	@Autowired private IEmployeeService employeeService;
	@Autowired private IMedical_Bills_uploadService medical_Bills_uploadService; 
	@Autowired private EmployeeRepo employeeRepo;
	@Autowired private Type_of_billsService type_of_billsService;
	@Autowired private Employee_Family_Repo empFamilyRepo;

	// Employee
			@RequestMapping("/allowance_approve")
			public String allowance_approve() {
				return "allowance_approve";
			}
			//ajax call
			@RequestMapping("/allowancesearch")
			public ResponseEntity<List<String>> allowancesearch(@RequestParam("request_no") Integer request_no,Model model) throws SQLException{
				System.out.println("=====allowancesearch======="+request_no);
				
				boolean exists = transactionsService.transactionExists(request_no);
				System.out.println("======exists========="+exists);
				
				List<String> list = new ArrayList<String>();
				
				if(exists) {
					
					Transactions transactions = transactionsService.getById(request_no);
					list.add(Integer.toString(transactions.getAmount_claimed())); //response[0]	 
					Type_of_bills type_of_bills = type_of_billsService.getById(transactions.getType_of_bill()); 
					System.out.println("========bill type name========"+type_of_bills.getName());  
					list.add(type_of_bills.getName());	//response[1]	 
					
				}else {
					System.out.println("========in else block========" ); 
					Employee_allowance employee_allowance = employee_allowanceService.getByReqNo(request_no);
					Employee employee = employeeRepo.getNamewithDesg(employee_allowance.getCode()); 
					
					if(employee_allowance.getAllowance_type().equals("1")) {
						System.out.println("========allowance type 1========" );
						list.add(employee_allowance.getCode());	//response[0]
						list.add(employee.getName());	 //response[1]
						list.add(MyUtil.getOptionValue("designation", "id", "name", employee.getDesignation())); //response[2]
						list.add(MyUtil.getOptionValue("type_of_allowances", "id", "name",  employee_allowance.getAllowance_type()));//response[3]
						list.add(Integer.toString(employee_allowance.getAmount_claimed()));	//response[4]
						list.add(employee_allowance.getNoofchilds()); //response[5] 
						list.add(employee_allowance.getAllowance_type()); //response[6] 
						
						if(employee_allowance.getNoofchilds().equals("1")) {
							System.out.println("========no of childs 1========" );
							list.add(Integer.toString(employee_allowance.getCea_amount_child1()));	//response[7]
						}
						if(employee_allowance.getNoofchilds().equals("2")) {
							System.out.println("========in no of childs 2========" ); 
							list.add(Integer.toString(employee_allowance.getCea_amount_child1()));	//response[7]
							list.add(Integer.toString(employee_allowance.getCea_amount_child2())); //response[8]
						}
					}
					if(employee_allowance.getAllowance_type().equals("4")) {
						System.out.println("========allowance type 4========" );
						list.add(employee_allowance.getCode());	//response[0]
						list.add(employee.getName());	 //response[1]
						list.add(MyUtil.getOptionValue("designation", "id", "name", employee.getDesignation())); //response[2]
						list.add(MyUtil.getOptionValue("type_of_allowances", "id", "name",  employee_allowance.getAllowance_type()));//response[3]
						list.add(Integer.toString(employee_allowance.getAmount_claimed()));	//response[4]
						
					}
					  
				}
				
				return ResponseEntity.ok(list);
			}
			@RequestMapping("/allowanceapprove")
			public String allowanceapprove(HttpServletRequest request, Model model) {
				System.out.println("=======allowanceapprove===========");
				
				String request_no = request.getParameter("request_no");
				String amount_approve1 = request.getParameter("amount_approve1");
				String amount_approve2 = request.getParameter("amount_approve2");
				String noofchilds = request.getParameter("noofchilds");
				String allowance_type = request.getParameter("allowance_type");
				String amount_approved = request.getParameter("amount_approved");
				
				System.out.println("=======request_no,amount_approve1,amount_approve2,noofchilds,allowance_type,amount_approved========"+request_no+","+amount_approve1+","+amount_approve2+","+noofchilds+","+allowance_type+",amount_approved=>"+amount_approved);
				
				try {
					
					boolean exists = transactionsService.transactionExists(Integer.parseInt(request_no));
					
					if(exists) {
						System.out.println("=======exists===========");
						
					}else {
						System.out.println("========else===========");
						
							Employee_allowance employee_allowance = employee_allowanceService.getByReqNo(Integer.parseInt(request_no));
							System.out.println("employee_allowance => "+employee_allowance.toString());
							
							if(allowance_type.equals("CEA")) {
								System.out.println("allowance_type => CEA");
								
								if(noofchilds.equals("1")) {
									System.out.println("noofchilds => 1");
										employee_allowance.setAmount_approve(Integer.parseInt(amount_approve1));
										Employee_allowance employee_allowance2 = employee_allowanceService.saveEmpAllowance(employee_allowance);
										model.addAttribute("employee_allowance2", employee_allowance2);
										Employee employee = employeeService.getById(employee_allowance2.getCode()); 
										model.addAttribute("employee", employee);
										return "NSs/cea_notesheet";
								}
								if(noofchilds.equals("2")) {
										System.out.println("noofchilds => 2");
										employee_allowance.setAmount_approve1(Integer.parseInt(amount_approve1));
										employee_allowance.setAmount_approve2(Integer.parseInt(amount_approve2));
										Integer amount_approve = Integer.parseInt(amount_approve1) + Integer.parseInt(amount_approve2);
										System.out.println("amount_approve before setting => "+amount_approve);
										employee_allowance.setAmount_approve(amount_approve);
										Employee_allowance employee_allowance2 = employee_allowanceService.saveEmpAllowance(employee_allowance);
										System.out.println("amount_approve after  => "+employee_allowance2.getAmount_approve());
										model.addAttribute("employee_allowance2", employee_allowance2);
										Employee employee = employeeService.getById(employee_allowance2.getCode()); 
										model.addAttribute("employee", employee);
										model.addAttribute("amount_approve1", amount_approve1);
										return "NSs/cea_notesheet";
									
								}
								
								
							}
							//BRIEF CASE
							if(allowance_type.equals("BRIEF CASE")) {
								System.out.println("allowance_type => BRIEF CASE");
								employee_allowance.setAmount_approved(Integer.parseInt(amount_approved));
								employee_allowance.setAmount_approve(Integer.parseInt(amount_approved));
								Employee_allowance employee_allowance2 = employee_allowanceService.saveEmpAllowance(employee_allowance);
								Employee employee = employeeService.getById(employee_allowance2.getCode()); 
								
								model.addAttribute("employee_allowance2", employee_allowance2);
								model.addAttribute("allowance_type", allowance_type);
								model.addAttribute("employee", employee);
								
								return "NSs/briefcaseapprovalnotesheet";
							}
							
						 
					}
					
					
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "Something Went Wrong Please Try Again Once");
					return "home";
				}
				return "";
			}
		// Medical
			@RequestMapping("/medical_approve")
			public String medical_approve(Medical_Bills_upload medical_Bills_upload) {
				return "medical_approve";
			}
			@RequestMapping("/requestnosearch")
			public ResponseEntity<List<String>> requestnosearch(@RequestParam("eno") Integer request_no){
				System.out.println("========requestnosearch========");
				Medical_Bills_upload bills_upload = medical_Bills_uploadService.getById(request_no);
				Employee employee = employeeService.getById(bills_upload.getEmp_code()); 
				
				List<String> list = new ArrayList<String>();
				list.add(bills_upload.getEmp_code());
				list.add(employee.getName());
				
				return ResponseEntity.ok(list);
			}
			@RequestMapping("/medicalbilldata")
			public String medicalbilldata(@RequestParam("request_no") Integer request_no,Model model){
				System.out.println("========medicalbilldata========"+request_no);
				
				Medical_Bills_upload medical_Bills_upload= medical_Bills_uploadService.getById(request_no);
				//Employee employee = employeeService.getById(medical_Bills_upload.getEmp_code()); 
				//Designation designation = designationRepo.getById(Integer.parseInt(employee.getDesignation()));
				
				
				List<Medical_Bills_upload> list2 = new ArrayList<Medical_Bills_upload>();
				
				String[] bill_no=medical_Bills_upload.getBill_no().split(",");
				String[] amount_claimed =  medical_Bills_upload.getAmount_claimed().split(",");
				String[] bill_date = medical_Bills_upload.getBill_date().split(",");
				
				model.addAttribute("noofbills",  bill_no.length);
				
				for(int i=0;i<bill_no.length;i++) {
					Medical_Bills_upload medical_Bills_upload1=new Medical_Bills_upload();
					
					medical_Bills_upload1.setBill_no(bill_no[i]);
					medical_Bills_upload1.setAmount_claimed(amount_claimed[i]);
					medical_Bills_upload1.setBill_date(bill_date[i]);
					
					list2.add(medical_Bills_upload1);
				}
				
				model.addAttribute("list", medical_Bills_upload);
				model.addAttribute("list1",list2);
				
				return "medical_billdata";
			}
			@RequestMapping("/medicalallowanceapprove")
			public String medicalallowanceapprove(@ModelAttribute("medical_Bills_upload") Medical_Bills_upload medical_Bills_upload
					,HttpServletRequest request, Model model) {
				
				System.out.println("=====medicalallowanceapprove=======");
				System.out.println("=====Bill_no======="+medical_Bills_upload.getBill_no());
				System.out.println("=====Amount_approved()======="+medical_Bills_upload.getAmount_approved());
				System.out.println("=====getRequest_no()======="+medical_Bills_upload.getRequest_no());
				System.out.println("getRemarks=> "+medical_Bills_upload.getRemarks());
				
				

				try {
					Medical_Bills_upload medical_Bills_upload2 = medical_Bills_uploadService.getById(medical_Bills_upload.getRequest_no());
					String[] totAmountApprovedArray = medical_Bills_upload.getAmount_approved().split(",");
					Integer totAmountApproved = 0;
					for(int i=0; i < totAmountApprovedArray.length; i++) {
						totAmountApproved = totAmountApproved + Integer.parseInt(totAmountApprovedArray[i]);
					}
					medical_Bills_upload2.setTotAmountApproved(totAmountApproved.toString());
					medical_Bills_upload2.setAmount_approved(medical_Bills_upload.getAmount_approved());
					medical_Bills_upload2.setRemarks(medical_Bills_upload.getRemarks());
					medical_Bills_uploadService.saveMedical_Bills_upload(medical_Bills_upload2);
					System.out.println("======Medical_Bills_upload Successfully======");
					
					Medical_Bills_upload medical_Bills_upload3 = medical_Bills_uploadService.getById(medical_Bills_upload.getRequest_no());
					System.out.println("empcode===> "+medical_Bills_upload3.getEmp_code());
					Employee employee = employeeService.getById(medical_Bills_upload3.getEmp_code().trim());
					
					List<Medical_Bills_upload> list = new ArrayList<Medical_Bills_upload>();
					
					String[] bill_no= medical_Bills_upload3.getBill_no().split(",");
					String[] lab_name = medical_Bills_upload3.getLab_name().split(",");
					String[] amount_claimed = medical_Bills_upload3.getAmount_claimed().split(",");
					String[] amount_approved = medical_Bills_upload.getAmount_approved().split(",");
					String[] remarks = medical_Bills_upload.getRemarks().split(",");
					Integer tot_amount = 0;
					
					System.out.println("bill_no => length=> "+bill_no.length);
					
					for(int i=0;i<bill_no.length;i++) {
						System.out.println("in for loop");
						Medical_Bills_upload medical_Bills_upload4 = new Medical_Bills_upload();
						
						medical_Bills_upload4.setBill_no(bill_no[i]);
						medical_Bills_upload4.setLab_name(lab_name[i]);
						medical_Bills_upload4.setAmount_claimed(amount_claimed[i]);
						medical_Bills_upload4.setAmount_approved(amount_approved[i]);
						medical_Bills_upload4.setRemarks(remarks[i]);
						tot_amount = tot_amount + Integer.parseInt(amount_approved[i]);
						list.add(medical_Bills_upload4);
					}
					model.addAttribute("medical_Bills_upload4", list);
					model.addAttribute("tot_amount", tot_amount);
					
					Date date = new Date();  
					SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
					String todaydate=formatter.format(date);
					
					model.addAttribute("medical_Bills_upload3", medical_Bills_upload3);
					model.addAttribute("employee", employee);
					//model.addAttribute("bills_Upload2", bills_Upload2);
					model.addAttribute("todaydate", todaydate);
					model.addAttribute("relation", empFamilyRepo.getRelation(medical_Bills_upload3.getEmp_code(), medical_Bills_upload3.getPatient_name()));
					
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "Something Went Wrong");
					return "home";
				}
				return "NSs/medicalbills_notesheet";
			}
}

