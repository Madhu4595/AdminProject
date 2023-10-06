<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
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
<%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>

<!DOCTYPE html>
<html lang="en">
<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();
	String todaydate = formatter.format(date);

	Employee_allowance empAllow = (Employee_allowance) request.getAttribute("employee_allowance2");
	
	String words =   empAllow.getAmount_approve().toString();
	
	%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/home-style.css" />
<script src="https://kit.fontawesome.com/2c3c26015e.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
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

<body onload="myFunction();">
	<!-- <img src="images/itiap.jpg" class="img-fluid" alt="Responsive image" width="100%"> -->
	
	<section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>
					<h6 style="text-align: center; font-weight: 50px;">
						<b><%= localizationManager.getMessage("NATIONALINFORMATICSCENTRE") %> / NATIONAL INFORMATICS CENTRE </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b><%= localizationManager.getMessage("ANDHRAPRADESHSTATECENTREVIJAYAWADA") %> ANDHRA PRADESH STATE CENTRE, VIJAYAWADA </b>
					</h6>
					<div>
						<div style="text-align: right;">
							Date:
							<%=todaydate%>
						</div>
						<div style="text-align: left;">
							<b> Subject:</b> Reimbursement of Children Education Allowance.
						</div>
						<br>
						<div>The following official has submitted his claim towards
							reimbursement of Children Education Allowance for his children as
							per the details following.</div>
						<br>
					</div>
					<br>

					<table  border="1" width="100%">
						<tr>
							<th style="width: 80px; text-align: center">S.No</th>
							<th style="width: 220px; text-align: center">Employee Name
								and Designation</th>
							<th style="width: 180px; text-align: center">Name and Class
								of the child</th>
							<th style="width: 100px; text-align: center">Period of claim</th>
							<th style="width: 150px; text-align: center">Claimed Amount</th>
							<th style="width: 150px; text-align: center">Admissible
								Amount</th>
						</tr>

						<tr>
							<td style="width: 80px; text-align: center" rowspan='<%=empAllow.getNoofchilds()%>'><%=1%></td>
							<td style="width: 200px; text-align: center" rowspan='<%=empAllow.getNoofchilds()%>'><b>${employee.callSign} ${employee.name}, ${employee.designation}<br>Emp.code:${employee.code} </b></td>
							<td style="width: 180px; text-align: center">${employee_allowance2.name_class_of_child1} </td>
							<td style="width: 100px; text-align: center">${employee_allowance2.period_of_claim_child1}</td>
							
							<% if (empAllow.getCea_type_child1().equals("sfee")) { %>
								<td style="width: 150px; text-align: center">${employee_allowance2.cea_amount_child1}</td>
							<% }
							%>
							<% if (empAllow.getCea_type_child1().equals("sfeehstl")) { %>
								<td style="width: 150px; text-align: center"><b>Hostel
									Subsidy</b> <br>81000 <br> (6750 &#215; 12) <br> <b>CEA</b>
								<br> 27000 <br>
								(2,250 &#215; 12)</td>
							<% } %>
							<% if (empAllow.getCea_type_child1().equals("sfeedisabled")) { %>
								<td style="width: 150px; text-align: center">  ${employee_allowance2.cea_amount_child1} <br> (Disabled Person)</td>
							<% } %>
							<% if (empAllow.getNoofchilds().equals("1")) { %>
								<td style="width: 150px; text-align: center">${employee_allowance2.amount_approve}</td>
							<% } %>
							<% if (empAllow.getNoofchilds().equals("2")) { %>
								<td style="width: 150px; text-align: center">${amount_approve1}</td>
							<% } %>
						</tr>
						<% if (empAllow.getNoofchilds().equals("2")) { %>
						<tr>
							<td style="width: 180px; text-align: center">${employee_allowance2.name_class_of_child2}  </td>
							<td style="width: 100px; text-align: center">${employee_allowance2.period_of_claim_child2} </td>
							<% if (empAllow.getCea_type_child2().equals("sfee")) { %>
								<td style="width: 150px; text-align: center">${employee_allowance2.cea_amount_child2}</td>
							<% } %>
							<% if (empAllow.getCea_type_child2().equals("sfeehstl")) { %>
								<td style="width: 150px; text-align: center"><b>Hostel
									Subsidy</b> <br>81000 <br> (6750 &#215; 12) <br> <b>CEA</b>
								<br> 27000 <br>
								(2,250 &#215; 12)
								</td>
							<% } %>
							<% if (empAllow.getCea_type_child2().equals("sfeedisabled")) { %>
								<td style="width: 150px; text-align: center">  ${employee_allowance2.cea_amount_child2} <br> (Disabled Person)</td>
							<% } %>
								<td style="width: 150px; text-align: center">${employee_allowance2.amount_approve2} </td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="5" style="text-align: center"><b>Total
									Amount</b></td>
							<td style="width: 150px; text-align: center; font-weight: bolder;">${employee_allowance2.amount_approve}
							</td>
						</tr>
					</table>
					<center style="font-weight: bolder;">( Rupees <span id="words" ></span> only)</center> 
					<br>
					<div>He has submitted necessary bonafied certificate in
						prescribed format from the School. An amount of Rs. 2,250/- per
						month is eligible from 1st July 2017 as per the 7th pay commission
						recommendations. Hence the total amount of Rs. 2,250 &#215; 12 =
						Rs. 27000/- for each child may be approved.</div>
					<br>
					<%
						if (empAllow.getCea_type_child1().equals("sfeehstl") || empAllow.getCea_type_child2().equals("sfeehstl")) {
					%>
					<div>He has submitted necessary bonafied certificate in
						prescribed format from the Residential College. An amount of Rs.
						6,750/- per month is eligible from 1st July 2017 as per the 7th
						pay commission recommendations. Hence the total amount of Rs 6,750
						&#215; 12=Rs.81000/- for each child may be approved</div><br> <br>
					<%
						}
					%>
					<div>
						The family details of the claimant has been verified from the
						official records and found correct.<br> <br> Necessary
						sanction orders have been prepared for approval and signature
						please.
					</div>
					<br> <br>

					<div style="text-align: right;">
						<b>
							 <%= localizationManager.getMessage("(BSNMurty)") %> / (BSN Murty)<br>
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
					<br> <br> <br>
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