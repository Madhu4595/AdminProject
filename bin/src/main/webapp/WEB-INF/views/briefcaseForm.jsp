<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEA EMPLOYEE ALLOWANCE</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script>

	 
	
	function employeesearch(a){
		//alert("Asdfasfs"+a.value)
		var code = a.value;
		//alert("Asdfasfs"+code)
		
		$.ajax({
			type: "get",
			url: "./empNameandDesignation?empcode="+code,
			cache: false,
			success:function(resp){
				//alert("success=> "+resp);
				document.getElementById("empName").innerHTML = resp;
				  
			},
			error:function(resp){
				//alert("error=> "+resp);
			}
		});
	}
	
	function Validate(){
	
		//alert("asdfasdf");
		
		var eno = $("#eno").val();
		if(eno === "" || eno === null){ alert("Employee Code is Requires, Please Enter"); $("#eno").focus(); return false; }
		
		return true;
	}
</script>
</head>
<body>

<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>
	
	<div align="center">
		<h6 class="h6 font-weight-bolder text-danger">EMPLOYEE BRIEFCASE ALLOWANCE ENTRY FORM</h6>
	</div>
	<div class="container mt-4 border font-weight-bolder"
		style="background-color: #e6ffff;">
		<form:form action="./saveBriefCase" modelAttribute="briefcase" method="post" onsubmit="return Validate()">
			
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Employee Code:</label>
				</div>
				<div class="col-4">
					<form:input path="empCode" id="eno" onChange="return employeesearch(this)" 
					class="form-control" placeholder="Enter Employee Code Example: 3586" maxlength="4" />
				</div>
				<div class="col-4"><span id="empName"></span></div>
			</div>
			
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Invoice Date:</label>
				</div>
				<div class="col-4">
					 <input type="date" name="invoiceDate" id="invoiceDate" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Invoice No:</label>
				</div>
				<div class="col-4">
					 <input type="text" name="invoiceNo" id="invoiceNo" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Shop Name:</label>
				</div>
				<div class="col-4">
					 <input type="text" name="shopName" id="shopName" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Amount Claimed:</label>
				</div>
				<div class="col-4">
					 <input type="text" name="amountClaimed" id="amountClaimed" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			 
			 <div class="row m-1" id="submit">
					<div class="col-4"></div>
					<div class="col-4">
						<input type="submit" id="search" class="btn btn-success px-3 form-control"  
							onchange="return Validate(this)" value="Submit" />
					</div>
					<div class="col-4"></div>
				</div>
		</form:form>
	</div>
	<div style="color: blue;" align="center">
		<h5>
			<b> ${msg} </b>
		</h5>
	</div>
	
</body>
</html>