package com.app.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.AppUser;
import com.app.entity.BriefCase;
import com.app.entity.CEA;
import com.app.entity.CGHS;
import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.entity.Employee_allowance;
import com.app.entity.GEM;
import com.app.entity.GPF;
import com.app.entity.LTC;
import com.app.entity.Medical_Bills;
import com.app.model.DistinctNoteNumbers;
import com.app.model.DistinctSanctionOrderNumbers;
import com.app.model.EmployeeCompleteDetailsModel;
import com.app.repo.AppUserRepo;
import com.app.repo.BriefCaseRepo;
import com.app.repo.CEARepo;
import com.app.repo.CGHSRepo;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;
import com.app.repo.Employee_allowanceRepo;
import com.app.repo.GEM_Repo;
import com.app.repo.GPF_Repo;
import com.app.repo.LTCRepo;
import com.app.repo.Medical_BillsRepo;
import com.app.service.GEM_Service;
import com.app.service.IEmployeeService;
import com.app.service.LTCService;
import com.app.util.MyUtil;

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
	private GEM_Service gemService;
	@Autowired
	private GEM_Repo gEM_Repo;
	@Autowired
	private GPF_Repo gpfRepo;
	@Autowired
	private Medical_BillsRepo medical_BillsRepo;
	@Autowired
	private EmployeeRepo employeeRepo;
	@Autowired
	private CEARepo cEARepo;
	@Autowired
	private LTCRepo ltcRepo;
	@Autowired
	private BriefCaseRepo briefCaseRepo;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private CGHSRepo cGHSRepo;
	@Autowired
	private AppUserRepo appUserRepo;
	
	@Autowired private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/validateEmpLogin")
	public ResponseEntity<?> validateEmpLogin(@RequestParam("username") String username,@RequestParam("doj") String doj) {
		System.out.println("username=>" + username);
		System.out.println("doj=>" + doj);

		try {
			AppUser user = appUserRepo.findByEmail(username);
			if (user == null) {
				return new ResponseEntity<Boolean>(false, HttpStatus.BAD_REQUEST);
			} else {
				Optional<Employee> employee = employeeRepo.findById(String.valueOf(user.getId()));
				
				if (employee.isPresent()) {
					Employee emp = employee.get();
					System.out.println("empempempemp=>" + emp.toString());
					
					DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					LocalDate dojFormat = LocalDate.parse(doj, dateTimeFormatter);
					System.out.println("dojFormat=>"+dojFormat);
					
					DateTimeFormatter dateTimeFormatter2 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
					String dobdate = dojFormat.format(dateTimeFormatter2);
					System.out.println("dobdate=>"+dobdate);
					
					DateTimeFormatter dateTimeFormatter3 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					String dojdate = dojFormat.format(dateTimeFormatter3);
					System.out.println("dojdate=>"+dojdate);
					
					Map<String, String> map = new HashedMap();
					
					System.out.println(dobdate+"="+emp.getDob());
					if(dobdate.equalsIgnoreCase(emp.getDob()) || dojdate.equalsIgnoreCase(emp.getDoj())) {
						System.out.println("KICKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
						map.put("username", username);
						map.put("found", "found");
						return new ResponseEntity<Map<String, String>>(map,HttpStatus.OK);
					}
					
//					System.out.println(dojdate+"="+emp.getDoj());
//					if(dojdate.equalsIgnoreCase(emp.getDoj())){
//						System.out.println("KIOOOOOOOOOOOOOOOOOOOOOO");
//						return new ResponseEntity<String>("found",HttpStatus.OK);
//					} 

				} else {
					return new ResponseEntity<String>("notfound", HttpStatus.BAD_REQUEST);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			e.printStackTrace();
			
		}
		  return new ResponseEntity<String>("notfound",HttpStatus.OK);
	}

	@GetMapping("/getAllCghs")
	public List<CGHS> getAllCghs() {
		List<CGHS> cghs = cGHSRepo.findAll();
		for (CGHS bean : cghs) {
			if (bean.getPatientId().equalsIgnoreCase("self")) {
				String empcode = bean.getEmpCode();
				bean.setEmpCode(myUtil.getEmpName(empcode));
				bean.setPatientId("self");
			} else {
				bean.setPatientId(myUtil.getFamilyMemberName(Integer.parseInt(bean.getPatientId())));
			}
		}
		return cghs;
	}

	@GetMapping("/getAllCghsEmp")
	public List<CGHS> getAllCghsEmp(String empCode) {
		List<CGHS> cghs = cGHSRepo.findByEmpCode(empCode);
		for (CGHS bean : cghs) {
			if (bean.getPatientId().equalsIgnoreCase("self")) {
				String empcode = bean.getEmpCode();
				bean.setEmpCode(myUtil.getEmpName(empcode));
				bean.setPatientId("self");
			} else {
				bean.setPatientId(myUtil.getFamilyMemberName(Integer.parseInt(bean.getPatientId())));
			}
		}
		return cghs;
	}

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
	public String checkSO(@RequestParam String siodate) {
		System.out.println("checkSO=> " + siodate);
		String find = "404";

		String ceaFind = "404";
		String ltcFind = "404";
		String gemFind = "404";
		String briefcaseFind = "404";

		try {
			List<CEA> cea = cEARepo.findBySanctionNumber(siodate);
			if (cea.isEmpty()) {
				ceaFind = "404";
			} else {
				ceaFind = "200";
			}

			LTC ltc = ltcRepo.getLTCBySanctionorderno(siodate);
			if (ltc == null) {
				ltcFind = "404";
			} else {
				ltcFind = "200";
			}

			GEM gem = gEM_Repo.getBySanctionNumber(siodate);
			if (gem == null) {
				gemFind = "404";
			} else {
				gemFind = "200";
			}

			BriefCase briefcase = briefCaseRepo.findBySanctionNumber(siodate);
			if (briefcase == null) {
				briefcaseFind = "404";
			} else {
				briefcaseFind = "200";
			}

			if (ceaFind.equalsIgnoreCase("200") || ltcFind.equalsIgnoreCase("200") || gemFind.equalsIgnoreCase("200")
					|| briefcaseFind.equalsIgnoreCase("200")) {
				find = "200";
			} else {
				find = "404";
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

	@GetMapping("/getGEMbycode")
	public GEM getGEMbycode(@RequestParam String requestno) {
		System.out.println("getGEMbycode=> requestno=> " + requestno);
		GEM gem = gemService.getGEMById(requestno);
		return gem;
	}

	// MEDICAL NOTESHEET

	// Medical Bills Based on Request Number
	@GetMapping("/getMedicBillsByReqNoNS")
	public List<Medical_Bills> getMedicBillsByReqNo(@RequestParam String requestNo) {
		return medical_BillsRepo.getByReqNoNS(Integer.parseInt(requestNo));
	}

	// Medical Bills Based on Employee Code
	@GetMapping("/getMedicBillsByEmpcodeNS")
	public List<Medical_Bills> getMedicBillsByEmpcode(@RequestParam String emp_code) {
		return medical_BillsRepo.getByEmpcodeNS(emp_code);
	}

	// Medical Bills Based on Employee Code and Request Number
	@GetMapping("/getByReqNoAndEmpcodeNS")
	public List<Medical_Bills> getByReqNoAndEmpcode(@RequestParam String requestNo, @RequestParam String emp_code) {
		return medical_BillsRepo.getByReqNoAndEmpcodeNS(requestNo, emp_code);
	}

	@GetMapping("/getMedicBillsByPatienctName2")
	public List<Medical_Bills> getMedicBillsByPatienctName2(String patient_name, @RequestParam String emp_code) {
		System.out.println("patient_name=> " + patient_name);
		System.out.println("emp_code=> " + emp_code);
		return medical_BillsRepo.getMedicBillsByPatienctName2(patient_name, emp_code);
	}

	// MEDICAL SANCTION ORDER

	// Medical Bills Based on Request Number
	@GetMapping("/getMedicBillsByReqNoSO")
	public List<Medical_Bills> getMedicBillsByReqNoSO(@RequestParam String requestNo) {
		return medical_BillsRepo.getByReqNoSO(Integer.parseInt(requestNo));
	}

	// Medical Bills Based on Employee Code
	@GetMapping("/getMedicBillsByEmpcodeSO")
	public List<Medical_Bills> getMedicBillsByEmpcodeSO(@RequestParam String emp_code) {
		return medical_BillsRepo.getByEmpcodeSO(emp_code);
	}

	// Medical Bills Based on Employee Code and Request Number
	@GetMapping("/getByReqNoAndEmpcodeSO")
	public List<Medical_Bills> getByReqNoAndEmpcodeSO(@RequestParam String requestNo, @RequestParam String emp_code) {
		return medical_BillsRepo.getByReqNoAndEmpcodeSO(requestNo, emp_code);
	}

	// GET ALL EMPLOYEES
	@GetMapping("/getEmps")
	public List<Employee> getEmps() {
		return employeeRepo.findAll(Sort.by(Sort.Direction.ASC, "code"));
	}

	@GetMapping("/getEmpss")
	public List<Employee> getEmpss() {
		List<Employee> data = employeeRepo.findAll(Sort.by(Sort.Direction.ASC, "code"));
		return data;
	}

	// GET ALL EMPLOYEE ALLOWANCES
	@GetMapping("/getAllAllowancesForNS")
	public List<Employee_allowance> getAllAllowancesForNS() {
		return employee_allowanceRepo.getAllAllowancesForNS();
	}

	// GET MedicaBills by Patient Name
	@GetMapping("/getMedicBillsByPatienctName")
	public List<Medical_Bills> getMedicBillsByPatienctName(String patient_name) {
		return medical_BillsRepo.getMedicBillsByPatienctName(patient_name);
	}

	// GET MedicaBills by Patient Name and Request No
	@GetMapping("/getMedicBillsByPatienctNameandReqNo")
	public List<Medical_Bills> getMedicBillsByPatienctNameandReqNo(String emp_code, String patient_name,
			Integer request_no) {
		return medical_BillsRepo.getMedicBillsByPatienctNameandReqNo(emp_code, patient_name, request_no);
	}

	// MedicalBills by Request No
	@GetMapping("/getMedicBillsByReqNoNS2")
	public List<Medical_Bills> getMedicBillsByReqNoNS2(@RequestParam String requestNo) {
		return medical_BillsRepo.getMedicBillsByReqNoNS2(Integer.parseInt(requestNo));
	}

	// All MedicalBills
	// for notesheet
	@GetMapping("/getAllMedicBills")
	public List<Medical_Bills> getAllMedicBills() {
		return medical_BillsRepo.getAllMedicBills();
	}

	// All MedicalBills
	// for sanction order
	@GetMapping("/getAllMedicBillss")
	public List<Medical_Bills> getAllMedicBillss() {
		return medical_BillsRepo.getAllMedicBillss();
	}

	// ==============================MEDICAL BILLS SANCTION
	// ORDER=======================================

	// MedicaBills by Patient Name
	@GetMapping("/getMedicBillsByPatienctNameSO")
	public List<Medical_Bills> getMedicBillsByPatienctNameSO(String patient_name) {
		System.out.println("patient_name====> " + patient_name);
		return medical_BillsRepo.getMedicBillsByPatienctNameSO(patient_name);
	}

	// MedicaBills by Patient Name and Request No
	@GetMapping("/getMedicBillsByPatienctNameandReqNoSO")
	public List<Medical_Bills> getMedicBillsByPatienctNameandReqNoSO(String emp_code, String patient_name,
			Integer request_no) {
		return medical_BillsRepo.getMedicBillsByPatienctNameandReqNoSO(emp_code, patient_name, request_no);
	}

	// MedicalBills by Request No
	@GetMapping("/getMedicBillsByReqNoSO2")
	public List<Medical_Bills> getMedicBillsByReqNoSO2(@RequestParam String requestNo) {
		return medical_BillsRepo.getMedicBillsByReqNoSO2(Integer.parseInt(requestNo));
	}

//	==============================CEA CEA CEA CEA CEA============================

	@Autowired
	private CEARepo ceaRepo;

	@GetMapping("/getAllCEAsForEdit")
	public List<CEA> getAllCEAsForEdit() {
		return ceaRepo.getAllCEAsForEdit();
	}

	@GetMapping("/getCEAForEditById")
	public CEA getCEAForEditById(String requestno) {
		return ceaRepo.getCEAForEditById(requestno);
	}

	@GetMapping("/getCEAsForNS")
	public List<CEA> getCEAsForNS() {
		return ceaRepo.getCEAsForNS();
	}

	@GetMapping("/getCEAsForSO")
	public List<CEA> getCEAsForSO() {
		return ceaRepo.getCEAsForSO();
	}

	// =========================LTC========================
	@GetMapping("/getLTCForNS")
	public LTC getLTCForNS(String requestno) {
		return ltcRepo.getLTCForNS(requestno);
	}

	@GetMapping("/getAllLTCForNS")
	public List<LTC> getAllLTCForNS() {
		return ltcRepo.getAllLTCForNS();
	}

	@GetMapping("/getLTCForSO")
	public LTC getLTCForSO(String requestno) {
		return ltcRepo.getLTCForSO(requestno);
	}

	@GetMapping("/getAllLTCForSO")
	public List<LTC> getAllLTCForSO() {
		return ltcRepo.getAllLTCForSO();
	}

	// =========LTC ENCASHMENT EDIT
	@GetMapping("/getAllLTCEncashForEdit")
	public List<LTC> getAllLTCEncashForEdit() {
		return ltcRepo.getAllLTCEncashForEdit();
	}

	@GetMapping("/getLTCEncashForEdit")
	public LTC getLTCEncashForEdit(String requestno) {
		return ltcRepo.getLTCEncashForEdit(requestno);
	}

	// ==================Encashment===========NOTESHEET============
	@GetMapping("/getAllLTCEncashForNS")
	public List<LTC> getAllLTCEncashForNS() {
		return ltcRepo.getAllLTCEncashForNS();
	}

	@GetMapping("/getLTCEncashForNS")
	public LTC getLTCEncashForNS(String requestno) {
		return ltcRepo.getLTCEncashForNS(requestno);
	}

	// ========PRINTS======LTC=========Encashment=======NOTESHEET=====
	@GetMapping("/getAllLTCEncashForNSPrints")
	public List<LTC> getAllLTCEncashForNSPrints() {
		return ltcRepo.getAllLTCEncashForNSPrints();
	}

	@GetMapping("/getLTCEncashForNSPrints")
	public LTC getLTCEncashForNSPrints(String requestno) {
		return ltcRepo.getLTCEncashForNSPrints(requestno);
	}

	// =====PRINTS=============Encashment===========SANCTION ORDER============
	@GetMapping("/getAllLTCEncashForSOPrints")
	public List<LTC> getAllLTCEncashForSOPrints() {
		return ltcRepo.getAllLTCEncashForSOPrints();
	}

	@GetMapping("/getLTCEncashForSOPrints")
	public LTC getLTCEncashForSOPrints(String requestno) {
		return ltcRepo.getLTCEncashForSOPrints(requestno);
	}

	// ========PRINTS======LTC=========Advance=======NOTESHEET=====
	@GetMapping("/getAllLTCAdvanceForNSPrints")
	public List<LTC> getAllLTCAdvanceForNSPrints() {
		return ltcRepo.getAllLTCAdvanceForNSPrints();
	}

	@GetMapping("/getLTCAdvanceForNSPrints")
	public LTC getLTCAdvanceForNSPrints(String requestno) {
		return ltcRepo.getLTCAdvanceForNSPrints(requestno);
	}

	// ========PRINTS======LTC=========Advance=======SANCTION ORDER
	@GetMapping("/getAllLTCAdvanceForSOPrints")
	public List<LTC> getAllLTCAdvanceForSOPrints() {
		return ltcRepo.getAllLTCAdvanceForSOPrints();
	}

	@GetMapping("/getLTCAdvanceForSOPrints")
	public LTC getLTCAdvanceForSOPrints(String requestno) {
		return ltcRepo.getLTCAdvanceForSOPrints(requestno);
	}

	// ========================Advance====================
	@GetMapping("/getAllLTCAdvanceForEdit")
	public List<LTC> getAllLTCAdvanceForEdit() {
		return ltcRepo.getAllLTCAdvanceForEdit();
	}

	@GetMapping("/getLTCAdvanceForEdit")
	public LTC getLTCAdvanceForEdit(String requestno) {
		return ltcRepo.getLTCAdvanceForEdit(requestno);
	}

	@GetMapping("/getAllLTCAdvanceForSO")
	public List<LTC> getAllLTCAdvanceForSO() {
		return ltcRepo.getAllLTCAdvanceForSO();
	}

	@GetMapping("/getLTCAdvanceForSO")
	public LTC getLTCAdvanceForSO(String requestno) {
		return ltcRepo.getLTCAdvanceForSO(requestno);
	}

	// ======================GEM===VEHICLE=====================
	@GetMapping("getAllGemVehicleForEdit")
	public List<GEM> getAllGemVehicleForEdit() {
		return gEM_Repo.getAllGemVehicleForEdit();
	}

	@GetMapping("getGemVehicleForEdit")
	public GEM getGemVehicleForEdit(String requestno) {
		return gEM_Repo.getGemVehicleForEdit(requestno);
	}

	@GetMapping("getAllGemVehicleForNS")
	public List<GEM> getAllGemVehicleForNS() {
		return gEM_Repo.getAllGemVehicleForNS();
	}

	@GetMapping("getGemVehicleForNS")
	public GEM getGemVehicleForNS(String requestno) {
		return gEM_Repo.getGemVehicleForNS(requestno);
	}

	@GetMapping("getAllGemVehicleForSO")
	public List<GEM> getAllGemVehicleForSO() {
		return gEM_Repo.getAllGemVehicleForSO();
	}

	@GetMapping("getGemVehicleForSO")
	public GEM getGemVehicleForSO(String requestno) {
		return gEM_Repo.getGemVehicleForSO(requestno);
	}

	// ======================PRINTS===VEHICLE=====NOTESHEET============
	@GetMapping("getAllGemVehicleForNSPrints")
	public List<GEM> getAllGemVehicleForNSPrints() {
		return gEM_Repo.getAllGemVehicleForNSPrints();
	}

	@GetMapping("getGemVehicleForNSPrints")
	public GEM getGemVehicleForNSPrints(String requestno) {
		return gEM_Repo.getGemVehicleForNSPrints(requestno);
	}

	// ======================PRINTS===VEHICLE=====SANCTION ORDER============
	@GetMapping("getAllGemVehicleForSOPrints")
	public List<GEM> getAllGemVehicleForSOPrints() {
		return gEM_Repo.getAllGemVehicleForSOPrints();
	}

	@GetMapping("getGemVehicleForSOPrints")
	public GEM getGemVehicleForSOPrints(String requestno) {
		return gEM_Repo.getGemVehicleForSOPrints(requestno);
	}

	// ==========GEM============PRINTS===OUTSOURCE=====NOTESHEET============
	@GetMapping("getAllGemOutsourceForNSPrints")
	public List<GEM> getAllGemOutsourceForNSPrints() {
		return gEM_Repo.getAllGemOutsourceForNSPrints();
	}

	@GetMapping("getGemOutsourceNSPrints")
	public GEM getGemOutsourceNSPrints(String requestno) {
		return gEM_Repo.getGemOutsourceNSPrints(requestno);
	}

	// =========GEM=============PRINTS===OUTSOURCE=====SANCTION ORDER============
	@GetMapping("getAllGemOutsourceForSOPrints")
	public List<GEM> getAllGemOutsourceForSOPrints() {
		return gEM_Repo.getAllGemOutsourceForSOPrints();
	}

	@GetMapping("getGemOutsourceSOPrints")
	public GEM getGemOutsourceSOPrints(String requestno) {
		return gEM_Repo.getGemOutsourceSOPrints(requestno);
	}

	// ==================GEM====OUTSOURCE=====================
	@GetMapping("getAllGemOutsourceForEdit")
	public List<GEM> getAllGemOutsourceForEdit() {
		return gEM_Repo.getAllGemOutsourceForEdit();
	}

	@GetMapping("getGemOutsourceForEdit")
	public GEM getGemOutsourceForEdit(String requestno) {
		return gEM_Repo.getGemOutsourceForEdit(requestno);
	}

	@GetMapping("getAllGemOutsourceForNS")
	public List<GEM> getAllGemOutsourceForNS() {
		return gEM_Repo.getAllGemOutsourceForNS();
	}

	@GetMapping("getGemOutsourceForNS")
	public GEM getGemOutsourceForNS(String requestno) {
		return gEM_Repo.getGemOutsourceForNS(requestno);
	}

	@GetMapping("getAllGemOutsourceForSO")
	public List<GEM> getAllGemOutsourceForSO() {
		return gEM_Repo.getAllGemOutsourceForSO();
	}

	@GetMapping("getGemOutsourceForSO")
	public GEM getGemOutsourceForSO(String requestno) {
		return gEM_Repo.getGemOutsourceForSO(requestno);
	}

	// =======================GPF===Withdraw====================
	@GetMapping("getAllGPFWithdrawForEdit")
	public List<GPF> getAllGPFWithdrawForEdit() {
		return gpfRepo.getAllGPFWithdrawForEdit();
	}

	@GetMapping("getGPFWithdrawForEdit")
	public GPF getGPFWithdrawForEdit(String requestno) {
		return gpfRepo.getGPFWithdrawForEdit(requestno);
	}

	@GetMapping("getAllGPFWithdrawForNS")
	public List<GPF> getAllGPFWithdrawForNS() {
		return gpfRepo.getAllGPFWithdrawForNS();
	}

	@GetMapping("getGPFWithdrawForNS")
	public GPF getGPFWithdrawForNS(String requestno) {
		return gpfRepo.getGPFWithdrawForNS(requestno);
	}

	@GetMapping("getAllGPFWithdrawForSO")
	public List<GPF> getAllGPFWithdrawForSO() {
		return gpfRepo.getAllGPFWithdrawForSO();
	}

	@GetMapping("getGPFWithdrawForSO")
	public GPF getGPFWithdrawForSO(String requestno) {
		return gpfRepo.getGPFWithdrawForSO(requestno);
	}

	@GetMapping("getAllGPFWithdrawForSOPrint")
	public List<GPF> getAllGPFWithdrawForSOPrint() {
		return gpfRepo.getAllGPFWithdrawForSOPrint();
	}

	@GetMapping("getAllGPFWithdrawForNSPrint")
	public List<GPF> getAllGPFWithdrawForNSPrint() {
		return gpfRepo.getAllGPFWithdrawForNSPrint();
	}

	// ==============CEA REPORTS
	// NOTESHEET
	@GetMapping("/getDistinctNotenumbers")
	public List<DistinctNoteNumbers> getDistinctNotenumbers() {
		return ceaRepo.getDistinctNotenumbers();
	}

	@GetMapping("/getDistinctSanctionOrderNumbers")
	public List<DistinctSanctionOrderNumbers> getDistinctSanctionOrderNumbers() {
		return ceaRepo.getDistinctSanctionOrderNumbers();
	}

	// ============BRIEFCASE
	@GetMapping("/findByNoteStatus")
	public List<BriefCase> findByNoteStatus(Boolean noteStatus) {
		System.out.println("noteStatus=>" + noteStatus);
		return briefCaseRepo.findByNoteStatus(noteStatus);
	}

	@GetMapping("/findByNoteStatusandSanctionStatus")
	public List<BriefCase> findByNoteStatusandSanctionStatus(Boolean noteStatus, Boolean sanctionStatus) {
		System.out.println("noteStatus=>" + noteStatus);
		System.out.println("noteStatus=>" + sanctionStatus);
		return briefCaseRepo.findByNoteStatusandSanctionStatus(noteStatus, sanctionStatus);
	}

	@GetMapping("getEmpDetails")
	public EmployeeCompleteDetailsModel getEmpDetails(String code) {
		System.out.println("UR in getEmpDetails" + code);
		Optional<Employee> employee = employeeRepo.findById(code);
		EmployeeCompleteDetailsModel employeeCompleteDetailsModel = null;
		if (employee.isPresent()) {
			employeeCompleteDetailsModel = new EmployeeCompleteDetailsModel();
			employeeCompleteDetailsModel.setCode(employee.get().getCode());
			employeeCompleteDetailsModel.setName(employee.get().getName());
			employeeCompleteDetailsModel.setDesignation(employee.get().getDesignation());
			employeeCompleteDetailsModel.setBasic_pay(employee.get().getBasic_pay());
			employeeCompleteDetailsModel.setPlace(employee.get().getPlace());
			employeeCompleteDetailsModel.setEmail(employee.get().getEmail());
			employeeCompleteDetailsModel.setDate_of_retirement(employee.get().getDate_of_retirement());
			employeeCompleteDetailsModel.setDob(employee.get().getDob());
			employeeCompleteDetailsModel.setPayscale(employee.get().getPayscale());
			employeeCompleteDetailsModel.setCallSign(employee.get().getCallSign());
			employeeCompleteDetailsModel.setEcghsCode(employee.get().getEcghsCode());
			employeeCompleteDetailsModel.setPhno(employee.get().getPhno());
			employeeCompleteDetailsModel.setAddress(employee.get().getAddress());
			employeeCompleteDetailsModel.setWardEntitlement(employee.get().getWardEntitlement());
			employeeCompleteDetailsModel.setDoj(employee.get().getDoj());
			employeeCompleteDetailsModel.setDoa(employee.get().getDoa());

			List<Employee_Family> empFamily = employeeFamilyRepo.getAllByEmpcode(code);

			if (empFamily.size() > 0) {
				com.app.model.Employee_Family empfamily = null;
				List<com.app.model.Employee_Family> listempfamily = new ArrayList<com.app.model.Employee_Family>();

				for (Employee_Family emp : empFamily) {
					empfamily = new com.app.model.Employee_Family();
					empfamily.setId(emp.getId());
					empfamily.setEmp_code(emp.getEmp_code());
					empfamily.setPer_name(emp.getPer_name());
					empfamily.setRelation(emp.getRelation());
					empfamily.setDob(emp.getDob());
					empfamily.setDependency(emp.getDependency());
					empfamily.setCghsCode(emp.getCghsCode());
					listempfamily.add(empfamily);
				}
				System.out.println("listempfamily=>" + listempfamily.size());
				employeeCompleteDetailsModel.setFamily(listempfamily);
			}

		}
		return employeeCompleteDetailsModel;
	}

	@GetMapping("/getFinancialYears")
	public List<String> generateFinancialYears() {
		return myUtil.generateFinancialYears();
	}
	
	@GetMapping("/updatepassword")
	public List<AppUser> updatepassword() {
	List<AppUser> appUserList=	appUserRepo.getEmpDetails();
	appUserList.stream().forEach(item -> {
	    String[] parts = item.getEmail().split("@");
        String firstPart = parts[0];
	    appUserRepo.updatePwdDetails(item.getId(),passwordEncoder.encode(item.getEmail()));
	});
	
		return appUserList;
	}
	
	
	

}
