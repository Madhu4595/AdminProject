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

$(document).ready(function() {
			
			$.ajax({
				type : "get",
				url : "./getFinancialYears",
				cache : false,
				timeout : 600000,
				success : function(resp) {
					//alert(resp);
					// alert(resp.length);
					// $("#financialYear").empty();
					$("#closingBalanceyear").append('<option value="">-select-</option>');
					for (var k = 0; k < resp.length; k++) {
						var bean = resp[k];
						$("#closingBalanceyear").append(
								'<option value="'+bean+'">' + bean
										+ '</option>');
					}
				}
			});
			
		});
function validate(){
	//alert("validate");
	
	/**
	
	//closingBalanceyear
	var closingBalanceyear = $("#closingBalanceyear").val();
	if(closingBalanceyear == "" || closingBalanceyear == null){
		alert("Year is required Closing balance as per statement."); 
		$("#closingBalanceyear").focus();
		return false;
	}
	
	//closingBalanceyearRs
	var closingBalanceyearRs = $("#closingBalanceyearRs").val();
	if(closingBalanceyearRs == "" || closingBalanceyearRs == null){
		alert("Rupees is required Closing balance as per statement."); 
		$("#closingBalanceyearRs").focus();
		return false;
	}
	
	//creditFrom
	var creditFrom = $("#creditFrom").val();
	if(creditFrom == "" || creditFrom == null){
		alert("Credit from is required."); 
		$("#creditFrom").focus();
		return false;
	}
	
	//creditTo
	var creditTo = $("#creditTo").val();
	if(creditTo == "" || creditTo == null){
		alert("Credit To is required."); 
		$("#creditTo").focus();
		return false;
	}
	
	//creditRs
	var creditRs = $("#creditRs").val();
	if(creditRs == "" || creditRs == null){
		alert("Credit Rupees is required."); 
		$("#creditRs").focus();
		return false;
	}
	
	//refundRs
	var refundRs = $("#refundRs").val();
	if(refundRs == "" || refundRs == null){
		alert("Rupees is required for Refund made to the fund after closing balance."); 
		$("#refundRs").focus();
		return false;
	}
	
	//withdrawPeriodFrom
	var withdrawPeriodFrom = $("#withdrawPeriodFrom").val();
	if(withdrawPeriodFrom == "" || withdrawPeriodFrom == null){
		alert("Withdrawal during the period From is required."); 
		$("#withdrawPeriodFrom").focus();
		return false;
	}
	
	//withdrawPeriodTo
	var withdrawPeriodTo = $("#withdrawPeriodTo").val();
	if(withdrawPeriodTo == "" || withdrawPeriodTo == null){
		alert("Withdrawal during the period To is required."); 
		$("#withdrawPeriodTo").focus();
		return false;
	}
	
	//withdrawPeriodRs
	var withdrawPeriodRs = $("#withdrawPeriodRs").val();
	if(withdrawPeriodRs == "" || withdrawPeriodRs == null){
		alert("Withdrawal during the period Rupees is required."); 
		$("#withdrawPeriodRs").focus();
		return false;
	}
	
	//netCreditDate
	var netCreditDate = $("#netCreditDate").val();
	if(netCreditDate == "" || netCreditDate == null){
		alert("Net balance at credit on date of application date is required."); 
		$("#netCreditDate").focus();
		return false;
	}
	
	//netCreditRs
	var netCreditRs = $("#netCreditRs").val();
	if(netCreditRs == "" || netCreditRs == null){
		alert("Net balance at credit on date of application amount is required."); 
		$("#netCreditRs").focus();
		return false;
	}
	
	//withdrawAmt
	var withdrawAmt = $("#withdrawAmt").val();
	if(withdrawAmt == "" || withdrawAmt == null){
		alert("AMOUNT OF WITHDRAWAL REQUIRED."); 
		$("#withdrawAmt").focus();
		return false;
	}
	
	//withdrawPurpose
	var withdrawPurpose = $("#withdrawPurpose").val();
	if(withdrawPurpose == "" || withdrawPurpose == null){
		alert("Purpose for the withdrawal is required."); 
		$("#withdrawPurpose").focus();
		return false;
	}
	
	//withdrawRule
	var withdrawRule = $("#withdrawRule").val();
	if(withdrawRule == "" || withdrawRule == null){
		alert("Rule under which the request is covered is required."); 
		$("#withdrawRule").focus();
		return false;
	}
	
	//earlierWithdrawRs
	var earlierWithdrawRs = $("#earlierWithdrawRs").val();
	if(earlierWithdrawRs == "" || earlierWithdrawRs == null){
		alert("Whether any withdrawal was taken for the same purpose earlier. If so, rupees is required."); 
		$("#earlierWithdrawRs").focus();
		return false;
	}
	
	//earlierWithdrawYear
	var earlierWithdrawYear = $("#earlierWithdrawYear").val();
	if(earlierWithdrawYear == "" || earlierWithdrawYear == null){
		alert("Whether any withdrawal was taken for the same purpose earlier. If so, year is required."); 
		$("#earlierWithdrawYear").focus();
		return false;
	}
	
	//pfAccount
	var pfAccount = $("#pfAccount").val();
	if(pfAccount == "" || pfAccount == null){
		alert("Name of the account officer maintaining the Provident Fund Accounts is required."); 
		$("#pfAccount").focus();
		return false;
	}
	**/
	
	
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/empLogin.jsp"%>
<%-- 	<%@include file="/WEB-INF/views/navbar2.jsp"%> --%>

	<div align="center" style="font-weight: bolder; color: red;">${msg }</div>
	
	<div style="color: blue;text-decoration: underline;font-weight: bold;" align="center">EMPLOYEE GPF
							WITHDRAW APPLY FORM</div>

	<form:form action="./saveEmpGpfApplyForm" method="post"
		modelAttribute="bean" onsubmit="return validate();" target="_blank" >
		
		<div class="container">
			<div class="row">
				<div class="col-12"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">

					<form:form action="./saveEmpGpfApplyForm" method="post"
						modelAttribute="bean">
						
<!-- 						<div class="row"> -->
<!-- 							<div class="col-2"> -->
								<input type="hidden" name="empCode" id="empCode" value="${emp.code }"
									class="form-control"  />
<!-- 							</div> -->
<!-- 						</div> -->

						<div class="row m-1">
							<div class="col-8"> 1. Basic Pay  </div>
							<div class="col-4">: Rs. ${emp.basic_pay } /-</div>
						</div>
						<div class="row m-1">
							<div class="col-8"> 2. GPF Account No.  </div>
							<div class="col-4">: ${emp.gpfaccno } </div>
						</div>

						<div class="row m-1">
							<div class="col-12">3. Balance at the credit of the subscriber on the date of application as given below:</div>
						</div>

						<div class="row m-1">
							<div class="col-5 pt-2">
								<label>i. Closing balance as per statement for the year</label>
							</div>
							<div class="col-3">
								<select name="closingBalanceyear" id="closingBalanceyear" class="form-control mt-1">
							</select>
							
<!-- 								<input type="text" name="closingBalanceyear" -->
<!-- 									id="closingBalanceyear" class="form-control mt-1" -->
<!-- 									placeholder="Year" /> -->
							</div>
							<div class="col-4">
								<input type="text" name="closingBalanceRs" id="closingBalanceyearRs" class="form-control mt-1" placeholder="Rs" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-1">ii. Credit </div>
							<div class="col-2">
								<input type="text" name="creditFrom" id="creditFrom" maxlength="7" class="form-control mt-1 " oninput="this.value = this.value.replace(/[^0-9/]/g, '');" placeholder="From"  />
							</div>
							<div class="col-2">
								<input type="text" name="creditTo" id="creditTo" class="form-control mt-1 " maxlength="7" oninput="this.value = this.value.replace(/[^0-9/]/g, '');"  placeholder="To" />
							</div>
							<div class="col-3"> on account of monthly subscription form </div>
							<div class="col-4">
								<input type="text" name="creditRs" id="creditRs" class="form-control mt-1" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Rs" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-8">iii. Refund made to the fund after closing balance vide(i) above</div>
							<div class="col-4">
								<input type="text" name="refundRs" id="refundRs" class="form-control mt-1" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Rs" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-3">iv. Withdrawal during the period</div>
							<div class="col-2">
								<input type="text" name="withdrawPeriodFrom" id="withdrawPeriodFrom" class="form-control mt-1 " maxlength="7" oninput="this.value = this.value.replace(/[^0-9/]/g, '');" placeholder="From" />
							</div>
							<div class="col-3">
								<input type="text" name="withdrawPeriodTo" id="withdrawPeriodTo" class="form-control mt-1 " maxlength="7" oninput="this.value = this.value.replace(/[^0-9/]/g, '');" placeholder="To" />
							</div>
							<div class="col-4">
								<input type="text" name="withdrawPeriodRs" id="withdrawPeriodRs" class="form-control mt-1" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Rs" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-5">v. Net balance at credit on date of
								application</div>
							<div class="col-3">
								<input type="date" name="netCreditDate" id="netCreditDate" class="form-control mt-1 " />
							</div>
							<div class="col-4">
								<input type="text" name="netCreditRs" id="netCreditRs" class="form-control mt-1" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Rs" />
							</div>
						</div>
						
						<div class="row m-1">
							<div class="col-8">
								4. AMOUNT OF WITHDRAWAL REQUIRED
							</div>
							<div class="col-4">
								<input type="text" name="withdrawAmt" id="withdrawAmt" class="form-control mt-1" oninput="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="Rs" />
							</div>
						</div>
						

						<div class="row m-1">
							<div class="col-8">5.a. Purpose for the withdrawal is required</div>
							<div class="col-4">
								<input type="text" name="withdrawPurpose" id="withdrawPurpose" class="form-control mt-1" />
							</div>
						</div>
						<div class="row m-1">
							<div class="col-8">5.b. Rule under which the request is
								covered</div>
							<div class="col-4">
								<input type="text" name="withdrawRule" id="withdrawRule" class="form-control mt-1" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-8">6. Whether any withdrawal was taken for the same purpose earlier. If so,</div>
							<div class="col-2">
								<input type="text" name="earlierWithdrawRs" id="earlierWithdrawRs" class="form-control mt-1" placeholder="Rs." oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
							</div>
							<div class="col-2">
								<input type="text" name="earlierWithdrawYear" id="earlierWithdrawYear" class="form-control mt-1" placeholder="Year" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
							</div>
						</div>
						
						
						

						<div class="row m-1">
							<div class="col-8">7. Name of the account officer maintaining the Provident Fund Accounts</div>
							<div class="col-4">
								<input type="text" name="pfAccount" id="pfAccount" class="form-control mt-1" />
							</div>
						</div>

						<div class="row m-1">
							<div class="col-4"></div>
							<div class="col-4 mt-2"> 
								<input type="submit" class="btn btn-success form-control"  />
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