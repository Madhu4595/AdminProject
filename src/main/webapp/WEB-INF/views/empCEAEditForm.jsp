<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
		Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	int current_year = Integer.parseInt(format.format(date));

	int start_year = 2010;
	int substart_year = 2010;
	int end_year = current_year + 1;
	String year_value="";
	int start_year2 = 2010;
	int substart_year2 = 2010;
	int end_year2 = current_year + 1;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEA EDIT FORM</title>
<style>
/*for admission number finding*/
/* The Modal (background) */
.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 220px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow-y: scroll; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close1 {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-content1 {
	background-color: #e4eeb9;
	border: 2px solid black;
}

#scrollbar {
	width: 800px;
	height: 300px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
#empName{
color: blue;
}
</style>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	//alert("Asdfasfs")
	  $("#editform").hide();
	});
	
function requestnosearch() {
	// alert("requestnosearch")
	var requestno = $("#requestno").val();
	//alert("request_no==> "+request_no);
	document.getElementById("requestno").readonly = true;

	var modal1 = document.getElementById("myModal1");
	var span = document.getElementsByClassName("close1")[0];
	modal1.style.display = "block";
	span.onclick = function() {
		modal1.style.display = "none";
	};

	$
			.ajax({
				type : "get",
				url : "./getAllCEAsForEdit",
				cache : false,
				success : function(response) {
					//alert("success response length=> "+response.length)
					//alert("success response  => "+JSON.stringify(response))
					if (response.length === 0) {
						alert("No CEA Details Found");
					} else {
						$("#myModal1").show();
						$("#data").empty();
						
						for (var i = 0; i < response.length; i++) {
							bean = response[i];
							
							var name_class_of_1;
							if(bean.name_class_of_child2 === null){
								name_class_of_1 = "";
							}else{
								name_class_of_1 = bean.name_class_of_child2;
							}

							$("#data").append(
											'<tr>'
													+ '<td><a style="color:blue;" href="javascript:callrequestno(\''+bean.requestno+'\')">'+bean.requestno+'</a></td>'
													+ '<td>'+bean.empCode+'</td>'
													+ '<td>'+bean.name_class_of_child1+'</td>'
													+ '<td>'+name_class_of_1+'</td>'
													+ '<td>'+bean.amount_claimed+'</td>'
													+ '</tr>');
						}

					}
				},
				error : function(response) {
					alert("CEA Bills Requests Data are not Found");
				}
			});

}
function callrequestno(a){
	//alert("callrequestno=> "+a);
	$("#requestno").val(a);
	
	var modal1 = document.getElementById("myModal1");
	modal1.style.display = "none";
	
	validate();
	
}
function validate(){
	
	var requestno = $("#requestno").val();
	
	if(requestno === null || requestno === ""){
		alert("Request Number is Required, Please Enter"); $("#requestno").focus(); return false;
	}else{
		
		$
		.ajax({
			type : "get",
			url : "./getCEAForEditById?requestno="+requestno,
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
				if (response.length === 0) {
					alert("No CEA Details Found");
				} else {
					$("#editform").show();
					
					$("#reqno").val(requestno);
					
					$("#ceaname0").val('');
					$("#p_claim").val('');
					$("#schoolfee").val('');
					$("#cea_amount_child1").val('');
					$("#amount_cla").val('');
					
					$("#ceaname1").val('');
					$("#p_claim1").val('');
					$("#schoolfee1").val('');
					$("#cea_amount_child2").val('');
					$("#amount_cla").val('');
					$("#amount_cla").val('');
					
					$("#empName").val('');
					$("#noofchilds").val(response.noofchilds);
					
					getEmpNameAndDesg(response.empCode);
					
					if(response.noofchilds === "1"){
						$("#ceaname0").val(response.name_class_of_child1);
						$("#p_claim").val(response.period_of_claim_child1);
						$("#schoolfee").val(response.cea_type_child1);
						$("#cea_amount_child1").val(response.cea_amount_child1);
						$("#amount_cla").val(response.amount_claimed);
						
						$("#ceaname1").attr("disabled",true);
						$("#p_claim1").attr("disabled",true);
						$("#schoolfee1").attr("disabled",true);
						$("#cea_amount_child2").attr("disabled",true);
						$("#amount_cla").attr("readonly",true);
					}
					if(response.noofchilds === "2"){
						$("#ceaname0").val(response.name_class_of_child1);
						$("#p_claim").val(response.period_of_claim_child1);
						$("#schoolfee").val(response.cea_type_child1);
						$("#cea_amount_child1").val(response.cea_amount_child1);
						$("#amount_cla").val(response.amount_claimed);
						
						$("#ceaname1").val(response.name_class_of_child2);
						$("#p_claim1").val(response.period_of_claim_child2);
						$("#schoolfee1").val(response.cea_type_child2);
						$("#cea_amount_child2").val(response.cea_amount_child2);
						$("#amount_cla").val(response.amount_claimed);
						$("#amount_cla").attr("readonly",true);
					}
				}
			},
			error : function(response) {
				alert("CEA Bills Requests Data are not Found");
			}
		});
		 
	}
	
}
function getEmpNameAndDesg(a){
	$.ajax({
		type: "get",
		url: "./empNameandDesignation?empcode="+a,
		cache: false,
		success:function(resp){
			//alert("success=> "+resp);
			document.getElementById("empName").innerHTML = resp+' (Emp Code: '+a+')';
		},
		error:function(resp){
			alert("Employee Name and Designation is not Found for Print");
		}
	});
}

function cea_amount_child1Validation(){
	
	var noofchilds = $("#noofchilds").val();
	var cea_amount_child1 = $("#cea_amount_child1").val();
	var cea_amount_child2 = $("#cea_amount_child2").val();
	
	if(noofchilds === "1"){
		$("#amount_cla").val(cea_amount_child1);
	}else{

		if(cea_amount_child1 === ""|| cea_amount_child1 === null){
			alert("Please Enter Amount For Child1");
			$("#cea_amount_child2").val('');
			$("#cea_amount_child1").focus();
			return false;
		}else{
			var amount_cla = parseInt(cea_amount_child1) + parseInt(cea_amount_child2);
			$("#amount_cla").val(amount_cla);
		}
	}
}
function cea_amount_child2Validation(){
	var noofchilds = $("#noofchilds").val();
	var cea_amount_child1 = $("#cea_amount_child1").val();
	var cea_amount_child2 = $("#cea_amount_child2").val();
	
	if(cea_amount_child1 === ""|| cea_amount_child1 === null){
		alert("Please Enter Amount For Child1");
		$("#cea_amount_child2").val('');
		$("#cea_amount_child1").focus();
		return false;
	}else{
		var amount_cla = parseInt(cea_amount_child1) + parseInt(cea_amount_child2);
		$("#amount_cla").val(amount_cla);
	}
}

function Validate(){
	
	var noofchilds = $("#noofchilds").val();
	
	
	if(noofchilds === "1"){
		var ceaname0 = $("#ceaname0").val();
		var p_claim = $("#p_claim").val();
		var schoolfee = $("#schoolfee").val();
		var cea_amount_child1 = $("#cea_amount_child1").val();
		var amount_cla = $("#amount_cla").val();
		
		if(ceaname0 === "" || ceaname0 === null){ alert("Name and Class of Child1 Required."); $("#ceaname0").focus(); return false; }
		if(p_claim === "" || p_claim === null){ alert("Period of Claim for child1 Required."); $("#p_claim").focus(); return false; }
		if(schoolfee === "" || schoolfee === null){ alert("Type Required."); $("#schoolfee").focus(); return false; }
		if(cea_amount_child1 === "" || cea_amount_child1 === null){ alert("Amount Claimed for child1 Required."); $("#cea_amount_child1").focus(); return false; }
		if(amount_cla === "" || amount_cla === null){ alert("Amount Claimed Required."); $("#amount_cla").focus(); return false; }
	}
	if(noofchilds === "2"){
		
		var ceaname1 = $("#ceaname1").val();
		var p_claim1 = $("#p_claim1").val();
		var schoolfee1 = $("#schoolfee1").val();
		var cea_amount_child2 = $("#cea_amount_child2").val();
		var amount_cla = $("#amount_cla").val();
		
		var ceaname0 = $("#ceaname0").val();
		var p_claim = $("#p_claim").val();
		var schoolfee = $("#schoolfee").val();
		var cea_amount_child1 = $("#cea_amount_child1").val();
		var amount_cla = $("#amount_cla").val();
		
		if(ceaname0 === "" || ceaname0 === null){ alert("Name and Class of Child1 Required."); $("#ceaname0").focus(); return false; }
		if(p_claim === "" || p_claim === null){ alert("Period of Claim for child1 Required."); $("#p_claim").focus(); return false; }
		if(schoolfee === "" || schoolfee === null){ alert("Type Required."); $("#schoolfee").focus(); return false; }
		if(cea_amount_child1 === "" || cea_amount_child1 === null){ alert("Amount Claimed for child1 Required."); $("#cea_amount_child1").focus(); return false; }
		if(amount_cla === "" || amount_cla === null){ alert("Amount Claimed Required."); $("#amount_cla").focus(); return false; }
		
		if(ceaname1 === "" || ceaname1 === null){ alert("Name and Class of Child2 Required."); $("#ceaname1").focus(); return false; }
		if(p_claim1 === "" || p_claim1 === null){ alert("Period of Claim for child2 Required."); $("#p_claim1").focus(); return false; }
		if(schoolfee1 === "" || schoolfee1 === null){ alert("Type Required."); $("#schoolfee1").focus(); return false; }
		if(cea_amount_child2 === "" || cea_amount_child2 === null){ alert("Amount Claimed for child2 Required."); $("#cea_amount_child2").focus(); return false; }
		if(amount_cla === "" || amount_cla === null){ alert("Amount Claimed Required."); $("#amount_cla").focus(); return false; }
	}
	
	return true;
}
</script>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	
	<div align="center">
		<h6 class="h6 font-weight-bolder text-primary">EMPLOYEE CEA ALLOWANCE EDIT FORM</h6>
	</div>
	<form:form action="./updateCEA" modelAttribute="cea" method="post" onsubmit="return Validate()">
	<div class="container mt-4 border font-weight-bolder"
		style="background-color: #e6ffff;">
		
		<div class="row align-items-center m-2">
			<div class="col-4">
				<label for="request_no" class="col-form-label">Request
					Number :</label>
			</div>
			<div class="col-4">
				<input type="text" name="requestnoo" id="requestno"
					placeholder="Ex: CEA0001" class="form-control"   />
			</div>
		</div>
		<div class="row align-items-center m-2">
			<div class="col-2"></div>
			<div class="col-4">
				<input type="button" class="btn btn-success" value="Get Data"
					style="width: 300px;" onclick="return validate()" />
			</div>
			<div class="col-4">
				<input type="button" id="helpsearch" class="btn btn-info"
					value="Seach Request No" style="width: 300px;"
					onclick="return requestnosearch()" />
			</div>
			<div class="col-2"></div>
		</div>
	
	</div>
	
	
	<div id="myModal1" class="modal1">
		<div class="modal-content1">
			<span class="close1" style="color: red; font-weight: bold;">&#9746;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<center>
				<div id="scrollbar">
					<div id="content">
					<table class="table table-stripped">
							<thead>
								<th>Request No</th>
								<th>Emp Code</th>
								<th>Name and Class of Child1</th>
								<th>Name and Class of Child2</th>
								<th>Amount Claimed</th>
							</thead>
							<tbody id="data"></tbody>
						</table>
					</div>
				</div>
			</center>
			
			 
		</div>
	</div>
	
	<div id="editform" class="container mt-4 border font-weight-bolder"
		style="background-color: #e6ffff;">
		
			
			<div class="row align-items-center m-2">
			
				<input type="hidden" name="noofchilds" id="noofchilds" />
				<input type="hidden" name="requestno" id="reqno" />
				
				
				<div class="col-3">
					<label for="requestno" class="col-form-label">Employee Code & Name:</label>
				</div>
				<div class="col-8">
					 <span id="empName"></span>
				</div>
			</div>
			<div class="row m-1">
					<div class="col-3" id="ceanamelabelc1">
						<label for="requestno" class="col-form-label">Name and Class of Child1:</label>
					</div>
					<div class="col-3" id="ceanameinputc1">
						<form:input path="name_class_of_child1" id="ceaname0"  class="form-control"
						placeholder="Ex: Madhu and Class IV" onChange="return ceaname1Validation()" />
					</div>
					<div class="col-3" id="ceanamelabelc2">
						<label for="requestno" class="col-form-label">Name and Class of Child2:</label>
					</div>
					<div class="col-3" id="ceanameinputc2">
						<form:input path="name_class_of_child2" id="ceaname1" class="form-control" 
						placeholder="Ex: Pavan and Class X" onChange="return ceaname2Validation()" />
					</div>
			</div>
			<div class="row m-1">
					<div class="col-3" id="pofcforc1label">
						<label for="requestno" class="col-form-label">Period of Claim for child1:</label>
					</div>
					<div class="col-3" id="pofcforc1input">
						<form:select path="period_of_claim_child1"
						class="form-control" id="p_claim" onChange="return p_claimValidation()"  >
							<form:option value="">-select-</form:option>
							<%
								for (int i = start_year; i < end_year; i++) {
									 year_value=String.valueOf(i)+"-"+String.valueOf(++substart_year);
									//System.out.println("dshjkgsdg"+year_value);
							%>
							<form:option value='<%=year_value%>'>
								<%=year_value%>
							</form:option>
							<%
								}
							%>

						</form:select>
					</div>
					<div class="col-3" id="pofcforc2label">
						<label for="requestno" class="col-form-label">Period of
							Claim for child2:</label>
					</div>
					<div class="col-3" id="pofcforc2input">
						<form:select path="period_of_claim_child2" id="p_claim1"
							  class="form-control"
							onChange="return p_claim1Validation()">
							<form:option value="">-select-</form:option>
							<%
								for (int i = start_year2; i < end_year2; i++) {
									String year_value1=String.valueOf(i)+"-"+String.valueOf(++substart_year2);
							%>
							<form:option value="<%=year_value1%>">
								<%=year_value1%>
							</form:option>
							<%
								}
							%>
						</form:select>
					</div>
				</div>
				<div class="row m-1">
					<div class="col-3" id="type1label">
						<label for="requestno" class="col-form-label">Type:</label>
					</div>
					<div class="col-3" id="type1input">
						<form:select path="cea_type_child1" id="schoolfee"
							 class="form-control">
							<form:option value="">-select-</form:option>
							<form:option value="sfee">School Fee</form:option>
							<form:option value="sfeehstl">School Fee & Hostel</form:option>
							<form:option value="sfeedisabled">School Fee For Disabled</form:option>
						</form:select>
					</div>
					<div class="col-3" id="type2label">
						<label for="requestno" class="col-form-label">Type:</label>
					</div>
					<div class="col-3" id="type2input">
						<form:select path="cea_type_child2" id="schoolfee1"
							  class="form-control">
							<form:option value="">-select-</form:option>
							<form:option value="sfee">School Fee</form:option>
							<form:option value="sfeehstl">School Fee & Hostel</form:option>
							<form:option value="sfeedisabled">School Fee For Disabled</form:option>
						</form:select>
					</div>
				</div>
				<div class="row m-1">
					<div class="col-3" id="acc1label">
						<label for="requestno" class="col-form-label">Amount
							Claimed for child1:</label>
					</div>
					<div class="col-3" id="acc1input">
						<form:input path="cea_amount_child1" id="cea_amount_child1" class="form-control"
							placeholder="Ex: 25000" onchange="return cea_amount_child1Validation()" />
					</div>
					<div class="col-3" id="acc2label">
						<label for="requestno" class="col-form-label">Amount
							Claimed for child2:</label>
					</div>
					<div class="col-3" id="acc2input">
						<form:input path="cea_amount_child2" id="cea_amount_child2" class="form-control"
							placeholder="Ex: 25000" onchange="cea_amount_child2Validation();" />
					</div>
				</div>
				<div class="row m-1">
					<div class="col-3" id="amountclaimlabel">
						<label for="requestno" class="col-form-label">Amount Claimed:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="amountclaiminput">
						<form:input path="amount_claimed" id="amount_cla" 
						class="form-control" onChange="return amount_claValidation()"
						  />
					</div>
					<div class="col-3"></div>
					<div class="col-3"></div>
				</div>
			 
			 <div class="row m-1" id="submit">
					<div class="col-4"></div>
					<div class="col-4">
						<input type="submit" id="search" class="btn btn-success px-3 form-control" value="Update" />
					</div>
					<div class="col-4"></div>
				</div>
		
	</div>
	</form:form>
	<center style="color: red;">
		<h3>
			<b> ${msg} </b>
		</h3>
	</center>
</body>
</html>