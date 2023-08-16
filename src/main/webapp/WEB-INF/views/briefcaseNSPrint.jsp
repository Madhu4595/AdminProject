<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.app.util.MyUtil"%>
<%@page import="com.app.entity.BriefCase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
BriefCase bean = (BriefCase)request.getAttribute("bean");
String words =   bean.getAmountApproved();
System.out.println("words=========> "+words);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script type="text/javascript">
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
<style>
	body{
		text-align: justify;
	}
</style>
</head>
<body onload="myFunction();">
  
	<section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>
				
				<h6 style="text-align: center; font-weight: 50px;"> <b> Government of India </b> </h6>
				<h6 style="text-align: center; font-weight: 50px;"> <b> Ministry of Electronics & Information Technology </b> </h6>
				<h6 style="text-align: center; font-weight: 50px;"> <b> National Informatics Centre (APSC) </b> </h6>
				<h6 style="text-align: center; font-weight: 50px;"> <b> Vijayawada - 520010 </b> </h6>
				<br><br>
					 
					<div>
						Reimbursement towards Purchase of <b>Brief Case</b> in ${emp.callSign } <b>${emp.name }, ${emp.designation },
						(Emp. Code: ${emp.code }),</b> ${emp.place } who submitted bill vide Invoice No. ${bean.invoiceNo } <b>dt. </b>
						 ${bean.invoiceDate } for <b>Rs. ${bean.amountApproved }/- ( Rupees <span id="words" ></span> Only ) </b>
						 as per his entitlement.
					</div>
					<br>
					<div>
						<b>${emp.callSign }. ${emp.name }</b> was eligible for issuing brief case and the necessary approval and documents
						were kept in receipt.
					</div>
					<br>
					<div>Submitted for approval please</div>
					<br> <br>

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