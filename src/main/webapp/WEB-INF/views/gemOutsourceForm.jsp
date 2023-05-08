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
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div align="center">
		<h3 class="h3 font-weight-bolder">GEM - Outsourcing Entry Form</h3>
	</div>
	<center style="color: red;">
		<h3>
			<b> ${msg} </b>
		</h3>
	</center>
	<div class="container mt-4 border font-weight-bolder"
		style="background-color: #e6ffff;">
		<form:form action="./saveGemOutsourcing" method="post" modelAttribute="gem">
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
</body>
</html>