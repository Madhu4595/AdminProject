<%@page import="com.app.entity.Medical_Bills_upload"%>
<%@page import="com.app.util.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%

Medical_Bills_upload empAllow = (Medical_Bills_upload) request.getAttribute("medical_Bills_upload");
String words = empAllow.getTotAmountApproved().toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#header{ text-align: center; font-weight: bolder; }
#topline{ text-align: center; }
#date{  margin-left: 70%; }
#from{ font-weight: 600; text-align: left; }
#sign{ text-align: right; }
#para1, #para2, #para3{ font-size:  large; text-align: justify; }
td{  padding: 15px; }
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
<body>
	<div id="header">
	GOVERNMENT OF INDIA<br>
	MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY<br>
	NATIONAL INFORMATIC CENTRE<br>
	ANDHRA PRADESH STATE CENTRE<br>
	Vijayawada - 520010
	</div>
	<span>Sanction Order No: </span><b>${siodate }</b><span id="date">Date:  ${todaydate}</span><br>
	<br>
	
	Accounts Officer,<br>
Pay and Accounts Office,<br>
Ministry of Electronics and Information Technology,<br>
Department of Information Technology,<br>
National Informatics Centre,<br>
New Delhi - 110 003.<br><br><br>

	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Subject: -</b> Reimbursement of medical expense in r/o <b>${employee.callSign} ${employee.name }, ${designation.name } (Emp. Code: ${medical_Bills_upload.emp_code }), 
	National Informatics Centre, APSC, Vijayawada.</b>
	<br><br>
	
	Sir,
	<br><br>
	<div id="para1">
	1. I am directed to convey the sanction of the Director General, National Informatics Centre under the powers delegated to him vide 
	O.M.No.M-11017/1/2014-MS (O&M) dated 17.7.2014 of Ministry of Information Technology to the incurring of an expenditure for 
	<b>Rs.  ${medical_Bills_upload.totAmountApproved }/- ( Rupees <span id="words" ></span> Only )</b> towards medical expense of <b>${employee.callSign} ${employee.name }, ${designation.name }</b>
	of National Informatics Centre, APSC, Vijayawada being the charges for treatment/investigation. Prescription and original receipts are enclosed herewith.
	<br><br>
	Sanction is also conveyed to the drawal of said amount through cheque/cash and payment thereof to <b>${employee.callSign} ${employee.name }, ${designation.name } (Emp. Code: ${medical_Bills_upload.emp_code })</b>
	<br>
	</div><br>
	<div id="para2">
	2. The expenditure involved is debitable as under: Demand No: 28, during the year 2023-2024
	<br>
	</div><br>
	
	'3451' Secretariat-Economic Services (Major Head)<br>
	00.091 Secretariat-(Minor Head)<br>
	.13 National Informatics Centre<br>
	.13.01 Establishment<br>
	<b>.13.01.06 Medical Expenses.</b>
	<br>
	<div id="sign">
		 <br>
		 <br><b>
		(S.V.Ch. Subba Rao)<br>
		Scientist-F & Head of Office	</b>	
	</div><br>
	
	<br><br>
	
	Copy to:<br>
	1. Drawing and Disbursing Officer, National Informatics Centre, Hyderabad. (2 copies) <br>
	2. Sanction File.
	
	
	


</body>
</html>