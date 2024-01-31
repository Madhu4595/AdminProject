<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/banner2.jsp"%>
	<%@ include file="/WEB-INF/views/navbar2.jsp"%>

	<div style="color: red;" align="center">
		<h3>
			<b> ${msg} </b>
		</h3>
	</div>

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
					<h6 class="h6" style="font-weight: bold;text-decoration: underline;color: blue;">AVAILABE EMP CEA APPLIES</h6>
				</div>
				<table class="table">
					<thead>
						<tr style="background-color: black; color: white;">
							<th>CHILD ONE NAME</th>
							<th>CHILD ONE ACADAMIC YEAR</th>
							<th>CHILD ONE SCHOOL NAME</th>

							<th style="color: blue;">CHILD TWO NAME</th>
							<th style="color: blue;">CHILD TWO ACADAMIC YEAR</th>
							<th style="color: blue;">CHILD TWO SCHOOL NAME</th>
							<th style="color: blue;" colspan="2">ACTIONS</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="bean" items="${list }">
							<tr>
								<td>${bean.childNameOne }</td>
								<td>${bean.childAcadamicYearOne }</td>
								<td>${bean.childSchoolNameOne }</td>

								<td>${bean.childNameTwo }</td>
								<td>${bean.childAcadamicYearTwo }</td>
								<td>${bean.childSchoolNameTwo }</td>
								<td><a href="./empCeaPrint?id=${bean.id }">Download</a> <%-- 			<td><a href="./empCeaPrintt?id=${bean.id }">Download</a> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%-- 	<div align="center"><h3><b> SPOUSE NAME : ${spouseName } </b></h3> </div> --%>

</body>
</html>