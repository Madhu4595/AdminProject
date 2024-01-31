<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMP GPF APPLY FORM</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css" >

<script>
function validate(){
	alert("validate");
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/navbar2.jsp"%>
	<div align="center" style="font-weight: bolder; color: red;">${msg }</div>

	<form:form action="./saveEmpGpfApplyForm" method="post"
		modelAttribute="bean">
		<div class="container-fluid">
			<div class="row">
				<div class="col-3">
					<div class="card"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<!-- 					<div class="card-header"> -->

						<!-- 					</div> -->
						<div class="card-body">
							<img src="data:image/png;base64,${photo }" alt="Image"
								width="100px;" height="100px;" /><br> <span
								style="color: blue;">Employee Details</span><br>
							<table>
								<tr>
									<td>Code</td>
									<td>: ${emp.code }</td>
								</tr>
								<tr>
									<td>Name</td>
									<td>: ${emp.name }</td>
								</tr>
								<tr>
									<td>Designation</td>
									<td>: ${emp.designation }</td>
								</tr>
								<tr>
									<td>Basic Pay</td>
									<td>: ${emp.basic_pay }</td>
								</tr>
								<tr>
									<td>Place</td>
									<td>: ${emp.place }</td>
								</tr>
								<tr>
									<td>E-Mail</td>
									<td>: ${emp.email }</td>
								</tr>
								<tr>
									<td>Phone No</td>
									<td>: ${emp.phno }</td>
								</tr>
								<tr>
									<td>DO Joining</td>
									<td>: ${emp.doj }</td>
								</tr>
								<tr>
									<td>DO Retirement</td>
									<td>: ${emp.date_of_retirement }</td>
								</tr>
								<tr>
									<td>DOB</td>
									<td>: ${emp.dob }</td>
								</tr>
								<tr>
									<td>Payscale</td>
									<td>: ${emp.payscale }</td>
								</tr>
								<tr>
									<td>CGHS Code</td>
									<td>: ${emp.ecghsCode }</td>
								</tr>
							</table>
						</div>
						<!-- 					<div class="card-footer"> -->
						<!-- 				<a href="#" style="border: 1px solid black;padding: 2px;border-radius: 5px;font-weight: bold;">VIEW MORE</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
						<!-- 				<a href="#" style="border: 1px solid black;padding: 2px;border-radius: 5px;font-weight: bold;">EDIT DETAILS</a> -->
						<!-- 					</div> -->
					</div>
				</div>
				<div class="col-9"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">

					<form:form action="./saveEmpGpfApplyForm" method="post"
						modelAttribute="bean">
						<div style="color: blue;text-decoration: underline;font-weight: bold;" align="center">EMPLOYEE GPF
							WITHDRAW APPLY FORM</div>
<!-- 						<div class="row"> -->
<!-- 							<div class="col-2"> -->
								<input type="hidden" name="empCode" id="empCode" value="${emp.code }"
									class="form-control" />
<!-- 							</div> -->
<!-- 						</div> -->

						<div class="row">
							<div class="col-6">
								1. Basic Pay <input type="text" name="basicPay" id="basicPay"
									class="form-control" />
							</div>
							<div class="col-6">
								2. GPF Account No. <input type="text" name="gpfAccNo"
									id="gpfAccNo" class="form-control" />
							</div>
						</div>

						<div class="row mt-4">
							<div class="col-12 fw-bolder">3. Balance at the credit of
								the subscriber on the date of application as given below:</div>
						</div>

						<div class="row">
							<div class="col-5 pt-2">
								<label>i. Closing balance as per statement for the year</label>
							</div>
							<div class="col-3">
								<input type="text" name="closingBalanceyear"
									id="closingBalanceyear" class="form-control mt-1"
									placeholder="Year" />
							</div>
							<div class="col-4">
								<input type="text" name="closingBalanceRs"
									id="closingBalanceyearRs" class="form-control mt-1"
									placeholder="Rs" />
							</div>
						</div>

						<div class="row">
							<div class="col-2 mt-2">ii. Credit</div>
							<div class="col-3">
								<input type="text" name="creditFrom" id="creditFrom"
									class="form-control mt-1 " placeholder="From" />
							</div>
							<div class="col-3">
								<input type="text" name="creditTo" id="creditTo"
									class="form-control mt-1 " placeholder="To" />
							</div>
							<div class="col-4">
								<input type="text" name="creditRs" id="creditRs"
									class="form-control mt-1" placeholder="Rs" />
							</div>
						</div>

						<div class="row">
							<div class="col-5 mt-2">iii. Refund made to the fund after
								closing balance vide(i) above</div>
							<div class="col-7">
								<input type="text" name="refundRs" id="refundRs"
									class="form-control mt-1" placeholder="Rs" />
							</div>
						</div>

						<div class="row">
							<div class="col-3 mt-2">iv. Withdrawal during the period</div>
							<div class="col-2">
								<input type="text" name="withdrawPeriodFrom"
									id="withdrawPeriodFrom" class="form-control mt-1 "
									placeholder="From" />
							</div>
							<div class="col-3">
								<input type="text" name="withdrawPeriodTo" id="withdrawPeriodTo"
									class="form-control mt-1 " placeholder="To" />
							</div>
							<div class="col-4">
								<input type="text" name="withdrawPeriodRs" id="withdrawPeriodRs"
									class="form-control mt-1" placeholder="Rs" />
							</div>
						</div>

						<div class="row">
							<div class="col-5 mt-2">v. Net balance at credit on date of
								application</div>
							<div class="col-3">
								<input type="date" name="netCreditDate" id="netCreditDate"
									class="form-control mt-1 " />
							</div>
							<div class="col-4">
								<input type="text" name="netCreditRs" id="netCreditRs"
									class="form-control mt-1" placeholder="Rs" />
							</div>
						</div>

						<div class="row">
							<div class="col-4 mt-2">4.a. Purpose for the withdrawal is
								required</div>
							<div class="col-2">
								<input type="text" name="withdrawPurpose" id="withdrawPurpose"
									class="form-control mt-1" />
							</div>
							<div class="col-4 mt-2">b. Rule under which the request is
								covered</div>
							<div class="col-2">
								<input type="text" name="withdrawRule" id="withdrawRule"
									class="form-control mt-1" />
							</div>
						</div>

						<div class="row">
							<div class="col-6 mt-2">5. Whether any withdrawal was taken
								for the same purpose earlier. If so,</div>
							<div class="col-3">
								<input type="text" name="earlierWithdrawRs"
									id="earlierWithdrawRs" class="form-control mt-1"
									placeholder="Amount" />
							</div>
							<div class="col-3">
								<input type="text" name="earlierWithdrawYear"
									id="earlierWithdrawYear" class="form-control mt-1"
									placeholder="Year" />
							</div>
						</div>

						<div class="row">
							<div class="col-6 mt-2">6. Name of the account officer
								maintaining the Provident Fund Accounts</div>
							<div class="col-6">
								<input type="text" name="pfAccount" id="pfAccount"
									class="form-control mt-1" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-4"></div>
							<div class="col-4 mt-2"> 
								<input type="submit" class="btn btn-success form-control" onclick="validate();" />
							</div>
							<div class="col-4"></div>
						</div>
					</form:form>



				</div>
			</div>
		</div>
	</form:form>

</body>
</html>