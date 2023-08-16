<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM - Outsource NoteSheet</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
</head>
<body>
<%@include file="/WEB-INF/views/banner.jsp"%>
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	
	<table class="table table-bordered table-striped" id="datatable">
					<thead style="background-color: black; color: white;">
						<tr>
						<th>Request Number</th>
						<th>Employee Code</th>
						<th>Bill_no</th>
						<th>Bill_Date</th>
						<th>Amount Approved</th>
						<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="medicalNsprintList" items="${medicalNsprintList }">
					<tr>
					<td>${medicalNsprintList.request_no}</td>
					<td>${medicalNsprintList.emp_code}</td>
					<td>${medicalNsprintList.bill_no}</td>
					<td>${medicalNsprintList.bill_date}</td>
					<td>${medicalNsprintList.amount_approved}</td>
					<td><a href="./generateMedicalNSPrints?ns_number=${medicalNsprintList.nsNumber}">Generate Notesheet</a></td>
					
					</tr>
					
					</c:forEach>
					
					</tbody>
					</table>
	
	 
</body>
</html>