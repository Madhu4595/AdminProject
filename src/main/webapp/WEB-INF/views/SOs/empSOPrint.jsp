<%@page import="com.app.entity.Employee_allowance"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int i = 1;
	String words =  request.getAttribute("totAmt").toString();
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
	    str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only ' : '';
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
						<b>GOVERNMENT OF INDIA </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b>MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b>NATIONAL INFORMATICS CENTRE </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b>ANDHRA PRADESH STATE CENTRE </b>
					</h6>
					<h6 style="text-align: center; font-weight: 50px;">
						<b>Vijayawada - 520010  </b>
					</h6>
					<div>

						<div style="text-align: right;"><b>Date</b>: ${todaydate }</div>
						<div style="text-align: left;">
							Sanction Order No:  <b>  ${SONumber } </b>
						</div>
						<br>
						<div style="text-align: left;">
							To,<br>
							Accounts Officer,<br>
							Pay and Accounts Office,<br>
							Ministry of Electronics and Information Technology,<br>
							Department of Information Technology,<br>
							National Informatics Centre,<br>
							New Delhi - 110 003.
						</div>
				<br>
				<div>
					 As per the provisions of O.M. No.21011/21/88-Estt. (Allowances) dated 17/10/1998 read with O.M.
					 No. 21017/1/97-Estt. (Allowances) dated 12/06/1998 and O.M. No.12011/3/2008--Estt(Allowances)
					 dated 02/09/2008, 11.09.2008. O.M.12011/01/2011--Estt.(Allowances) dated 04/05/2005 and No.
					 A-27012/1/2014--Estt.(Allowance), dated 28.04.2014 issued by the Department of Personnal and
					 Training, the sanction is hereby accorded for reimbursement of the Children Education Allowance / 
					 Hostel subsidy to the under-mentioned officers at the rates shown against each.
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
							Integer totAmt = 0;
							for(Employee_allowance bean: list){
								 
								System.out.println("aaaaaaaaaaaaaaaaaaaaa"+bean.getRequest_no());
								
								if(bean.getNoofchilds().equalsIgnoreCase("1")){
									 
									System.out.println("asdfasfasdfasdf");
									String code = bean.getCode();
									String name_class_of_child1 = bean.getName_class_of_child1();
									String period_of_claim_child1 = bean.getPeriod_of_claim_child1();
									String amount_claimed = bean.getAmount_claimed().toString();
									String amount_approve = bean.getAmount_approve().toString();
									totAmt = totAmt + Integer.parseInt(amount_approve);
									%>
									<tr>
									<td rowspan="2"><%=i++ %></td>
									<td rowspan="2">1child<%=code %> </td>
									<td><%=name_class_of_child1 %> </td>
									<td><%=period_of_claim_child1 %> </td>
									<td><%=amount_claimed %> </td>
									<td><%=amount_approve %> </td>
								 </tr>
								 <tr> </tr>
									<% 
								} 
								if(bean.getNoofchilds().equalsIgnoreCase("2")){
									System.out.println("asdfasfasdfasdf");
									String code = bean.getCode();
									
									String name_class_of_child1 = bean.getName_class_of_child1();
									String name_class_of_child2 = bean.getName_class_of_child2();
									
									String period_of_claim_child1 = bean.getPeriod_of_claim_child1();
									String period_of_claim_child2 = bean.getPeriod_of_claim_child2();
									
									String cea_amount_child1 = bean.getCea_amount_child1().toString();
									String cea_amount_child2 = bean.getCea_amount_child2().toString();
									
									String amount_approve1 = bean.getAmount_approve1().toString();
									totAmt = totAmt + Integer.parseInt(amount_approve1);
									String amount_approve2 = bean.getAmount_approve2().toString();
									totAmt = totAmt + Integer.parseInt(amount_approve2);
									%>
									<tr>
									 <td rowspan="2"><%=i++ %></td>
									 <td rowspan="2">2child<%=code %></td>
									 <td><%=name_class_of_child1 %></td>
									 <td><%=period_of_claim_child1 %></td>
									 <td><%=cea_amount_child1 %></td>
									 <td><%=amount_approve1 %></td>
									</tr>
									
									<tr>
									 <td><%=name_class_of_child2 %></td>
									 <td><%=period_of_claim_child2 %></td>
									 <td><%=cea_amount_child2 %></td>
									 <td><%=amount_approve2 %></td>
									</tr>
									<% 
								}
							}
							%>
							<tr> </tr>
								<tr>
									 <td colspan="5" align="right"><b>Total Amount: (Rupees <span id="words" ></span> Only) </b></td>
									 <td><b>&#8377;${totAmt }/-</b></td>
									 
									</tr>
							 
							</tbody>
						</table>
					
				</div>
				<br>
				<div>
					 Certified that the relevant information and certificate in the prescribed form have been submitted by
					 the Government servants and the certificate from the Head of the institution that the institution is a 
					 recognized one run by the University affiliated to the University and not exceeds the fees prescribed
					 by the University with which it is affiliated has also been submitted by the government servants in
					 support of the initial claim or at the beginning of each academic year and that the claim has been
					 verified and found admissible under the Government of India, Department of Personnel and Training
					 O.M. No.21011/21/88--Estt(Allowances) dated 17/10/1988 read with O.M. No.21017/1/97-
					 Estt(Allowances) dated 12/06/1998 and O.M.No.12011/03/2008-Estt.(Allowances), dated 02.09.2008,
					 11.09.2008, O.M. No.12011/01/2011--Estt.(Allowances) dated 04/05/2005 orders issued thereon from time to time.
				</div>
				<br>
				<div>
					The expenditure involved is debitable to the <b>Major Head - 3451 - SEC - 00.091 Attached offices
					(Minor Head), 13 National Informatics Centre, 13.01 Establishment 13.01.07-Allowances under
					demand No - 27 during the year 2023-24.</b>
				</div>
				<br>
				<div style="text-align: right;">
								<b>
								(S.V. Ch. Subba Rao)<br>
								Scientist-F & Head of Office
								</b>
					</div>


					 
				</div></div></div></section>
</body>
</html>