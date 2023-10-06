<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>Medical Bills</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<style>
.getbg002 {
	background-color: #67c355;
}

.white {
	color: white !important;
}

.btn-warning {
	color: #ffffff !important;
	background-color: #67c355 !important;
	border-color: #67c355 !important;
	font-size: 20px !important;
	border-radius: 0 !important;
}

.buttoncolor {
	background-color: #007bff87;
	border: none;
	color: white;
	padding: 3px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

#section {
	border: 2px solid black;
	background-color: #e6f9ff;
}

h5 {
	color: blue;
	text-decoration: underline;
}

label {
	font-weight: bolder;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	document.getElementById("card_no").readOnly = true;
	document.getElementById("request_no").readOnly = true;
	
	
});


	function validate() {
		var elements = document.getElementsByClassName("billno");
		//alert(elements.length);
		var rv = true;
		$('.billno').each(function() {
			console.log($(this).val(), $(this));
			if ($(this).val() == "") {
				alert("Please Enter Bill Details");
				return rv = false;
			}
		});

		if (!rv) {
			return false;
		}

		//alert("rv"+rv);
		$('.mul_amt').each(function() {
			console.log($(this).val(), $(this));
			if ($(this).val() == "") {
				alert("Please Enter Bill Details");
				return rv = false;
			}
		});

		if (!rv) {
			return false;
		}

		$('.mul_labname').each(function() {
			if ($(this).val() == "") {
				alert("Please Enter Bill Details");
				return rv = false;
			}
		});

		if (!rv) {
			return false;
		}

		$('.mul_date').each(function() {
			if ($(this).val() == "") {
				alert("Please Enter Bill Details");
				return rv = false;
			}
		});

		if (!rv) {
			return false;
		}
	 
		var date = document.getElementById("date").value;
		var eno = document.getElementById("eno").value;
		var drname = document.getElementById("drname").value;
		var disease = document.getElementById("disease").value;
		var period_treatment = document.getElementById("period_treatment").value;
		var hospital = document.getElementById("hospital").value;
		var patient_name = document.getElementById("patient_name").value;

		if (date == null || date == '') {
			alert("Bill Date is Required");
			document.getElementById('date').focus();
			return false;
		}
		if (eno == null || eno == '') {
			alert("Employee Number is Required");
			document.getElementById('eno').focus();
			return false;
		}
		if (drname == null || drname == '') {
			alert("Doctor Name is Required");
			document.getElementById('drname').focus();
			return false;
		}
		if (disease == null || disease == '') {
			alert("Disease Name is Required");
			document.getElementById('disease').focus();
			return false;
		}
		if (period_treatment == null || period_treatment == '') {
			alert("Period of Treatment is Required");
			document.getElementById('period_treatment').focus();
			return false;
		}
		if (hospital == null || hospital == '') {
			alert("Hospital Name is Required");
			document.getElementById('hospital').focus();
			return false;
		}
		if (patient_name == null || patient_name == '') {
			alert("Patient Name is Required");
			document.getElementById('patient_name').focus();
			return false;
		}

	}
	// var rowNumber = document.getElementsByName("m_billno").value;
	//alert(rowNumber.length);    	

	function addLocDept() {
		var rowNumber = document.getElementById("rowIndex").value;
		var value = parseInt(document.getElementById('totalprice').value);
		value = isNaN(value) ? 0 : value;
		value = value + 10;
		document.getElementById('totalprice').value = value;
		$('#college_info').hide();
		document.getElementById("selected_id").disabled = true;
		rowNumber = parseInt(rowNumber) + 1;
		var addrs_state_p = document.getElementsByName("addrs_state_p");
		document.getElementById("addrs_state_p").style.display = "none";
		document.getElementById("addrs_district_p").style.display = "none";
		document.getElementById("addrs_mandal_p").style.display = "none";
		if (addrs_state_p.length == 60) {
			alert("You can select maximum of 60 ")
			return false;
		}
		var loctextid = addrs_state_p[addrs_state_p.length - 1].id;
		var addrs_district_p = document.getElementsByName("addrs_district_p");
		var locDistid = [ addrs_district_p.length - 1 ].id;
		var addrs_mandal_p = document.getElementsByName("addrs_mandal_p");
		var locmandid = addrs_mandal_p[addrs_mandal_p.length - 1].id;
		var table = document.getElementById("locDeptTable");
		var newlocid = 'addrs_state_p' + rowNumber;
		// alert(newlocid);
		var newDeptid = 'addrs_district_p' + rowNumber;
		var newmandid = 'addrs_mandal_p' + rowNumber;
		var x = document.getElementById("locDeptTable").rows.length;
		var row = table.insertRow(x - 1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);

		//cell1.innerHTML = '<select name="addrs_state_p" value id='+newlocid+' onchange="return abc(\''+newDeptid+'\',this.id,this.value);"><option value="">Select</option><option value="28">AP</option></select>';
		cell1.innerHTML = '<select name="addrs_state_p" style="width:150px" value id='+newlocid+' ><option value="">Select</option><option value="22">Anantapur</option><option value="23">Chittoor</option><option value="20">Cuddapah</option><option value="14">East Godavari</option><option value="17">Guntur</option><option value="16">Krishna</option><option value="21">Kurnool</option><option value="19">Nellore</option><option value="18">Prakasam</option><option value="11">Srikakulam</option><option value="13">Visakhapatnam</option><option value="12">Vizianagaram</option><option value="15">West Godavari</option></select>';
		cell2.innerHTML = '<select name="addrs_district_p" style="width:150px" value id='
				+ newDeptid
				+ ' onchange="getColleges(\''
				+ newlocid
				+ '\',\''
				+ newDeptid
				+ '\',\''
				+ newmandid
				+ '\', \'mandals\');"><option value="">Select</option><option value="G">Government</option><option value="P">Private</option>';
		cell3.innerHTML = '<select name="addrs_mandal_p" style="width:250px" onchange="return abc(this.value,this.id),abcd(this.value,this.id)" value id='
				+ newmandid + ' >'

		$('#rowIndex').val(rowNumber);
		for (var i = 0; i < rowNumber; i++) {
			var nuwid = newmandid;
			var new_Deptid = newDeptid;
			var new_locid = newlocid;

			if (rowNumber < 10) {
				nuwid = nuwid.substring(0, nuwid.length - 1);
				new_Deptid = new_Deptid.substring(0, new_Deptid.length - 1);
				new_locid = new_locid.substring(0, new_locid.length - 1);
			} else {
				nuwid = nuwid.substring(0, nuwid.length - 2);
				new_Deptid = new_Deptid.substring(0, new_Deptid.length - 2);
				new_locid = new_locid.substring(0, new_locid.length - 2);
			}
			nuwid = nuwid + i;
			new_Deptid = new_Deptid + i;
			new_locid = new_locid + i;
			var exist_id = document.getElementById(nuwid);
			if (exist_id) {
				document.getElementById(nuwid).style.display = "none";
				document.getElementById(new_Deptid).style.display = "none";
				document.getElementById(new_locid).style.display = "none";
			}
		}

		var modal = document.getElementById('myModal');
		var btn = document.getElementById("popup_id");

		var span = document.getElementsByClassName("close")[0];
		modal.style.display = "block";
		span.onclick = function() {
			modal.style.display = "none";
		}
		window.onclick = function(event) {
			if (event.target == modal) {
				/* modal.style.display = "none"; */
			}
		}
		return false;
	}

	function getValue(radiovalue) {
		//alert(radiovalue);
		if (radiovalue == 'CGHS') {
			document.getElementById("card_no").readOnly = false;
			
		} else {
			document.getElementById("card_no").value = "";
			document.getElementById("card_no").readOnly = true;
		}
	}
 
	function employeesearch() {

		var eno = $('#eno').val();
		document.getElementById("eno").readonly = true;
		
		if (!eno.match('^[0-9]{4}$')) {
			alert("Employee Number should contain FOUR NUMBERS only");
			document.getElementById("eno").value = null;
			$("#eno").focus();
			return false;
		}
		
		$.ajax({
			type: "get",
			url: "./empNameandDesignation",
			data: "empcode="+eno,
			cache:false,
			success:function(response){
//					alert("response=> "+response);
//					alert("response=> "+JSON.stringify(response));
				document.getElementById("empname").innerHTML = response;
				document.getElementById("eno").readOnly = true;
				
			},
			error:function(response){
				alert("Employee code is not found");
				$("#eno").val(''); $("#eno").focus();
			}
		});
	}

	function relationsearch() {

		var patient_name = $('#patient_name').val();
		var eno = $('#eno').val();

		$
				.getJSON(
						'relationsearch.action?eno=' + eno + "&patient_name="
								+ patient_name,
						function(response) {
							if (response) {
								if (response.Error == 'Success') {

									//     	             $('#empname').val(response.name);
									//     	             $('#basicpay').val(response.basic_pay);

									document.getElementById("relationname").innerHTML = "Relation: "
											+ response.relation;
									//document.getElementById("basicpay").innerHTML =response.basic_pay;
								}
							}
						});

	}
	function addOwner(a) {
		//alert("a==========> "+a);

		var tr = $(a).closest('tr').clone();
		$(tr).find('input').attr('readonly', true);
		tr.insertBefore('#multi tbody tr:last');

		var tr = $(a).closest('tr');
		$(tr).find('input').val('');

		var allbutt = document.querySelectorAll('input[type="button"]');
		$(tr).find(allbutt).val('Add');

		$(tr).find('input:last').val('Remove');

	}
	function removeOwner(a) {
		$(a).closest('tr').remove();
	}
	
	function getFamilyDetails(){
		var emp_code = $("#eno").val();
		$("#patient_name").empty();
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	         url: "./getFamilyDetails?emp_code="+emp_code,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	$("#patient_name").append('<option value="self">-self-</option>');
				for(var i = 0; i < data.length; i++){
					var fdata = data[i];
					$("#patient_name").append('<option value="'+fdata.per_name+'">'+fdata.per_name+'</option>');
				}
	            
	        },
	        error: function (data) {
	            //alert("Admission Number Not Found");
	            
	        }
	    });
		
	}
</script>
</head>

<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<form:form action="./billsupload" method="post"
		modelAttribute="medical_Bills_upload" enctype="multipart/form-data">

		<section class="container mt-5 shadow py-5" id="section">
			<div class="col-md-12  md-p-1 p-1">
				<h5 class="text-center px-2 text-uppercase sendhead"
					style="text-align: center">MEDICAL BILLS UPLOAD</h5>
			</div>
			<div class="row">

				<div class="col-md-5  md-p-2 p-4">

					<div class="form-group">
						<label>Request No</label>
						<form:input path="request_no" id="request_no" readonly="readonly"
							class="form-control" value="${hit_count}" />
					</div>
					<div class="form-group">
						<label>Name of Patient:</label> <select name="patient_name"
							style="width: 425px;" id="patient_name"
							onchange="relationsearch()" class="form-control">
							</select>
					</div>
					<div class="form-group" style="margin-top: 50px;">
						<label>Type: </label>
						<form:radiobutton path="type" id="CGHS" value="CGHS"
							onchange="getValue(this.id)" />
						<label for="CGHS">CGHS</label>
						<form:radiobutton path="type" id="AMA" value="AMA"
							onchange="getValue(this.id)" />
						<label for="AMA">AMA</label><br>
					</div>

					<div class="form-group">
						<label>Hospital:</label>
						<form:input path="hospital_name" id="hospital"
							class="form-control" />
					</div>

					<div class="form-group">
						<label>Period of treatment:</label>
						<form:input path="period_of_treatment" id="period_treatment"
							class="form-control" />
					</div>

					<div class="form-group">
						<label></label> <label></label>
						<p id="relationname" class="sendhead1"></p>
					</div>

				</div>
				<div class="col-md-5  md-p-4 p-4">
					<div class="form-group">
						<label>Employee Code:</label>
						<form:input path="emp_code" class="form-control" id="eno"
							onchange="employeesearch();getFamilyDetails();" maxlength="5" />
					</div>
					<div class="form-group">
						<label>Disease Details:</label>
						<form:input path="disease_name" id="disease" class="form-control" />
					</div>
					<div class="form-group" id="cardnodiv">
						<label>Card No:</label>
						<form:input path="card_no" id="card_no" class="form-control" />
					</div>
					<div class="form-group">
						<label>Doctor Name: </label>
						<form:input path="doctor_name" id="drname" class="form-control" />
					</div>

				</div>


			</div>
			<div class="row">
				<div>
					<table style="BORDER-COLLAPSE: collapse;" width="90%"
						align="center" id="multi">
						<tr class="sendhead1">
							<th width="100px;">Bill No</th>
							<th width="100px;">Date</th>
							<th width="100px;">Amount</th>
							<th width="100px;">Lab Name</th>
							<th width="100px;">Add/Delete</th>
						</tr>
						<tr
							style="border-top: 10px solid; border-bottom: 10px solid; border-color: transparent;">
							<td style="width: 400px;"><form:input class="billno"
									path="bill_no" maxlength="50" /></td>
							<td style="width: 400px;"><form:input type="date"
									class="mul_date" path="bill_date" maxlength="50" /></td>
							<td style="width: 400px;"><form:input type="text"
									class="mul_amt" path="amount_claimed" maxlength="10" /></td>
							<td style="width: 400px;"><form:input type="text"
									class="mul_labname" path="lab_name" maxlength="30" /></td>
							<!-- 						<td  style="width:400px;"><input type="button"  style="" class="buttoncolor" name="add" value="add" onclick="addOwner(this)" /></td> -->

							<td style="width: 400px;"><input type="button" style=""
								class="buttoncolor" name="add" value="Add"
								onclick="addOwner(this)" /></td>
							<td style="width: 400px;"><input type="button" style=""
								class="buttoncolor" name="remove" value="Remove"
								onclick="removeOwner(this)" /></td>
						</tr>
					</table>

				</div>

			</div>
			<div class="form-group mt-5" style="margin-left: 40px;">
				<button type="submit" class="btn btn-success px-5"
					onclick="return validate()">Submit</button>
			</div>

		</section>
	</form:form>

</body>

</html>