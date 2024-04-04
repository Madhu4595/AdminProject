<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
AppUser user = (AppUser) session.getAttribute("user");
String empId = String.valueOf(user.getId());
System.out.println("cghsForm=>user=>"+user.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEA Apply Form</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
$(document).ready(
		function() {
			
			getEmpDetails();
			$("#dataBody").hide();

			$("#checkedAll").change(function() {
				if (this.checked) {
					$(".checkSingle").each(function() {
						this.checked = true;
					})
				} else {
					$(".checkSingle").each(function() {
						this.checked = false;
					})
				}
			});

			$(".checkSingle").click(function() {
				if ($(this).is(":checked")) {
					var isAllChecked = 0;
					$(".checkSingle").each(function() {
						if (!this.checked)
							isAllChecked = 1;
					})
					if (isAllChecked == 0) {
						$("#checkedAll").prop("checked", true);
					}
				} else {
					$("#checkedAll").prop("checked", false);
				}
			});

			$.ajax({
				type : "get",
				url : "./getFinancialYears",
				cache : false,
				timeout : 600000,
				success : function(resp) {
					//alert(resp);
					// alert(resp.length);
					// $("#financialYear").empty();
					$("#financialYear").append(
							'<option value="">-select-</option>');
					for (var k = 0; k < resp.length; k++) {
						var bean = resp[k];
						$("#financialYear").append(
								'<option value="'+bean+'">' + bean
										+ '</option>');
					}
				}
			});
		})
	function getEmpDetails() {
		var empCode = '<%=empId%>';
		//alert("empcode="+empCode);
 
		$.ajax({
					type : "GET",
					url : "./getEmpDetails?code=" + empCode,
					cache : false,
					success : function(resp) {
						//alert("resp"+JSON.stringify(resp));

						var count = 0;
						for (var i = 0; i < resp.family.length; i++) {
							var fdata = resp.family[i];
							if (fdata.relation === 'Wife') {
								$("#spouseName").val(fdata.per_name);
								$("#spouseNamee").val(fdata.id);
							} else {
								count = count + 1;
								$("#familyclaims").append('<tr>'
														+ '<td><input type="checkbox" class="checkSingle" name="checkClosureAlloc" value="'+count+'"  id="checkboxId'+count+'" />'
														+ '<input type="hidden" name="childId" id="childId'+count+'" value="'+fdata.id+'" /></td>'
														+ '<td>'
														+ fdata.per_name
														+ '</td>'
														+ '<td><select name="claimfor" id="claimfor'+count+'" class="form-control">'
														+ '<option value="">-select-</option>'
														+ '<option value="cea">CEA</option>'
														+ '<option value="hostelSubsidy">Hostel Subsidy</option>'
														+ '<option value="both">Both</option>'
														+ '</select></td>'
														+ '<td><input type="text" class="form-control" name="childAcademicYear" id="childAcademicYear'+count+'"/></td>'
														+ '<td><textarea class="form-control" name="childSchoolName" id="childSchoolName'+count+'" col="40" rows="2"></textarea></td>'
														+ '</tr>');

							}
							document.getElementById("param").value = count;
						}

					},
					error : function(resp) {
						alert("No details found with given employee code");
					}
				});
	}
	function checkVal() {
		//financialYear
		var financialYear = $("#financialYear").val();
		if (financialYear == null || financialYear == "") {
			alert("Financial Year is required, Please fill that!!");
			return false;
		}
		
		validate();

		var selopt = document.getElementsByName("checkClosureAlloc");
		var param = $("#param").val();

		var flag = false;
		for (var i = 0; i < selopt.length; i++) {
			if (selopt[i].checked) {
				flag = true;
			}
		}
		if (flag) {
			if (confirm("Please Ensure That All The Details Are Entered Correctly. Once Submitted Cannot Be Edited") === true) {
				return submitClosure();
				;
			} else {
				return false;
			}
		} else {
			alert('Select atleast one Record to Submit');
			return false;
		}
	}
	function submitClosure() {
		var childIdList = "", childAcademicYearList = "";
		childSchoolNameList = "";
		claimforList = "";

		for (j = 1; j <= document.getElementById("param").value; j++) {
			//alert("j is--->"+j)
			if ((document.getElementById("checkboxId" + j).checked) === true) {
				if (document.getElementById("childAcademicYear" + j).value === ""
						|| document.getElementById("childAcademicYear" + j).value === null) {
					alert("Please Enter Acadamic Year for All Checked Childs");
					return false;
				} else {
					childAcademicYearList = childAcademicYearList
							+ document.getElementById("childAcademicYear" + j).value
							+ ",";
				}
				childAcademicYearList = childAcademicYearList
						+ document.getElementById("childAcademicYear" + j).value
						+ ",";

				if (document.getElementById("childSchoolName" + j).value === ""
						|| document.getElementById("childSchoolName" + j).value === null) {
					alert("Please Enter School Name for All Checked Childs");
					return false;
				} else {
					childSchoolNameList = childSchoolNameList
							+ document.getElementById("childSchoolName" + j).value
							+ ",";
				}
				childSchoolNameList = childSchoolNameList
						+ document.getElementById("childSchoolName" + j).value
						+ ",";

				if (document.getElementById("claimfor" + j).value === ""
						|| document.getElementById("claimfor" + j).value === null) {
					alert("Please Enter Claim for All Checked Childs");
					return false;
				} else {
					claimforList = claimforList
							+ document.getElementById("claimfor" + j).value
							+ ",";
				}
				claimforList = claimforList
						+ document.getElementById("claimfor" + j).value + ",";

				childIdList = childIdList
						+ document.getElementById("childId" + j).value + ",";
			}

		}
		document.getElementById("childAcademicYearr").value = childAcademicYearList;
		document.getElementById("childSchoolNamee").value = childSchoolNameList;
		document.getElementById("childIdd").value = childIdList;
		document.getElementById("claimforr").value = claimforList;
	}

	let phdSelectedValue = 'NO';
	function phdDisable(a) {
		var phd = a;
		if (phd == 'YES') {
			document.getElementById("phdNature").disabled = false;
			document.getElementById("phdDate").disabled = false;
			document.getElementById("phdPercentage").disabled = false;

			$("#phdNature").val('');
			$("#phdDate").val('');
			$("#phdPercentage").val('');

			phdSelectedValue = 'YES';
		} else {
			document.getElementById("phdNature").disabled = true;
			document.getElementById("phdDate").disabled = true;
			document.getElementById("phdPercentage").disabled = true;

			$("#phdNature").val('NULL');
			$("#phdDate").val('NULL');
			$("#phdPercentage").val('NULL');

			phdSelectedValue = 'NO'
		}
	}
	
	function validateFinancialYear(){
		
	}

	function validate() {
		
// 		var empCode = $("#empCode").val();
// 		if (empCode == null || empCode == "") {
// 			alert("Employee code is required, Please fill that!!");
// 			return false;
// 		}

		var spouseName = $("#spouseName").val();
		if (spouseName == null || spouseName == "") {
			alert("Spouse Name is required, Please fill that!!");
			return false;
		}

		var spouseName = $("#spouseName").val();
		if (spouseName == null || spouseName == "") {
			alert("Spouse Name is required, Please fill that!!");
			return false;
		}

		var spouseOrg = $("#spouseOrg").val();
		if (spouseOrg == null || spouseOrg == "") {
			alert("Spouse working organisation is required, Please fill that!!");
			$("#spouseOrg").focus();
			return false;
		}

		var spouseDesg = $("#spouseDesg").val();
		if (spouseDesg == null || spouseDesg == "") {
			alert("Spouse designation is required, Please fill that!!");
			$("#spouseDesg").focus();
			return false;
		}

		var spouseAddress = $("#spouseAddress").val();
		if (spouseAddress == null || spouseAddress == "") {
			alert("Spouse Working Address is required, Please fill that!!");
			$("#spouseAddress").focus();
			return false;
		}

		if (phdSelectedValue == 'NO') {
			$("#phdNature").val('NULL');
			$("#phdDate").val('NULL');
			$("#phdPercentage").val('NULL');

			phdNature = 'NULL';
			phdDate = 'NULL';
			phdPercentage = 'NULL';

			$("#disabled").val('NO');
		}

		if (phdSelectedValue == 'YES') {
			var phdNature = $("#phdNature").val();
			var phdDate = $("#phdDate").val();
			var phdPercentage = $("#phdPercentage").val();

			var phdNature = $("#phdNature").val();
			if (phdNature == null || phdNature == "") {
				alert("Disable Nature is required, Please fill that!!");
				$("#phdNature").focus();
				return false;
			}

			var phdDate = $("#phdDate").val();
			if (phdDate == null || phdDate == "") {
				alert("Disable Date of Certificate is required, Please fill that!!");
				$("#phdDate").focus();
				return false;
			}

			var phdPercentage = $("#phdPercentage").val();
			if (phdPercentage == null || phdPercentage == "") {
				alert("Disable Percentage is required, Please fill that!!");
				$("#phdNature").focus();
				return false;
			}

			$("#disabled").val('YES');

			return false;
		}

	}



	function bonafideAmtAttachedd(a) {
		alert(a)
		if (a == 'YES') {
			document.getElementById("bonafideAmt").disabled = false;
			$("#bonafideAmt").val('');
		}
		if (a == 'NO') {
			$("#bonafideAmt").prop('disabled', true);
			$("#bonafideAmt").val('NULL');
		}
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/empLogin.jsp"%>
<%-- 	<%@include file="/WEB-INF/views/navbar2.jsp"%> --%>

	<div class="container">
		<div class="row">
<!-- 			<div class="col-3"> -->
<!-- 				<div class="card" -->
<!-- 					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;"> -->
<!-- 										<div class="card-header"> -->

<!-- 										</div> -->
<!-- 					<div class="card-body"> -->
<%-- 						<img src="data:image/png;base64,${photo }" alt="Image" --%>
<!-- 							width="100px;" height="100px;" /><br> <span -->
<!-- 							style="color: blue;">Employee Details</span><br> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<td>Code</td> -->
<%-- 								<td>: ${emp.code }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Name</td> -->
<%-- 								<td>: ${emp.name }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Designation</td> -->
<%-- 								<td>: ${emp.designation }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Basic Pay</td> -->
<%-- 								<td>: ${emp.basic_pay }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Place</td> -->
<%-- 								<td>: ${emp.place }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>E-Mail</td> -->
<%-- 								<td>: ${emp.email }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Phone No</td> -->
<%-- 								<td>: ${emp.phno }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>DO Joining</td> -->
<%-- 								<td>: ${emp.doj }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>DO Retirement</td> -->
<%-- 								<td>: ${emp.date_of_retirement }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>DOB</td> -->
<%-- 								<td>: ${emp.dob }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Payscale</td> -->
<%-- 								<td>: ${emp.payscale }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>CGHS Code</td> -->
<%-- 								<td>: ${emp.ecghsCode }</td> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 					<div class="card-footer" align="center"> -->
<!-- 									<a href="./editEmpDetails" style=" padding: 2px;border-radius: 5px;">Edit Details</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 										</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="col-12"
				style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
				<div align="center">
					<div class="col-sm-12">
						<h6 class="h6 text-primary" style="text-decoration: underline;">CEA
							APPLY FORM</h6>
					</div>
				</div>

				<form:form action="./saveempCEAApply" method="post">
				
				<div class="row">
					<div class="col-4">
						<label for="FinancialYear" style="color: blue">Financial Year</label>
						<select name="financialYear" id="financialYear"
								class="form-control">
							</select>
					</div>
					<div class="col-4"></div>
					<div class="col-4"></div>
				</div>
				<br>
				<span style="color: blue">Spouse Working Details</span>
				<div class="row">
					<div class="col-6">
					<label for="FinancialYear">Name</label>
						 <input type="text" name="spouseName" id="spouseName"
										class="form-control" readonly="readonly" /><input
										type="hidden" name="spouseNamee" id="spouseNamee" />
					</div>
					<div class="col-6">
						<label for="Organization">Organization</label><select name="spouseOrg" id="spouseOrg"
										class="form-control">
										<option value="">-select-</option>
										<option value="scg">State whether in Central Government</option>
										<option value="sg">State Government</option>
										<option value="psu">PSU</option>
										<option value="others">Others</option>
									</select>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<label for="Designation">Designation</label><input type="text" name="spouseDesg" id="spouseDesg"
										class="form-control" />
					</div>
					<div class="col-6">
					<label for="Designation">Address</label>
					<input type="text" name="spouseAddress"
										id="spouseAddress" class="form-control" />
					</div>
				</div>
				<br>
				<span style="color: blue">Whom CEA/Hostel Subsidy Claimed</span>
				<div class="row">
					<div class="col-12">
						<table border="1" style="width: 100%;">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkedAll" /></th>
										<th>Name</th>
										<th>Claim for</th>
										<th>Academic Year</th>
										<th>Name of School</th>
									</tr>
								</thead>
								<tbody id="familyclaims"></tbody>
							</table>
							<br>
					</div>
				</div>
				<br>
				<span style="color: blue">Other Details</span>
				<div class="row">
					<div class="col-6">
						<label for="Oone">
							Distance of Hostel of child from residence of employee
							(in case Hostel Subsidy is claimed) : Defalut value is NA
							<input
								type="text" name="distanceHostel" id="distanceHostel" value="NA"
								class="form-control m-1"
								placeholder="Distance of Hostel of child from residence of employee (in case Hostel Subsidy is claimed) : Defalut value is NA" />
						</label>
					</div>
					<div class="col-6">
						<label for="Otwo">Amount of CEA/Hostel Subsidy already received up to previous
							quarter : Defalut value is NILL</label> <input type="text"
								name="hostelSubsidy" id="hostelSubsidy" value="NULL"
								class="form-control m-1"
								placeholder="Amount of CEA/Hostel Subsidy already received up to previous quarter : Defalut value is NILL" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-6">
						<label for="Othree">Whether the child for whom the CEA is applied for is a
							disabled child:</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input
								type="radio" name="phd" value="YES"
								onchange="return phdDisable(this.value)"
								class="form-check-input" />
								<b>YES</b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" name="phd"
								value="NO" onchange="return phdDisable(this.value)"
								class="form-check-input" checked="checked" /><b>NO</b> 
								
					</div>
					<div class="col-6">
						<input
								type="text" class="form-control m-1" disabled="disabled"
								name="phdNature" id="phdNature"
								placeholder="If yes, indicate the nature of disability: Default value is NILL" />
							
							<input type="text" class="form-control m-1" disabled="disabled"
								name="phdDate" id="phdDate"
								placeholder="Date of disability certificate: Default value is NILL" />
							<input type="text" class="form-control m-1" disabled="disabled"
								name="phdPercentage" id="phdPercentage"
								placeholder="Indicate the percentage of disability: Default value is NILL" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-6">
						<label for="Ofour">Whether the Bonafied certificate from Head of
							Institution has been attched:</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="bonafideCertificate" value="YES"
								onchange="return bonafideCertificateAttach(this.value)"
								class="form-check-input" checked="checked" /><b>YES</b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								name="bonafideCertificate" value="NO"
								onchange="return bonafideCertificateAttach(this.value)"
								class="form-check-input" /><b>NO</b>  
						
					</div>
					<div class="col-6">
					For Hostel,
							Subsidy, the Bonafide certificate from mentioning the amount is
							attached: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								name="bonafideAmtAttached" value="YES"
								onchange="return bonafideAmtAttachedd(this.value)"
								class="form-check-input" /><b>YES</b>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								name="bonafideAmtAttached" value="NO"
								onchange="return bonafideAmtAttachedd(this.value)"
								class="form-check-input" checked="checked" /><b>NO</b><br>
							<input type="text" name="bonafideAmt" class="form-control m-1"
								id="bonafideAmt" placeholder="Default value: NULL"
								disabled="disabled" />
					</div>
				</div>
				
				<input type="hidden" name="empCode" id="empCode" value="${emp.code }" />
				<input type="hidden" name="param" id="param" /> 
				<input type="hidden" id="disabled" name="disabled"> 
				<input type="hidden" id="childAcademicYearr" name="childAcademicYearr">
				<input type="hidden" id="childSchoolNamee" name="childSchoolNamee">
				<input type="hidden" id="childIdd" name="childIdd"> 
				<input type="hidden" id="claimforr" name="claimforr"> 
				<input type="hidden" id="bonafideCertificatee" name="bonafideCertificatee"> 
				
				<div align="center">
				<input type="submit" onclick="return checkVal();" value="SUBMIT" class="btn btn-success m-2" />
				</div>
				
				
<!-- 					<div class="row"> -->
<!-- 						<div class="col-4"> -->
							<!-- 							<input type="text" class="form-control m-1" name="empCode" -->
							<!-- 								id="empCode" maxlength="4" onchange="return getEmpDetails()" -->
							<!-- 								placeholder="Employee Code" /> -->
<!-- 						</div> -->
<!-- 						<div class="col-8"> -->
							<!-- 							<span id="empInfo" class="text-primary"></span> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div id="dataBody"> -->
<!-- 						<div -->
<!-- 							style="border: 1px solid black; padding: 10px; border-radius: 10px;" -->
<!-- 							align="left"> -->
<!-- 							Financial Year <select name="financialYear" id="financialYear" -->
<!-- 								class="form-control w-25"> -->
<!-- 							</select> -->
<!-- 						</div> -->


<!-- 						<div -->
<!-- 							style="border: 1px solid black; padding: 10px; border-radius: 10px;" -->
<!-- 							align="left"> -->
<!-- 							<span style="font-weight: bolder; text-decoration: underline;">Spouse -->
<!-- 								Working Details</span> -->

<!-- 							<div class="row"> -->
<!-- <!-- 								<div class="col-6"> --> 
<!-- <!-- 									Name<input type="text" name="spouseName" id="spouseName" --> 
<!-- <!-- 										class="form-control" readonly="readonly" /><input --> 
<!-- <!-- 										type="hidden" name="spouseNamee" id="spouseNamee" /> --> 
<!-- <!-- 								</div> -->
<!-- 								<div class="col-6"> -->
<!-- 									Organization <select name="spouseOrg" id="spouseOrg" -->
<!-- 										class="form-control"> -->
<!-- 										<option value="">-select-</option> -->
<!-- 										<option value="scg">State whether in Central -->
<!-- 											Government</option> -->
<!-- 										<option value="sg">State Government</option> -->
<!-- 										<option value="psu">PSU</option> -->
<!-- 										<option value="others">Others</option> -->
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-6"> -->
<!-- 									Designation<input type="text" name="spouseDesg" id="spouseDesg" -->
<!-- 										class="form-control" /> -->
<!-- 								</div> -->
<!-- 								<div class="col-6"> -->
<!-- 									Address<input type="text" name="spouseAddress" -->
<!-- 										id="spouseAddress" class="form-control" /> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<br> <span -->
<!-- 								style="font-weight: bolder; text-decoration: underline;">Whom -->
<!-- 								CEA/Hostel Subsidy Claimed</span> -->
<!-- 							<table border="1" style="width: 100%;"> -->
<!-- 								<thead> -->
<!-- 									<tr> -->
<!-- 										<th><input type="checkbox" id="checkedAll" /></th> -->
<!-- 										<th>Name</th> -->
<!-- 										<th>Claim for</th> -->
<!-- 										<th>Academic Year</th> -->
<!-- 										<th>Name of School</th> -->
<!-- 									</tr> -->
<!-- 								</thead> -->
<!-- 								<tbody id="familyclaims"></tbody> -->
<!-- 							</table> -->
<!-- 							<br> Distance of Hostel of child from residence of employee -->
<!-- 							(in case Hostel Subsidy is claimed) : Defalut value is NA <input -->
<!-- 								type="text" name="distanceHostel" id="distanceHostel" value="NA" -->
<!-- 								class="form-control m-1" -->
<!-- 								placeholder="Distance of Hostel of child from residence of employee (in case Hostel Subsidy is claimed) : Defalut value is NA" /> -->
<!-- 							Amount of CEA/Hostel Subsidy already received up to previous -->
<!-- 							quarter : Defalut value is NILL <input type="text" -->
<!-- 								name="hostelSubsidy" id="hostelSubsidy" value="NULL" -->
<!-- 								class="form-control m-1" -->
<!-- 								placeholder="Amount of CEA/Hostel Subsidy already received up to previous quarter : Defalut value is NILL" /> -->
<!-- 										<input type="text" class="form-control m-1" placeholder="Academic Year" /> -->
<!-- 							<br>  -->
<!-- 							Whether the child for whom the CEA is applied for is a -->
<!-- 							disabled child: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -->
<!-- 							<input -->
<!-- 								type="radio" name="phd" value="YES" -->
<!-- 								onchange="return phdDisable(this.value)" -->
<!-- 								class="form-check-input" /> -->
<!-- 								<b>YES</b> -->
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -->
<!-- 							<input type="radio" name="phd" -->
<!-- 								value="NO" onchange="return phdDisable(this.value)" -->
<!-- 								class="form-check-input" checked="checked" /><b>NO</b>  -->
<!-- 								<input -->
<!-- 								type="text" class="form-control m-1" disabled="disabled" -->
<!-- 								name="phdNature" id="phdNature" -->
<!-- 								placeholder="If yes, indicate the nature of disability: Default value is NILL" /> -->
							
<!-- 							<input type="text" class="form-control m-1" disabled="disabled" -->
<!-- 								name="phdDate" id="phdDate" -->
<!-- 								placeholder="Date of disability certificate: Default value is NILL" /> -->
<!-- 							<input type="text" class="form-control m-1" disabled="disabled" -->
<!-- 								name="phdPercentage" id="phdPercentage" -->
<!-- 								placeholder="Indicate the percentage of disability: Default value is NILL" /> -->
							<br> 
<!-- 							Whether the Bonafied certificate from Head of -->
<!-- 							Institution has been attched: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input -->
<!-- 								type="radio" name="bonafideCertificate" value="YES" -->
<!-- 								onchange="return bonafideCertificateAttach(this.value)" -->
<!-- 								class="form-check-input" checked="checked" /><b>YES</b> -->
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" -->
<!-- 								name="bonafideCertificate" value="NO" -->
<!-- 								onchange="return bonafideCertificateAttach(this.value)" -->
<!-- 								class="form-check-input" /><b>NO</b> <br> For Hostel, -->
<!-- 							Subsidy, the Bonafide certificate from mentioning the amount is -->
<!-- 							attached: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" -->
<!-- 								name="bonafideAmtAttached" value="YES" -->
<!-- 								onchange="return bonafideAmtAttachedd(this.value)" -->
<!-- 								class="form-check-input" /><b>YES</b> -->
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" -->
<!-- 								name="bonafideAmtAttached" value="NO" -->
<!-- 								onchange="return bonafideAmtAttachedd(this.value)" -->
<!-- 								class="form-check-input" checked="checked" /><b>NO</b><br> -->
<!-- 							<input type="text" name="bonafideAmt" class="form-control m-1" -->
<!-- 								id="bonafideAmt" placeholder="Default value: NULL" -->
<!-- 								disabled="disabled" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</form:form>
			</div>
		</div>
	</div>


<!-- 	<div class="container shadow-lg rounded" align="center" -->
<!-- 		style="background-color: #e6ffff;"> -->
<!-- 		<div class="row m-2"> -->
<!-- 			<div class="col-12"> -->
<!-- 				<h6 class="h6 font-weight-bolder text-info">CEA APPLY FORM</h6> -->
<!-- 			</div> -->
<!-- 		</div> -->



<!-- 	</div> -->
</body>
</html>