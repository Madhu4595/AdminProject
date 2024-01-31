package com.app.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.app.entity.AppUser;
import com.app.entity.CGHS;
import com.app.entity.CGHSBills;
import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.model.CGHSModel;
import com.app.model.EmployeeCompleteDetailsModel;
import com.app.repo.CGHSRepo;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;

@Controller
public class CGHSController {
	
	@Autowired private CGHSRepo cGHSRepo;
	@Autowired private HomeRestController homeRestController;
	@Autowired private Employee_Family_Repo employee_Family_Repo;
	@Autowired private EmployeeRepo employeeRepo;
	
	@RequestMapping("/cghsForm")
	public String cghsForm(Model model,HttpSession session) {
		System.out.println("cghsForm");
		model.addAttribute("cghs", new CGHS());
		
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		
		return "cghs/cghsForm";
	}
 
	
	@RequestMapping("/saveCGHS")
	public String saveCGHS(@ModelAttribute("cghs") CGHS cghs,Model model,HttpServletRequest request,
			MultipartFile doc) {
		System.out.println("cghs===>"+cghs.toString());
		System.out.println("type=>"+request.getParameterValues("typee"));
		
		try {
			
			String[] type = request.getParameterValues("typee");
			String[] billNo = request.getParameterValues("billNoo");
			String[] date = request.getParameterValues("datee");
			String[] amount = request.getParameterValues("amountt");
			String[] doctorName = request.getParameterValues("doctorNamee");
			String[] hospitalName = request.getParameterValues("hospitalNamee");
			System.out.println("length=>"+type.length);
			
			Set<CGHSBills> cGHSBillss = new HashSet<CGHSBills>();
			
			for(int i=0; i < type.length; i++) {
				CGHSBills cGHSBills = new CGHSBills();
				
				cGHSBills.setType(type[i]);
				cGHSBills.setBillNo(billNo[i]);
				cGHSBills.setDate(date[i]);
				cGHSBills.setAmount(amount[i]);
				cGHSBills.setDoctorName(doctorName[i]);
				cGHSBills.setHospitalName(hospitalName[i]);
				 
				cGHSBillss.add(cGHSBills);
			}
			cghs.setcGHSBills(cGHSBillss);
			cghs.setDocument(doc.getBytes());
			CGHS savedCghs = cGHSRepo.save(cghs);
			model.addAttribute("msg", "CGHS Details are saved Successfully with ID:"+savedCghs.getCghsId());
			return "home";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "Something went wrong while saving data, Please try again");
			return "cghs/cghsForm";
		}
		  
	}
	
	@RequestMapping("/cghsmrcfPrintform")
	public String cghsmrcfPrintform(HttpSession session, Model model) {
		
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		
		return "cghs/cghsmrcfPrintform";
	}
	
	@RequestMapping("/cghsmrcfPrint")
	public String cghsmrcfPrint(@Param("requestNo") String requestNo,Model model) {
		System.out.println("requestNo=>"+requestNo);
		
		if(requestNo.isEmpty()) {
			model.addAttribute("msg", "Request Number is mandatory for generating print");
			return "cghs/cghsmrcfPrintform";
		}
		
		Optional<CGHS> bean = cGHSRepo.findById(requestNo);
		if(bean.isPresent()) {
			System.out.println("bean=>"+bean.toString());
			
			EmployeeCompleteDetailsModel employee = homeRestController.getEmpDetails(bean.get().getEmpCode());
			List<Employee_Family> family = employee_Family_Repo.getAllByEmpcode(bean.get().getEmpCode());
			
			CGHSModel cGHSModel = new CGHSModel();
			
			cGHSModel.setEmpCode(bean.get().getEmpCode());
			cGHSModel.setEmpName(employee.getName());
			cGHSModel.setEcghsCode(employee.getEcghsCode());
			cGHSModel.setWardEntitlement(bean.get().getWardEntitlement());
			cGHSModel.setAddress(employee.getAddress());
			
			if(bean.get().getPatientId().equalsIgnoreCase("self")) {
				cGHSModel.setPatientName(employee.getName());
				cGHSModel.setPatientCghsCode(employee.getEcghsCode());
			}else {
				for(Employee_Family empFamily:family) {
					
					if(Integer.parseInt(bean.get().getPatientId()) == empFamily.getId()) {
						cGHSModel.setPatientName(empFamily.getPer_name());
						cGHSModel.setPatientCghsCode(empFamily.getCghsCode());
						cGHSModel.setPatientRelation(empFamily.getRelation());
					}
				}
			}
			
			cGHSModel.setHospitalName(bean.get().getHospitalName());
			cGHSModel.setEmpalledUnderCGHS(bean.get().getEmpalledUnderCGHS());
			cGHSModel.setOpdTreatment(bean.get().getOpdTreatment());
			cGHSModel.setIndoorTreatment(bean.get().getIndoorTreatment());
			cGHSModel.setEmergencyTreatment(bean.get().getEmergencyTreatment());
			cGHSModel.setTreatmentPermission(bean.get().getTreatmentPermission());
			cGHSModel.setHealthMedicalInsuranceScheme(bean.get().getHealthMedicalInsuranceScheme());
			cGHSModel.setHealthMedicalInsuranceSchemeIfYes(bean.get().getHealthMedicalInsuranceSchemeIfYes());
			cGHSModel.setMedicalAdvanceDetails(bean.get().getMedicalAdvanceDetails());
			
			Integer opdTotal = 0;
			Integer indoorTotal = 0;
			Integer testsTotal = 0;
			
			for(CGHSBills cGHSBills:bean.get().getcGHSBills()) {
				if(cGHSBills.getType().equalsIgnoreCase("opd")) {
					opdTotal = opdTotal + Integer.parseInt(cGHSBills.getAmount());
				}
				if(cGHSBills.getType().equalsIgnoreCase("indoor")) {
					indoorTotal = indoorTotal + Integer.parseInt(cGHSBills.getAmount());
				}
				if(cGHSBills.getType().equalsIgnoreCase("tests")) {
					testsTotal = testsTotal + Integer.parseInt(cGHSBills.getAmount());
				}
			}
			cGHSModel.setOpdTotal(opdTotal);
			cGHSModel.setIndoorTotal(indoorTotal);
			cGHSModel.setTestsTotal(testsTotal);
			
			Integer totAmoutClaimed = opdTotal + indoorTotal + testsTotal;
			
			 LocalDate currentDate = LocalDate.now();
		     DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		     String formattedDate = currentDate.format(formatter);
		     
		     cGHSModel.setDate(formattedDate);
		     cGHSModel.setPlace(employee.getPlace());
			
			
			model.addAttribute("bean", cGHSModel);
			model.addAttribute("totAmoutClaimed", totAmoutClaimed);
		}else {
			model.addAttribute("msg", "Request Number is not existed");
			return "cghs/cghsmrcfPrintform";
		}
		
		 
		return "cghs/cghsmrcfPrint";
	}

}

