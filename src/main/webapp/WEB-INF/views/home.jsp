<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

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
.spannames{
	font-weight: bold;
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
 	<%
String role= (String)session.getAttribute("role");
System.out.println("role=>"+role);
AppUser user= (AppUser)session.getAttribute("user");
System.out.println("user=>"+user.toString());
%>


	<%
if(role.equalsIgnoreCase("ROLE_EMP")){
	%>
	<%@include file="empLogin.jsp" %>
	
	<div class="container">
	<div class="card"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
		<div class="row">
			<div class="col-3">
				
					<!-- 					<div class="card-header"> -->
					<!-- 					</div> -->
					<div class="card-body">
						<img src="data:image/png;base64,${photo }" alt="Image"
							width="100%;" height="70%;" /><br> 
<!-- 							<span -->
<!-- 							style="color: blue;">Employee Details</span><br> -->
						
					</div>
<!-- 										<div class="card-footer" align="center"> -->
<!-- 									<a href="./editEmpDetails" style=" padding: 2px;border-radius: 5px;">Edit Details</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 										</div> -->
				
			</div>
 			<div class="col-9">
 			<table class="table table-borderless">
							<tr>
								<td>Code</td>
								<td>: <span class="spannames">${emp.code }</span></td>
								<td>Name</td>
								<td>: <span class="spannames">${emp.name }</span></td>
							</tr>
							 
							<tr>
								<td>Designation</td>
								<td>: <span class="spannames">${emp.designation }</span></td>
								<td>Basic Pay</td>
								<td>: <span class="spannames">${emp.basic_pay } /-</span></td>
							</tr>
							<tr>
								<td>Place</td>
								<td>: <span class="spannames">${emp.place }</span></td>
								<td>E-Mail</td>
								<td>: <span class="spannames">${emp.email }</span></td>
							</tr>
							<tr>
								<td>Phone No</td>
								<td>: <span class="spannames">${emp.phno }</span></td>
								<td>DO Joining</td>
								<td>: <span class="spannames">${emp.doj }</span></td>
							</tr>
							 
							<tr>
								<td>DO Retirement</td>
								<td>: <span class="spannames">${emp.date_of_retirement }</span></td>
								<td>DOB</td>
								<td>: <span class="spannames">${emp.dob }</span></td>
							</tr>
							 
							<tr>
								<td>Payscale</td>
								<td>: <span class="spannames">${emp.payscale }</span></td>
								<td>CGHS Code</td>
								<td>: <span class="spannames">${emp.ecghsCode }</span></td>
							</tr>
							
							<tr>
								<td colspan="4" style="text-align: center;"><a href="./editEmpDetails" style=" padding: 2px;border-radius: 5px;">Edit Details</a></td>
							</tr>
							
						</table>
 			</div> 
		</div>
		</div>
	</div>
	<%
}else{
%>
<%@include file="navbar2.jsp"%> 
<%
}
%>

	<div style="color: red; font-weight: bold;" align="center">
		<h3>${msg}</h3>
	</div>




<br>
<br>
<br>
<br>
<%@include file="footer.jsp"%>

</body>
</html>