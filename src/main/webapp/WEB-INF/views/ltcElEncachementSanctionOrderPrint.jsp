<%@page import="com.app.util.MyUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.app.entity.Employee"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();
	String todaydate = formatter.format(date);
	
	Employee empp = (Employee)request.getAttribute("emp");
	Integer basicpay = Integer.parseInt(StringUtils.remove(empp.getBasic_pay(), ","));
	System.out.println("basicpay=> "+basicpay);
	
	Integer da =  (Integer)request.getAttribute("da");
	Integer dabasicpay = basicpay*da/100;
	Integer daplusbasicpay = basicpay + dabasicpay;
	Integer totalAmout = daplusbasicpay/30*10;
	String words= totalAmout.toString();
	
	System.out.println("words======> "+words);
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LTC-EL Enacachement</title>
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
<body onload="myFunction();">
	

	<section class="container mt-5 pt-2">
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
						<b> National Informatics Centre </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b> Andhra Pradesh State Centre </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b> Vijayawada - 520010 </b>
					</h6>

					<div>
						<div style="text-align: right;">
							Date:
							<%=todaydate%>
						</div>
					</div>
					<br> <label class="font-weight-bolder">
						Sanction order No: ${ltc.sanctionorderno}</label> <br> <br>
					<div id="from">
						To,<br> The Drawing & Disbursing Officer,<br> National
						Informatics Centre,<br> Hyderabad.
					</div>
					<br> <br>
					<div style="text-align: justify;">
						Sanction of the Competent Authority under Sub-Rule 6(a)(ii) of
						Rule No. 39 (6) (a) (ii) of CCS (Leave) Rules, 1972 read with O.M.
						No. 31011/4/2008-Estt.(A0 dated 23.9.2008 issued by M/o Personnel
						& public Grievances & Pension) is conveyed to the grant of cash
						equivalent to 10 days as following in respect of earned leave at
						credit of <b>${emp.name}, ${designation.name} (Emp. Code No.
							${emp.code})</b> of NIC, APSC, Vijayawada (${ltc.location}) to visit
						<b>"${ltc.visitplace}"</b> for the block year ${ltc.blockyear}
						during Earned Leave ${ltc.leavedetails}.
					</div>
					<br> <br>
					<table border="1" style="text-align: center;  width: 100%;">
						<thead style="font-weight: bolder;">
							<tr>
								<td>SI. No.</td>
								<td>Name and Designation</td>
								<td>Pay DA in Rs.</td>
								<td>Total In Rs.</td>
								<td>No.of Days To be Encashed</td>
								<td>Total Amount<br>(4/30) &#215;5 (Rs.)
								</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><b>${emp.name}, <br>${designation.name} (Emp. Code No. ${emp.code})</b></td>
								<td><%=basicpay %><br><%=dabasicpay %></td>
								<td><%=daplusbasicpay %></td>
								<td>10</td>
								<td><b><%=totalAmout %></b></td>
							</tr>
						</tbody>
					</table>
					<center><b>(Rupees <span id="words" ></span>)</b></center>
					<br>
					It is certified that <b>${emp.name}, ${designation.name} (Emp. Code No. ${emp.code})</b> is having more than
					30 days of Earned Leave at his credit after taking into account the period of encashment.
					<br><br><br><br>
					<div id="sign">
						<br> <br> <b>(S.V.Ch. Subba Rao)<br>
							Scientist-F & Head of Office
						</b>
					</div>
					<br>
					<div id="note">
						Copy to:<br> 1. Office Order File<br> 2. Individual
						concerned
					</div>

				</div>
			</div>
		</div>

	</section>

</body>
</html>