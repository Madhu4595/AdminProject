<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMP GPF ADVANCE FORM</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<style type="text/css">
#scrollbar {
	width: 1100px;
	height: 440px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/empLogin.jsp"%>
<%-- 	<%@include file="/WEB-INF/views/navbar2.jsp"%> --%>
	
	
		
		<div align="center" class="mb-2 h5 text-primary">Availabel GPF Advance Details</div>
		<div class="container">
		
			<div class="row">
				<div class="col-12"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						
						<div id="scrollbar">
					<div id="content" align="center">
					<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>Advance Purpose</th>
					<th>Advance Amount</th>
					<th>No of Installments</th>
					<th colspan="2">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${list}">
					<tr>
						<td>${bean.advancePurpose }</td>
						<td>${bean.advanceAmt }</td>
						<td>${bean.installments }</td>
						<td><a href="./empGpfAdvaceApplyFormPrint?id=${bean.id }" target="_blank">Print</a></td>
<%-- 						<td><a href="./empGpfAdvaceApplyFormPrintPdf?id=${bean.id }">Print</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div></div>
					</div></div></div>
		
		
<!-- 	<div class="container bg-light"> -->
		
	
		
<!-- 	</div> -->
</body>
</html>