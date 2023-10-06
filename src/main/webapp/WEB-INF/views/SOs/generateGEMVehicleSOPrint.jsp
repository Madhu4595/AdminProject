<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
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
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
Date date = new Date();
String todaydate = formatter.format(date);

GEM gem = (GEM) request.getAttribute("gem");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
td {
	padding: 4px;
}
</style>
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
						<%= localizationManager.getMessage("nic36") %> / Sanction Order No <b> : ${gem.sanctionNumber } </b> 
						<span style="margin-left: 550px;"><%= localizationManager.getMessage("nic37") %> / Date  : <b><%=todaydate%></b></span>
					</div>
					<br>
					 
					
					<div>
						<b>Subject:</b> Expenditure sanction towards vehicle hiring charges for the for the office of NIC, APSC, Vijayawada for the month of <b>${gem.monthYear }</b>.
					</div>
					<br> 
					<b>Sir</b>
					<br>
					<div style="text-align: justify;">
						<span style="margin-left: 40px"></span>I am directed to convey the sanction of the Director General, NIC under the powers delegated to him vide Ministry of Information Technology vide order
						No.M-11017/1/2014-MS (O&M) dated 17.07.2014 for <b>Rs. ${gem.amount }/- (Rupees <span id="words"></span>)</b> towards vehicle hiring charges for the 
						office of NIC, APSC Vijayawada for the month of <b>${gem.monthYear }</b>.
					</div>
					<br>
					<div style="text-align: justify;">
						Sanction is also conveyed to the drawl of said amount through DD/Cheque in favor of <b>M/s. Viswa Enterprises, Visakhapatnam</b> and payment thereof to the
						party <b>(Bank Details: Current A/C No: 50200076201971, HDFC Bank, Maddilapalem Branch, Visakhapatnam, IFSC Code: HDFC0006187)</b>.
					</div>
					<br>
					<div>
						This has been approved vide <b>IFS Dairy No. 390 dated 12/06/2023</b>
					</div>
					<br>
					<div>
						The expenditure involved is debitable as under Demand No. 27 during the financial year 2023-2024
					</div>
					<br>
					<div>
						<span style="margin-right: 32px;">3451</span> Secretariat Economic Services (Major Head)<br>
						<span style="margin-right: 20px;">00.091</span> Secretariats (Minor Head)<br>
						<span style="margin-right: 50px;">13</span> National Informatics Centre<br>
						<span style="margin-right: 30px;">13.01</span> Establishment<br>
						<b><span style="margin-right: 3px;" >13.01.18 </span>  Rent for Others</b>
					</div>
					
					
					
					
					
					
					<br><br><br>
					<div style="text-align: right">
						<br> <br> <b>
						(<%= localizationManager.getMessage("nic46") %>) / (S.V.Ch. Subba Rao)<br>
<%= localizationManager.getMessage("nic43") %> / Scientist-F & Head of Office
						</b>
					</div>


				</div>
			</div>
		</div>
	</section>
</body>
</html>