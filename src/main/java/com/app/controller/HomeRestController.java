package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.Employee_allowance;
import com.app.entity.GEM;
import com.app.entity.LTC;
import com.app.entity.Medical_Bills_upload;
import com.app.repo.Employee_Family_Repo;
import com.app.repo.Employee_allowanceRepo;
import com.app.repo.LTCRepo;
import com.app.repo.Medical_Bills_uploadRepo;
import com.app.service.GEM_Service;
import com.app.service.IEmployeeService;
import com.app.service.LTCService;

@RestController
public class HomeRestController {

	@Autowired
	private Employee_Family_Repo employeeFamilyRepo;
	@Autowired
	private LTCService ltcService;
	@Autowired
	private Employee_allowanceRepo employee_allowanceRepo;
	@Autowired
	private IEmployeeService employeeService;
	@Autowired
	private LTCRepo lTCRepo;
	@Autowired
	private GEM_Service gemService;
	@Autowired
	private Medical_Bills_uploadRepo medical_Bills_uploadRepo;
	

	@GetMapping("/getFamilyDetails")
	public List<Employee_Family> getFamilyDetails(@RequestParam("emp_code") String emp_code) {
		System.out.println("emp_code===> " + emp_code);
		List<Employee_Family> family = employeeFamilyRepo.getAllByEmpcode(emp_code);
		return family;
	}

	@GetMapping("/relationsearch")
	public Employee_Family relationSearch(@RequestParam("eno") String eno,
			@RequestParam("patient_name") String patient_name) {
		System.out.println("emp_code,patient_name===> " + eno + ", " + patient_name);
		Employee_Family family = employeeFamilyRepo.getRelation(eno, patient_name);
		return family;
	}

	@GetMapping("/getltcbycode")
	public LTC getltcbycode(@RequestParam String requestno) {
		System.out.println("getltcbycode=> requestno=> " + requestno);
		LTC ltc = ltcService.getLTCById(requestno);
		return ltc;
	}

	@GetMapping("/checkSO")
	public Integer checkSO(@RequestParam String siodate) {
		System.out.println("checkSO=> " + siodate);
		Integer find = 404;
		try {
			Employee_allowance emp = employee_allowanceRepo.findBySO(siodate);
			if(emp == null) { find = 404; }
			else { find =200; }
			
			LTC soltc = lTCRepo.checkSO(siodate);
			if(soltc == null) { find = 404; }
			else { find =200; }
			
			Medical_Bills_upload mbu = medical_Bills_uploadRepo.findBySO(siodate);
			if(mbu == null) { find = 404; }
			else { find =200; }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return find;
	}

	@GetMapping("/empNameandDesignation")
	public String employee(@RequestParam String empcode) {
		System.out.println("/findByEmpcode => empcode=> " + empcode);
		String nameanddesg = "";
		Employee emp = employeeService.getById(empcode);
		System.out.println("emp => " + emp);
		nameanddesg = emp.getName();
		nameanddesg = nameanddesg + ", "+emp.getDesignation();
		return nameanddesg;
	}
	
	@GetMapping("/getAllLtcs")
	public List<LTC> getAllLtcs(){
		return ltcService.getAll();
	}
	
	@GetMapping("/getAllGEMs")
	public List<GEM> getAllGEMs(){
		return gemService.getAllGEMs();
	}
	
	@GetMapping("/getGEMbycode")
	public GEM getGEMbycode(@RequestParam String requestno) {
		System.out.println("getGEMbycode=> requestno=> " + requestno);
		GEM gem = gemService.getGEMById(requestno);
		return gem;
	}

}
