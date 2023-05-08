<%@page import="com.app.entity.GEM"%>
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
		
		GEM gem = (GEM)request.getAttribute("oldGem");
		String words = gem.getAmount();
	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM-Vehicle NoteSheet</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<style>
		td{
			padding: 4px;
		}
	</style>
	<script>
	$(document).ready(function(){
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
		});
 
</script>
</head>
<body>
	
	
	<section class="container mt-5 pt-2 border">
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
					 <div>
					 	<b>Subject: </b> Monthly rental expenditure towards usage of Vehicle.
					 </div>
					<br><br>
					<div style="text-align: justify;">
						NIC, APSC sent a proposal for hiring vehicle for office purpose on rental basis. DG, NIC has given the in principle approval for which financial concurrence has been 
						obtained vide <u>IFS Dairy No. 420 dated 30/06/2022</u> for giving the services for a period of one year w.e.f ${oldGem.period } for an amount of Rs. ${oldGem.amount }/-
						per month inclusive of all taxes. (Copy attached).
					</div>
					<br> 
					<div style="text-align: justify;">
						A work order through GEM Contract No <u>GEMC-511687746353612</u> dated 30/06/2022 and Sanction order vide No. 511687746353612 dated 30/06/2022
						has been issued to the empanelled vendor i.e., M/s. Swarnandhra Travels. (Copy attached)
					</div><br>
					<div style="text-align: justify;">
						M/s. Swarnandhra Travels has submitted the following bill for the month of ${oldGem.monthYear } towards vehicle hiring charges for the office of NIC,
						APSC, Vijayawada.
					</div>
					 <br>
					<div style="text-align: justify;">
						The bill has been verified and found that the vendor has submitted as per the approved rates.
					</div><br>
					
					<table border="1" class="table table-bordered">
						 <tr class="font-weight-bold">
						 	<td>Period</td>
						 	<td>Bill No.</td>
						 	<td>Bill Date</td>
						 	<td>Amount (in Rs.)</td>
						 </tr>
						 <tr>
						 	<td>${oldGem.period }</td>
						 	<td>${oldGem.billno }</td>
						 	<td>${oldGem.billdate }</td>
						 	<td>${oldGem.amount }/-</td>
						 </tr>
						 <tr>
						 	<td colspan="4" align="center">
						 		<b>(Rupees <span id="words"></span>)----Total Amount - &#8377;${oldGem.amount }/-</b>
						 	</td>
						 </tr>
						
					</table>
					 
					 
					<div style="text-align: justify;">
						In view of the above, approval may be given for the above expenditure for preparing sanction orders accordingly.
					</div>
					 
					<br><br><br><br><br>
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