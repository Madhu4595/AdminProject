<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMP GPF PRINT FORM</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css" >
</head>
<body>
<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/navbar2.jsp"%>
<div align="center" style="font-weight: bolder; color: red;">${msg }</div>

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
					<div align="center" style="font-weight: bolder; color: blue;">Available GPF Withdraw Details</div>
	<table class="table table-bordered">
		<thead class="bg-dark text-white">
			<tr>
				<th>Purpose</th>
				<th>Period From</th>
				<th>Period To</th>
				<th>Action</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach var="bean" items="${list }">
		<tr>
		<td>${bean.withdrawPurpose }</td> 
		<td>${bean.withdrawPeriodFrom } </td> 
		<td>${bean.withdrawPeriodTo }</td> 
		<td><a href="./empGpfPrint?id=${bean.id }">Get Print</a></td> 
		</tr>
	</c:forEach>
	</tbody>
	</table>
					</div>
					</div>
					</div>





<!-- <div class="container border p-4" style="background-color: #e6ffff;"> -->

<!-- </div> -->
</body>
</html>