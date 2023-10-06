<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="com.app.entity.GPF"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
	 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
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
<title>GPF Withdraw Notesheet</title>
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

									 <h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic1") %> / GOVERNMENT OF INDIA</b> </h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic32") %> / MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY </b> </h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic33") %> / NATIONAL INFORMATICS CENTRE </b></h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic34") %> / ANDHRA PRADESH STATE CENTRE </b></h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic35") %> - <%= localizationManager.getMessage("nic17") %> /  VIJAYAWADA - 520010 </b></h6>
<br>

					<div>
						<div style="text-align: right;">
							 <%= localizationManager.getMessage("nic37") %> / Date:<b> <%=todaydate%></b> 
						</div>
					</div>
					<div>
						<b>Subject: </b> Withdrawal of Rs. <b>${gpf.withDrawAmt }/-</b>
						from GPF in favour of ${emp.callSign }, ${emp.name },
						${emp.designation }, ${emp.place }.
					</div>
					<br> <br>

					<div style="text-align: justify;">
						${emp.callSign }. ${emp.name }, ${emp.designation }, ${emp.place }
						has applied for withdrawal of Rs. <b>${gpf.withDrawAmt }/-</b> (
						Rupees <span id="words"></span> ) from the amount standing to his
						credit in GPF account No.${gpf.gpfNo } towards expenditure in
						connection with purchase of consumer durables in terms of Rule
						15(1)(A) of General Provident Fund (Central Services) Rules, 1960.
					</div>
					<br>
					<div style="text-align: justify;">${emp.callSign },
						${emp.name }, ${emp.designation }, ${emp.place } is having net
						balance of Rs. ${gpf.netBalance }/- in his GPF account and the
						amount applied for does not exceed the limits as laid down under
						Rule 16(1) which reflects that up to 75% of balance at credit in
						the cases of withdrawal under clause (B) of sub-rule (1) of Rule
						15 may be sanctioned by the competent authority.</div>
					<br>
					<div class="container w-75">
						<div class="row">
							<div class="col-1">1.</div>
							<div class="col-4">Name of the subscriber:</div>
							<div class="col-4">${emp.callSign }. ${emp.name }</div>
						</div>
						<div class="row">
							<div class="col-1">2.</div>
							<div class="col-4">Designation:</div>
							<div class="col-4">${emp.designation },Emp. Code:
								${emp.code }</div>
						</div>
						<div class="row">
							<div class="col-1">3.</div>
							<div class="col-4">Account No:</div>
							<div class="col-4">${gpf.gpfNo }</div>
						</div>
						<div class="row">
							<div class="col-1">4.</div>
							<div class="col-4">Basic Pay:</div>
							<div class="col-4">Rs.${emp.basic_pay }</div>
						</div>
						<div class="row">
							<div class="col-1">5.</div>
							<div class="col-4">Amount of Withdrawal required:</div>
							<div class="col-4">Rs. ${gpf.withDrawAmt }</div>
						</div>
						<div class="row">
							<div class="col-1">6.</div>
							<div class="col-4">Net balance at Credit:</div>
							<div class="col-4">Rs. ${gpf.netBalance }</div>
						</div>
						<div class="row">
							<div class="col-1">7.</div>
							<div class="col-4">Purpose for which withdrawal is:</div>
							<div class="col-4">${gpf.purpose }</div>
						</div>
						<div class="row">
							<div class="col-1">8.</div>
							<div class="col-4">Rules under which the request:</div>
							<div class="col-4"></div>
						</div>
					</div>
					<br>

					<div style="text-align: justify;">${emp.callSign }.
						${emp.name }, ${emp.designation }, ${emp.place }, has submitted
						the required documents. The withdrawal applied for by
						${emp.callSign }. ${emp.name } does not exceed the limit of 75%
						under Rule 16(1).</div>
					<br>
					<div style="text-align: justify;">
						SIO, NIC, APSC being the competent authority as per the delegation
						of powers vide No.M11017/1/2014 dated 17/07/2014 any approve for
						withdrawal of Rs. <b>${gpf.withDrawAmt }/-</b> to ${emp.callSign }.
						${emp.name } from his GPF account
					</div>
					<br> <br>
					<br>
					<br>
					<br>
					<br>
					<div style="text-align: right;">
						<b> 
						(<%= localizationManager.getMessage("nic45") %>) / (BSN Murty)<br>
							 <%= localizationManager.getMessage("DeputyDirector") %> / Deputy Director
						</b>
					</div>

					<div style="text-align: left;">
						<b><u><%= localizationManager.getMessage("HOAPSC") %> / HO, APSC</u></b>
					</div>
					<br> <br> <br>
					<div style="text-align: left;">
						<b><u><%= localizationManager.getMessage("SIOAPSC") %> / SIO, APSC</u></b>
					</div>





				</div>
			</div>
		</div>
	</section>
</body>
</html>