<%@page import="com.app.entity.Employee"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.app.util.MyUtil"%>
<%@page import="com.app.entity.Employee_allowance"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Employee_allowance upload = (Employee_allowance)request.getAttribute("employee_allowance2");
String words =   upload.getAmount_approved().toString();

String billdate = MyUtil.ChDate(upload.getBilldate());

System.out.println("words=========> "+words);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BRIEF CASE</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/home-style.css" />
<script src="https://kit.fontawesome.com/2c3c26015e.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">

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
	body{
		text-align: justify;
	}
</style>
</head>

<body onload="myFunction();" >
	<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();
	String todaydate = formatter.format(date);
	
	Employee emp = (Employee) request.getAttribute("employee");
	System.out.println("emp=> "+emp.toString());
	%>
	<section class="container mt-5 pt-2">
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
						Reimbursement towards Purchase of <b>${allowance_type}</b> in r/o <b>${employee.callSign} ${employee.name}, ${employee.designation },
						(Emp. Code: ${employee_allowance2.code}),</b> ${employee.place }				
						 who submitted bill vide Invoice No. ${employee_allowance2.billno} 
						dt. <%=billdate%> for 
						Rs. ${employee_allowance2.amount_claimed}/- ${employee.callSign} ${employee.name} is eligible for <b> Rs. ${employee_allowance2.amount_approved}/- ( Rupees <span id="words" ></span> Only ) </b> as per his entitlement.
					</div>
					<br>
					<div>
					<b>${employee.callSign} ${employee.name}</b> was eligible for issuing brief case and the necessary approval and documents were kept in
					receipt.
					</div>
					<br>
					<div>Submitted for approval please</div>
					<br> <br>

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
	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="assests/owlCarousel/owl.carousel.min.js"
		type="text/javascript"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
</body>
<!--<h3 align="center"><input type="button"  
           value="Print Receipt" onclick="return myFunction();" class="btn btn-primary"/></h3>-->
</html>