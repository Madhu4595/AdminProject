<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>

<body>
	<table width="900px;">
		<tr class="sendhead1">
			<th>Request No</th>
			<th>Related To</th>
			<th>Amount Claimed</th>
			<th>Amount Approved</th>
			<th>Sanction Order No </th>
			<th>Generate Sanction Order</th>
	  	</tr>
		<tbody>
<!-- 		Employee Allowances -->
		<c:forEach items="${employee_allowances }" var="employee_allowance">
		<tr>
			<td>
			<input type="hidden" name="request_no" id="request_no${employee_allowance.request_no }" value='${employee_allowance.request_no }' />
			${employee_allowance.request_no }
			</td>
			<td>
				<input type="hidden" name="allowance_type" id="allowance_type${employee_allowance.request_no }" value='${employee_allowance.allowance_type }' />
				${employee_allowance.allowance_type }
			</td>
			<td>
				<input type="hidden" name="amount_claimed" value='${employee_allowance.amount_claimed }' />
				${employee_allowance.amount_claimed }
			</td>
			<td>
				<input type="hidden" name="amount_approved" value='${employee_allowance.amount_approved }' />
				 
				${employee_allowance.amount_approve }
			</td>
			<td>
<%-- 				<input type="date" name="sio_date" id="sio_date${employee_allowance.request_no }"/> --%>
<input type="text" name="sio_date" id="sio_date${employee_allowance.request_no }"/>
			</td>
			<td>
				<input type="button" name="so" value="Generate SO" onclick="return generate_sanction('${employee_allowance.request_no }')" />
			</td>
		</tr>
		
		</c:forEach>
		
<!--  		Medical Allowances  -->
<c:forEach items="${medical_Bills_upload }" var="upload">
		<tr>
			<td>
			<input type="hidden" name="request_no" id="request_no${upload.request_no }" value='${upload.request_no }' />
			${upload.request_no }
			</td>
			<td>
				<input type="hidden" name="allowance_type" id="allowance_type${upload.request_no }" value='${upload.type }' />
				${upload.type }
			</td>
			<td>
				<input type="hidden" name="amount_claimed" value='${upload.totAmountClaimed }' />
				${upload.totAmountClaimed }
			</td>
			<td>
				<input type="hidden" name="amount_approved" value='${upload.totAmountApproved }' />
				${upload.totAmountApproved }
			</td>
			<td>
<input type="text" name="sanctionorderno" id="sio_date${upload.request_no }"/>
			</td>
			<td>
				<input type="button" name="so" value="Generate SO" onclick="return generate_sanction('${upload.request_no }')" />
			</td>
		</tr>
		
		</c:forEach>
 
	</tbody>
		
	</table>
</body>
</html>