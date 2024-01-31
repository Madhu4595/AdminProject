<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	System.out.println("ur in cghsForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="ISO-8859-1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CGHS</title>

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script>
 	$(document).ready(function() {
 		//$("#viewinputs").hide();
	getEmpDetails();
 	});
// 	let empfamily = null;

// 	function validate() {
// 		var empCode = $("#empCode").val();
// 		alert("empCode=>" + empCode);

// 		if (empCode === null || empCode === "") {
// 			alert("Employee Code should not be Empty");
// 			$("#empCode").focus();
// 			return false;
// 		}

// 		return false;
// 	}
	function getEmpDetails() {
		var empCode = $("#empCode").val();
		//alert("empCode=>"+empCode);

// 		if (empCode === null || empCode === "") {
// 			alert("Employee Code should not be Empty");
// 			$("#empCode").focus();
// 			return false;
// 		}

		$.ajax({
			type : "GET",
			url : "getEmpDetails?code=" + empCode,
			cache : false,
			success : function(resp) {
				//alert("success=>"+JSON.stringify(resp));
				//$("#viewinputs").show();
				//document.getElementById("namespan").value = resp.name;
				//document.getElementById("ecghsspan").value = resp.ecghsCode;
				//document.getElementById("email").value = resp.email;
				//document.getElementById("mobile").value = resp.phno;
				//$("#address").val(resp.address);
				//$("#wardEntitlement").val(resp.wardEntitlement);
				
				empfamily = resp.family;
				
				$("#patientId").append('<option value="self">-self-</option>');
				$("#patient_benID").val(resp.ecghsCode);
				$("#patient_relation").val('self');
				
				for(var i = 0; i < resp.family.length; i++){
					var fdata = resp.family[i];
					$("#patientId").append('<option value="'+fdata.id+'">'+fdata.per_name+'</option>');
				}
				
			},
			error : function(resp) {
				alert("Employee Details are not Loaded.");
			}
		});
 
	}
	
	function relationsearch(){
		
		var patient_name = $("#patientId").val();
		var ecghsCode = $("#ecghsCode").val();
		
		if(patient_name == 'self'){
			$("#patient_benID").val(ecghsCode);
			$("#patient_relation").val('self');
		}
		
		for(var i = 0; i < empfamily.length; i++){
			var fdata = empfamily[i];
			
			if(patient_name == fdata.id){
				// patient_benID
				document.getElementById("patient_benID").value = fdata.cghsCode;
				// patient_relation
				document.getElementById("patient_relation").value = fdata.relation;
			}
		}
	}
 
	
	
	$(document).ready(function () {

	// Denotes total number of rows
	var rowIdx = 0;

	// jQuery button click event to add a row
	$('#addBtn').on('click', function () {
		// Adding a row inside the tbody.
		$('#tbodydd').append(
				'<tr id="R' + (++rowIdx) + '">' +
				'<td class="row-index">' +
					'<select class="form-control" name="typee" id="typee">' +
						'<option value="" disabled="disabled" selected="selected">-select-</option>' +
						'<option value="opd">OPD Treatment</option>' +
						'<option value="indoor">Indoor Treatment</option>' +
						'<option value="tests">Tests / Investigation</option>' +
						'</select>' +
				'</td>' +
				'<td class="row-index"><input type="text" name="billNoo" id="billNoo" class="form-control" /></td>' +
				'<td class="row-index"><input type="date" name="datee" id="datee" class="form-control" /></td>' +
				'<td class="row-index"><input type="text" name="amountt" id="amountt" class="form-control" /></td>' +
				'<td class="row-index"><input type="text" name="doctorNamee" id="doctorNamee" class="form-control" /></td>' +
				'<td class="row-index"><input type="text" name="hospitalNamee" id="hospitalNamee" class="form-control" /></td>' +
			    '<td> <button class="btn btn-danger remove" type="button">Remove</button> </td>' +
			    '</tr>');
	});

	// jQuery button click event to remove a row.
	$('#tbodydd').on('click', '.remove', function () {
		// Getting all the rows next to the row
		// containing the clicked button
		var child = $(this).closest('tr').nextAll();

		// Iterating across all the rows
		// obtained to change the index
		child.each(function () {

		// Getting <tr> id.
		var id = $(this).attr('id');

		// Getting the <p> inside the .row-index class.
		var idx = $(this).children('.row-index').children('p');

		// Gets the row number from <tr> id.
		var dig = parseInt(id.substring(1));

		// Modifying row index.
		//idx.html(`Row ${dig - 1}`);

		// Modifying row id.
		$(this).attr('id', `R${dig - 1}`);
		});

		// Removing the current row.
		$(this).closest('tr').remove();

		// Decreasing total number of rows by 1.
		rowIdx--;
	});
	});
	
	function scheme(){
		
		var healthMedicalInsuranceScheme = document.getElementsByName("healthMedicalInsuranceScheme");
		var radioSelected = false;
		for(var i=0; i<healthMedicalInsuranceScheme.length;i++){
			if(healthMedicalInsuranceScheme[i].checked){ 
				radioSelected = true; break; 
			}
		}
		if(!radioSelected){
			alert("Please choose Subscribing to any health / medical Insurance scheme, It should not empty!!!"); return false;
		}

		const radioInputs = document.querySelectorAll('input[name="healthMedicalInsuranceScheme"]');
		
		let selectedValue = null;
		radioInputs.forEach(input => { if (input.checked) { 
			selectedValue = input.value;  

				if(selectedValue == 'No') { 
					document.getElementById('healthMedicalInsuranceSchemeIfYes').readOnly = true;
					$("#healthMedicalInsuranceSchemeIfYes").val('');
				}else{
					document.getElementById('healthMedicalInsuranceSchemeIfYes').readOnly = false;
					$("#healthMedicalInsuranceSchemeIfYes").val('');
					$("#healthMedicalInsuranceSchemeIfYes").focus();
				}
			
			}  
		});
	}
	
	function validate(){
		//alert("validate")
		//scheme();
		
		//hospitalName
		var hospitalName = $("#hospitalName").val();
		if(hospitalName == null || hospitalName == ""){ alert("Name & address of the hospital is required, please fill that!!"); return false; }
		
		//empalledUnderCGHS
		var empalledUnderCGHS = document.getElementsByName("empalledUnderCGHS");
		var empalledUnderCGHSRadioSelected = false;
		for(var i=0; i<empalledUnderCGHS.length;i++){ if(empalledUnderCGHS[i].checked){  empalledUnderCGHSRadioSelected = true; break;  } }
		if(!empalledUnderCGHSRadioSelected){ alert("Please choose Hospital empalled under CGHS, It should not empty!!!"); return false; }
		
		//opdTreatment
		var opdTreatment = document.getElementsByName("opdTreatment");
		var opdTreatmentRadioSelected = false;
		for(var i=0; i<opdTreatment.length;i++){ if(opdTreatment[i].checked){ opdTreatmentRadioSelected = true; break; } }
		if(!opdTreatmentRadioSelected){ alert("Please choose OPD/Test&Investigations, It should not empty!!!"); return false; }
		
		//indoorTreatment
		var indoorTreatment = document.getElementsByName("indoorTreatment");
		var indoorTreatmentRadioSelected = false;
		for(var i=0; i<indoorTreatment.length;i++){ if(indoorTreatment[i].checked){ indoorTreatmentRadioSelected = true; break; } }
		if(!indoorTreatmentRadioSelected){ alert("Please choose  Indoor Treatment, It should not empty!!!"); return false; }
		
		//emergencyTreatment
		var emergencyTreatment = document.getElementsByName("emergencyTreatment");
		var emergencyTreatmentRadioSelected = false;
		for(var i=0; i<emergencyTreatment.length;i++){ if(emergencyTreatment[i].checked){ emergencyTreatmentRadioSelected = true; break; } }
		if(!emergencyTreatmentRadioSelected){ alert("Please choose  Weather treatment was taken in emergency, It should not empty!!!"); return false; }
		
		//treatmentPermission
		var treatmentPermission = document.getElementsByName("treatmentPermission");
		var treatmentPermissionRadioSelected = false;
		for(var i=0; i<treatmentPermission.length;i++){ if(treatmentPermission[i].checked){ treatmentPermissionRadioSelected = true; break; } }
		if(!treatmentPermissionRadioSelected){ alert("Please choose  Prior permission was taken for the treatment, It should not empty!!!"); return false; }
		
		//medicalAdvanceDetails
		var medicalAdvanceDetails = $("#medicalAdvanceDetails").val();
		if(medicalAdvanceDetails == null || medicalAdvanceDetails == ""){ alert("Details of Medical Advance taken,if any is required, please fill that!!"); return false; }
		
		
		//healthMedicalInsuranceScheme
		var healthMedicalInsuranceScheme = document.getElementsByName("healthMedicalInsuranceScheme");
		var healthMedicalInsuranceSchemeRadioSelected = false;
		for(var i=0; i<healthMedicalInsuranceScheme.length;i++){ if(healthMedicalInsuranceScheme[i].checked){ healthMedicalInsuranceSchemeRadioSelected = true; break; } }
		if(!healthMedicalInsuranceSchemeRadioSelected){ alert("Please choose  Subscribing to any health / medical Insurance scheme, It should not empty!!!"); return false; }
		
		const radioInputs = document.querySelectorAll('input[name="healthMedicalInsuranceScheme"]');
		let selectedValue = null;
		radioInputs.forEach(input => { if (input.checked) { 
			selectedValue = input.value; 
			//alert(selectedValue);
				if(selectedValue == 'No') { 
					document.getElementById('healthMedicalInsuranceSchemeIfYes').readOnly = true;
					$("#healthMedicalInsuranceSchemeIfYes").val('');
				}else{
					document.getElementById('healthMedicalInsuranceSchemeIfYes').readOnly = false;
					var healthMedicalInsuranceSchemeIfYes = $("#healthMedicalInsuranceSchemeIfYes").val();
					if(healthMedicalInsuranceSchemeIfYes == null || healthMedicalInsuranceSchemeIfYes == ''){
						alert('Please enter Subscribing to any health / medical Insurance scheme,If yes');
						$("#healthMedicalInsuranceSchemeIfYes").focus();
						return false;
					}
				}
			
			}  
		});
		
		var amountfor = $("#firstrecord").val();  
		//alert(amountfor);
		if(amountfor == null || amountfor == ""){
			alert('Please Enter Amount Claimed Details related to patient'); return false;
		}
		
		//doc
		//var doc = $("#doc").val();
		//if(doc == null || doc == ""){ alert("Document Upload is required, please fill that!!"); return false; }
		
		
		
		return true;
	}
 
</script>
<style>
.panel, .panel-body {
	box-shadow: none;
}

.panel-group .panel-heading {
	padding: 0;
}

.panel-group .panel-heading a {
	display: block;
	padding: 10px 15px;
	text-decoration: none;
	position: relative;
}

.panel-group .panel-heading a:after {
	content: '-';
	float: right;
}

.panel-group .panel-heading a.collapsed:after {
	content: '+';
}
</style>


</head>
<body>
	<%@ include file="/WEB-INF/views/banner2.jsp"%>
	<%@ include file="/WEB-INF/views/navbar2.jsp"%>

	<div style="color: red;" align="center">
		<h3>
			<b> ${msg} </b>
		</h3>
	</div>
	<form:form action="./saveCGHS" method="post" modelAttribute="cghs"
		enctype="multipart/form-data" onsubmit="return validate()">
		<div class="container-fluid">
			<div class="row">
				<div class="col-3">
					<div class="card"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<!-- 					<div class="card-header"> -->

						<!-- 					</div> -->
						<div class="card-body">
							<img src="data:image/png;base64,${photo }" alt="Image"
								width="100px;" height="100px;" /><br> <span
								style="color: blue;">Employee Details</span><br>
							<table>
								<tr>
									<td>Code</td>
									<td>: ${emp.code }</td>
								</tr>
								<tr>
									<td>Name</td>
									<td>: ${emp.name }</td>
								</tr>
								<tr>
									<td>Designation</td>
									<td>: ${emp.designation }</td>
								</tr>
								<tr>
									<td>Basic Pay</td>
									<td>: ${emp.basic_pay }</td>
								</tr>
								<tr>
									<td>Place</td>
									<td>: ${emp.place }</td>
								</tr>
								<tr>
									<td>E-Mail</td>
									<td>: ${emp.email }</td>
								</tr>
								<tr>
									<td>Phone No</td>
									<td>: ${emp.phno }</td>
								</tr>
								<tr>
									<td>DO Joining</td>
									<td>: ${emp.doj }</td>
								</tr>
								<tr>
									<td>DO Retirement</td>
									<td>: ${emp.date_of_retirement }</td>
								</tr>
								<tr>
									<td>DOB</td>
									<td>: ${emp.dob }</td>
								</tr>
								<tr>
									<td>Payscale</td>
									<td>: ${emp.payscale }</td>
								</tr>
								<tr>
									<td>CGHS Code</td>
									<td>: ${emp.ecghsCode }</td>
								</tr>
							</table>
						</div>
						<!-- 					<div class="card-footer"> -->
						<!-- 				<a href="#" style="border: 1px solid black;padding: 2px;border-radius: 5px;font-weight: bold;">VIEW MORE</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
						<!-- 				<a href="#" style="border: 1px solid black;padding: 2px;border-radius: 5px;font-weight: bold;">EDIT DETAILS</a> -->
						<!-- 					</div> -->
					</div>
				</div>
				<div class="col-9"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
					<div align="center">
						<div class="col-sm-12">
							<h6 class="h6 text-primary" style="text-decoration: underline;">MEDICAL REIBURSEMENT CLAIM FORM</h6>
						</div>
					</div>
					<input type="hidden" name="empCode" id="empCode"
						value="${emp.code }" /> <input type="hidden" name="ecghsCode"
						id="ecghsCode" value="${emp.ecghsCode }" /> <span
						style="color: blue;">Patient Details:</span>
					<div class="row">
						<div class="col-4">
							<label for="PatientsName">Patients Name</label> <select
								name="patientId" id="patientId" onchange="relationsearch()"
								class="form-control">
							</select>
						</div>
						<div class="col-4">
							<label for="PatientsCGHSBenIDNo">Patients CGHS Ben ID No</label>
							<input type="text" name="patient_benID" id="patient_benID"
								class="form-control" disabled="disabled" />
						</div>
						<div class="col-4">
							<label for="Relationship">Relationship with the Principal</label>
							<input type="text" name="patient_relation" id="patient_relation"
								class="form-control" disabled="disabled" />
						</div>
					</div>
					<br> <span style="color: blue;">Hospital Details:</span>
					<div class="row">
						<div class="col-4">
							<label for="Nameaddressofthehospital">Name & address of
								the hospital</label>
							<textarea rows="2" name="hospitalName" id="hospitalName"
								class="form-control"></textarea>
						</div>
						<div class="col-4">
							<label for="HospitalempalledunderCGHS">Hospital empalled
								under CGHS</label><br>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="empalledUnderCGHS" value="Yes">YES
								</label> <label class="form-check-label ml-4"> <input
									type="radio" class="form-check-input" name="empalledUnderCGHS"
									value="No">NO
								</label>
							</div>

						</div>
						<div class="col-4">
							<label for="Treatmentforwhichreimbursementclaimed">Treatment
								for which reimbursement claimed </label><br> (a)
							OPD/Test&Investigations
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="opdTreatment" value="Yes">YES
								</label> <label class="form-check-label ml-4"> <input
									type="radio" class="form-check-input" name="opdTreatment"
									value="No">NO
								</label>
							</div>
							<br> (b) Indoor Treatment
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="indoorTreatment" value="Yes">YES
								</label> <label class="form-check-label ml-4"> <input
									type="radio" class="form-check-input" name="indoorTreatment"
									value="No">NO
								</label>
							</div>


						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="Weathertreatment">Weather treatment was taken
								in emergency</label>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="emergencyTreatment" value="Yes">YES
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="emergencyTreatment" value="No">NO
								</label>
							</div>
						</div>
						<div class="col-4">

							<label for="Priorpermission">Prior permission was taken
								for the treatment</label>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="treatmentPermission" value="Yes">YES
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="treatmentPermission" value="No">NO
								</label>
							</div>
						</div>
						<div class="col-4">
							<label for="Detailsof">Details of Medical Advance
								taken,if any</label>
							<textarea rows="1" name="medicalAdvanceDetails"
								id="medicalAdvanceDetails" class="form-control"></textarea>
						</div>
					</div>

					<div class="row ">
						<div class="col-4">
							<label for="Subscribing">Subscribing to any health /
								medical Insurance scheme</label>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" onchange="return scheme()"
									name="healthMedicalInsuranceScheme" value="Yes">YES
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" onchange="return scheme()"
									name="healthMedicalInsuranceScheme" value="No">NO
								</label>
							</div>
						</div>
						<div class="col-4">
							<label for="Subscribingto">Subscribing to any health /
								medical Insurance scheme,If yes</label>
							<textarea rows="1" name="healthMedicalInsuranceSchemeIfYes"
								id="healthMedicalInsuranceSchemeIfYes" class="form-control"></textarea>
						</div>
						<div class="col-4">
							<label for="DocumentUpload">Document Upload</label> <input
								type="file" name="doc" id="doc" class="mt-4" />
						</div>
					</div>
					<br> <span style="color: blue;">Amount Claimed</span>
					<div class="row ">
						<div class="col-12">
							<div class="form-check form-check-inline">
								<table class="table table-borderless" id="multi">
									<tbody id="tbodydd">
										<tr>
											<td>Type</td>
											<td>Bill No</td>
											<td>Date</td>
											<td>Amount</td>
											<td>Doctor Name</td>
											<td>Hospital Name</td>
										</tr>
										<tr>
											<td><select class="form-control" name="typee" id="firstrecord">
													<option value="">-select-</option>
													<option value="opd">OPD Treatment</option>
													<option value="indoor">Indoor Treatment</option>
													<option value="tests">Tests / Investigation</option>
											</select></td>
											<td><input type="text" name="billNoo" id="billNoo"
												class="form-control" /></td>
											<td><input type="date" name="datee" id="datee"
												class="form-control" /></td>
											<td><input type="text" name="amountt" id="amountt"
												class="form-control" /></td>
											<td><input type="text" name="doctorNamee"
												id="doctorNamee" class="form-control" /></td>
											<td><input type="text" name="hospitalNamee"
												id="hospitalNamee" class="form-control" /></td>
										</tr>
									</tbody>
								</table>
								<button class="btn btn-md btn-primary" id="addBtn" type="button">Add
									More</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 m-4" align="center">
							<button type="submit"
								class="btn btn-success fw-bolder form-control w-25">Submit</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form:form>

	<!-- 	<div align="center"> -->

	<!-- 		<div class="container mt-2 mb-2 border shadow-lg"> -->
	<%-- 			<form:form action="./saveCGHS" method="post" modelAttribute="cghs" --%>
	<%-- 				enctype="multipart/form-data" onsubmit="return validate()"> --%>

	<!-- 				<div class="row align-items-center m-2"> -->
	<!-- 					<div class="col-sm-4"></div> -->
	<!-- 					<div class="col-sm-4"> -->
	<!-- 						<input type="text" class="form-control" name="empCode" -->
	<!-- 							id="empCode" maxlength="4" onchange="return getEmpDetails()" -->
	<!-- 							placeholder="Employee Code" /> -->
	<!-- 					</div> -->
	<!-- 					<div class="col-sm-4"></div> -->
	<!-- 				</div> -->
	<!-- 				<div id="viewinputs"> -->

	<!-- 					<div class="panel-group border rounded-lg" -->
	<!-- 						id="accordionSingleClosed" role="tablist" -->
	<!-- 						aria-multiselectable="true" -->
	<!-- 						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;"> -->
	<!-- 						<div class="panel panel-default"> -->
	<!-- 							<div class="panel-heading" role="tab" id="headingOne"> -->
	<!-- 								<div class="panel-title" align="left"> -->
	<!-- 									<a class="collapsed" role="button" data-toggle="collapse" -->
	<!-- 										href="#collapseItemCloseOne" aria-expanded="true" -->
	<!-- 										aria-controls="collapseItemCloseOne"> Principal CGHS card -->
	<!-- 										holder details </a> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 							<div id="collapseItemCloseOne" class="panel-collapse collapse" -->
	<!-- 								role="tabpanel" aria-labelledby="headingOne"> -->
	<!-- 								<div class="panel-body m-2"> -->
	<!-- 									<div class="row"> -->
	<!-- 										<div class="col-4"> -->
	<!-- 											<div align="left">Name of the Principal CGHS Card -->
	<!-- 												Holder</div> -->
	<!-- 											<input type="text" class="form-control" id="namespan" -->
	<!-- 												disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-4"> -->
	<!-- 											<div align="left">CGHS Ben ID No</div> -->
	<!-- 											<input type="text" class="form-control" id="ecghsspan" -->
	<!-- 												disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-4"> -->
	<!-- 											<div align="left">Ward Entitlement</div> -->
	<!-- 											<input type="text" class="form-control" -->
	<!-- 												name="wardEntitlement" id="wardEntitlement" -->
	<!-- 												disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 									</div> -->

	<!-- 									<div class="row"> -->
	<!-- 										<div class="col-4"> -->
	<!-- 											<div align="left">Mobile</div> -->
	<!-- 											<input type="text" class="form-control" id="mobile" -->
	<!-- 												disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-4"> -->
	<!-- 											<div align="left">E-Mail</div> -->
	<!-- 											<input type="text" class="form-control" id="email" -->
	<!-- 												disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-4"> -->
	<!-- 											<div align="left">Full Address</div> -->
	<!-- 											<textarea rows="2" name="address" id="address" -->
	<!-- 												class="form-control" disabled="disabled"></textarea> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<br>

	<!-- 					<div class="panel-group border rounded-lg" -->
	<!-- 						id="accordionSingleClosed1" role="tablist" -->
	<!-- 						aria-multiselectable="true" -->
	<!-- 						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;"> -->
	<!-- 						<div class="panel panel-default"> -->
	<!-- 							<div class="panel-heading" role="tab" id="headingOne"> -->
	<!-- 								<div class="panel-title" align="left"> -->
	<!-- 									<a class="collapsed" role="button" data-toggle="collapse" -->
	<!-- 										href="#collapseItemCloseOne1" aria-expanded="true" -->
	<!-- 										aria-controls="collapseItemCloseOne1"> Patient Details </a> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 							<div id="collapseItemCloseOne1" class="panel-collapse collapse" -->
	<!-- 								role="tabpanel" aria-labelledby="headingOne"> -->
	<!-- 								<div class="panel-body m-2"> -->
	<!-- 									<div class="row align-items-center empinfo  "> -->
	<!-- 										<div class="col-sm-4"> -->
	<!-- 											<div align="left">Patients Name</div> -->
	<!-- 											<select name="patientId" id="patientId" -->
	<!-- 												onchange="relationsearch()" class="form-control"> -->
	<!-- 											</select> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-sm-3"> -->
	<!-- 											<div align="left">Patients CGHS Ben ID No</div> -->
	<!-- 											<input type="text" name="patient_benID" id="patient_benID" -->
	<!-- 												class="form-control" disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 										<div class="col-sm-5"> -->
	<!-- 											<div align="left">Relationship with the Principal CGHS -->
	<!-- 												card holder</div> -->
	<!-- 											<input type="text" name="patient_relation" -->
	<!-- 												id="patient_relation" class="form-control" -->
	<!-- 												disabled="disabled" /> -->
	<!-- 										</div> -->
	<!-- 									</div> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->
	<br>
	<!-- 					<div class="panel-group border rounded-lg shadow-lg" -->
	<!-- 						id="accordionSingleClosed2" role="tablist" -->
	<!-- 						aria-multiselectable="true" -->
	<!-- 						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;"> -->
	<!-- 						<div class="panel panel-default"> -->
	<!-- 							<div class="panel-heading" role="tab" id="headingOne"> -->
	<!-- 								<div class="panel-title" align="left"> -->
	<!-- 									<a class="collapsed" role="button" data-toggle="collapse" -->
	<!-- 										href="#collapseItemCloseOne2" aria-expanded="true" -->
	<!-- 										aria-controls="collapseItemCloseOne2"> Hospital Details </a> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 							<div id="collapseItemCloseOne2" class="panel-collapse collapse" -->
	<!-- 								role="tabpanel" aria-labelledby="headingOne"> -->
	<!-- 								<div class="panel-body m-2"> -->

	<!-- 									<div class="container  m-4"> -->
	<!-- 										<table class="table table-borderless"> -->
	<!-- 											<tbody> -->
	<!-- 												<tr> -->
	<!-- 													<td>Name & address of the hospital :</td> -->
	<!-- 													<td><textarea rows="2" name="hospitalName" -->
	<!-- 															id="hospitalName" class="form-control"></textarea></td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Hospital empalled under CGHS :</td> -->
	<!-- 													<td> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="empalledUnderCGHS" value="Yes">YES -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="empalledUnderCGHS" value="No">NO -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 													</td> -->
	<!-- 												</tr> -->

	<!-- 												<tr> -->
	<!-- 													<td>Treatment for which reimbursement claimed :</td> -->
	<!-- 													<td>(a) OPD Treatment / Test & investigations:</td> -->
	<!-- 													<td> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="opdTreatment" value="Yes">YES -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="opdTreatment" value="No">NO -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 													</td> -->

	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td></td> -->
	<!-- 													<td>(b) Indoor Treatment:</td> -->
	<!-- 													<td> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="indoorTreatment" value="Yes">YES -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="indoorTreatment" value="No">NO -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 													</td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Weather treatment was taken in emergency :</td> -->
	<!-- 													<td> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="emergencyTreatment" value="Yes">YES -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="emergencyTreatment" value="No">NO -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 													</td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Prior permission was taken for the treatment :</td> -->
	<!-- 													<td> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="treatmentPermission" value="Yes">YES -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																name="treatmentPermission" value="No">NO -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 													</td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Details of Medical Advance taken,if any :</td> -->
	<!-- 													<td><textarea rows="1" name="medicalAdvanceDetails" -->
	<!-- 															id="medicalAdvanceDetails" class="form-control"></textarea></td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Subscribing to any health / medical Insurance -->
	<!-- 														scheme :</td> -->
	<!-- 													<td><div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																onchange="return scheme()" -->
	<!-- 																name="healthMedicalInsuranceScheme" value="Yes">YES -->
	<!-- 															</label> -->
	<!-- 														</div> -->
	<!-- 														<div class="form-check form-check-inline"> -->
	<!-- 															<label class="form-check-label"> <input -->
	<!-- 																type="radio" class="form-check-input" -->
	<!-- 																onchange="return scheme()" -->
	<!-- 																name="healthMedicalInsuranceScheme" value="No">NO -->
	<!-- 															</label> -->
	<!-- 														</div></td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Subscribing to any health / medical Insurance -->
	<!-- 														scheme,If yes :</td> -->
	<!-- 													<td><textarea rows="1" -->
	<!-- 															name="healthMedicalInsuranceSchemeIfYes" -->
	<!-- 															id="healthMedicalInsuranceSchemeIfYes" -->
	<!-- 															class="form-control"></textarea></td> -->
	<!-- 												</tr> -->
	<!-- 												<tr> -->
	<!-- 													<td>Document Upload</td> -->
	<!-- 													<td><input type="file" name="doc" id="doc" /></td> -->
	<!-- 												</tr> -->
	<!-- 											</tbody> -->
	<!-- 										</table> -->
	<!-- 									</div> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->

	<!-- 					<br> -->
	<!-- 					<div class="panel-group border rounded-lg" -->
	<!-- 						id="accordionSingleClosed3" role="tablist" -->
	<!-- 						aria-multiselectable="true" -->
	<!-- 						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;"> -->
	<!-- 						<div class="panel panel-default"> -->
	<!-- 							<div class="panel-heading" role="tab" id="headingOne"> -->
	<!-- 								<div class="panel-title" align="left"> -->
	<!-- 									<a class="collapsed" role="button" data-toggle="collapse" -->
	<!-- 										href="#collapseItemCloseOne3" aria-expanded="true" -->
	<!-- 										aria-controls="collapseItemCloseOne3"> Amount Claimed </a> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 							<div id="collapseItemCloseOne3" class="panel-collapse collapse" -->
	<!-- 								role="tabpanel" aria-labelledby="headingOne"> -->
	<!-- 								<div class="panel-body m-2"> -->
	<!-- 									<table class="table table-borderless" id="multi"> -->
	<!-- 										<tbody id="tbodydd"> -->
	<!-- 											<tr> -->
	<!-- 												<td>Type</td> -->
	<!-- 												<td>Bill No</td> -->
	<!-- 												<td>Date</td> -->
	<!-- 												<td>Amount</td> -->
	<!-- 												<td>Doctor Name</td> -->
	<!-- 												<td>Hospital Name</td> -->
	<!-- 											</tr> -->
	<!-- 											<tr> -->
	<!-- 												<td><select class="form-control" name="typee" -->
	<!-- 													id="typee"> -->
	<!-- 														<option value="" disabled="disabled" selected="selected">-select-</option> -->
	<!-- 														<option value="opd">OPD Treatment</option> -->
	<!-- 														<option value="indoor">Indoor Treatment</option> -->
	<!-- 														<option value="tests">Tests / Investigation</option> -->
	<!-- 												</select></td> -->
	<!-- 												<td><input type="text" name="billNoo" id="billNoo" -->
	<!-- 													class="form-control" /></td> -->
	<!-- 												<td><input type="date" name="datee" id="datee" -->
	<!-- 													class="form-control" /></td> -->
	<!-- 												<td><input type="text" name="amountt" id="amountt" -->
	<!-- 													class="form-control" /></td> -->
	<!-- 												<td><input type="text" name="doctorNamee" -->
	<!-- 													id="doctorNamee" class="form-control" /></td> -->
	<!-- 												<td><input type="text" name="hospitalNamee" -->
	<!-- 													id="hospitalNamee" class="form-control" /></td> -->
	<!-- 											</tr> -->
	<!-- 										</tbody> -->
	<!-- 									</table> -->
	<!-- 									<button class="btn btn-md btn-primary" id="addBtn" -->
	<!-- 										type="button">Add More</button> -->
	<!-- 								</div> -->
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 					</div> -->



	<!-- 	<div class="col-sm-12 m-4"> -->
	<!-- 		<button type="submit" -->
	<!-- 			class="btn btn-success fw-bolder form-control w-25">Submit</button> -->
	<!-- 	</div> -->
	<!-- 				</div> -->
	<%-- 			</form:form> --%>
	<!-- 		</div> -->
	<!-- 	</div> -->

</body>
</html>