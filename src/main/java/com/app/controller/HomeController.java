package com.app.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.Vendor;
import com.app.repo.Employee_Family_Repo;
import com.app.service.IEmployeeService;
import com.app.service.IEmployee_Family_Service;
import com.app.service.IVendorService;

@Controller
public class HomeController {

	@Autowired
	private IVendorService vendorService;
	@Autowired
	private IEmployeeService employeeService;
	@Autowired
	private IEmployee_Family_Service employee_Family_Service;
	@Autowired
	private Employee_Family_Repo employee_Family_Repo;

//Employee Details
	@RequestMapping("/employee_insert")
	public String employee_insert(Employee employee, Model model) {
		return "employee_insert";
	}

	@RequestMapping("/saveEmp")
	public String saveEmp(
			@ModelAttribute("employee") Employee employee, Model model, HttpServletRequest request,
			MultipartFile photo_doc, MultipartFile cghsphoto_doc  ) throws IOException {

		System.out.println("UR in====saveEmp=====");
		System.out.println("employee=====" + employee.toString());
		
		System.out.println("photo_doc=====" + photo_doc);
		System.out.println("employee=====" + photo_doc);

		try {

			String[] feditname = request.getParameterValues("per_name");
			String[] editrelationname = request.getParameterValues("relation");
			String[] editdob = request.getParameterValues("editdob");
			String[] editdependency = request.getParameterValues("editdependency");
			String[] cghsCode = request.getParameterValues("cghsCode");

			String designation = request.getParameter("edesignation");
			String payscale = request.getParameter("egst");

			Employee saveEmployee;
			Employee_Family family;

			if (employeeService.findById(employee.getCode())) {
				saveEmployee = employeeService.getById(employee.getCode());

				saveEmployee.setName(employee.getName());
				saveEmployee.setDesignation(designation);
				saveEmployee.setBasic_pay(employee.getBasic_pay());
				saveEmployee.setDob(employee.getDob());
				saveEmployee.setPayscale(payscale);
				saveEmployee.setPlace(employee.getPlace());
				saveEmployee.setEcghsCode(employee.getEcghsCode());
				
				if(photo_doc.isEmpty()) { System.out.println("emp photo is nullllllllll"); }
				else { saveEmployee.setEmpPhoto(photo_doc.getBytes()); }
				if(cghsphoto_doc.isEmpty()) {System.out.println("cghs photo is nullllllllll");}
				else { saveEmployee.setEmpCghsPhoto(cghsphoto_doc.getBytes()); }
				saveEmployee.setPhno(employee.getPhno());
				
				saveEmployee.setAddress(employee.getAddress());
				saveEmployee.setWardEntitlement(employee.getWardEntitlement());
				saveEmployee.setDoj(employee.getDoj());
				saveEmployee.setDoa(employee.getDoa());
				saveEmployee.setGpfaccno(employee.getGpfaccno());

				employee_Family_Repo.deleteAllFamilyDetailsByEmpCode(employee.getCode());

				for (int i = 0; i < feditname.length; i++) {
					String x = feditname[i];
					if (x.equalsIgnoreCase("") || x.equals(null)) {
						System.out.println("iffffffffffffffffffffffffffffffff");
					} else {
						System.out.println("elseeeeeeeeeeeeeeeeeeeeeeeee");
						family = new Employee_Family();
						family.setEmp_code(employee.getCode());
						family.setPer_name(feditname[i]);
						family.setRelation(editrelationname[i]);
						family.setDob(editdob[i]);
						family.setDependency(editdependency[i]);
						family.setCghsCode(cghsCode[i]);
						
						employee_Family_Service.saveEmployee_Family(family);
					}
				}
				employeeService.saveEmployee(saveEmployee);
			} else {

				saveEmployee = new Employee();
				saveEmployee.setCode(employee.getCode());
				saveEmployee.setName(employee.getName());
				saveEmployee.setDesignation(designation);
				saveEmployee.setBasic_pay(employee.getBasic_pay());
				saveEmployee.setDob(employee.getDob());
				saveEmployee.setPayscale(payscale);
				saveEmployee.setEcghsCode(employee.getEcghsCode());
				saveEmployee.setAddress(employee.getAddress());
				saveEmployee.setWardEntitlement(employee.getWardEntitlement());
				saveEmployee.setGpfaccno(employee.getGpfaccno());
				
				if(photo_doc == null) { }
				else { saveEmployee.setEmpPhoto(photo_doc.getBytes()); }
				saveEmployee.setPhno(employee.getPhno());

				for (int i = 0; i < feditname.length; i++) {
					String x = feditname[i];
					if (x.equalsIgnoreCase("")) {

					} else {
						family = new Employee_Family();
						family.setEmp_code(employee.getCode());
						family.setPer_name(feditname[i]);
						family.setRelation(editrelationname[i]);
						family.setDob(editdob[i]);
						family.setDependency(editdependency[i]);
						family.setCghsCode(cghsCode[i]);
						
						employee_Family_Service.saveEmployee_Family(family);
					}
				}
				employeeService.saveEmployee(saveEmployee);
			}

			model.addAttribute("msg", "Employee inserted Successfully");
			return "home";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong while Saving Employee Details, Please Try Again Once");
			return "home";
		}
	}

	@RequestMapping("/employeesearchnum")
	public ResponseEntity<List<String>> employeesearchnum(@RequestParam("code") String code) {
		System.out.println("======employeesearchnum=======");
		System.out.println("======code=======" + code);

		Employee emp = employeeService.getById(code);
		System.out.println("sdfsdf" + emp.toString());

		String empName = emp.getName();
		String empBasicPay = emp.getBasic_pay();
		String empDob = emp.getDob();
		String ps = emp.getPayscale();
		String empDesg = emp.getDesignation();
		
		String photo = "";
		if(emp.getEmpPhoto() == null) { photo = ""; }else 
		{ photo = Base64.getEncoder().encodeToString(emp.getEmpPhoto()); }
		
		String cghsPhoto = "";
		if(emp.getEmpCghsPhoto() == null) { cghsPhoto = ""; }else 
		{ cghsPhoto = Base64.getEncoder().encodeToString(emp.getEmpCghsPhoto()); }
		
		String phno = emp.getPhno();
		String address = emp.getAddress();

		List<String> empDetails = new ArrayList<String>();
		empDetails.add(empName); // 0
		empDetails.add(empDesg); // 1
		empDetails.add(empBasicPay); // 2
		empDetails.add(empDob.toString()); // 3
		empDetails.add(ps); // 4
		empDetails.add(emp.getPlace()); //5
		empDetails.add(emp.getEcghsCode()); //6
		empDetails.add(photo);//7
		empDetails.add(phno);//8
		empDetails.add(address);//9
		empDetails.add(emp.getWardEntitlement()); //10
		empDetails.add(emp.getDoj());//11
		empDetails.add(emp.getDoa());//12
		empDetails.add(cghsPhoto);//13
		empDetails.add(emp.getGpfaccno()); //14
		
		return ResponseEntity.ok(empDetails);
	}

	@RequestMapping("/employeefamilysearch")
	public String employeefamilysearch(@RequestParam("code") String code, Model model) {
		System.out.println("=====employeefamilysearch======");
		System.out.println("=====code======" + code);

		List<Employee_Family> emp_family = employee_Family_Repo.getAllByEmpcode(code);
		System.out.println("==emp_family===" + emp_family.size());
		
		for(Employee_Family bean:emp_family) {
			if(bean.getCghsPhoto() != null) {
				bean.setFamilyCghsPhoto(Base64.getEncoder().encodeToString(bean.getCghsPhoto()));
			}else {
				bean.setFamilyCghsPhoto("");
			}
		}
		
		model.addAttribute("emp_family", emp_family);
		
		return "employee_family_data";
	}

//Vendor Details
	@RequestMapping("/vendor_insert")
	public String vinsert(Vendor vendor) {
		return "vendor_insert";
	}

	@RequestMapping("/saveVendor")
	public String saveVendor(@ModelAttribute("vendor") Vendor vendor, Model model,
			HttpServletRequest httpServletRequest) {
		System.out.println("saveVendor=> ModelAttribute(vendor)=> " + vendor.toString());

		try {

			if (vendorService.existOrNot(vendor.getCode())) {
				Vendor existedVendor = vendorService.getById(vendor.getCode());
				existedVendor.setCode(vendor.getCode());
				existedVendor.setName(vendor.getName());
				existedVendor.setPan_no(vendor.getPan_no());
				existedVendor.setBank_acno(vendor.getBank_acno());
				existedVendor.setIfsc_code(vendor.getIfsc_code());
				existedVendor.setAddress(vendor.getAddress());
				existedVendor.setGst_no(vendor.getGst_no());
				existedVendor.setBank_name(vendor.getBank_name());
				vendorService.saveVendor(existedVendor);
			} else {
				vendorService.saveVendor(vendor);
			}
			model.addAttribute("msg", "vendor is inserted successfully");
			System.out.println("vendor is inserted successfully");
			return "home";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong while Saving Vendor Details Please Try Again Once");
			return "home";
		}
	}

	// get name and designation ajax calling
	@RequestMapping("/getNameDesg")
	public ResponseEntity<List<String>> empNamebycode(@RequestParam("code") String code) {
		System.out.println("code=========> " + code);
		Employee emp = employeeService.getById(code);
		System.out.println("sdfsdf" + emp.toString());
		String empName = emp.getName();
		String empBasicPay = emp.getBasic_pay();


		List<String> empDetails = new ArrayList<String>();
		empDetails.add(empName); // 0
		empDetails.add(empBasicPay); // 2

		return ResponseEntity.ok(empDetails);
	}

	@RequestMapping("/billsuploadedit")
	public String billsuploadedit() {
		return null;
	}

	@RequestMapping("/vendorsearchnum")
	public ResponseEntity<List<String>> vendorsearchnum(@RequestParam("code") String code) {
		System.out.println("=====vendorsearchnum=======");
		System.out.println("=====code=======" + code);

		Vendor vendor = vendorService.getById(code);
		System.out.println("=====vendor=======" + vendor.toString());
		List<String> list = new ArrayList<String>();
		list.add(vendor.getName()); // 0
		list.add(vendor.getPan_no()); // 1
		list.add(vendor.getBank_name()); // 2
		list.add(vendor.getBank_acno()); // 3
		list.add(vendor.getIfsc_code()); // 4
		list.add(vendor.getAddress()); // 5
		list.add(vendor.getGst_no()); // 6
		list.add(vendor.getBank_address()); // 7

		return ResponseEntity.ok(list);
	}

	@RequestMapping("/test")
	public String test() {
		return "test";
	}

}

