<%@page import="com.app.util.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#section{
	border: 2px solid black;
	background-color: #e6f9ff;
}
h4{
	color: blue;
	text-decoration: underline;
	font-weight: bolder;
}
.row{ margin: 2px; font-weight: bolder; }
</style>

</head>
<body>
<%@include file="banner.jsp" %>
<%@include file="navbar.jsp" %>

<form:form action="transactionsave" method="post" modelAttribute="transactions" > 
    <section class="container mt-5 shadow py-5" id="section">
	<h4 align="center" >VENDOR BILL PROCESSING</h4>
	
	<div class="container">
		<div class="row">
			<div class="col-2"> Request No: </div>
			<div class="col-3"><form:input readonly="readonly"  path="request_no" value="${hit_count}"/></div>
		</div>
		<div class="row">
			<div class="col-2"> Date: </div>
			<div class="col-3"><form:input type="date" path="generated_date" /></div>
		</div>
		<div class="row">
			<div class="col-2"> Subject: </div>
			<div class="col-9"><form:textarea cols="66" path="subject" id="subject"/></textarea></div>
		</div>
		<div class="row">
			<div class="col-2"> Notepara1: </div>
			<div class="col-7"> <form:textarea  cols="66" path="note_para1" /></textarea> </div>
		</div>
		<div class="row">
			<div class="col-2"> Notepara2: </div>
			<div class="col-7"> <form:textarea  cols="66" path="note_para2" /></textarea> </div>
		</div>
		<div class="row">
			<div class="col-2"> Vendor: </div>
			<div class="col-7"> 
				<form:select path="vendor_no" id="v_no" onchange="vendorsearch()" >
					<%=MyUtil.putOptions("vendor_master", "code", "name")%>	
				</form:select>  
			</div>
			<div class="3">
			
			</div>
		</div>
		<div class="row">
			<div class="col-2"> Category of Bills: </div>
			<div class="col-6">
				<form:select path="type_of_bill" >
				<%=MyUtil.putOptions("type_of_bills", "id", "name")%>>
				</form:select>	
			</div>
		</div>
		<div class="row">
			<div class="col-2">Bill/Invoice No:</div>
			<div class="col-3"><form:input  path="bill_no" id="bill_no"/></div>
			<div class="col-2">Bill/Invoice Date:</div>
			<div class="col-3"><form:input type="date" path="bill_date"/></div>
		</div>
		<div class="row">
			<div class="col-2">GEM Order No:</div>
			<div class="col-3"><form:input path="gem_no" id="gem_no"/></div>
			<div class="col-2">GEM Date:</div>
			<div class="col-3"><form:input type="date" path="gem_date"/></div>
		</div>
		<div class="row">
			<div class="col-2"> Contract No: </div>
			<div class="col-3"> <form:input path="contract_no" id="contract_no"/> </div>
			<div class="col-2"> Contract Date: </div>
			<div class="col-3"> <form:input type="date" path="contract_date"/> </div>
		</div>
		<div class="row">
			<div class="col-2"> Amount:  </div>
			<div class="col-3"> <form:input path="amount_claimed" id="amount"/> </div>
			<div class="col-3">   </div>
			<div class="col-3">   </div>
		</div>
		<div class="row">
			<div class="col-2"> IFD Diary:  </div>
			<div class="col-3"> <form:input  path="ifd_no" id="vcode"/> </div>
			<div class="col-2"> IFD Date: </div>
			<div class="col-3"> <form:input type="date" path="ifd_date"/> </div>
		</div>
		<div class="row">
			<div class="col-2"> Budget Head: </div>
			<div class="col-3"> 
				<form:select path="acc_head">
					<form:option value="1">"{27.01.139/ Establishment -3451000911301139}” (Minor Works)"</form:option>
					<form:option value="2">"{21.01.139/ Establishment -3451000911301139}” (Supplies and Materials)"</form:option>
					<form:option value="3">"{13.01.139/ Establishment -3451000911301139}” (Office Expenses)"</form:option>
				</form:select>
			</div>
		</div>
		<div class="row">
			<div class="col-2"> Remarks:  </div>
			<div class="col-3"> <form:textarea path="description" cols="22"/> </textarea> </div>
		</div>
		<div class="row">
			<div class="col-4">  </div>
			<div class="col-3"> <input type="submit" id="search" class="btn btn-success px-3" value="Submit"/> </div>
		</div> 
	</div>
	
	 
<!-- <td colspan="2" width="500px;"><div id="vendordetails"></div></td></tr> -->
<!-- <tr id="gstno" style="display:none"><td><label style="padding-right:60px;">Vendor GST Number:</label> </td> -->
 		 
    </section>
 </form:form>
</body>
</html>