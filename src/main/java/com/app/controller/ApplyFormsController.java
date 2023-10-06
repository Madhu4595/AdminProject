package com.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.empapplyforms.EmpCEAApplyForm;
import com.app.repo.EmpCEAApplyFormRepo;

@Controller
public class ApplyFormsController {
	
	@Autowired private EmpCEAApplyFormRepo empCEAApplyFormRepo;

	@RequestMapping("/empCEAApplyForm")
	public String empCEAApplyForm(Model model) {
		return "empApplyForms/empCEAApplyForm";
	}
	
	@RequestMapping("/saveempCEAApply")
	public String saveempCEAApply(HttpServletRequest request,Model model) {
		
		String empCode = request.getParameter("empCode"); System.out.println("empCode=>"+empCode);
		
		String spousId = request.getParameter("spouseNamee"); System.out.println("spouseNamee=>"+spousId);
		String spouseOrg = request.getParameter("spouseOrg"); System.out.println("spouseOrg=>"+spouseOrg);
		String spouseDesg = request.getParameter("spouseDesg"); System.out.println("spouseDesg=>"+spouseDesg);
		String spouseJobAddress = request.getParameter("spouseAddress"); System.out.println("spouseJobAddress=>"+spouseJobAddress);
		
		String[] childsIds = request.getParameter("childIdd").split(","); System.out.println("childsIds=>"+childsIds.length);
		String[] childSchoolNamee = request.getParameter("childSchoolNamee").split(","); System.out.println("childSchoolNamee=>"+childSchoolNamee.length);
		String[] childAcademicYearr = request.getParameter("childAcademicYearr").split(","); System.out.println("childAcademicYearr=>"+childAcademicYearr.length);
		
		String distanceHostel = request.getParameter("distanceHostel"); System.out.println("distanceHostel=>"+distanceHostel);
		String hostelSubsidy = request.getParameter("hostelSubsidy"); System.out.println("hostelSubsidy=>"+hostelSubsidy);
		
		String phd = request.getParameter("phd"); System.out.println("phd=>"+phd);
		String phdNature = request.getParameter("phdNature"); System.out.println("phdNature=>"+phdNature);
		String phdDate = request.getParameter("phdDate"); System.out.println("phdDate=>"+phdDate);
		String phdPercentage = request.getParameter("phdPercentage"); System.out.println("phdPercentage=>"+phdPercentage);
		
		String bonafideCertificate = request.getParameter("bonafideCertificate"); System.out.println("bonafideCertificate=>"+bonafideCertificate);
		String bonafideAmtAttached = request.getParameter("bonafideAmtAttached"); System.out.println("bonafideAmtAttached=>"+bonafideAmtAttached);
		String bonafideAmt = request.getParameter("bonafideAmt"); System.out.println("bonafideAmt=>"+bonafideAmt);
		
		EmpCEAApplyForm bean = new EmpCEAApplyForm();
		
		bean.setEmpCode(Integer.parseInt(empCode));
		bean.setSpouseId(spousId);
		bean.setSpouseOrg(spouseOrg);
		bean.setSpouseDesg(spouseDesg);
		bean.setSpouseAddress(spouseJobAddress);
		
		if(childsIds.length ==1) {
				bean.setChildId1(childsIds[0]);
				bean.setChildSchoolName1(childSchoolNamee[0]);
				bean.setChildAcademicYear1(childAcademicYearr[0]);
				bean.setNoOfChilds("1");
		}
		
		if(childsIds.length ==2) {
			bean.setChildId1(childsIds[0]);
			bean.setChildSchoolName1(childSchoolNamee[0]);
			bean.setChildAcademicYear1(childAcademicYearr[0]);
			
			bean.setChildId2(childsIds[1]);
			bean.setChildSchoolName2(childSchoolNamee[1]);
			bean.setChildAcademicYear2(childAcademicYearr[1]);
			
			bean.setNoOfChilds("2");
		}
		
		bean.setDistanceHostel(distanceHostel);
		bean.setHostelSubsidy(hostelSubsidy);
		
		bean.setDisableChild(phd);
		if(phd.equalsIgnoreCase("YES")) {
			bean.setDisableNature(phdNature);
			bean.setDisableCertificateDate(phdDate);
			bean.setDisablePercentage(phdPercentage);
		}else {
			bean.setDisableNature("NULL");
			bean.setDisableCertificateDate("NULL");
			bean.setDisablePercentage("NULL");
		}
		
		bean.setBonafideCertificate(bonafideCertificate);
		bean.setBonafideAmtAttached(bonafideAmtAttached);
		if(bonafideAmtAttached.equalsIgnoreCase("YES")) {
			bean.setBonafideAmt(bonafideAmt);
		}else {
			bean.setBonafideAmt("NULL");
		}
		
		
		EmpCEAApplyForm emp = empCEAApplyFormRepo.save(bean);
		model.addAttribute("msg", "APPLICATION IS SAVED SUCCESSFULLY WITH APPLICATION ID:"+emp.getId());
		
		return "home";
	}
}
