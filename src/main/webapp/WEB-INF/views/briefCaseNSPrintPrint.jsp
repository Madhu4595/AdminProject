<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.app.util.MyUtil"%>
<%@page import="com.app.entity.BriefCase"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%
	Locale locale = new Locale("hi", "IN"); // Hindi (India)
LocalizationManager localizationManager = new LocalizationManager(locale);
%>
<%
	BriefCase bean = (BriefCase) request.getAttribute("bean");
String words = bean.getAmountApproved();
System.out.println("words=========> " + words);
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
 
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/home-style.css" />
  <script src="https://kit.fontawesome.com/2c3c26015e.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
 <script src="./js/ajax.js" type="text/javascript"></script>
   <script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="./js/jquery.min.js" type="text/javascript"></script>
   <script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
function myFunction() {
	var num = '<%=words%>';
		var a = [ '', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ',
				'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ',
				'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ',
				'Eighteen ', 'Nineteen ' ];
		var b = [ '', '', 'Twenty', 'Thirty', 'Fourty', 'Fifty', 'Sixty',
				'Seventy', 'Eighty', 'Ninety' ];

		if ((num = num.toString()).length > 9)
			return 'overflow';
		n = ('000000000' + num).substr(-9).match(
				/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
		if (!n)
			return;
		var str = '';
		str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]])
				+ 'Crore ' : '';
		str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]])
				+ 'Lakh ' : '';
		str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]])
				+ 'Thousand ' : '';
		str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]])
				+ 'Hundred ' : '';
		str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
				+ (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only '
				: '';
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

	LocalDateTime sodate = bean.getNsDate();
	DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	String sodatee = sodate.format(dateformatter);
	System.out.println("date====> " + sodatee);

	SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

	Date invoiceDate = inputFormat.parse(bean.getInvoiceDate());
	String formattedDate = outputFormat.format(date);
	%>



	<div class="container border" align="center">
		<h6 style="text-align: center; font-weight: 50px;">
			<b> <%=localizationManager.getMessage("nic1")%> / GOVERNMENT OF
				INDIA
			</b>
		</h6>
		<h6 style="text-align: center; font-weight: 50px;">
			<b> <%=localizationManager.getMessage("nic32")%> / MINISTRY OF
				ELECTRONICS & INFORMATION TECHNOLOGY
			</b>
		</h6>
		<h6 style="text-align: center; font-weight: 50px;">
			<b> <%=localizationManager.getMessage("nic33")%> / NATIONAL
				INFORMATICS CENTRE
			</b>
		</h6>
		<h6 style="text-align: center; font-weight: 50px;">
			<b> <%=localizationManager.getMessage("nic34")%> / ANDHRA PRADESH
				STATE CENTRE
			</b>
		</h6>
		<h6 style="text-align: center; font-weight: 50px;">
			<b> <%=localizationManager.getMessage("nic35")%> - <%=localizationManager.getMessage("nic17")%>
				/ VIJAYAWADA - 520010
			</b>
		</h6>

		<br>

		<div align="right">
			<%=localizationManager.getMessage("nic37")%>
			/ Date:<b> <%=sodatee%>
		</div>

		<br>

		<div style="text-align: justify;">
			Reimbursement towards Purchase of <b>Brief Case</b> in ${emp.callSign }
			<b>${emp.name }, ${emp.designation }, (Emp. Code: ${emp.code }),</b>
			${emp.place } who submitted bill vide Invoice No. ${bean.invoiceNo }
			<b>dt. </b>
			<%=formattedDate%>
			for <b>Rs. ${bean.amountApproved }/- ( Rupees <span id="words"></span>
				Only)
			</b> as per his entitlement.
		</div>
		<br>
		<div style="text-align: justify;">
			<b>${emp.callSign }. ${emp.name }</b> was eligible for issuing brief
			case and the necessary approval and documents were kept in receipt.
		</div>
		<br>
		<div style="text-align: justify;">Submitted for approval please</div>
		<br> <br>
		<div align="right">
			<b> (<%=localizationManager.getMessage("nic45")%>) / (BSN
				Murty)<br> <%=localizationManager.getMessage("DeputyDirector")%>
				/ Deputy Director
			</b>
		</div>

		<div style="text-align: left;">
			 <b><u><%=localizationManager.getMessage("HOAPSC")%> / HO, APSC</u></b>
		</div>
		<br> <br> <br>
		<div style="text-align: left;">
			<b><u><%=localizationManager.getMessage("SIOAPSC")%> / SIO, APSC</u></b>
		</div>


	</div>



</body>
</html>