package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.Employee_allowance;
import com.app.entity.GEM;
import com.app.entity.GPF;
import com.app.entity.LTC;
import com.app.entity.Medical_Bills;
import com.app.entity.Medical_Bills_upload;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;
import com.app.repo.Employee_allowanceRepo;
import com.app.repo.GEM_Repo;
import com.app.repo.GPF_Repo;
import com.app.repo.LTCRepo;
import com.app.repo.Medical_BillsRepo;
import com.app.repo.Medical_Bills_uploadRepo;
import com.app.service.GEM_Service;
import com.app.service.IEmployeeService;
import com.app.service.LTCService;

@RestController
public class HomeRestController {

	@Autowired private Employee_Family_Repo employeeFamilyRepo;
	@Autowired private LTCService ltcService;
	@Autowired private Employee_allowanceRepo employee_allowanceRepo;
	@Autowired private IEmployeeService employeeService;
	@Autowired private LTCRepo lTCRepo;
	@Autowired private GEM_Service gemService;
	@Autowired private GEM_Repo gEM_Repo;
	@Autowired private Medical_Bills_uploadRepo medical_Bills_uploadRepo;
	@Autowired private GPF_Repo gpfRepo;
	@Autowired private Medical_BillsRepo medical_BillsRepo;  
	@Autowired private EmployeeRepo employeeRepo;

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
	public boolean checkSO(@RequestParam String siodate) {
		System.out.println("checkSO=> " + siodate);
		boolean find = false;
		
		boolean empFind = false;
		boolean ltcFind = false;
		boolean mbuFind = false;
		
		try {
			Employee_allowance emp = employee_allowanceRepo.findBySO(siodate);
			System.out.println("emp===> " + emp);
			if (emp == null) {
				System.out.println("emp == null=> ");
				empFind = false;
				
			} else {
				System.out.println("emp == null=>else ");
				empFind = true;
			}
			
			LTC soltc = lTCRepo.checkSO(siodate);
			if (soltc == null) {
				ltcFind = false;
			} else {
				ltcFind = true;
			}

			Medical_Bills_upload mbu = medical_Bills_uploadRepo.findBySO(siodate);
			if (mbu == null) {
				mbuFind = false;
			} else {
				mbuFind = true;
			}
			
			if(empFind == true || ltcFind == true || mbuFind == true) {
				find = true;
			}else {
				find = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("/checkSO==> final find value==> " + find);
		return find;
	}

	@GetMapping("/empNameandDesignation")
	public String employee(@RequestParam String empcode) {
		System.out.println("/findByEmpcode => empcode=> " + empcode);
		String nameanddesg = "";
		Employee emp = employeeService.getById(empcode);
		System.out.println("emp => " + emp);
		nameanddesg = emp.getName();
		nameanddesg = nameanddesg + ", " + emp.getDesignation();
		return nameanddesg;
	}

	@GetMapping("/getAllLtcs")
	public List<LTC> getAllLtcs() {
		return ltcService.getAll();
	}

	@GetMapping("/getAllGEMs")
	public List<GEM> getAllGEMs() {
		return gemService.getAllGEMs();
	}

	@GetMapping("/getGemsForSO")
	public List<GEM> getGemsForSO() {
		return gEM_Repo.getGemsForSO();
	}
	@GetMapping("/getOutsourceGems")
	public List<GEM> getOutsourceGems() {
		return gEM_Repo.getAllOutsourcingGEMs();
	}
	@GetMapping("/getVehicleGems")
	public List<GEM> getVehicleGems() {
		return gEM_Repo.getAllVehicleGEMs();
	}
	
	@GetMapping("/getGEMbycode")
	public GEM getGEMbycode(@RequestParam String requestno) {
		System.out.println("getGEMbycode=> requestno=> " + requestno);
		GEM gem = gemService.getGEMById(requestno);
		return gem;
	}
	
	//GPF WithDraw -By Id
	@GetMapping("/getGpfWithDrawById")
	public GPF getGpf(@RequestParam String requestNo) {
		System.out.println("/getGpfById=> requestNo=> "+requestNo);
		GPF gpf = gpfRepo.getWithDrawGPFById(requestNo).get();
		return gpf;
	}
	//GPF WithDraw - All
	@GetMapping("/getAllGPFWithDraw")
	public List<GPF> getAllGPF(){
		System.out.println("/getAllGPF");
		return gpfRepo.getAllWithDrawGPF();
	}
	
	
	//MEDICAL NOTESHEET
	
	//Medical Bills Based on Request Number
	@GetMapping("/getMedicBillsByReqNoNS")
	public List<Medical_Bills> getMedicBillsByReqNo(@RequestParam String requestNo){
		return medical_BillsRepo.getByReqNoNS(Integer.parseInt(requestNo));
	}
	//Medical Bills Based on Employee Code
	@GetMapping("/getMedicBillsByEmpcodeNS")
	public List<Medical_Bills> getMedicBillsByEmpcode(@RequestParam String	emp_code){
		return medical_BillsRepo.getByEmpcodeNS(emp_code);
	}
	//Medical Bills Based on Employee Code and Request Number
	@GetMapping("/getByReqNoAndEmpcodeNS")
	public List<Medical_Bills> getByReqNoAndEmpcode(@RequestParam String requestNo, @RequestParam String emp_code){
		return medical_BillsRepo.getByReqNoAndEmpcodeNS(requestNo, emp_code);
	}
	
	//MEDICAL SANCTION ORDER
	
	//Medical Bills Based on Request Number
		@GetMapping("/getMedicBillsByReqNoSO")
		public List<Medical_Bills> getMedicBillsByReqNoSO(@RequestParam String requestNo){
			return medical_BillsRepo.getByReqNoSO(Integer.parseInt(requestNo));
		}
	//Medical Bills Based on Employee Code
	@GetMapping("/getMedicBillsByEmpcodeSO")
	public List<Medical_Bills> getMedicBillsByEmpcodeSO(@RequestParam String	emp_code){
		return medical_BillsRepo.getByEmpcodeSO(emp_code);
	}
	
	//Medical Bills Based on Employee Code and Request Number
	@GetMapping("/getByReqNoAndEmpcodeSO")
	public List<Medical_Bills> getByReqNoAndEmpcodeSO(@RequestParam String requestNo, @RequestParam String emp_code){
		return medical_BillsRepo.getByReqNoAndEmpcodeSO(requestNo, emp_code);
	}
	
	//GET ALL EMPLOYEES
	@GetMapping("/getEmps")
	public List<Employee> getEmps(){
		return employeeRepo.findAll(Sort.by(Sort.Direction.ASC, "code"));
	}
	//GET ALL EMPLOYEE ALLOWANCES 
	@GetMapping("/getAllAllowancesForNS")
	public List<Employee_allowance> getAllAllowancesForNS(){
		return employee_allowanceRepo.getAllAllowancesForNS();
	}
	
}
