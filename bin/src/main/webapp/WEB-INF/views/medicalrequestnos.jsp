<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   	
</head>
<body>
<table id="admnumtable" border="1" style="height: 100%;" 
                           class="table table-bordered ">
	<tr>
		<td>Request No</td>
		<td>Emp Code</td>
		<td>Bill No</td>
		<td>Amount Claimed</td>
	</tr>
	<c:forEach var="obj" items="${medical_Bills_upload}">
	<tr>
		<td><a href="javascript:callrequestno('${obj.request_no }')">${obj.request_no }</a></td>
		<td>${obj.emp_code }</td>
		<td>${obj.bill_no }</td>
		<td>${obj.amount_claimed }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>