<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.app.entity.GEM"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page contentType="text/html; charset=utf-8" language="java" %>
	 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
	
	<%
	System.out.println("generateGEMOutsourceNoteSheet=============>");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		String todaydate = formatter.format(date);
		
		GEM gem = (GEM)request.getAttribute("oldGem");
		String words = gem.getAmount();
		
		LocalDateTime now = gem.getNsDate();  
	    DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
	    String formatDateTime = now.format(format);  
	    System.out.println("After Formatting: " + formatDateTime);
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM- Outsourcing</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
		    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'Only ' : '';
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
							 <%= localizationManager.getMessage("date") %> / Date:<b> <%=formatDateTime%></b> 
						</div>
					</div>
					<br>
					 <div>
					 	<b>Subject: </b> Expenditure towards outsourcing services of one Office Assistant and one MTS for the month of 
					 	${oldGem.monthYear }.
					 </div>
					<br><br>
					<div style="text-align: justify;">
						DG. NIC has given the in principle approval for outsourcing services of one Office Assistant and one MTS for Administration support for NIC, APSC 
						through e file dated 12/11/2022 (Copy placed in the receipts) for which financial concurrence has been obtained from the competent authority vide IFD 
						Dairy No. 1241 dated 16/03/2023 for giving the services for a period of one year w.e.f 12/04/2023 for an amount of <b>Rs. 7,29,637.80/-</b>
						under the <b>Budget Head - Office Expenses</b> (Copy placed in the receipts).
					</div>
					<br> 
					<div style="text-align: justify;">
						A work order through GEM Contract No <u>GEMC-511687760862087</u> dated 10/04/2023 has been issued to the empanelled vendor i.e., M/s
						KK Group of Companies, New Delhi.(Copy placed in receipts).
					</div><br>
					<div style="text-align: justify;">
						M/s. KK Group of Companies has submitted the bill towards outsourcing service charges of one Office Assistant and one MTS for the month of 
						 <b>${oldGem.monthYear }</b> for NIC, APSC, Vijayawada.
					</div><br>
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
						 		<b>(Rupees <span id="words"></span>)</b>
						 	</td>
						 </tr>
						
					</table>
					 
					 
					<div style="text-align: justify;">
						In view of the above, approval may be given for the above expenditure for preparing sanction orders accordingly.
					</div>
					 
					<br><br><br><br><br>
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