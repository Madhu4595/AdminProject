<%@page import="com.app.entity.GPF"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
Date date = new Date();
String todaydate = formatter.format(date);

GPF gpf = (GPF) request.getAttribute("gpf");
String words = gpf.getWithDrawAmt();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GPF - Withdraw</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	
	<script>
	$(document).ready(function(){
		var num = '<%=words%>';
				var a = [ '', 'One ', 'Two ', 'Three ', 'Four ', 'Five ',
						'Six ', 'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ',
						'Twelve ', 'Thirteen ', 'Fourteen ', 'Fifteen ',
						'Sixteen ', 'Seventeen ', 'Eighteen ', 'Nineteen ' ];
				var b = [ '', '', 'Twenty', 'Thirty', 'Fourty', 'Fifty',
						'Sixty', 'Seventy', 'Eighty', 'Ninety' ];

				if ((num = num.toString()).length > 9)
					return 'overflow';
				n = ('000000000' + num).substr(-9).match(
						/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
				if (!n)
					return;
				var str = '';
				str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' '
						+ a[n[1][1]])
						+ 'Crore ' : '';
				str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' '
						+ a[n[2][1]])
						+ 'Lakh ' : '';
				str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' '
						+ a[n[3][1]])
						+ 'Thousand ' : '';
				str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' '
						+ a[n[4][1]])
						+ 'Hundred ' : '';
				str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
						+ (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]])
						+ 'only ' : '';
				document.getElementById("words").innerHTML = str;
			});
</script>
</head>
<body>

	<section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>
				
				<h6 style="text-align: center; font-weight: 50px;">
						<b> Government of India </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b> Ministry of Electronics & Information Technology </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b> National Informatics Centre (APSC) </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b> Vijayawada - 520010 </b>
					</h6>

					<div>
						<b>Sanction Order No: ${gpf.soNum }</b><span style="margin-left: 70%">Date: <%=todaydate%></span>
					</div>
					<br>
					
					<div>
						To <br>
						The Accounts Officer, <br>
						Pay & Accounts Office, <br>
						NIC,(Hqrs.,), New Delhi.
					</div><br>
					
					<div style="margin-left: 30px;">
						<b>Sub:</b> Withdrawal from GPF account by <b>${emp.callSign } ${emp.name }</b>, ${emp.designation }, ${emp.place }.
					</div><br>
					
					<div style="text-align: justify;">
						1. Sanction of the competent Authority is hereby conveyed under Rule 15(1)(A) read with 16(1) and 16(2) of
						GPF rules, to the withdrawal by ${emp.callSign } ${emp.name }, ${emp.designation }, ${emp.place }, <b>Rs. ${gpf.withDrawAmt }/- (Rupees <span id="words"></span>)
						</b> from his GPF Account No. ${gpf.gpfNo } to enable him to defray the expenses in connection with Purchase of consumer durable (Refrigerator).
					</div><br>
					
					<div style="text-align: justify;">
						2. The amount of withdrawal does not exceed 75% of the amount at the credit of ${emp.callSign } ${emp.name }, ${emp.designation }, ${emp.place }
						 in his GPF account. His basic pay is Rs. ${emp.basic_pay }/-.
					</div><br>
					
					<div style="text-align: justify;">
						3. It is certified that ${emp.callSign } ${emp.name }, ${emp.designation }, ${emp.place } has completed 25 Years of Service as on date.
						Also certified that ${emp.callSign } ${emp.name }, ${emp.designation }, ${emp.place } has not made any withdrawal for same purpose.
					</div><br>
					
					<div style="text-align: justify;">
						The balance at the credit of ${emp.callSign } ${emp.name }, ${emp.designation }, ${emp.place } as on January, 2023 is detailed below.
					</div><br>
					
					<div class="container">
						<div class="row">
							<div class="col-6">a) Closing Balance as per accounts slip for the year 2022-2023:</div>
							<div class="col-4">Rs. </div>
						</div>
						<div class="row">
							<div class="col-6">b) Subsequent deposits and refunds of advance from 04/2022 to 01/2023:</div>
							<div class="col-4">Rs. </div>
						</div>
						<div class="row">
							<div class="col-6">c) Total of Col. (a) and (b):</div>
							<div class="col-4">Rs. </div>
						</div>
						<div class="row">
							<div class="col-6">d) Subsequent withdrawals:</div>
							<div class="col-4">Rs. </div>
						</div>
						<div class="row">
							<div class="col-6">e) Balance as on date of Sanction Column (c)-(d):</div>
							<div class="col-4">Rs.  </div>
						</div>
					</div>
					
				
				
				<br><br><br>
					<div style="text-align: right">
						<br> <br> <b>(S.V.Ch. Subba Rao)<br>
							Scientist-F & Head of Office
						</b>
					</div>
					
					
					<div>
						Copy To: <br>
						1. D.D.O., NIC,Hyderabad. <br>
						2. ${emp.callSign } ${emp.name }, ${emp.designation }, ${emp.place }.<br>
						3. Sanction Order File. <br>
						4. Personal File.
					</div>
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>