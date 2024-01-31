<%@page import="com.app.empapplyforms.EmpCEAApplyForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  function getPrint(){
	  window.print();
  }
  </script>
  <style>
  	body{
  		font-size: 22px;
  	}
  </style>
</head>
<body onload="return getPrint();">
	<div class="container border mt-1">
		<div style="font-weight: bolder;text-decoration: underline;" align="center">Annexure 'A'</div><br>
		
		<div style="font-weight: bolder;"> PROFORMA FOR RE-IMBURSEMENT OF CHILDREN EDUCATION ALLOWANCE/HOSTEL SUBSIDY IN TERMS OF RBE No. 147/2017 </div><br>
		<div style="font-weight: bolder;">CLAIM FOR THE FINANCIAL YEAR: 22-23</div>
		
		<br>
		<div>
			I here by apply for the reimbursement of Children Education Allowance for my child/children and relevant particulars are furnished below:-
		</div>
		<br>
		
		<table border="1" >
			<tbody>
				<tr> <td style="padding: 5px;">1.</td> <td style="padding: 5px;">Name of the Employee</td> <td style="padding: 5px;">${bean.callSign}. ${bean.empName }</td> </tr>
				<tr> <td style="padding: 5px;">2.</td> <td style="padding: 5px;">P.F. No / Employee No.</td> <td style="padding: 5px;">${bean.empCode}</td> </tr>
				<tr> <td style="padding: 5px;">3.</td> <td style="padding: 5px;">Designation</td> <td style="padding: 5px;">${bean.designation}</td> </tr>
				<tr> <td style="padding: 5px;">4.</td> <td style="padding: 5px;">Office.</td> <td style="padding: 5px;">${bean.empOffice}</td> </tr>
				<tr> <td style="padding: 5px;">5.</td> <td style="padding: 5px;">Name of Spouse</td> <td style="padding: 5px;">${bean.spouseName}</td> </tr>
				<tr> <td style="padding: 5px;">6.</td> <td style="padding: 5px;">If spouse is employed,State whether in Central Govt., PSU,State Govt. (give details)</td> <td style="padding: 5px;">${bean.spouseOrg}</td> </tr>
				<tr> <td style="padding: 5px;">7.</td> <td style="padding: 5px;">Designation,Office of spouse,If spouse is employed</td> <td style="padding: 5px;">${bean.spouseDesg}, ${bean.spouseAddress}</td> </tr>
			</tbody>
		</table>
		<br>
		8. Details of all the children of the employee:
		<table border="1" style="width: 100%;">
			<thead>
				<tr>
					<td>SI. No.</td>
					<td>Sequence</td>
					<td>Name</td>
					<td>DOB</td>
					<td>Age</td>
				</tr>
			</thead>
			<tbody>
			<%
				int count = 1;
				int count2 = 1;
			%>
				 <c:forEach var="bean" items="${childs}">
				 	<tr>
				 		<td><%=count++ %></td>
				 		<td><%=count2++ %>st Child</td>
				 		<td>${bean.childName }</td>
				 		<fmt:parseDate var="podate" value="${bean.dob }" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${podate}" pattern="dd-MM-yyyy" var="dobb" />
						<td>${dobb }</td>
				 		<td>${bean.age }</td>
				 	</tr>
				 </c:forEach>
			</tbody>
		</table>
		<br>
		9. Details of all the children for whom CEA/Hostel Subsidy claimed:
		<table border="1" style="width: 100%;">
			<thead>
				<tr>
					<td>SI. No.</td>
					<td>Sequence</td>
					<td>Name</td>
					<td>DOB</td>
					<td>Age</td>
				</tr>
			</thead>
			<tbody>
			<%
				int count3 = 1;
				int count4 = 1;
			%>
				 <c:forEach var="bean" items="${childs2}">
				 	<tr>
				 		<td><%=count3++ %></td>
				 		<td><%=count4++ %>st Child</td>
				 		<td>${bean.childName }</td>
				 		<fmt:parseDate var="podate" value="${bean.dob }" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${podate}" pattern="dd-MM-yyyy" var="dobb" />
						<td>${dobb }</td>
				 		<td>${bean.age }</td>
				 	</tr>
				 </c:forEach>
			</tbody>
		</table>
		<br>
		10. Academic year, Name of School/Residential School and Class in which children studied
		<table border="1"  style="text-align: center;width: 100%;"  >
			<tbody>
			<%
				int count6 = 1;
			%>
				 <c:forEach var="bean" items="${childs2}">
				 			<tr><td><%=count6++ %>st Child </td> 
				 			  <td> ${bean.childAcadamicYear } ,  ${bean.childSchoolName } </td> </tr>
				 </c:forEach>
			</tbody>
			
		</table>
		<br>
		
		<table>
			<tr><td>11. Distance of Hostel of child from residence of employee (in case Hostel Subsidy is claimed) <b>${bean.distanceHostel }</b></td></tr>
			<tr><td>12. Amount of CEA/Hostel Subsidy already received up to previous quarter <b>${bean.hostelSubsidy }</b></td></tr>
			<tr><td>13. The Academic year for which CEA/Hostel Subsidy is applied now <b>${bean.acadamicYear }</b></td></tr>
			<tr><td>14. (a) Whether the child for whom the CEA is applied for is a disabled child <b>${bean.disableChild }</b></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) If yes, indicate the nature of disability :<b>${bean.disableNature }</b></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(c) Date of disability certificate :<b>${bean.disableCertificateDate }</b></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) Indicate the percentage of disability :<b>${bean.disablePercentage }</b></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b> </b></td></tr>
			
			<tr><td>15. Whether the Bonafied certificate from Head of Institution has been attached: ${bean.bonafideCertificate }</td></tr>
			<tr><td>16. For Hostel Subsidy, the Bonafide certificate from mentioning the amount is attached: ${bean.bonafideAmtAttached }</td></tr>
			<tr><td>17. If Yes at Item No. 16, Amount claimed for Hostel Subsidy: ${bean.bonafideAmt }</td></tr>
			
			<tr><td>18. (i) Certified that the fee/amount indicate above had actually been paid by me </td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Certified that my wife/husband is not a Central Government Servant. </td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iii) Certified that my husband/wife Sri/Smt:  <b>${bean.spouseName}</b> as: <b>${bean.spouseDesg}</b> in <b>${bean.spouseAddress}</b>  and
			that he/she shall not apply/has not applied for the Children Education Allowance for the child mentioned above. </td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iv) Certified that I or my wife/husband has not claimed this reimbursement from any other source and will not claim the same in future </td></tr>
		
			<tr><td>17. Certified that my child in respect of whom reimbursement of Children Education Allowance is applied is studying in the School/Jr. College which is recognized and affiliated to Board of Education/University.</td></tr>
			<tr><td>18. The information furnished above are complete and correct and i have not suppressed any relevant information. In the event of any change in the particulars 
			given above which affect my eligibility for reimbursement of Children Education Allowance. I undertake to intimate the same promptly and also to refund excess payments if any
			made. Further, I am aware that if at any stage the information / documents furnished above is found to be false, I am liable for disciplinary action.</td></tr>
		</table>
		
		<br><br><br>
		<div class="row">
			<div class="col-4"></div>
			<div class="col-3"></div>
			<div class="col-5">
				Signature: <br>
				Name: <b>${bean.callSign}. ${bean.empName }</b> <br>
				Designation & Station: <b>${bean.designation}</b> <br>
				Working at: <br>
				Date: <b>${bean.todayDate }</b>
			</div>
		</div>
		
		
	 </div>
		
	 
</body>
</html>