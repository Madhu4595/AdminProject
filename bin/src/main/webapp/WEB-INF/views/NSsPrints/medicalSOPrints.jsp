<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="com.app.entity.Medical_Bills_upload"%>
<%@page import="com.app.util.MyUtil"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
<%
	String totAmountApproved = request.getAttribute("totAmountApproved").toString();
System.out.println("words=> " + totAmountApproved);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medical Bills</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>
$(document).ready(function(){
	  	var num = '<%=totAmountApproved%>';
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
						+ 'Only ' : '';
				document.getElementById("words").innerHTML = str;
			});
</script>
<style>
#header {
	text-align: center;
	font-weight: bolder;
}

#topline {
	text-align: center;
}

#date {
	margin-left: 70%;
}

#from {
	font-weight: 600;
	text-align: left;
}

#sign {
	text-align: right;
}

#para1, #para2, #para3 {
	font-size: large;
	text-align: justify;
}

td {
	padding: 15px;
}
body{
    font-family: "Times New Roman", Times, serif;
    font-size: 10pt;
    margin: 0;
    padding: 0;
}
</style>
</head>
<body>

	<section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>


					<div style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;"   align="center">
						<%= localizationManager.getMessage("nic1") %> / GOVERNMENT OF INDIA<br>
						<%= localizationManager.getMessage("nic32") %> / MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY<br>
						<%= localizationManager.getMessage("nic33") %> / NATIONAL INFORMATICS CENTRE<br>
						<%= localizationManager.getMessage("nic34") %> / ANDHRA PRADESH STATE CENTRE<br>
						<%= localizationManager.getMessage("nic35") %> - <%= localizationManager.getMessage("nic17") %> /  VIJAYAWADA - 520010
					</div>

					<div>
						<%= localizationManager.getMessage("nic36") %> / Sanction Order No <b> : ${so_number} </b> 
						<span style="margin-left: 550px;"><%= localizationManager.getMessage("nic37") %> / Date  : <b>${siodate}</b></span>
					</div>
					<br>
					
					<div style="text-align: left;">
							<%= localizationManager.getMessage("nic5") %> / To,<br>
							<%= localizationManager.getMessage("nic38") %> / The Accounts Officer,<br>
							<%= localizationManager.getMessage("nic39") %> / Pay and Accounts Office,<br>
							<%= localizationManager.getMessage("nic40") %> / National Informatics Centre,<br>
							<%= localizationManager.getMessage("nic41") %> / A-Block, CGO Complex, Lodhi Road,<br>
							<%= localizationManager.getMessage("nic42") %> - <%= localizationManager.getMessage("nic28") %> / New Delhi - 110 003.
						</div><br>

					<div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Subject: -</b>
						Reimbursement of medical expense in r/o <b>${employee.callSign}
							${employee.name }, ${employee.designation } (Emp. Code:
							${employee.code }), National Informatics Centre,
							APSC, Vijayawada.</b>

					</div>
					<br> Sir, <br>
					<br>
					<div id="para1" style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;">
						1. I am directed to convey the sanction of the Director General,
						National Informatics Centre under the powers delegated to him vide
						O.M.No.M-11017/1/2014-MS (O&M) dated 17.7.2014 of Ministry of
						Information Technology to the incurring of an expenditure for <b>Rs.
							${totAmountApproved }/- (Rupees <span
							id="words"></span>)
						</b> towards medical expense of <b>${employee.callSign}
							${employee.name }, ${employee.designation }</b> of National
						Informatics Centre, APSC, Vijayawada being the charges for
						treatment/investigation. Prescription and original receipts are
						enclosed herewith. <br>
						<br> Sanction is also conveyed to the drawal of said amount
						through cheque/cash and payment thereof to <b>${employee.callSign}
							${employee.name }, ${employee.designation } (Emp. Code:
							${employee.code })</b> <br>
					</div>
					<br>

					<div id="para2" style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;">
						2. The expenditure involved is debitable as under: Demand No: 27,
						during the year 2023-2024 <br>
					</div>
					<br>
					<div style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;">
					 '3451' Secretariat-Economic Services (Major Head)<br>
					00.091 Secretariat-(Minor Head)<br> .13 National Informatics
					Centre<br> .13.01 Establishment<br> <b>.13.01.06
						Medical Treatment.</b>
						</div>
						 <br>
					<div id="sign" style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;">
						<br> <br><br> <br>
						<b> 
						<%= localizationManager.getMessage("nic9") %> / (P. Lakshminarayana)<br>
						<%= localizationManager.getMessage("nic43") %> <br> State Informatics Office & Head of Office
						</b>
					</div>
					<br> 
					<br> Copy to:<br> 1. Drawing and Disbursing Officer,
					National Informatics Centre, Hyderabad. (2 copies) <br> 2.
					Sanction File.

				</div>
			</div>
		</div>
	</section>


	<br>

</body>
</html>