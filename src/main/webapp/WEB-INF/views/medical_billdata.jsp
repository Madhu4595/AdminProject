<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
 span{ font-weight: bolder;}
 #details{margin-left: 300px; }
 table{ margin-left: 150px;}
</style>
</head>
<body>
	<div id="details">
			<label>Employee Code: </label><span> ${list.emp_code }</span>&nbsp;&nbsp;&nbsp;
			<label>Patient Name:</label><span> ${list.patient_name }</span>&nbsp;&nbsp;&nbsp;
			<label>Doctor Name:</label><span> ${list.doctor_name }</span>
	</div>			
			
	<table width="900px;">
    	<tr class="sendhead1">
			<th>Bill No</th>
			<th>Date</th>
			<th>Amount Claimed</th>
			<th>Amount Approved</th>
			<th>Remarks </th>
		</tr>
		<tbody>
		<c:forEach var="list1" items="${list1}">
				<tr>
					 		    		
					<td id="billno">
					<input type="hidden" name="bill_no" value="${list1.bill_no}" />
					${list1.bill_no} </td>
					<td id="billdate"> 
					<input type="hidden" name="amount_claimed" value="${list1.bill_date}" />
					${list1.bill_date}</td>
					<td id="amount_cla">
					<input type="hidden" name="amount_claimed" value="${list1.amount_claimed}" />
					${list1.amount_claimed} </td>
    				<td>
    					<input type="text"  name="amount_approved" id="amount_approve" />
<%--     			    <input type="text" name="amount_approve" onchange="amountcheck('<s:property value="amount_cla"/>',this.value)"> --%>
    				</td>
					<td>
						<input type="text"  name="remarks" id="remarks" />
					</td>
					
				</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>