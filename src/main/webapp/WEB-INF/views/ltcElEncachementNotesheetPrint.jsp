<%@page import="com.app.entity.LTC"%>
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
		
		LTC ltc = (LTC)request.getAttribute("ltc");
		String totalfare = ltc.getTotalfare();
		String words = ltc.getAmountadvance();
	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LTC-EL Enacachement</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	
	<style>
		td{
			padding: 4px;
		}
	</style>
	<script>
function myFunction() {
	var num = '<%=words%>';
	var a = ['','One ','Two ','Three ','Four ', 'Five ','Six ','Seven ','Eight ','Nine ','Ten ','Eleven ','Twelve ','Thirteen ','Fourteen ','Fifteen ','Sixteen ','Seventeen ','Eighteen ','Nineteen '];
	var b = ['', '', 'Twenty','Thirty','Fourty','Fifty', 'Sixty','Seventy','Eighty','Ninety'];

	    if ((num = num.toString()).length > 9) return 'overflow';
	    n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
	    if (!n) return; var str = '';
	    str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'Crore ' : '';
	    str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'Lakh ' : '';
	    str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'Thousand ' : '';
	    str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'Hundred ' : '';
	    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only ' : '';
	    document.getElementById("words").innerHTML = str;
}
</script>
</head>
<body onload="myFunction();">
	
	
	<section class="container mt-5 pt-2">
		<div class="row">
			<div class="col-md-12">
				<div>
				
				<h6 style="text-align: center; font-weight: 50px;"> <b> Government of India </b> </h6>
				<h6 style="text-align: center; font-weight: 50px;"> <b> Ministry of Electronics & Information Technology </b> </h6>
				<h6 style="text-align: center; font-weight: 50px;"> <b> National Informatics Centre (APSC) </b> </h6>
				<h6 style="text-align: center; font-weight: 50px;"> <b> Vijayawada - 520010 </b> </h6>
				
					<div>
						<div style="text-align: right;">
							Date:
							<%=todaydate%>
						</div>
					</div>
					<br>
					<% if(totalfare == null) {%>
					<label class="font-weight-bolder underline" style="text-decoration: underline;">Particulars of EL-Encashment for approval: </label>
					<%}else{ %>
					<label class="font-weight-bolder underline" style="text-decoration: underline;">Particulars of LTC Advance for approval: </label>
					<%} %>
					<br><br>
					<table>
						<tr> <td>1. Name of the Employee</td> <td>:  <b>${emp.name}</b></td> </tr>
						<tr> <td>2. Designation & Employee Code Number</td> <td>:  ${emp.designation }, ${emp.code}</td> </tr>
						<tr> <td>3. Basic Pay</td> <td>:  &#8377; ${emp.basic_pay}/-</td> </tr>
						<tr> <td>4. Block Year</td> <td>:   ${ltc.blockyear}</td> </tr>
						<tr> <td>5. Anywhere in India / Home Town</td> <td>:   ${ltc.location}</td> </tr>
						<tr> <td>6. Place of visit</td> <td>:   <b>${ltc.visitplace}</b></td> </tr>
						<tr> <td>7. To whom claimed</td> <td>:   ${ltc.claimedfor}</td> </tr>
						<tr> <td>8. Period of visit</td> <td>:   ${ltc.visitperiod}</td> </tr>
						<tr> <td>9. Leave Details<br></td> <td>:   ${ltc.leavedetails}</td> </tr>
						<% if(totalfare == null) {%>
						<tr> <td> 10. Encashment availed for as on date</td> <td>:   ${ltc.encashment}</td> </tr>
						<tr> <td>11. Amount of advance<br>(90% of total fare or advance claimed)</td> <td>:   ${ltc.amountadvance}</td> </tr>
						<%}else{ %>
							<tr> <td> 10. Total fare (to and from)</td> <td>: Rs.  ${ltc.totalfare}/-</td> </tr>
							<tr> <td>11. Amount of advance<br>(90% of total fare or advance claimed)</td> <td>:  Rs.<b> ${ltc.amountadvance}/-</b></td> </tr>
						<%} %>
						
					</table>
					<br>
					<div>
					<% if(totalfare == null) {%>
						While availing LTC, ${emp.name} has requested 10 days of EL encashment. As per the Office records, He is eligible for the same. Submitted
						for consideration and approval of the Competent Authority for making payment of leave encashment for 10 days. 
						<%}else{ %>
						Submitted for consideration and approval of the Competent Authority for making payment of LTC advance of <b>Rs. ${ltc.amountadvance}/- 
						(Rupees <span id="words" ></span> only)</b>
						<%} %>
					</div>
					<br><br><br>
					<div style="text-align: right;">
						<b>
							 (BSN Murty)<br>
							 Deputy Director
						</b>
					</div>
					
					<div style="text-align: left;">
						<b><u>HO, APSC</u></b>
					</div>
					<br> <br> <br>
					<div style="text-align: left;">
						<b><u>SIO, APSC</u></b>
					</div>
 
				</div>
			</div>
		</div>

	</section>
</body>
</html>