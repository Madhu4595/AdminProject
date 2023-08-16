<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM-Vehicle</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
function validate(){
	//alert("validate");
	
	var monthYear = $("#monthYear").val();
	var period = $("#period").val();
	var billno = $("#billno").val();
	var billdate = $("#billdate").val();
	var amount = $("#amount").val();
	
	if(monthYear === null || monthYear === ""){ alert("Month & Year is required"); $("#monthYear").focus(); return false; }
	if(period === null || period === ""){ alert("Period is required"); $("#period").focus(); return false; }
	if(billno === null || billno === ""){ alert("Bill Number is required"); $("#billno").focus(); return false; }
	if(billdate === null || billdate === ""){ alert("Bill Date is required"); $("#billdate").focus(); return false; }
	if(amount === null || amount === ""){ alert("Amount is required"); $("#amount").focus(); return false; }
	
	return true;
}
</script>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div align="center">
		<h6 class="h6 font-weight-bolder text-primary">GEM - Vehicle Entry Form</h6>
	</div>
	
	<div class="container mt-2 border font-weight-bolder"
		style="background-color: #e6ffff;">
		<form:form action="./saveGem" method="post" modelAttribute="gem" onsubmit="return validate()">
			<div class="row align-items-center m-2">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="monthYear" class="col-form-label">Month & Year:</label>
				</div>
				<div class="col-4">
					<input type="text" name="monthYear" id="monthYear"
						placeholder="Ex: Jan 2022" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="period" class="col-form-label">Period:</label>
				</div>
				<div class="col-4">
					<input type="text" name="period" id="period" placeholder="Ex: 01/01/2023 to 31/01/2023" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="billno" class="col-form-label">Bill Number:</label>
				</div>
				<div class="col-4">
					<input type="text" name="billno" id="billno" placeholder="Ex: 123" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="billdate" class="col-form-label">Bill Date:</label>
				</div>
				<div class="col-4">
					<input type="text" name="billdate" id="billdate"
						placeholder="Ex: 12-12-2002" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="amount" class="col-form-label">Amount:</label>
				</div>
				<div class="col-4">
					<input type="text" name="amount" id="amount" placeholder="Ex: 1000" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2">
				<div class="col-4"></div>
				<div class="col-4">
					<input type="submit" class="btn btn-success" style="width: 300px;" />
				</div>
				<div class="col-4"></div>
			</div>
		</form:form>
	</div>
	<center style="color: red;">
		<h3>
			<b> ${msg} </b>
		</h3>
	</center>
</body>
</html>