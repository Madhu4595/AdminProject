<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% System.out.println("ddddddddddddddddddddddddddddddddddddd"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
a{
color: black
}
</style>
</head>
<body>
 
	<table id="admnumtable" border="1" style="height: 100%;" 
                           class="table table-bordered ">
		<tr class="sendhead1">
			<th style="width: 100px;">Request No</th>
			<th style="width: 150px;">Employee Code</th>
			<th style="width: 150px;">Amount Claimed</th>
		</tr>
		<tbody>
		<c:forEach var="empa" items="${emp_allowance }">
		<tr>

					<input type="hidden" name="selectrecords" id="request_no" />
					<td><a  style="color:blue;" href="javascript:callrequestno('${empa.request_no }')" >${empa.request_no }</a></td>
					<td>${empa.code}</td>
					<td>${empa.amount_claimed}</td>

				</tr>
        
        </c:forEach>
			 
		</tbody>
	</table>
</body>
</html>