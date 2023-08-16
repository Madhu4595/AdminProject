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
body {
	text-align: justify;
}
</style>
</head>
<body onload="myFunction();">
	<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();
	String todaydate = formatter.format(date);
	
	SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	Date invoiceDate = inputFormat.parse(bean.getInvoiceDate());
    String formattedDate = outputFormat.format(date);
    
    
	
	%>

	<section class="container mt-5 pt-2 border">

		<div class="row">
			<div class="col-md-12">
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
					<b> VIJAYAWADA - 520010 </b>
				</h6>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div align="left" class="font-weight-bolder">Sanction Order
					No: ${bean.sanctionNumber }</div>
				<div align="right" class="font-weight-bolder">
					Date:
					<%=todaydate %></div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<div align="left">
					Accounts Officer <br> Pay & Accounts Officer <br>
					Department of Information Technology <br> National Informatics
					Centre (Hqrs), <br> New Delhi - 110 003.
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				Sub: Reimbursement Towards purchase of <b>BRIEF CASE</b>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">Sir,</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				I am directed to convey the sanction of the Director General, NIC
				under the powers delegated to him vide MInistry of Information
				Technology vide order No. M-11017/1/2014-MS (O&M) dated 17.07.2014,
				to the incurring of expenditure of <b>Rs. ${bean.amountApproved }/-
					( Rupees <span id="words"></span> ).
				</b> Reimbursement towards purchase of Brief Case to <b>${emp.name },${emp.designation },
					Employee Code: ${emp.code }</b> ${emp.place }. from ${bean.shopName }
				and Vide Invoice No. <b>${bean.invoiceNo }</b> dated <b><%=formattedDate %></b>.
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				Sanction is also conveyed to the drawl of said amount through
				D.D/Cheque/NEFT in favor of ${emp.callSign } <b>${emp.name },${emp.designation },
					Employee Code: ${emp.code }</b> ${emp.place }.
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">The expenditure involved is debitable as
				under, demand No. 27 during the year 2023-2024.</div>
		</div>
		<br>
		<div>
			<span style="margin-right: 32px;">'3451'</span> Secretariat Economic
			Services (Major Head)<br> <span style="margin-right: 20px;">00.091</span>
			Secretariats (Minor Head)<br> <span style="margin-right: 50px;">.13</span>
			National Informatics Centre<br> <span
				style="margin-right: 30px;">.13.01</span> Establishment<br> <b><span
				style="margin-right: 3px;">.13.01.13 </span> Other Revenue
				expenditure.</b>
		</div>


		<br>
		<br>
		<div id="sign" align="right">
			<br> <br> <b>(S.V.Ch. Subba Rao)<br> Scientist-F &
				Head of Office
			</b>
		</div>
		<br>
		<div  >
			Copy to:<br> 
			01. Drawing & Disbursing Officer, NIC(APSU), Hyderabad (2 copies)<br>
			02. Integrated Finance Section, NIC(Hqrs.), New Delhi.<br>
			03. Principal Director of Audit, Scientific Dept., AGCR Building, I.P. Estate, New Delhi.<br>
			04. Sanction File
		</div>


	</section>
</body>
</html>