<%@page import="com.app.entity.Employee_allowance"%>
<%@page import="com.app.util.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%@page import="java.util.Date" %>
 <%
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); 
Date date = new Date();  
String todaydate=formatter.format(date);

Employee_allowance empallow = (Employee_allowance)request.getAttribute("employee_allowance");
String words = empallow.getAmount_approved().toString();
 
%>
<!DOCTYPE html>
<html lang="en">

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
      <h6 style="text-align: center;font-weight:50px;"><b>No.1 (43)/NIC-APSC/2019/Admn.   </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>Government of India   </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>Ministry of Electronics & Information Technology  </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>National Informatics Centre (APSC)   </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>VIJAYAWADA 520010.  </b></h6> 
      <div>
      <div style="text-align: left;">
      <b>Sanction Order No: ${employee_allowance.siodate}</b>
      </div>
       <div style="text-align: right;">
     <b> Date: <%=todaydate %></b>
      </div><br>
        <div style="text-align: left;">
    Accounts Officer<br>
     Pay & Accounts Officer<br>
      Department of Information Technology<br>
       National Informatics Centre (Hqrs),<br>
        New Delhi - 110 003.<br><br>
      </div><br>
     
      <div style="text-align: left;margin-left:40px;">
      Sub: Reimbursement Towards purchase of <b>${allowance_type}</b>
      </div>
        <div style="text-align: left;">
     Sir, 
      </div>
      <div>
      I am directed to convey the sanction of the Director General, NIC under the powers delegated to him
vide Ministry of Information Technology vide order No. M-11017/1/2014-MS (O&M) dated
17.07.2014, to the incurring of expenditure of <b>Rs. ${employee_allowance.amount_approved} /- ( Rupees <span id="words" ></span> ) </b>. Reimbursement towards purchase of Brief Case to <b>${employee.name} ,
 ${employee.designation }, Employee Code: </b> <b>${employee.code} </b> National Informatics Centre, Vijayawada,  from <b>${employee_allowance.shopname}</b> and Vide Invoice No.<b>${employee_allowance.billno} </b> dated <b> <%=MyUtil.ChDate(empallow.getBilldate()) %></b>.</div><br>
<div>
Sanction is also conveyed to the drawl of said amount through D.D/Cheque/NEFT in favor of Sri
 <b> ${employee.name},${employee.designation }, Employee Code: </b> <b>${employee.code}</b> National Informatics Centre, Vijayawada 

</div><br>
The expenditure involved is debitable as under, demand No. 28 during the year 2023-2024.
      </div><br>
    <table>
    <tr>
    <td style="width:100px;">'3451'</td>
    <td>Secretariat-Economic Services (Major Head) </td>
    </tr>
     <tr>
    <td style="width:100px;">00.091</td>
    <td>Secretariat-(Minor Head) </td>
    </tr>
     <tr>
    <td style="width:100px;">.13</td>
    <td>National Informatics Centre </td>
    </tr>
     <tr>
    <td style="width:100px;">.13.01</td>
    <td>Establishment </td>
    </tr>
     <tr>
    <td style="width:100px;"><b>.13.01.13</b> </td>
    <td><b>Office Expenses.</b> </td>
    </tr>
    
    
    </table>
    
     <div style="text-align: right;"><b>
     <p style="margin-right:50px;">SVCH Subbarao</p>
     <p>Scientist - F / Head of Office</p></b>
      </div>
      
      
     
      <div>
      Copy to:<br>
      01. Drawing & Disbursing Officer, NIC(APSU), Hyderabad (2 copies)<br>
      02. Integrated Finance Section, NIC(Hqrs.), New Delhi<br>
      03. Principal Director of Audit, Scientific Dept., AGCR Building, I.P. Estate, New Delhi<br>
      04. Sanction File<br>
      </div>
         

  </div>
</div>



</div>
</section>


  



</form>
         


  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="assests/owlCarousel/owl.carousel.min.js" type="text/javascript"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
 
</body>
<!--<h3 align="center"><input type="button"  
           value="Print Receipt" onclick="return myFunction();" class="btn btn-primary"/></h3>-->
</html>