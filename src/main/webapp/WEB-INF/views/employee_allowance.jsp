<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./customJS/emp_allow.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<link rel="stylesheet" href="./customCSS/employee_allowanceCSS.css" />

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>VENDOR</title>
</head>
<body>
<%@include file="banner.jsp"%>
	<%
		Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	int current_year = Integer.parseInt(format.format(date));

	int start_year = 2010;
	int substart_year = 2010;
	int end_year = current_year + 1;
	String year_value="";
	int start_year2 = 2010;
	int substart_year2 = 2010;
	int end_year2 = current_year + 1;
	%>
	<%@include file="navbar.jsp"%>


	<!-- Intro Section  -->
	<section class="container mt-5 shadow py-5" id="section">
		<h4 align="center">EMPLOYEE ALLOWANCES</h4>


		<div align="left" style="padding-left: 50px;">

			<form:form action="empAllowanceSave"
				modelAttribute="employee_allowance" method="post" name="RegForm"
				onsubmit="return Validate()">

				<div class="row">
					<div class="col-3">
						<label for="requestno" class="col-form-label">Request No:</label>
					</div>
					<div class="col-4">
						<form:input path="request_no" value="${hit_count}"
							readonly="readonly"  
							 />
					</div>
				</div>

				<div class="row">
					<div class="col-3">
						<label for="requestno" class="col-form-label">Employee
							Code:</label>
					</div>
					<div class="col-4">
						<form:input path="code" id="eno" onChange="return employeesearch()" placeholder="Ex: 1001" maxlength="5" />
					</div>
					<div class="col-5" id="empname"></div>
				</div>

				<div class="row" id="toallow">
					<div class="col-3">
						<label for="requestno" class="col-form-label">Type Of Allowances:</label>
					</div>
					<div class="col-4" id="toallowinput">
						<form:select path="allowance_type" id="allowlist"
							style="width: 190px; height: 26px;"
							onchange="allowancelist(this)">
							<form:option value="">-select-</form:option>
							<c:forEach items="${allowancelist}" var="allowancelist">
								<form:option value="${allowancelist.id}">${allowancelist.name }</form:option>
							</c:forEach>
						</form:select>
					</div>
				</div>

				<div class="row" id="noofchild">
					<div class="col-3" id="noofchildlabel">
						<label for="requestno" class="col-form-label">Allowance
							for Number of Childs:</label>
					</div>
					<div class="col-4" id="noofchildinput">
						<select name="noofchilds" style="width: 190px; height: 26px;"
							id="noofchilds" onchange="return childrens(this)">
							<option value="">-select-</option>
							<option value="1">ONE</option>
							<option value="2">TWO</option>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="col-3" id="ceanamelabelc1">
						<label for="requestno" class="col-form-label">Name and Class of Child1:</label>
					</div>
					<div class="col-3" id="ceanameinputc1">
						<form:input path="name_class_of_child1" id="ceaname0" 
						placeholder="Ex: Madhu and Class IV" onChange="return ceaname1Validation()" />
					</div>
					<div class="col-3" id="ceanamelabelc2">
						<label for="requestno" class="col-form-label">Name and Class of Child2:</label>
					</div>
					<div class="col-3" id="ceanameinputc2">
						<form:input path="name_class_of_child2" id="ceaname1" 
						placeholder="Ex: Pavan and Class X" onChange="return ceaname2Validation()" />
					</div>
				</div>

				<div class="row">
					<div class="col-3" id="pofcforc1label">
						<label for="requestno" class="col-form-label">Period of Claim for child1:</label>
					</div>
					<div class="col-3" id="pofcforc1input">
						<form:select path="period_of_claim_child1" id="p_claim" onChange="return p_claimValidation()" style="width: 190px; height: 26px;">
							<form:option value="">-select-</form:option>
							<%
								for (int i = start_year; i < end_year; i++) {
									 year_value=String.valueOf(i)+"-"+String.valueOf(++substart_year);
									System.out.println("dshjkgsdg"+year_value);
							%>
							<form:option value='<%=year_value%>'>
								<%=year_value%>
							</form:option>
							<%
								}
							%>

						</form:select>
					</div>
					<div class="col-3" id="pofcforc2label">
						<label for="requestno" class="col-form-label">Period of
							Claim for child2:</label>
					</div>
					<div class="col-3" id="pofcforc2input">
						<form:select path="period_of_claim_child2" id="p_claim1"
							style="width: 190px; height: 26px;"
							onChange="return p_claim1Validation()">
							<form:option value="">-select-</form:option>
							<%
								for (int i = start_year2; i < end_year2; i++) {
									String year_value1=String.valueOf(i)+"-"+String.valueOf(++substart_year2);
							%>
							<form:option value="<%=year_value1%>">
								<%=year_value1%>
							</form:option>
							<%
								}
							%>
						</form:select>
					</div>
				</div>

				<div class="row">
					<div class="col-3" id="type1label">
						<label for="requestno" class="col-form-label">Type:</label>
					</div>
					<div class="col-3" id="type1input">
						<form:select path="cea_type_child1" id="schoolfee"
							style="width: 190px; height: 26px;">
							<form:option value="">-select-</form:option>
							<form:option value="sfee">School Fee</form:option>
							<form:option value="sfeehstl">School Fee & Hostel</form:option>
							<form:option value="sfeedisabled">School Fee For Disabled</form:option>
						</form:select>
					</div>
					<div class="col-3" id="type2label">
						<label for="requestno" class="col-form-label">Type:</label>
					</div>
					<div class="col-3" id="type2input">
						<form:select path="cea_type_child2" id="schoolfee1"
							style="width: 190px; height: 26px;">
							<form:option value="">-select-</form:option>
							<form:option value="sfee">School Fee</form:option>
							<form:option value="sfeehstl">School Fee & Hostel</form:option>
							<form:option value="sfeedisabled">School Fee For Disabled</form:option>
						</form:select>
					</div>
				</div>

				<div class="row">
					<div class="col-3" id="acc1label">
						<label for="requestno" class="col-form-label">Amount
							Claimed for child1:</label>
					</div>
					<div class="col-3" id="acc1input">
						<form:input path="cea_amount_child1" id="cea_amount_child1"
							placeholder="Ex: 25000" onchange="return cea_amount_child1Validation()" />
					</div>
					<div class="col-3" id="acc2label">
						<label for="requestno" class="col-form-label">Amount
							Claimed for child2:</label>
					</div>
					<div class="col-3" id="acc2input">
						<form:input path="cea_amount_child2" id="cea_amount_child2"
							placeholder="Ex: 25000" onchange="cea_amount_child2Validation();" />
					</div>
				</div>

				<div class="row">
					<div class="col-3" id="comser">
						<label class="col-form-label">Completed Service:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="comser0div">
						<form:input path="completed_service" id="comser0" />
					</div>
					<div class="col-3" id="balpersp">
						<label class="col-form-label">Balance as per accounts slip:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="balance_accountsdiv">
						<form:input path="balance_asper_accountsslip" id="balance_accounts" onChange="return balance_accountsValidation()" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-3" id="gaclse">
						<label class="col-form-label">Closing Balance as per Accounts:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="closing_amt_billsdiv">
						<form:input path="closing_balance_asper_accounts" id="closing_amt_bills" onChange="return closing_amt_billsValidation()" />
					</div>
					<div class="col-3" id="gsubdeps">
						<label class="col-form-label">Subsequent deposits:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="gsubdepsdiv">
						<form:input path="subsequent_deposits" id="gsubdeps" onchange="balanceamount();subseq_depoValidation()" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-3" id="gpftot">
						<label class="col-form-label">Total:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="totaldiv">
						<form:input path="total" id="total" />
					</div>
					<div class="col-3" id="gsubwith">
						<label class="col-form-label">Subsequent withdrawals:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="subseq_withdwdiv">
						<form:input path="subsequent_withdrawals" id="subseq_withdw" onchange="balanceamounts();subseq_withdwValidation()" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-3" id="gbal">
						<label class="col-form-label">Balance: <span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="balancediv">
						 <form:input path="balance" id="balance" onChange="return balanceValidation()" />
					</div>
					<div class="col-3" id="billnolabel" >
						<label class="col-form-label">Bill No: <span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="billnodiv">
					<form:input path="billno" id="billno" onChange="return billnoValidation()" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-3" id="billdate">
						<label class="col-form-label">Bill Date:  <span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="billdatediv">
						<input type="date" name="billdate" id="billdate"  onchange=" datediff();billdateValidation()" />
					</div>
					<div class="col-3" id="shopnamelabel">
						<label class="col-form-label"> Shop Name: <span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="shopnamediv">
						<form:input path="shopname" id="shopname" onChange="return shopnameValidation()" />
					</div>
				</div>
				
				<div class="row">
					<div class="col-3" id="lclaim">
						<label class="col-form-label">Last Claimed:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="lclaimdiv">
						<form:input path="last_claimed" id="lclaim1" onChange="return lclaimValidation()"></form:input>
					</div>
				</div>

				<div class="row">
					<div class="col-3" id="amountclaimlabel">
						<label for="requestno" class="col-form-label">Amount Claimed:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="amountclaiminput">
						<form:input path="amount_claimed" id="amount_cla" onChange="return amount_claValidation()" />
					</div>
					<div class="col-3"></div>
					<div class="col-3"></div>
				</div>
<!-- 				<div class="row" id="ceares"> -->
<!-- 					<div class="col-3"> -->
<!-- 						<label for="remarks" class="col-form-label">Remarks:<span style="color: red">*</span></label> -->
<!-- 					</div> -->
<!-- 					<div class="col-4"> -->
<%-- 						<form:textarea path="remarks" cols="22" id="remarks" onChange="return remarksValidation()" /> --%>
<!-- 					</div> -->
<!-- 				</div> -->



				<div class="row" id="submit">
					<div class="col-5"></div>
					<div class="col-2">
						<input type="submit" id="search" class="btn btn-success px-3"
							onchange="return Validate(this)" value="Submit" />
					</div>
					<div class="col-5"></div>
				</div>
			</form:form>



		</div>

	</section>
</body>
</html>
