package com.app.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.entity.Bills_Upload;
import com.app.entity.Employee;
import com.app.entity.Medical_Bills;
import com.app.entity.Medical_Bills_upload;
import com.app.repo.Medical_BillsRepo;
import com.app.repo.Medical_Bills_uploadRepo;
import com.app.service.IBills_UploadService;
import com.app.service.IEmployeeService;
import com.app.service.IMedical_Bills_uploadService;
import com.app.util.MyUtil;
@Controller
public class MedicalController {
	
	@Autowired private IMedical_Bills_uploadService medical_Bills_uploadService;
	@Autowired private IBills_UploadService bills_UploadService;
	@Autowired private Medical_Bills_uploadRepo medical_Bills_uploadRepo;
	@Autowired private Medical_BillsRepo medical_BillsRepo;
	@Autowired private IEmployeeService empService;
	
	// Medical
		// New
		@RequestMapping("/billsupload2")
		public String billsupload2(Medical_Bills_upload medical_Bills_upload, Model model) throws SQLException {
			int hit_count = MyUtil.hit_counter();
			model.addAttribute("hit_count", hit_count);
			return "billsupload2";
		}

		@RequestMapping("/billsupload")
		public String saveBills_upload(@ModelAttribute("medical_Bills_upload") Medical_Bills_upload medical_Bills_upload,
				Model model, HttpServletRequest request) {

			System.out.println("patient_name=> " + request.getParameter("patient_name"));
			System.out.println("/billsupload=> " + medical_Bills_upload.toString());
		try {

			String[] totAmountClaimedArray = medical_Bills_upload.getAmount_claimed().split(",");
			Integer totAmountClaimed = 0;

			String[] bill_no = medical_Bills_upload.getBill_no().split(",");
			System.out.println("bilss size=====> "+bill_no.length);
			
			String[] bill_date = medical_Bills_upload.getBill_date().split(",");
			String[] amount_claimed = medical_Bills_upload.getAmount_claimed().split(",");
			String[] lab_name = medical_Bills_upload.getLab_name().split(",");
			//String[] remarks = medical_Bills_upload.getRemarks().split(",");
			
			Medical_Bills medicalBills = null;
			for(int i = 0; i < bill_no.length; i++) {
				medicalBills = new Medical_Bills();
				medicalBills.setRequest_no(medical_Bills_upload.getRequest_no());
				medicalBills.setEmp_code(medical_Bills_upload.getEmp_code());
				medicalBills.setEntryDate(LocalDateTime.now());
				
				medicalBills.setBill_no(bill_no[i]);
				medicalBills.setBill_date(bill_date[i]);
				medicalBills.setAmount_claimed(amount_claimed[i]);
				medicalBills.setLab_name(lab_name[i]);
				//medicalBills.setRemarks(remarks[i]);
				
				medical_BillsRepo.save(medicalBills);
			}
			
			Bills_Upload b_upload = new Bills_Upload();
			b_upload.setEmp_code(medical_Bills_upload.getEmp_code());
			b_upload.setType(medical_Bills_upload.getType());
			b_upload.setCard_no(medical_Bills_upload.getCard_no());
			b_upload.setDoctor_name(medical_Bills_upload.getDoctor_name());
			b_upload.setDisease_name(medical_Bills_upload.getDisease_name());
			b_upload.setHospital_name(medical_Bills_upload.getHospital_name());
			b_upload.setPatient_name(medical_Bills_upload.getPatient_name());
			b_upload.setBill_no(medical_Bills_upload.getBill_no());
			b_upload.setBill_date(medical_Bills_upload.getBill_date());
			b_upload.setAmount_claimed(medical_Bills_upload.getAmount_claimed());
			b_upload.setLab_name(medical_Bills_upload.getLab_name());
			b_upload.setPeriod_of_treatment(medical_Bills_upload.getPeriod_of_treatment());
			b_upload.setRequest_no(medical_Bills_upload.getRequest_no());
			//b_upload.setRemarks(medical_Bills_upload.getRemarks());

			for (int i = 0; i < totAmountClaimedArray.length; i++) {
				totAmountClaimed = totAmountClaimed + Integer.parseInt(totAmountClaimedArray[i]);
				System.out.println("totAmountClaimed=> " + totAmountClaimed);
			}
			medical_Bills_upload.setTotAmountClaimed(totAmountClaimed.toString());

			bills_UploadService.saveBills_Upload(b_upload);
			medical_Bills_uploadService.saveMedical_Bills_upload(medical_Bills_upload);

			model.addAttribute("msg", "MEDICAL BILLS UPLOAD Saved Successfully");
			System.out.println("bills upload saved successfully");
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "Something Went Wrong while Uploading data, Please try Again");
		}
		return "home";
		}

		// Modify
		@RequestMapping("/billsupload_edit")
		public String billsupload_edit(Bills_Upload bills_Upload) throws SQLException {
			return "billsupload_edit";
		}

		@RequestMapping("/medicalreqnosearch")
		public String medicalreqnosearch(@RequestParam("request_no") Integer request_no, Model model) {
			System.out.println("medicalreqnosearch======>" + request_no);
			Medical_Bills_upload medical_Bills_upload = medical_Bills_uploadService.getById(request_no);
			
			List<Medical_Bills> listBills = medical_BillsRepo.getByReqNo(request_no);
			System.out.println("listBills size=> "+listBills.size());

			String[] billno = medical_Bills_upload.getBill_no().split(",");
			String[] billdate = medical_Bills_upload.getBill_date().split(",");
			// String[] amount = medical_Bills_upload.getAmount_approved().split(",");
			String[] labname = medical_Bills_upload.getLab_name().split(",");
			String[] amount_claimed = medical_Bills_upload.getAmount_claimed().split(",");
			
			List<Medical_Bills_upload> mbu = new ArrayList<Medical_Bills_upload>();

			for (int i = 0; i < billno.length; i++) {
				Medical_Bills_upload mb = new Medical_Bills_upload();
				
				mb.setBill_no(billno[i]);
				mb.setBill_date(billdate[i]);
				// mb.setAmount_approved(amount[i]);
				mb.setLab_name(labname[i]);
				mb.setAmount_claimed(amount_claimed[i]);
				mbu.add(mb);
			}
			System.out.println("medical_Bills_upload===> " + medical_Bills_upload.toString());
			model.addAttribute("medical_Bills_upload", medical_Bills_upload);
			model.addAttribute("mbu", mbu);
			model.addAttribute("listBills", listBills);

			return "medical_allowance_requestdata";
		}

		@RequestMapping("/billsuploadeditsave")
		public String billsuploadedit(@ModelAttribute("bills_Upload") Medical_Bills_upload upload,
				HttpServletRequest request, Model model) {
			System.out.println("====billsupload======" + upload.toString());
			System.out.println("====billsuploadedit======" + request.getParameter("request_no"));
			System.out.println("====updatetype======" + request.getParameter("updatetype"));
			System.out.println("====updatepatient_name======" + request.getParameter("updatepatient_name"));
		try {
			
			System.out.println("upload.getBill_no=> "+upload.getBill_no());
			if(upload.getBill_no() == null) {
				model.addAttribute("msg", "Medical Bills are Empty, Minimum One Bill is Required for Update Details");
				return "home";
			}
			
			String[] bill_no = upload.getBill_no().split(",");
			System.out.println("bilss size=====> "+bill_no.length);
			
			String[] bill_date = upload.getBill_date().split(",");
			String[] amount_claimed = upload.getAmount_claimed().split(",");
			String[] lab_name = upload.getLab_name().split(",");
			String[] remarks = upload.getRemarks().split(",");
			
			Medical_Bills medicalBills = null;
			medical_BillsRepo.deleteByReqNo(upload.getRequest_no());
			for(int i = 0; i < bill_no.length; i++) {
				medicalBills = new Medical_Bills();
				
				medicalBills.setBill_no(bill_no[i]);
				medicalBills.setBill_date(bill_date[i]);
				medicalBills.setAmount_claimed(amount_claimed[i]);
				medicalBills.setLab_name(lab_name[i]);
				medicalBills.setRemarks(remarks[i]);
				
				medicalBills.setRequest_no(upload.getRequest_no());
				medicalBills.setEmp_code(upload.getEmp_code());
				medicalBills.setUpdatedTime(LocalDateTime.now()); 
				
				medical_BillsRepo.save(medicalBills);
			}

			Medical_Bills_upload medical_Bills_upload = medical_Bills_uploadService.getById(Integer.parseInt(request.getParameter("request_no")));
			
			medical_Bills_upload.setType(request.getParameter("updatetype"));
			medical_Bills_upload.setDoctor_name(upload.getDoctor_name());
			medical_Bills_upload.setPeriod_of_treatment(upload.getPeriod_of_treatment());
			medical_Bills_upload.setPatient_name(request.getParameter("updatepatient_name"));
			medical_Bills_upload.setCard_no(upload.getCard_no());
			medical_Bills_upload.setDisease_name(upload.getDisease_name());
			medical_Bills_upload.setHospital_name(upload.getHospital_name());
			medical_Bills_upload.setBill_no(upload.getBill_no());
			medical_Bills_upload.setBill_date(upload.getBill_date());
			medical_Bills_upload.setAmount_approved(upload.getAmount_approved());
			medical_Bills_upload.setLab_name(upload.getLab_name());
			medical_Bills_upload.setAmount_claimed(upload.getAmount_claimed());

			medical_Bills_uploadService.saveMedical_Bills_upload(medical_Bills_upload);

			model.addAttribute("msg", "Medical Bill Updated Successfully");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "Something went Wrong while updating Medical Bill Please Try Again");
		}
			return "home";
		}

		@RequestMapping("/medicalrequestnos")
		public String medicalrequestnos(Model model) {
			System.out.println("=medicalrequestnos=");
			List<Medical_Bills_upload> medical_Bills_upload = medical_Bills_uploadRepo.helprequestnosearch();
			model.addAttribute("medical_Bills_upload", medical_Bills_upload);
			System.out.println("=medicalrequestnos=" + medical_Bills_upload.size());
			return "medicalrequestnos";
		}
		
		
		// Medical Notesheet New Page
		@RequestMapping("/medicalNoteSheetForm")
		public String medicalNoteSheetForm() {
			return "medicalNoteSheetForm";
		}
		
		@RequestMapping("/medicalNSPrint")
		public String medicalNSPrint(HttpServletRequest request,Model model) {
			
			String[] requestNo = request.getParameter("requestNo").split(",");
			String[] billNo = request.getParameter("billNo").split(",");
			String[] amountApproved = request.getParameter("amountApproved").split(",");
			String[] amountClaimed = request.getParameter("amountClaimed").split(",");
			
			System.out.println("legth===> "+requestNo.length);
			System.out.println("billNo===> "+billNo.length);
			System.out.println("amountApproved===> "+amountApproved.length);
			
			String request_no = "";
			Integer totAmountApproved = 0;
			Integer totAmountClaimed = 0;
			
			Date date = new Date();  
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
			String todaydate=formatter.format(date);
			model.addAttribute("todaydate", todaydate);
			
			try {
			List<Medical_Bills> listBills = new ArrayList<Medical_Bills>();
			for(int i = 0; i < requestNo.length; i++) {
					
					Medical_Bills mBills = new Medical_Bills();
					mBills = medical_BillsRepo.getByReqNoAndBillNo(requestNo[i], billNo[i]);
					mBills.setAmount_approved(amountApproved[i]);
					mBills.setNoteStatus(true);
					mBills.setNsDate(LocalDateTime.now());
					
					medical_BillsRepo.save(mBills);
					
					request_no = requestNo[i];
					totAmountApproved = totAmountApproved + Integer.parseInt(amountApproved[i]);
					totAmountClaimed = totAmountClaimed + Integer.parseInt(amountClaimed[i]);
					System.out.println("mBills=> "+mBills.toString());
					
					listBills.add(mBills);
			}
			System.out.println("totAmount=> "+totAmountApproved);
			model.addAttribute("totAmountApproved", totAmountApproved);
			
			System.out.println("totAmountClaimed=> "+totAmountClaimed);
			model.addAttribute("totAmountClaimed", totAmountClaimed);
			
			System.out.println("listBills=> "+listBills.size());
			model.addAttribute("medical_Bills_upload4", listBills);
			
				
				Optional<Medical_Bills_upload> medical_Bills_upload3 = medical_Bills_uploadRepo.findById(Integer.parseInt(request_no));
				if(medical_Bills_upload3.isPresent()) {
					model.addAttribute("medical_Bills_upload3", medical_Bills_upload3.get());
				}else {
					model.addAttribute("msg", "Medical Bills Upload is not found with Given Request Number");
					return "medicalNoteSheetForm";
				}
				
				Employee employee = empService.getById(medical_Bills_upload3.get().getEmp_code());
				model.addAttribute("employee", employee);

				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "NSs/medicalNSPrint";
		}
		
		
		@RequestMapping("/medicalSOForm")
		public String medicalSOForm() {
			return "medicalSOForm";
		}
		
		@RequestMapping("/medicalSOPrint")
		public String medicalSOPrint(HttpServletRequest request,Model model) {
			
			String[] requestNo = request.getParameter("requestNo").split(",");
			String[] billNo = request.getParameter("billNo").split(",");
			String[] amountClaimed = request.getParameter("amountClaimed").split(",");
			String[] amountApproved = request.getParameter("amountApproved").split(",");
			String soNum = request.getParameter("soNumber");
			
			System.out.println("requestNo=>"+requestNo.length);
			System.out.println("billNo=>"+billNo.length);
			System.out.println("amountApproved=>"+amountApproved.length);
			System.out.println("amountClaimed=>"+amountClaimed.length);
			System.out.println("soNum=>"+soNum);
			
			Date date = new Date();  
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
			String todaydate=formatter.format(date);
			model.addAttribute("todaydate", todaydate);
			
			Integer totAmountApproved = 0;
			String emp_code = "";
			
			try {
				for(int i = 0; i < requestNo.length; i++) {
					Medical_Bills mBills = new Medical_Bills();
					mBills = medical_BillsRepo.getByReqNoAndBillNo(requestNo[i], billNo[i]);
					mBills.setSoNumber(soNum);
					mBills.setSanctionStatus(true);
					mBills.setSanctionorderDate(LocalDateTime.now());
					
					medical_BillsRepo.save(mBills);
					
					emp_code = mBills.getEmp_code();
					totAmountApproved = totAmountApproved + Integer.parseInt(amountApproved[i]);
				}
				model.addAttribute("siodate", soNum);
				model.addAttribute("totAmountApproved", totAmountApproved);
				model.addAttribute("employee", empService.getById(emp_code));
				
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "something Went Wrong");
				return "medicalSOForm";
			}
			
			
			
			return "SOs/medicalSOPrint";
		}
		
		

}
