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

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script>
	$(document).ready(function() {
		//$("#viewinputs").hide();
	});
	let empfamily = null;

	function validate() {
		var empCode = $("#empCode").val();
		alert("empCode=>" + empCode);

		if (empCode === null || empCode === "") {
			alert("Employee Code should not be Empty");
			$("#empCode").focus();
			return false;
		}

		return false;
	}
	function getEmpDetails() {
		var empCode = $("#empCode").val();
		//alert("empCode=>"+empCode);

		if (empCode === null || empCode === "") {
			alert("Employee Code should not be Empty");
			$("#empCode").focus();
			return false;
		}

		$.ajax({
			type : "GET",
			url : "getEmpDetails?code=" + empCode,
			cache : false,
			success : function(resp) {
				$("#viewinputs").show();
				document.getElementById("namespan").value = resp.name;
				document.getElementById("ecghsspan").value = resp.ecghsCode;
				document.getElementById("email").value = resp.email;
				document.getElementById("mobile").value = resp.phno;
				$("#address").val(resp.address);
				$("#wardEntitlement").val(resp.wardEntitlement);
				
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
				alert("No details found with given employee code");
			}
		});
 
	}
	
	function relationsearch(){
		var patient_name = $("#patientId").val();
		
		var ecghsCode = $("#ecghsspan").val();
		
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
				}else{
					document.getElementById('healthMedicalInsuranceSchemeIfYes').readOnly = false;
				}
			
			}  
		});
	}
	
	function validate(){
		scheme();
		
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
	<%@ include file="/WEB-INF/views/banner.jsp"%>
	<%@ include file="/WEB-INF/views/navbar.jsp"%>
	
	<div style="color: red;" align="center"><h3><b>
${msg}
</b></h3>
</div>

	<div align="center">
		<div class="row align-items-center">
			<div class="col-sm-12">
				<h6 class="h6 font-weight-bolder text-primary ">MEDICAL
					REIBURSEMENT CLAIM FORM</h6>
			</div>
		</div>
		<div class="container mt-2 mb-2 border shadow-lg">
			<form:form action="./saveCGHS" method="post"  modelAttribute="cghs" enctype="multipart/form-data"
			 onsubmit="return validate()">

				<div class="row align-items-center m-2">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="empCode"
							id="empCode" maxlength="4" onchange="return getEmpDetails()"
							placeholder="Employee Code" />
					</div>
					<div class="col-sm-4"></div>
				</div>
				<div id="viewinputs">

					<div class="panel-group border rounded-lg"
						id="accordionSingleClosed" role="tablist"
						aria-multiselectable="true"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<div class="panel-title" align="left">
									<a class="collapsed" role="button" data-toggle="collapse"
										href="#collapseItemCloseOne" aria-expanded="true"
										aria-controls="collapseItemCloseOne"> Principal CGHS card
										holder details </a>
								</div>
							</div>
							<div id="collapseItemCloseOne" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body m-2">
									<div class="row">
										<div class="col-4">
											<div align="left">Name of the Principal CGHS Card
												Holder</div>
											<input type="text" class="form-control" id="namespan"
												disabled="disabled" />
										</div>
										<div class="col-4">
											<div align="left">CGHS Ben ID No</div>
											<input type="text" class="form-control" id="ecghsspan"
												disabled="disabled" />
										</div>
										<div class="col-4">
											<div align="left">Ward Entitlement</div>
											<input type="text" class="form-control" name="wardEntitlement" id="wardEntitlement"
												 disabled="disabled"  />
										</div>
									</div>

									<div class="row">
										<div class="col-4">
											<div align="left">Mobile</div>
											<input type="text" class="form-control" id="mobile"
												disabled="disabled" />
										</div>
										<div class="col-4">
											<div align="left">E-Mail</div>
											<input type="text" class="form-control" id="email"
												disabled="disabled" />
										</div>
										<div class="col-4">
											<div align="left">Full Address</div>
											<textarea rows="2" name="address" id="address" class="form-control" disabled="disabled"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div class="panel-group border rounded-lg"
						id="accordionSingleClosed1" role="tablist"
						aria-multiselectable="true"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<div class="panel-title" align="left">
									<a class="collapsed" role="button" data-toggle="collapse"
										href="#collapseItemCloseOne1" aria-expanded="true"
										aria-controls="collapseItemCloseOne1"> Patient Details </a>
								</div>
							</div>
							<div id="collapseItemCloseOne1" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body m-2">
									<div class="row align-items-center empinfo  ">
										<div class="col-sm-4">
											<div align="left">Patients Name</div>
											<select name="patientId"
												  id="patientId" onchange="relationsearch()" class="form-control">
											</select>
										</div>
										<div class="col-sm-3">
											<div align="left">Patients CGHS Ben ID No</div>
											<input type="text" name="patient_benID" id="patient_benID" class="form-control" disabled="disabled"  />
										</div>
										<div class="col-sm-5">
											<div align="left">Relationship with the Principal CGHS
												card holder</div>
											<input type="text" name="patient_relation" id="patient_relation" class="form-control" disabled="disabled"  />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="panel-group border rounded-lg shadow-lg"
						id="accordionSingleClosed2" role="tablist"
						aria-multiselectable="true"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<div class="panel-title" align="left">
									<a class="collapsed" role="button" data-toggle="collapse"
										href="#collapseItemCloseOne2" aria-expanded="true"
										aria-controls="collapseItemCloseOne2"> Hospital Details </a>
								</div>
							</div>
							<div id="collapseItemCloseOne2" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body m-2">

									<div class="container  m-4">
										<table class="table table-borderless" >
											<tbody>
												<tr>
													<td>Name & address of the hospital :</td>
													<td><textarea rows="2" name="hospitalName" id="hospitalName" class="form-control"></textarea></td>
												</tr>
												<tr>
													<td>Hospital empalled under CGHS :</td>
													<td>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empalledUnderCGHS" value="Yes">YES
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="empalledUnderCGHS" value="No">NO
															</label>
														</div>
													</td>
												</tr>

												<tr>
													<td>Treatment for which reimbursement
														claimed :</td>
													<td>(a) OPD Treatment / Test & investigations:</td>
													<td>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="opdTreatment" value="Yes">YES
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="opdTreatment" value="No">NO
															</label>
														</div>
													</td>

												</tr>
												<tr>
													<td></td>
													<td>(b) Indoor Treatment:</td>
													<td>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="indoorTreatment" value="Yes">YES
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="indoorTreatment" value="No">NO
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>Weather treatment was taken in
														emergency :</td>
													<td>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="emergencyTreatment" value="Yes">YES
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="emergencyTreatment" value="No">NO
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>Prior permission was taken for the
														treatment :</td>
													<td>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="treatmentPermission"  value="Yes">YES
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" name="treatmentPermission"  value="No">NO
															</label>
														</div>
													</td>
												</tr>
												<tr>
													<td>Details of Medical Advance taken,if
														any :</td>
													<td><textarea rows="1" name="medicalAdvanceDetails" id="medicalAdvanceDetails" class="form-control"></textarea></td>
												</tr>
												<tr>
													<td>Subscribing to any health / medical Insurance scheme :</td>
													<td><div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" onchange="return scheme()"
																name="healthMedicalInsuranceScheme" value="Yes">YES
															</label>
														</div>
														<div class="form-check form-check-inline">
															<label class="form-check-label"> 
																<input type="radio" class="form-check-input" onchange="return scheme()" 
																name="healthMedicalInsuranceScheme" value="No">NO
															</label>
														</div></td>
												</tr>
												<tr>
													<td>Subscribing to any health / medical
														Insurance scheme,If yes :</td>
													<td><textarea rows="1" name="healthMedicalInsuranceSchemeIfYes" id="healthMedicalInsuranceSchemeIfYes" class="form-control"></textarea></td>
												</tr>
												<tr>
													<td>Document Upload</td>
													<td><input type="file" name="doc" id="doc" /></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<br>
					<div class="panel-group border rounded-lg"
						id="accordionSingleClosed3" role="tablist"
						aria-multiselectable="true"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<div class="panel panel-default">
							<div class="panel-heading" role="tab" id="headingOne">
								<div class="panel-title" align="left">
									<a class="collapsed" role="button" data-toggle="collapse"
										href="#collapseItemCloseOne3" aria-expanded="true"
										aria-controls="collapseItemCloseOne3"> Amount Claimed </a>
								</div>
							</div>
							<div id="collapseItemCloseOne3" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body m-2">
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
												<td>
													<select class="form-control" name="typee" id="typee">
														<option value="" disabled="disabled" selected="selected">-select-</option>
														<option value="opd">OPD Treatment</option>
														<option value="indoor">Indoor Treatment</option>
														<option value="tests">Tests / Investigation</option>
													</select>
												</td>
												<td><input type="text" name="billNoo" id="billNoo" class="form-control" /></td>
												<td><input type="date" name="datee" id="datee" class="form-control" /></td>
												<td><input type="text" name="amountt" id="amountt" class="form-control" /></td>
												<td><input type="text" name="doctorNamee" id="doctorNamee" class="form-control" /></td>
												<td><input type="text" name="hospitalNamee" id="hospitalNamee" class="form-control" /></td>
											</tr>
										</tbody>
									</table>
									<button class="btn btn-md btn-primary" id="addBtn" type="button">Add More</button>
								</div>
							</div>
						</div>
					</div>



					<div class="col-sm-12 m-4">
						<button type="submit"
							class="btn btn-success fw-bolder form-control w-25">Submit</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>