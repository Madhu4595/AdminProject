<%@page import="com.app.util.MyUtil"%>
<%@page import="com.app.entity.Employee_allowance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% 
	Employee_allowance employee_allowance = (Employee_allowance)request.getAttribute("employee_allowance"); 
	String words = employee_allowance.getAmount_approve().toString();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cea sanction order</title>

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
	alert("asdfasdfasdfasdfasdf");
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
<body  onload="myFunction();">
	
	<div id="topline">No.1 (18) / NIC-APSC/2019/Admn.</div>
	<div id="header">
	GOVERNMENT OF INDIA<br>
	MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY<br>
	NATIONAL INFORMATIC CENTRE<br>
	ANDHRA PRADESH STATE CENTRE<br>
	Vijayawada - 520010
	</div>
	<span>Sanction Order No: <b>${employee_allowance.siodate }</b></b></span><span id="date">Date:  ${todaydate}</span><br>
	<br>
	<div id="from">
	To,<br>
	The DDO,<br>
	NIC, Hyderabad.
	</div><br>
	<div id="para1">
		As per the provisions of O.M. No.21011/21/88-Estt. (Allowances) dated 17/10/1988 read with O.M.
		No.21017/1/97-Estt. (Allowances) dated 12/06/1998 and O.M. No.12011/3/2008--Estt(Allowances)
		dated 02/09/2008, 11.09.2008. O.M. No.12011/01/2011--Estt.(Allowances) dated 04/05/2005 and No.
		A-27012/1/2014-Estt.(Allowance), dated 28.04.2014 issued by Department of personal and Training
		section is hereby accored for reimbursement of the Children Education Allowance / Hostel subsidy to
		the under mentioned officer at the rates shown against each:
	</div><br>
	<div id="table">
		<table border="1">
			<tr>
				<td>S.No</td>
				<td>Employee Name and Designation</td>
				<td>Name and Class of the child</td>
				<td>Period of claim</td>
				<td>Claimed Amount</td>
				<td>Admissible Amount</td>
			</tr>
			
			<%if(employee_allowance.getNoofchilds().equalsIgnoreCase("1")){ %>
				<tr>
					<td>1</td>  
  					<td> ${employee.name }<br>${employee.designation } </td>  
  					<td> ${employee_allowance.name_class_of_child1} </td>  
  					<td> ${employee_allowance.period_of_claim_child1} </td>  
 					<td> ${employee_allowance.amount_claimed} </td>  
  					<td> ${employee_allowance.amount_approve} </td>
				</tr>
			<%} %>
			<%if(employee_allowance.getNoofchilds().equalsIgnoreCase("2")){ %>
				<tr>
					<td rowspan="2">1</td>  
  					<td rowspan="2"> ${employee.name }<br>${employee.designation } </td>  
  					<td> ${employee_allowance.name_class_of_child1} </td>  
  					<td> ${employee_allowance.period_of_claim_child1} </td>  
 					<td> ${employee_allowance.amount_approve1} </td>  
  					<td> ${employee_allowance.amount_approve1} </td>
				</tr>
				<tr>
  					<td> ${employee_allowance.name_class_of_child2} </td>  
  					<td> ${employee_allowance.period_of_claim_child2} </td>  
 					<td> ${employee_allowance.amount_approve2} </td>  
  					<td> ${employee_allowance.amount_approve2} </td>
				</tr>
			<%} %>
			
 
			<tr>
				<td colspan="5" align="center"><b>Total Amount</b></td>
				<td><b> ${employee_allowance.amount_approve}</b></td>
			</tr>
		</table>
	</div>
	<center style="font-weight: bolder;">( Rupees <span id="words" ></span> Only )</center>
	<br>
	<div id="para2">
		<p>Certified that the relevant information and certificate in the prescribed form have been submitted by the
		Government servant and the certificates from the Head of the institutions that the institution is a
		recognized one run by the University affiliated to the University  and not exceeds the fees prescribed by
		the University with which it is affiliated has also been submitted by the government servants in support
		of the initial claim or at the beginning of each academic year and that the claim has been verified and
		found admissible under the Government of India, Department of Personnel and Training O.M.
		No.21011/21/88-Est(Allowances) dated 17/10/1988 read with O.M. No.21017/1/97-Estt(Allowances)
		dated 12/06/1998 and O.M.No.12011/03/2008-Estt.(Allowances), dated 02.09.2008, 11.09.2008. O.M.
		No.12011/01/2011--Estt.(Allowances) dated 04/05/2005 orders issued thereon from time to time.</p>
	</div><br>
	<div id="para3">
		The expenditure involved is debitable to the <b>Major Head - 3451 - SES - 00.091 Attached offices
		(Minor Head), 13 National Informatics Centre, 13.01 Establishment 13.01.01 Salaries during the
		year 2023-24.</b>
	</div><br>
	<div id="sign">
		 <br>
		 <br>
		<b>(S.V.Ch. Subba Rao)<br>
		Scientist-F & Head of Office</b>		
	</div><br>
	<div id="note">
		Copy to:<br>
		1. Accounts Officer, Pay and Accounts Officer, NIC, HQs, New Delhi.<br>
		2. Intigrated Finance Section, NIC, Hqrs, New Delhi.<br>
		3. Principal Director of Audit, Scientific Department, AGCR Building, New Delhi.<br>
		4. Office order file.
	</div>
</body>
</html>