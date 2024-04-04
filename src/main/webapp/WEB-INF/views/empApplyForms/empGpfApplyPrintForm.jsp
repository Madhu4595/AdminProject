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
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
</head>
<style>
#scrollbar {
	width: 1100px;
	height: 440px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
<body>
	<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/empLogin.jsp"%>
	<%-- 	<%@include file="/WEB-INF/views/navbar2.jsp"%> --%>


	<div align="center" style="font-weight: bolder; color: red;">${msg }</div>
<div align="center" style="font-weight: bolder; color: blue;">Available
					GPF Withdraw Details</div>
	<div class="container">
		<div class="row">

			<div class="col-12"
				style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
				

				<div id="scrollbar">
					<div id="content">
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
										<td>${bean.withdrawPeriodFrom }</td>
										<td>${bean.withdrawPeriodTo }</td>
										<td><a href="./empGpfPrint?id=${bean.id }" target="_blank">Get Print</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</div>





	<!-- <div class="container border p-4" style="background-color: #e6ffff;"> -->

	<!-- </div> -->
</body>
</html>