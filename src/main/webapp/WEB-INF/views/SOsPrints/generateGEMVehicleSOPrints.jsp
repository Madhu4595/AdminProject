<%@page import="com.app.entity.GEM"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
 

GEM gem = (GEM) request.getAttribute("gem");
String words = gem.getAmount();

LocalDateTime nsdate = gem.getSoDate();
DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
String date = nsdate.format(dateformatter);
System.out.println("date====> "+date);

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
						<b> Vijayawada - 520010 </b>
					</h6>

					<div>
						<b>Sanction Order No: ${gem.sanctionNumber }</b><span style="margin-left: 70%">Date: <%=date%></span>
					</div>
					<br>
					
					<div>
						<b>Sub:</b> Expenditure sanction towards vehicle hiring charges for the for the office of NIC, APSC, Vijayawada for the month of <b>${gem.monthYear }</b>.
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
						Sanction is also conveyed to the drawl of said amount through DD/Cheque in favor of <b>M/s. Swarnandhra Travels, Chittor</b> and payment thereof to the
						party <b>(Bank Details: Current A/C No: 920020039167111, Axis Bank, Kadiri Branch, Anantapur - 515591, IFSC Code: UTIB0002016)</b>.
					</div>
					<br>
					<div>
						This has been approved vide <b>IFS Dairy No. 420 dated 30/06/2022</b>
					</div>
					<br>
					<div>
						The expenditure involved is debitable as under Demand No. 28 during the financial year 2023-2024
					</div>
					<br>
					<div>
						<span style="margin-right: 32px;">3451</span> Secretariat Economic Services (Major Head)<br>
						<span style="margin-right: 20px;">00.091</span> Secretariats (Minor Head)<br>
						<span style="margin-right: 50px;">13</span> National Informatics Centre<br>
						<span style="margin-right: 30px;">13.01</span> Establishment<br>
						<b><span style="margin-right: 3px;" >13.01.13 </span>  Office Expenses</b>
					</div>
					
					
					
					
					
					
					<br><br><br>
					<div style="text-align: right">
						<br> <br> <b>(S.V.Ch. Subba Rao)<br>
							Scientist-F & Head of Office
						</b>
					</div>


				</div>
			</div>
		</div>
	</section>
</body>
</html>