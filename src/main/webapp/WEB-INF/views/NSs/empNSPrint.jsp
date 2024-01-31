<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="com.app.entity.Employee"%>
<%@page import="com.app.entity.Employee_allowance"%>
<%@page import="java.util.List"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
<%
	int i = 1;
String words =  request.getAttribute("totalAmout").toString();
System.out.println("words==>===> "+words);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EmployeeNoteSheet</title>
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
	    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'Only ' : '';
	    document.getElementById("words").innerHTML = str;
}
</script>
</head>
<body onload="myFunction();">
 <section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>
				
				 
					<h6 style="text-align: center; font-weight: 50px;">
						<b><%= localizationManager.getMessage("NATIONALINFORMATICSCENTRE") %> / NATIONAL INFORMATICS CENTRE </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b><%= localizationManager.getMessage("ANDHRAPRADESHSTATECENTRE") %> / ANDHRA PRADESH STATE CENTRE </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b><%= localizationManager.getMessage("VIJAYAWADA") %> / VIJAYAWADA  </b>
					</h6> 
					
					<div>

						<div style="text-align: right;"><b>Date</b>: ${todaydate }</div>
						<div style="text-align: left;">
							<b><u> Subject: Reimbursement of Children's Education Allowance.</u></b>
						</div>
						<br>
				
				<div>
					The following officials have submitted a claim towards reimbursement of Children's Education Allowance for their children as per the 
					details mentioned in the below table.
				</div>
				<br>
				<div>
					
						<table class="table table-bordered table-stripped">
							<thead>
								<tr>
									<th>S. No</th>
									<th>Employee Name and Designation</th>
									<th>Name and Class of the Child</th>
									<th>Period of Claim</th>
									<th>Claimed Amount</th>
									<th>Admissible Amount</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Employee_allowance> list = (List<Employee_allowance>)request.getAttribute("listEmpAllowances");
							System.out.println("listttttttttttttttttttttttttt=> "+list.size());
							
							List<Employee> empsList = (List<Employee>)request.getAttribute("empsList");
							 
							for(Employee_allowance bean: list){
								 
								System.out.println("aaaaaaaaaaaaaaaaaaaaa"+bean.getRequest_no());
								
								if(bean.getNoofchilds().equalsIgnoreCase("1")){
									 
									System.out.println("asdfasfasdfasdf");
									String code = bean.getCode();
									String empNameandDesg = "";
									for(Employee emp:empsList){
										if(emp.getCode().equalsIgnoreCase(code)){
											empNameandDesg = emp.getName()+", "+emp.getDesignation();
										}
										
									}
									
									String name_class_of_child1 = bean.getName_class_of_child1();
									String period_of_claim_child1 = bean.getPeriod_of_claim_child1();
									String amount_claimed = bean.getAmount_claimed().toString();
									String amount_approve = bean.getAmount_approve().toString();
									
									
									%>
									<tr>
									<td rowspan="2"><%=i++ %></td>
									<td rowspan="2"><%=empNameandDesg %> </td>
									<td><%=name_class_of_child1 %> </td>
									<td><%=period_of_claim_child1 %> </td>
									
									<%if(bean.getCea_type_child1().equalsIgnoreCase("sfeehstl")){
										%>
										<td style="width: 150px; text-align: center"><b>Hostel
									Subsidy</b> <br>81000 <br> (6750 &#215; 12) <br> <b>CEA</b>
								<br> 27000 <br>
								(2,250 &#215; 12)</td>
										<%
									}else{
									 %>
									<td><%=amount_claimed %> </td>
									<%} %>
									
									<td><%=amount_approve %> </td>
								 </tr>
								 <tr> </tr>
									<% 
								} 
								if(bean.getNoofchilds().equalsIgnoreCase("2")){
									System.out.println("asdfasfasdfasdf");
									String code = bean.getCode();
									String empNameandDesg = "";
									for(Employee emp:empsList){
										if(emp.getCode().equalsIgnoreCase(code)){
											empNameandDesg = emp.getName()+", "+emp.getDesignation();
										}
									}
									
									String name_class_of_child1 = bean.getName_class_of_child1();
									String name_class_of_child2 = bean.getName_class_of_child2();
									
									String period_of_claim_child1 = bean.getPeriod_of_claim_child1();
									String period_of_claim_child2 = bean.getPeriod_of_claim_child2();
									
									String cea_amount_child1 = bean.getCea_amount_child1().toString();
									String cea_amount_child2 = bean.getCea_amount_child2().toString();
									
									String amount_approve1 = bean.getAmount_approve1().toString();
									String amount_approve2 = bean.getAmount_approve2().toString();
									%>
									<tr>
									 <td rowspan="2"><%=i++ %></td>
									 <td rowspan="2"><%=empNameandDesg %> </td>
									 <td><%=name_class_of_child1 %></td>
									 <td><%=period_of_claim_child1 %></td>
									 
									 <%if(bean.getCea_type_child1().equalsIgnoreCase("sfeehstl")){
										%>
										<td style="width: 150px; text-align: center"><b>Hostel
									Subsidy</b> <br>81000 <br> (6750 &#215; 12) <br> <b>CEA</b>
								<br> 27000 <br>
								(2,250 &#215; 12)</td>
										<%
									}else{
									 %>
									<td><%=cea_amount_child1 %> </td>
									<%} %>
									 
<%-- 									 <td><%=cea_amount_child1 %></td> --%>
									 <td><%=amount_approve1 %></td>
									</tr>
									<tr>
									 <td><%=name_class_of_child2 %></td>
									 <td><%=period_of_claim_child2 %></td>
									 
									 <%if(bean.getCea_type_child2().equalsIgnoreCase("sfeehstl")){
										%>
										<td style="width: 150px; text-align: center"><b>Hostel
									Subsidy</b> <br>81000 <br> (6750 &#215; 12) <br> <b>CEA</b>
								<br> 27000 <br>
								(2,250 &#215; 12)</td>
										<%
									}else{
									 %>
									<td><%=cea_amount_child2 %> </td>
									<%} %>
									 
<%-- 									 <td><%=cea_amount_child2 %></td> --%>
									 <td><%=amount_approve2 %></td>
									</tr>
									<% 
								}
							}
							%>
							<tr> </tr>
								<tr>
									 <td colspan="5" align="right"><b>Total Amount: </b></td>
									 <td><b>&#8377;${totalAmout }/-</b></td>
									</tr>
									<tr>
									<td colspan="6" align="right"><b>Total Amount: (Rupees <span id="words" ></span> ) </b></td>
									</tr>
									 
							 
							</tbody>
						</table>
					
				</div>
				<br>
				<div>
					The officers/officials have submitted the necessary bonafide certificate in the prescribed format from the School.
					An amount of &#8377;2,250/- per month for CEA and  &#8377;6,750/- per month for Hostel Subsidy is eligible from 1st July
					2017 as per the 7th pay commission recommendations. Hence the total amount of &#8377;2,250 &#10005; 12 = Rs. 27000/- for CEA and 
					&#8377;6,750 &#10005; 12 = &#8377;81,000/- for hostel subsidy may be approved.
				</div>
				<br>
				<div>
					The family details of the claimants have been verified from the official records and found correct.
				</div>
				<br>
				<div>
					Necessary sanction order shave been prepared for approval and signature, please
				</div>
				<br>
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
				</div></div></div></section>
</body>
</html>