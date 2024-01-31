package com.app.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.empapplyforms.EmpCEAApplyForm;
import com.app.empapplyforms.EmpGPFAdvanceApplyForm;
import com.app.empapplyforms.EmpGPFApplyForm;
import com.app.empapplyforms.model.ChildDataSet;
import com.app.empapplyforms.model.ChildDetails;
import com.app.empapplyforms.model.Employeedataset;
import com.app.entity.AppUser;
import com.app.entity.Employee;
import com.app.model.EmployeeCompleteDetailsModel;
import com.app.model.Employee_Family;
import com.app.model.ResponseParams;
import com.app.repo.EmpCEAApplyFormRepo;
import com.app.repo.EmpGPFAdvanceApplyFormRepo;
import com.app.repo.EmpGPFApplyFormRepo;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;
import com.app.util.MyUtil;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

@Controller
public class ApplyFormsController {
	

	@Autowired
	private EmpCEAApplyFormRepo empCEAApplyFormRepo;
	@Autowired
	private HomeRestController homeRestController;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private EmpGPFApplyFormRepo empGPFApplyFormRepo;
	@Autowired private EmployeeRepo employeeRepo;
	
	@Autowired private EmpGPFAdvanceApplyFormRepo empGPFAdvanceApplyFormRepo;
	@Autowired private Employee_Family_Repo employee_Family_Repo;

	// ===================== EMP CEA APPLY =====================================

	@RequestMapping("/empCEAApplyForm")
	public String empCEAApplyForm(Model model,HttpSession session) {
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<com.app.entity.Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		return "empApplyForms/empCEAApplyForm";
	}

	@RequestMapping("/saveempCEAApply")
	public String saveempCEAApply(HttpServletRequest request, Model model) {

		String empCode = request.getParameter("empCode");
		System.out.println("empCode=>" + empCode);
		String financialYear = request.getParameter("financialYear");
		System.out.println("financialYear=>" + financialYear);

		String spousId = request.getParameter("spouseNamee");
		System.out.println("spouseNamee=>" + spousId);
		String spouseOrg = request.getParameter("spouseOrg");
		System.out.println("spouseOrg=>" + spouseOrg);
		String spouseDesg = request.getParameter("spouseDesg");
		System.out.println("spouseDesg=>" + spouseDesg);
		String spouseJobAddress = request.getParameter("spouseAddress");
		System.out.println("spouseJobAddress=>" + spouseJobAddress);

		String[] childsIds = request.getParameter("childIdd").split(",");
		System.out.println("childsIds=>" + childsIds.length);
		String[] childSchoolNamee = request.getParameter("childSchoolNamee").split(",");
		System.out.println("childSchoolNamee=>" + childSchoolNamee.length);
		String[] childAcademicYearr = request.getParameter("childAcademicYearr").split(",");
		System.out.println("childAcademicYearr=>" + childAcademicYearr.length);
		String[] claimforr = request.getParameter("claimforr").split(",");
		System.out.println("claimforr=>" + claimforr.length);

		String distanceHostel = request.getParameter("distanceHostel");
		System.out.println("distanceHostel=>" + distanceHostel);
		String hostelSubsidy = request.getParameter("hostelSubsidy");
		System.out.println("hostelSubsidy=>" + hostelSubsidy);

		String phd = request.getParameter("phd");
		System.out.println("phd=>" + phd);
		String phdNature = request.getParameter("phdNature");
		System.out.println("phdNature=>" + phdNature);
		String phdDate = request.getParameter("phdDate");
		System.out.println("phdDate=>" + phdDate);
		String phdPercentage = request.getParameter("phdPercentage");
		System.out.println("phdPercentage=>" + phdPercentage);

		String bonafideCertificate = request.getParameter("bonafideCertificate");
		System.out.println("bonafideCertificate=>" + bonafideCertificate);
		String bonafideAmtAttached = request.getParameter("bonafideAmtAttached");
		System.out.println("bonafideAmtAttached=>" + bonafideAmtAttached);
		String bonafideAmt = request.getParameter("bonafideAmt");
		System.out.println("bonafideAmt=>" + bonafideAmt);

		EmpCEAApplyForm bean = new EmpCEAApplyForm();

		bean.setEmpCode(Integer.parseInt(empCode));
		bean.setSpouseId(spousId);
		bean.setSpouseOrg(spouseOrg);
		bean.setSpouseDesg(spouseDesg);
		bean.setSpouseAddress(spouseJobAddress);
		bean.setFinancialYear(financialYear);

		if (childsIds.length == 1) {
			bean.setChildId1(childsIds[0]);
			bean.setChildSchoolName1(childSchoolNamee[0]);
			bean.setChildAcademicYear1(childAcademicYearr[0]);
			bean.setNoOfChilds("1");
			bean.setClaimfor1(claimforr[0]);
		}

		if (childsIds.length == 2) {
			bean.setChildId1(childsIds[0]);
			bean.setChildSchoolName1(childSchoolNamee[0]);
			bean.setChildAcademicYear1(childAcademicYearr[0]);
			bean.setClaimfor1(claimforr[0]);

			bean.setChildId2(childsIds[1]);
			bean.setChildSchoolName2(childSchoolNamee[1]);
			bean.setChildAcademicYear2(childAcademicYearr[1]);
			bean.setClaimfor2(claimforr[1]);

			bean.setNoOfChilds("2");
		}

		bean.setDistanceHostel(distanceHostel);
		bean.setHostelSubsidy(hostelSubsidy);

		bean.setDisableChild(phd);
		if (phd.equalsIgnoreCase("YES")) {
			bean.setDisableNature(phdNature);
			bean.setDisableCertificateDate(phdDate);
			bean.setDisablePercentage(phdPercentage);
		} else {
			bean.setDisableNature("NULL");
			bean.setDisableCertificateDate("NULL");
			bean.setDisablePercentage("NULL");
		}

		bean.setBonafideCertificate(bonafideCertificate);
		bean.setBonafideAmtAttached(bonafideAmtAttached);
		if (bonafideAmtAttached.equalsIgnoreCase("YES")) {
			bean.setBonafideAmt(bonafideAmt);
		} else {
			bean.setBonafideAmt("NULL");
		}

		EmpCEAApplyForm emp = empCEAApplyFormRepo.save(bean);
		model.addAttribute("msg", "APPLICATION IS SAVED SUCCESSFULLY WITH APPLICATION ID:" + emp.getId());

		return "home";
	}

	@RequestMapping("/empCeaApplyPrintForm")
	public String empCeaApplyPrintForm(Model model,String code,HttpSession session) {
		
		System.out.println("code=>"+code);
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<com.app.entity.Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		

		//List<EmpCEAApplyForm> listBeans = empCEAApplyFormRepo.findAll();
		List<EmpCEAApplyForm> listBeans = empCEAApplyFormRepo.findByEmpCode(Integer.parseInt(code));
		
		
		String spouseName = "";

		List<ResponseParams> list = new ArrayList<>();

		for (EmpCEAApplyForm bean : listBeans) {
			EmployeeCompleteDetailsModel getEmpDetails = homeRestController
					.getEmpDetails(String.valueOf(bean.getEmpCode()));

			ResponseParams responseParams = new ResponseParams();
			responseParams.setId(bean.getId());

			for (Employee_Family family : getEmpDetails.getFamily()) {
				if (bean.getSpouseId().equalsIgnoreCase(String.valueOf(family.getId()))) {
					responseParams.setSpouseName(family.getPer_name());
					spouseName = family.getPer_name();
				}

				if (bean.getNoOfChilds().equalsIgnoreCase("1")) {
					if (bean.getChildId1().equalsIgnoreCase(String.valueOf(family.getId()))) {
						responseParams.setChildNameOne(family.getPer_name());
					}
					responseParams.setChildAcadamicYearOne(bean.getChildAcademicYear1());
					responseParams.setChildSchoolNameOne(bean.getChildSchoolName1());
				}
				if (bean.getNoOfChilds().equalsIgnoreCase("2")) {
					if (bean.getChildId1().equalsIgnoreCase(String.valueOf(family.getId()))) {
						responseParams.setChildNameOne(family.getPer_name());
					}
					responseParams.setChildAcadamicYearOne(bean.getChildAcademicYear1());
					responseParams.setChildSchoolNameOne(bean.getChildSchoolName1());

					if (bean.getChildId2().equalsIgnoreCase(String.valueOf(family.getId()))) {
						responseParams.setChildNameTwo(family.getPer_name());
					}
					responseParams.setChildAcadamicYearTwo(bean.getChildAcademicYear2());
					responseParams.setChildSchoolNameTwo(bean.getChildSchoolName2());
				}
			}
			list.add(responseParams);
		}
		System.out.println("list size=>" + list.size());
		model.addAttribute("spouseName", spouseName);
		model.addAttribute("list", list);
		return "empApplyForms/empCeaApplyPrintForm";
	}

	@RequestMapping("/empCeaPrint")
	public String empCeaPrint(@RequestParam Long id, Model model) {
		System.out.println("empCeaPrint=>id=>" + id);

		Optional<EmpCEAApplyForm> beann = empCEAApplyFormRepo.findById(id);

		if (beann.isPresent()) {

			ResponseParams bean = new ResponseParams();
			List<ResponseParams> listBeans = new ArrayList<>();
			List<ResponseParams> listBeans2 = new ArrayList<>();

			EmployeeCompleteDetailsModel getEmpDetails = homeRestController
					.getEmpDetails(String.valueOf(beann.get().getEmpCode()));
			List<Employee_Family> fam = getEmpDetails.getFamily();

			for (Employee_Family bean2 : fam) {

				if (bean2.getRelation().equalsIgnoreCase("Wife") || bean2.getRelation().equalsIgnoreCase("Husband")) {

				} else {
					System.out.println("bean2======>" + bean2.toString());

					ResponseParams responseParams = new ResponseParams();
					responseParams.setId(Long.valueOf(bean2.getId()));
					responseParams.setChildName(bean2.getPer_name());
					responseParams.setDob(bean2.getDob());
					responseParams.setAge(String.valueOf(myUtil.calculateAge(LocalDate.parse(bean2.getDob()))));
					System.out.println("age=>" + responseParams.getAge());

					listBeans.add(responseParams);
				}
			}

			if (beann.get().getNoOfChilds().equalsIgnoreCase("1")) {
				for (ResponseParams bean3 : listBeans) {
					if (beann.get().getChildId1().equalsIgnoreCase(String.valueOf(bean3.getId()))) {
						bean3.setChildAcadamicYear(beann.get().getChildAcademicYear1());
						bean3.setChildSchoolName(beann.get().getChildSchoolName1());
						listBeans2.add(bean3);
					}
				}
			}
			if (beann.get().getNoOfChilds().equalsIgnoreCase("2")) {
				for (ResponseParams bean3 : listBeans) {
					if (beann.get().getChildId1().equalsIgnoreCase(String.valueOf(bean3.getId()))) {
						bean3.setChildAcadamicYear(beann.get().getChildAcademicYear1());
						bean3.setChildSchoolName(beann.get().getChildSchoolName1());
						listBeans2.add(bean3);
					}
					if (beann.get().getChildId2().equalsIgnoreCase(String.valueOf(bean3.getId()))) {
						bean3.setChildAcadamicYear(beann.get().getChildAcademicYear2());
						bean3.setChildSchoolName(beann.get().getChildSchoolName2());
						listBeans2.add(bean3);
					}
				}
			}

			String spouseName = "";
			for (Employee_Family bean2 : getEmpDetails.getFamily()) {
				if (bean2.getRelation().equalsIgnoreCase("Wife") || bean2.getRelation().equalsIgnoreCase("Husband")) {
					spouseName = bean2.getPer_name();
				}
			}

			bean.setCallSign(getEmpDetails.getCallSign());
			bean.setEmpCode(String.valueOf(beann.get().getEmpCode()));
			bean.setEmpName(getEmpDetails.getName());
			bean.setDesignation(getEmpDetails.getDesignation());
			bean.setEmpOffice(getEmpDetails.getPlace());
			bean.setSpouseName(spouseName);

			bean.setSpouseOrg(beann.get().getSpouseOrg());
			bean.setSpouseDesg(beann.get().getSpouseDesg());
			bean.setSpouseAddress(beann.get().getSpouseAddress());

			bean.setDistanceHostel(beann.get().getDistanceHostel());
			bean.setHostelSubsidy(beann.get().getHostelSubsidy());
			bean.setAcadamicYear(beann.get().getChildAcademicYear1());

			bean.setDisableChild(beann.get().getDisableChild());
			bean.setDisableNature(beann.get().getDisableNature());
			bean.setDisableCertificateDate(beann.get().getDisableCertificateDate());
			bean.setDisablePercentage(beann.get().getDisablePercentage());

			bean.setBonafideCertificate(beann.get().getBonafideCertificate());
			bean.setBonafideAmtAttached(beann.get().getBonafideAmtAttached());
			bean.setBonafideAmt(beann.get().getBonafideAmt());

			bean.setTodayDate(String.valueOf(java.time.LocalDate.now()));

			model.addAttribute("bean", bean);
			model.addAttribute("childs", listBeans);
			model.addAttribute("childs2", listBeans2);
		} else {
			model.addAttribute("msg", "No data is available with given data");
			return "empApplyForms/empCeaApplyPrintForm";
		}

		return "empApplyForms/empCeaPrint";
	}

	@RequestMapping("empCeaPrintt")
	public String empCeaJasper(@RequestParam Long id, Model model, HttpServletResponse response) {
		
		System.out.println("requestParam=>"+id);
		
		Optional<EmpCEAApplyForm> beann = empCEAApplyFormRepo.findById(id);

		if (beann.isPresent()) {
			
			System.out.println("beann=>"+beann.get().toString());

			List<ResponseParams> listBeans = new ArrayList<>();
			List<ResponseParams> listBeans2 = new ArrayList<>();

			EmployeeCompleteDetailsModel getEmpDetails = homeRestController
					.getEmpDetails(String.valueOf(beann.get().getEmpCode()));
			List<Employee_Family> fam = getEmpDetails.getFamily();

			for (Employee_Family bean2 : fam) {

				if (bean2.getRelation().equalsIgnoreCase("Wife") || bean2.getRelation().equalsIgnoreCase("Husband")) {

				} else {
					System.out.println("bean2======>" + bean2.toString());

					ResponseParams responseParams = new ResponseParams();
					responseParams.setId(Long.valueOf(bean2.getId()));
					responseParams.setChildName(bean2.getPer_name());
					responseParams.setDob(bean2.getDob());
					responseParams.setAge(String.valueOf(myUtil.calculateAge(LocalDate.parse(bean2.getDob()))));
					System.out.println("age=>" + responseParams.getAge());

					listBeans.add(responseParams);
				}
			}

			if (beann.get().getNoOfChilds().equalsIgnoreCase("1")) {
				for (ResponseParams bean3 : listBeans) {
					if (beann.get().getChildId1().equalsIgnoreCase(String.valueOf(bean3.getId()))) {
						bean3.setChildAcadamicYear(beann.get().getChildAcademicYear1());
						bean3.setChildSchoolName(beann.get().getChildSchoolName1());
						listBeans2.add(bean3);
					}
				}
			}
			if (beann.get().getNoOfChilds().equalsIgnoreCase("2")) {
				for (ResponseParams bean3 : listBeans) {
					if (beann.get().getChildId1().equalsIgnoreCase(String.valueOf(bean3.getId()))) {
						bean3.setChildAcadamicYear(beann.get().getChildAcademicYear1());
						bean3.setChildSchoolName(beann.get().getChildSchoolName1());
						listBeans2.add(bean3);
					}
					if (beann.get().getChildId2().equalsIgnoreCase(String.valueOf(bean3.getId()))) {
						bean3.setChildAcadamicYear(beann.get().getChildAcademicYear2());
						bean3.setChildSchoolName(beann.get().getChildSchoolName2());
						listBeans2.add(bean3);
					}
				}
			}

			String spouseName = "";
			for (Employee_Family bean2 : getEmpDetails.getFamily()) {
				if (bean2.getRelation().equalsIgnoreCase("Wife") || bean2.getRelation().equalsIgnoreCase("Husband")) {
					spouseName = bean2.getPer_name();
				}
			}

			try {
 
				//String path = "C:\\Users\\swamy\\Desktop\\AdminProject-WS\\AdminProject\\src\\main\\resources\\Annexure.jrxml";
				String path = "/opt/Tomcat-CRL/webapps/nicadmin/WEB-INF/classes/Annexure.jrxml";
				
				//employee details
				Map<String, Object> dataset1 = new HashMap<>();
				Employeedataset employeedataset = new Employeedataset();
				employeedataset.setEmployeeName(getEmpDetails.getCallSign() + " " + getEmpDetails.getName());
				employeedataset.setEmpCode(String.valueOf(beann.get().getEmpCode()));
				employeedataset.setDesignation(getEmpDetails.getDesignation());
				employeedataset.setOffice(getEmpDetails.getPlace());
				employeedataset.setSpouse(spouseName);

				List<Employeedataset> studentList = new ArrayList<>();
				studentList.add(employeedataset);
				JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(studentList);
				dataset1.put("employeedataset", dataSource);
				
				System.out.println("getDistanceHostel"+beann.get().getDistanceHostel());
				System.out.println("financialYear"+beann.get().getFinancialYear());
				
				dataset1.put("distanceHostel", beann.get().getDistanceHostel());
				dataset1.put("financialYear", beann.get().getFinancialYear());

		//all childrens details of the employee 
		List<ChildDetails> childList = new ArrayList<>();
		if(listBeans.size() == 1) {
			ResponseParams responseParams1 = listBeans.get(0);
			ChildDetails childDetails = new ChildDetails();
			childDetails.setSlno(1L);
			childDetails.setSequence("1st Child");
			childDetails.setName(responseParams1.getChildName());
			childDetails.setDob(MyUtil.dateConvert1(responseParams1.getDob()));
			childDetails.setAge(responseParams1.getAge()+" Years");
			childList.add(childDetails);
		}
		
		if(listBeans.size() == 2) {
			ResponseParams responseParams1 = listBeans.get(0);
			ChildDetails childDetails1 = new ChildDetails();
			childDetails1.setSlno(1L);
			childDetails1.setSequence("1st Child");
			childDetails1.setName(responseParams1.getChildName());
			childDetails1.setDob(MyUtil.dateConvert1(responseParams1.getDob()));
			childDetails1.setAge(responseParams1.getAge()+" Years");
			childList.add(childDetails1);
			
			ResponseParams responseParams2 = listBeans.get(1);
			ChildDetails childDetails2 = new ChildDetails();
			childDetails2.setSlno(2L);
			childDetails2.setSequence("2st Child");
			childDetails2.setName(responseParams2.getChildName());
			childDetails2.setDob(MyUtil.dateConvert1(responseParams2.getDob()));
			childDetails2.setAge(responseParams2.getAge()+" Years");
			childList.add(childDetails2);
			
		}
		JRBeanCollectionDataSource dataSourceChild = new JRBeanCollectionDataSource(childList);
		dataset1.put("childDetails", dataSourceChild);
		
		//applied childrens details
		List<ChildDetails> childListc = new ArrayList<>();
		if(listBeans2.size() == 1) {
			ResponseParams responseParams1 = listBeans.get(0);
			ChildDetails childDetails = new ChildDetails();
			childDetails.setSlno(1L);
			childDetails.setSequence("1st Child");
			childDetails.setName(responseParams1.getChildName());
			childDetails.setDob(MyUtil.dateConvert1(responseParams1.getDob()));
			childDetails.setAge(responseParams1.getAge()+" Years");
			childListc.add(childDetails);
		}
		
		if(listBeans2.size() == 2) {
			ResponseParams responseParams1 = listBeans.get(0);
			ChildDetails childDetails1 = new ChildDetails();
			childDetails1.setSlno(1L);
			childDetails1.setSequence("1st Child");
			childDetails1.setName(responseParams1.getChildName());
			childDetails1.setDob(MyUtil.dateConvert1(responseParams1.getDob()));
			childDetails1.setAge(responseParams1.getAge()+" Years");
			childListc.add(childDetails1);
			
			ResponseParams responseParams2 = listBeans.get(1);
			ChildDetails childDetails2 = new ChildDetails();
			childDetails2.setSlno(2L);
			childDetails2.setSequence("2st Child");
			childDetails2.setName(responseParams2.getChildName());
			childDetails2.setDob(MyUtil.dateConvert1(responseParams2.getDob()));
			childDetails2.setAge(responseParams2.getAge()+" Years");
			childListc.add(childDetails2);
			
		}
		JRBeanCollectionDataSource dataSourceChildc = new JRBeanCollectionDataSource(childListc);
		dataset1.put("childDataSet", dataSourceChildc);
 
		//school address details
		List<ChildDataSet> listChildDataSet = new ArrayList<ChildDataSet>();
		if(listBeans2.size() == 1) {
			ResponseParams responseParams1 = listBeans.get(0);
			ChildDataSet childDataSet = new ChildDataSet();
			childDataSet.setAddress1(responseParams1.getChildSchoolName());
			listChildDataSet.add(childDataSet);
		}
		if(listBeans2.size() == 2) {
			ResponseParams responseParams1 = listBeans.get(0);
			ChildDataSet childDataSet1 = new ChildDataSet();
			childDataSet1.setAddress1(responseParams1.getChildSchoolName());
			
			ResponseParams responseParams2 = listBeans.get(1);
			childDataSet1.setAddress2(responseParams2.getChildSchoolName());
			
			listChildDataSet.add(childDataSet1);
		}
		JRBeanCollectionDataSource dataSourceschool = new JRBeanCollectionDataSource(listChildDataSet);
		dataset1.put("schoolDataSet",dataSourceschool);
		

				InputStream input = new FileInputStream(new File(path));
				JasperDesign jasperDesign = JRXmlLoader.load(input);
				JasperReport report = JasperCompileManager.compileReport(jasperDesign);
				JasperPrint print = JasperFillManager.fillReport(report, dataset1, new JREmptyDataSource());

				JasperExportManager.exportReportToPdfFile(print, "C:\\Users\\swamy\\Desktop\\AdminProject-WS\\pdf\\Annexure.pdf");
				//JasperExportManager.exportReportToPdfFile(print, "/opt/Tomcat-CRL/webapps/nicadmin/WEB-INF/classes/Annexure.pdf");
				System.out.println("Report Created.");

				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", "attachment; filename=Annexure.pdf");

				FileInputStream fileInputStream = new FileInputStream("C:\\Users\\swamy\\Desktop\\AdminProject-WS\\pdf\\Annexure.pdf");
				//FileInputStream fileInputStream = new FileInputStream("/opt/Tomcat-CRL/webapps/nicadmin/WEB-INF/classes/Annexure.pdf");
				OutputStream outputStream = response.getOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				while ((bytesRead = fileInputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				// Close streams
				fileInputStream.close();
				outputStream.close();
				 
				
				 
				
				

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception occurred while creating reports: " + e);
			}

		}

		return "redirect:/empCeaApplyPrintForm";
	}

	// ======================= EMP GPF APPLY =========================

	@RequestMapping("/empGpfApplyForm")
	public String empGpfApplyForm(Model model,HttpSession session) {
		model.addAttribute("bean", new EmpGPFApplyForm());
		
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<com.app.entity.Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		
		return "empApplyForms/empGpfApplyForm";
	}

	@RequestMapping("/saveEmpGpfApplyForm")
	public String saveEmpGpfApplyForm(@ModelAttribute("bean") EmpGPFApplyForm bean,
			RedirectAttributes redirectAttributes) {
		EmpGPFApplyForm savedBean = empGPFApplyFormRepo.save(bean);
		redirectAttributes.addFlashAttribute("msg",
				"Your GPF Withdrawal details are saved Successfully with ID:" + savedBean.getId());
		return "redirect:/empGpfApplyForm";
	}

	@RequestMapping("/empGpfApplyPrintForm")
	public String empGpfApplyPrintForm(Model model,String code,HttpSession session) {
		//model.addAttribute("list", empGPFApplyFormRepo.findAll());
		model.addAttribute("list", empGPFApplyFormRepo.findByEmpCode(Integer.parseInt(code)));
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<com.app.entity.Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		return "empApplyForms/empGpfApplyPrintForm";
	}

	@RequestMapping("/empGpfPrint")
	public String empGpfPrint(@RequestParam("id") Long id, Model model) {
		System.out.println("/empGpfPrint" + id);

		Optional<EmpGPFApplyForm> bean = empGPFApplyFormRepo.findById(id);
		if (bean.isPresent()) {
			model.addAttribute("bean", bean.get());
			EmployeeCompleteDetailsModel getEmpDetails = homeRestController
					.getEmpDetails(String.valueOf(bean.get().getEmpCode()));
			model.addAttribute("emp", getEmpDetails);

		} else {
			model.addAttribute("msg", "Given Record is not Found");
			return "empApplyForms/empGpfApplyPrintForm";
		}

		return "empApplyForms/empGpfPrint";
	}
	
	
	//==============Employee GPF Advace 

	@RequestMapping("/empGpf2ApplyForm")
	public String empGpf2ApplyForm(Model model,HttpSession session) {
		model.addAttribute("bean", new EmpGPFAdvanceApplyForm());
		
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<com.app.entity.Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		
		return "empApplyForms/empGpf2ApplyForm";
	}

	@RequestMapping("/saveEmpGpfAdvanceApplyForms")
	public String saveEmpGpfAdvanceApplyForms(@ModelAttribute("bean") EmpGPFAdvanceApplyForm bean, Model model) {
		System.out.println("bean=>"+bean.toString());
		EmpGPFAdvanceApplyForm savedBean = empGPFAdvanceApplyFormRepo.save(bean);
		model.addAttribute("msg", "GPF Advance details are saved Successfullly with ID: "+savedBean.getId());
		return "home";
	}
	
	@RequestMapping("/empGpfAdvanceApplyPrintForm")
	public String empApplyFormGpfAdvancePrintForm(Model model,String code,HttpSession session) {
	//	model.addAttribute("list", empGPFAdvanceApplyFormRepo.findAll());
		model.addAttribute("list", empGPFAdvanceApplyFormRepo.findByEmpCode(Integer.parseInt(code)));
		
		AppUser user = (AppUser) session.getAttribute("user");
		System.out.println("cghsForm=>user=>"+user.toString());
		model.addAttribute("user", user);
		
		Optional<Employee> emp = employeeRepo.findById(String.valueOf(user.getId()));
		if(emp.isPresent()) { model.addAttribute("emp", emp.get()); }
		else { model.addAttribute("msg", "Employee Details or not founded"); }
		
		String photo = Base64.getEncoder().encodeToString(emp.get().getEmpPhoto());
		model.addAttribute("photo", photo);
		
		List<com.app.entity.Employee_Family> empFamily = employee_Family_Repo.getAllByEmpcode(String.valueOf(user.getId()));
		System.out.println("empFamily=>"+empFamily.toString());
		model.addAttribute("empFamily", empFamily);
		
		  return "empApplyForms/empGpfAdvanceApplyPrintForm";
	}
	
	@RequestMapping("/empGpfAdvaceApplyFormPrint")
	public String empGpfAdvaceApplyFormPrint(@RequestParam("id") String id,Model model) {
		System.out.println("id=>"+id);
		
		model.addAttribute("bean", empGPFAdvanceApplyFormRepo.findById(Long.valueOf(id)).get());
		
		EmployeeCompleteDetailsModel getEmpDetails = homeRestController
				.getEmpDetails(String.valueOf(empGPFAdvanceApplyFormRepo.findById(Long.valueOf(id)).get().getEmpCode()));
		model.addAttribute("emp", getEmpDetails);
		
		
		  return "empApplyForms/empGpfAdvaceApplyFormPrint";
	}
	
	
	@GetMapping("/empGpfAdvaceApplyFormPrintPdf")
	public ResponseEntity<InputStreamResource> empGpfAdvaceApplyFormPrintPdf(@RequestParam("id") String id) throws IOException {
		
		System.out.println("/empGpfAdvaceApplyFormPrintPdf");
		
		myUtil.empGPFAdvancePdf(id);
		
		String filePath="C:\\Users\\swamy\\Desktop\\APBOCWWB\\hinditext.pdf";
		
		// Read the PDF file into an InputStream
        Path path = Paths.get(filePath);
        InputStream inputStream = new FileInputStream(path.toFile());
        
     // Set the headers for the response
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "file.pdf");
		
     // Return the ResponseEntity with InputStreamResource
        return ResponseEntity
                .ok()
                .headers(headers)
                .body(new InputStreamResource(inputStream));
		 
	}
	
	 
	
	
	
	
	
	 
	
}
