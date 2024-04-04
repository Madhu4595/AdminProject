<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMP GPF ADVANCE FORM</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script type="text/javascript">
 function validate(){
	// alert("validate");
	 
	 //financialYear
	 var financialYear = $("#financialYear").val();
	 if(financialYear == "" || financialYear == null){
		 alert("Closing balance as per statement for the year is required please choose one.");
		 $("#financialYear").focus();
		 return false;
	 }
	 
	 //closingBalance
	 var closingBalance = $("#closingBalance").val();
	 if(closingBalance == "" || closingBalance == null){
		 alert("Closing balance as per statement for the year amount is required please enter.");
		 $("#closingBalance").focus();
		 return false;
	 }
	 
	 //creditOnAccountFrom
	 var creditOnAccountFrom = $("#creditOnAccountFrom").val();
	 if(creditOnAccountFrom == "" || creditOnAccountFrom == null){
		 alert("Credit on account of monthly subscription From is required please enter.");
		 $("#creditOnAccountFrom").focus();
		 return false;
	 }
	 
	 //creditOnAccountTo
	 var creditOnAccountTo = $("#creditOnAccountTo").val();
	 if(creditOnAccountTo == "" || creditOnAccountTo == null){
		 alert("Credit on account of monthly subscription To is required please enter.");
		 $("#creditOnAccountTo").focus();
		 return false;
	 }
	 
	 //creditOnAccountRs
	 var creditOnAccountRs = $("#creditOnAccountRs").val();
	 if(creditOnAccountRs == "" || creditOnAccountRs == null){
		 alert("Credit on account of monthly subscription Rupees is required please enter.");
		 $("#creditOnAccountRs").focus();
		 return false;
	 }
	 
	 return true;
 }
 </script>
</head>
<body>
	<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/empLogin.jsp"%>
<%-- 	<%@include file="/WEB-INF/views/navbar2.jsp"%> --%>


	<div class="container">
		<div class="row">
<!-- 			<div class="col-3"> -->
<!-- 				<div class="card" -->
<!-- 					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;"> -->
<!-- 										<div class="card-header"> -->

<!-- 										</div> -->
<!-- 					<div class="card-body"> -->
<%-- 						<img src="data:image/png;base64,${photo }" alt="Image" --%>
<!-- 							width="100px;" height="100px;" /><br> <span -->
<!-- 							style="color: blue;">Employee Details</span><br> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<td>Code</td> -->
<%-- 								<td>: ${emp.code }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Name</td> -->
<%-- 								<td>: ${emp.name }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Designation</td> -->
<%-- 								<td>: ${emp.designation }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Basic Pay</td> -->
<%-- 								<td>: ${emp.basic_pay }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Place</td> -->
<%-- 								<td>: ${emp.place }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>E-Mail</td> -->
<%-- 								<td>: ${emp.email }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Phone No</td> -->
<%-- 								<td>: ${emp.phno }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>DO Joining</td> -->
<%-- 								<td>: ${emp.doj }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>DO Retirement</td> -->
<%-- 								<td>: ${emp.date_of_retirement }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>DOB</td> -->
<%-- 								<td>: ${emp.dob }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>Payscale</td> -->
<%-- 								<td>: ${emp.payscale }</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>CGHS Code</td> -->
<%-- 								<td>: ${emp.ecghsCode }</td> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				<div class="card-footer" align="center"> -->
<!-- 									<a href="./editEmpDetails" style=" padding: 2px;border-radius: 5px;">Edit Details</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 										</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="col-12" style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
			
				<div align="center">
					<div class="col-sm-12">
						<h6 class="h6 text-primary" style="text-decoration: underline;">EMPLOYEE GPF ADVANCE APPLY FORM</h6>
					</div>
				</div>


				<form:form action="./saveEmpGpfAdvanceApplyForms" modelAttribute="bean" method="post" onsubmit="return validate();">
				
					<input type="hidden" name="empCode" id="empCode" value="${emp.code }" class="form-control" />

  					<div class="row"> 
						<div class="col-6 font-weight-bold text-info"> GPF Account No : ${emp.gpfaccno } </div>
					</div>
					<br>
					<div class="row">
						<div class="col-12">
							<label class="form-lable font-weight-bold">Balance at the
								credit of the subscriber on the date of application as below</label>
						</div>
					</div>
					<div class="row form-inline">
						<div class="col-6">
							<label>i. Closing balance as per statement for the year</label> 
							<select name="financialYear" id="financialYear" class="form-control" style="width: 47%;">
								<option value="">-select-</option>
								<c:forEach items="${yearsList }" var="bean">
									<option value="${bean }">${bean } </option>
								</c:forEach>
							</select>  
							<input type="text" name="closingBalance" id="closingBalance" class="form-control" style="width: 52%;" placeholder="Rs." oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
						</div>
						<div class="col-6">
							<label>ii. Credit on account of monthly subscription </label> 
							<input type="text" name="creditOnAccountFrom" id="creditOnAccountFrom" class="form-control" placeholder="From" style="width: 29%;" />
							<input type="text" name="creditOnAccountTo" id="creditOnAccountTo" class="form-control" placeholder="To" style="width: 29%;" /> 
							<input type="text" name="creditOnAccountRs" id="creditOnAccountRs" class="form-control" style="width: 40%;" placeholder="Rs." oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
						</div>
					</div>
					<div class="row form-inline">
						<div class="col-6">
							<label>iii. Refund </label> 
							<input type="text" name="refundFrom" id="refundFrom" class="form-control" placeholder="From" style="width: 29%;" /> 
							<input type="text" name="refundTo" id="refundTo" class="form-control" placeholder="To" style="width: 29%;" /> 
							<input type="text" name="refundRs" id="refundRs" class="form-control" style="width: 40%;" placeholder="Rs." oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
						</div>
						<div class="col-6">
							<label>iv. Total </label> 
							<input type="text" name="total" id="total" class="form-control" style="width: 100%;" />
						</div>
					</div>
					<div class="row form-inline">
						<div class="col-6">
							<label>v. withdrawal during period </label> 
							<input type="text" name="withdrawPeriodFrom" id="withdrawPeriodFrom" style="width: 28%;" class="form-control" placeholder="From" />
							<input type="text" name="withdrawPeriodTo" id="withdrawPeriodTo" style="width: 30%;" class="form-control" placeholder="To" /> 
							<input type="text" name="withdrawAmt" id="withdrawAmt" style="width: 40%;" class="form-control" placeholder="Rs" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
						</div>
						<div class="col-6">
							<label>vi. Net balance at credit </label> 
							<input type="text" name="netCreditBalance" id="netCreditBalance" class="form-control" style="width: 100%;" />
						</div>
					</div>

					<br>
					<br>
					<div class="row">
						<div class="col-6">
							<label>Amount of advance outstanding </label> 
							<input type="text" name="amtAdvanceOutstanding" id="amtAdvance" class="form-control" style="width: 100%;" />
						</div>
						<div class="col-6">
							<label>Amount of advance required </label> 
							<input type="text" name="amtAdvanceRequired" id="amtAdvanceRequired" class="form-control" style="width: 100%;" />
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label>Purpose for which the advance is required</label> 
							<input type="text" name="advancePurpose" id="advancePurpose" class="form-control" style="width: 100%;" />
						</div>
						<div class="col-6">
							<label>Rules under which the request is covered</label> 
							<input type="text" name="requestRulesCovered" id="requestRulesCovered" class="form-control" style="width: 100%;" />
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-12">
							<label class="form-lable font-weight-bold">If advance is
								bought for House Building, etc., following information may be
								given</label>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Location & measurement of the
								Plot </label> 
								<input type="text" class="form-control" name="plotLocAndMeasure">
						</div>
						<div class="col-6">
							<label class="form-label"> Whether plot is free hold or
								on lease </label> 
								<input type="text" class="form-control" name="plotFreehold">
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Plan for construction </label> 
							<input type="text" class="form-control" name="planForConstruction">
						</div>
						<div class="col-6">
							<label class="form-label"> If the flat or plot being
								purchased is from a H.B. Society, the name of the society, the
								location and the measurements, etc. </label> <input type="text"
								name="platPurchaseSociety" class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Cost of construction </label> <input
								type="text" class="form-control" name="costOfConstruction">
						</div>
						<div class="col-6">
							<label class="form-label"> If the purchase of flat is
								from DDA or any Housing Board, etc. the location, dimension,
								etc. may be given </label> <input type="text" class="form-control"
								name="platPurchaseBoard">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-12">
							<label class="form-lable font-weight-bold">If advance is
								required for education of children, following details may be
								given</label>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Name of the Son / Daughter </label> <input
								type="text" class="form-control" name="nameOfSChildren">
						</div>
						<div class="col-6">
							<label class="form-label"> Class and Institution /
								College where studying </label> <input type="text" class="form-control"
								name="childrenInstitution">
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Whether a day scholar or a
								hostler</label> <input type="text" class="form-control"
								name="scholarOrHostler">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-12">
							<label class="form-lable font-weight-bold">If advance is
								required for treatment of ailing family members, following
								details may be given.</label>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Name of the Patient and
								Relationship </label> <input type="text" class="form-control"
								name="patientNameAndRelation">
						</div>
						<div class="col-6">
							<label class="form-label"> Name of the Hospital /
								Dispensary / Doctor where the patient is undergoing treatment </label> <input
								type="text" class="form-control" name="hospitalName">
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Whether Outdoor / Indoor
								patient</label> <input type="text" class="form-control"
								name="indoorOrOutdoor">
						</div>
						<div class="col-6">
							<label class="form-label"> Whether re-imbursement
								available or not</label> <input type="text" class="form-control"
								name="reimbursement">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-12">
							<label class="form-lable font-weight-bold">In case of
								advance under 8(c) to 8(e), no certificate or documentary
								evidence would be required</label>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label class="form-label"> Account of the consolidated
								advance (item No. 6 & 7) and number of the monthly instalments
								in which consolidated advance is proposed to repaid</label>
						</div>
						<div class="col-6">
							<label class="form-label"> Full particulars of the
								pecuniary circumstances of the subscriber, justifying the
								application for the advance</label>
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<input type="text" class="form-control" name="advanceAmt">
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="installments">
						</div>
						<div class="col-6">
							<input type="text" class="form-control"
								name="pecuniaryCircumstances">
						</div>
					</div>

					<div align="center">
						<input type="submit" class="btn btn-success m-1" value="Submit" />
					</div>
				</form:form>
			</div>
		</div>
	</div>


</body>
</html>