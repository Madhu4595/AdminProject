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
	
	<div align="center" class="text-primary font-weight-bolder">
		Available Brief Case Notesheets
	</div>
	
	<table class="table table-bordered table-striped" id="datatable">
					<thead style="background-color: black; color: white;">
						<tr>
						<th>Request Number</th>
						<th>Employee Code</th>
						<th>Invoice No</th>
						<th>Invoice Date</th>
						<th>Shop Name</th>
						<th>Amount Approved</th>
						<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="bean" items="${list }">
					<tr>
					<td>${bean.requestno}</td>
					<td>${bean.empCode}</td>
					<td>${bean.invoiceNo}</td>
					<td>${bean.invoiceDate}</td>
					<td>${bean.shopName}</td>
					<td>${bean.amountApproved}</td>
					<td><a href="./generatebriefCaseNSPrintPrint?requestno=${bean.requestno}">Print Notesheet</a></td>
					</tr>
					
					</c:forEach>
					
					</tbody>
					</table>
	
	 
</body>
</html>