<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/jquery364.slim.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui.js" type="text/javascript"></script>

<link rel="stylesheet" href="./bootstrap/bootstrap452.min.css">

<style>
#nicimgg, #apimgg {
	width: 180px;
	height: 80px;
}

#nicimgg {
	margin-right: 80px;
	margin-left: 30px;
}

#apimgg {
	margin-left: 130px;
}

#titlee {
	font-size: 45px;
}

#bannnersection {
	border: 2px solid black;
	background: #e6ffcc;
}
/* 	.container{ */
/* 		border: 2px solid black; */
/* 		margin-top: 20px; */
/* 		background-color: #ffe6ff; */
/* 	} */
</style>


</head>
<body>
<!-- 	<section id="bannnersection"> -->
<!-- 		<div id="banner"> -->
<!-- 			<img alt="NIC" src="./images/nic-logo.jpg" id="nicimgg"> <b -->
<!-- 				id="titlee">NIC APSC ADMIN BILL PROCESSING</b> <img alt="AP" -->
<!-- 				src="./images/indialogo.jpeg" id="apimgg"> -->
<!-- 		</div> -->
<!-- 	</section> -->
	<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>

	<%
if(role.equalsIgnoreCase("ROLE_EMP")){
	%>
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
			<div class="col-9"></div>
		</div>
	</div>
	<%
}
%>

	<div style="color: red; font-weight: bold;" align="center">
		<h3>${msg}</h3>
	</div>



</body>
</html>