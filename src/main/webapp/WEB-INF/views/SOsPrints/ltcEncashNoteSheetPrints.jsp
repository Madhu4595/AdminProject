<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="com.app.entity.LTC"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.app.util.MyUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
<%
 
LTC ltc = (LTC) request.getAttribute("ltc");
String words = ltc.getAmountadvance();
String[] claims= ltc.getClaimedfor().split(",");
System.out.println("claims==> "+claims.length);

LocalDateTime nsdate = ltc.getSanction_date();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
String date = nsdate.format(formatter);
System.out.println("Date====> "+date);




int sno =1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LTC-Advance Enacachement</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

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

#sign {
	text-align: right;
}
</style>
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
				+ (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'Only '
				: '';
		document.getElementById("words").innerHTML = str;
	}
</script>
</head>
<body onload="myFunction();">


	<section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>

					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic1") %> / GOVERNMENT OF INDIA</b> </h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic32") %> / MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY </b> </h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic33") %> / NATIONAL INFORMATICS CENTRE </b></h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic34") %> / ANDHRA PRADESH STATE CENTRE </b></h6>
					<h6 style="text-align: center; font-weight: 50px;"> <b> <%= localizationManager.getMessage("nic35") %> - <%= localizationManager.getMessage("nic17") %> /  VIJAYAWADA - 520010 </b></h6>
					
					<div>
						<%= localizationManager.getMessage("nic36") %> / Sanction Order No <b> : ${ltc.sanctionorderno}  </b> 
						<span style="margin-left: 550px;"><%= localizationManager.getMessage("nic37") %> / Date  : <b><%=date%></b></span>
					</div>
					<br>  
					<div style="text-align: left;">
							<%= localizationManager.getMessage("nic5") %> / To,<br>
							<%= localizationManager.getMessage("nic38") %> / The Accounts Officer,<br>
							<%= localizationManager.getMessage("nic39") %> / Pay and Accounts Office,<br>
							<%= localizationManager.getMessage("nic40") %> / National Informatics Centre,<br>
							<%= localizationManager.getMessage("nic41") %> / A-Block, CGO Complex, Lodhi Road,<br>
							<%= localizationManager.getMessage("nic42") %> - <%= localizationManager.getMessage("nic28") %> / New Delhi - 110 003.
						</div>
					<br> <br>
					<div style="text-align: justify;">
						Sanction of the Competent Authority under Rule 52(2) of General
						Financial Rules incorporating Compendium of Rules on Advances, as
						amended from time to time and read with O.M. No. M-11019/1/99-MS
						(O&M) dated 04.01.2000 of M/o Information Technology is hereby
						conveyed to the grant of an advance of <b>Rs.
							${ltc.amountadvance }/- (Rupees <span id="words"></span>)
						</b> to <b>${emp.callSign } ${emp.name } (Emp. Code No. 2385),</b>
						NIC, APSC, Vijayawada to meet the expenses in connection with LTC
						(${ltc.location}) for the Block year 2020-2021 of 2018-2021 to
						enable him along with family members to visit <b>"${ltc.visitplace}."</b>
						Their outward journey starts on ${ltc.visitperiod}
					</div>
					<br> <br>
					<table border="1" style="text-align: center; width: 100%;">
						<thead style="font-weight: bolder;">
							<tr>
								<td>SI. No.</td>
								<td>Name</td>
								<td>Age</td>
								<td>Relationship</td>
							</tr>
						</thead>
						<tbody>
							 
						<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.sno } </td>
								<td>${list.per_name } </td>
								<td>${list.age } </td>
								<td>${list.relation } </td>
							</tr>
						</c:forEach>
							
							 
						</tbody>
					</table>
					<br> <br>
					<br>
					<br>
					<br>
					<div id="sign">
						<br> <br> <b>
						(<%= localizationManager.getMessage("nic46") %>) / (P. Lakshminarayana)<br>
<%= localizationManager.getMessage("nic43") %> <br> State Informatics Office & Head of Office</b>
						</b>
					</div>
					<br>
					<div id="note">
						Copy to:<br> 1. <b>${emp.callSign } ${emp.name },
							${emp.designation }</b> with a request that within 10 days of drawal
							of advance, he should produce documentary evidence to the effect
							to the Competent Authority that the amount sanctioned has been
							utilized for the purchase of tickets. He should also submit the
							detailed LTC bill within one month after the completion of return
							journey failing which penal interest at the rate of 2% over and
							above the rate of interest prescribed and the advance will be
							recovered in lump sum.<br><br> Note: Documentary proof of travel
						to the declared place of visit in respect of LTC is mandatory. Air
						tickets may be purchased directly from the Airlines Office or from
						the Govt approved travel Agents M/s Balmer Lawrie and Co. or M/s
						Ashok Travel & Tours only as per Hqrs., Circular dated 10.10.2008<br><br> 
						2. Office Order Folder.
					</div>

				</div>
			</div>
		</div>

	</section>

</body>
</html>