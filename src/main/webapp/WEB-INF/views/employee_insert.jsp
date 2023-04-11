<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./sass/style.css" />
<link type="text/css"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" />

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function() {
    $("#dob").datepicker({ dateFormat: 'dd/mm/yy' });
});

function rupeeformat(value){
	//alert(value);
	 var x=value;
	    x=x.toString();
	    var lastThree = x.substring(x.length-3);
	    var otherNumbers = x.substring(0,x.length-3);
	    if(otherNumbers != '')
	        lastThree = ',' + lastThree;
	    var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
	    document.getElementById('basic_pay').value=res;
}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function allowAlphaNumericSpace(e) {
	  var code = ('charCode' in e) ? e.charCode : e.keyCode;
	  if (!(code == 32) && // space
	    !(code > 47 && code < 58) && // numeric (0-9)
	    !(code > 64 && code < 91) && // upper alpha (A-Z)
	    !(code > 96 && code < 123)) { // lower alpha (a-z)
	    e.preventDefault();
	  }
	}
function Validation(){
	//alert("validation")
	var code = document.getElementById('code').value;
	var name = document.getElementById('name').value;
	var edesignation = document.getElementById('edesignation').value;
	var basic_pay = document.getElementById('basic_pay').value;
	var dob = document.getElementById('dob').value;
	//var bank_acno = document.getElementById('bank_acno').value;
	//var ifsc_code = document.getElementById('ifsc_code').value;
	
	//null check
	if(code==null || code==''){
		alert("Please Enter Employee Code");
		document.getElementById('code').focus();
		return false;
	}
	 
	if(name==null || name==''){
		alert("Please Enter Name");
		document.getElementById('name').focus();
		return false;
	}
	if(edesignation==null || edesignation==''){
		alert("Please Enter Designation");
		document.getElementById('edesignation').focus();
		return false;
	}
	if(basic_pay==null || basic_pay==''){
		alert("Please Enter Basic Pay");
		document.getElementById('basic_pay').focus();
		return false;
	}
	if(dob==null || dob==''){
		alert("Please Enter Date of Birth");
		document.getElementById('dob').focus();
		return false;
	}
// 	if(bank_acno==null || bank_acno==''){
// 		alert("Please Enter Bank Name");
// 		document.getElementById('bank_acno').focus();
// 		return false;
// 	}
// 	if(ifsc_code==null || ifsc_code==''){
// 		alert("Please Enter IFSC Code");
// 		document.getElementById('ifsc_code').focus();
// 		return false;
// 	}
//size check
	
	if(code.length>4){
		   alert("Please enter 4 digits Emploee Code");
		   $('#code').val('');
		   $('#code').focus();
		   return false;
	   }
	if(name.length>50){
		   alert("Please enter Name");
		   $('#name').val('');
		   $('#name').focus();
		   return false;
	   }
// 	if(basic_pay.length>6){
// 		   alert("Please enter Basic Pay Correctly");
// 		   $('#basic_pay').val('');
// 		   $('#basic_pay').focus();
// 		   return false;
// 	   }
	
// 	if(bank_acno.length>18){
// 		   alert("Please enter Bank Account Number Correctly");
// 		   $('#bank_acno').val('');
// 		   $('#bank_acno').focus();
// 		   return false;
// 	   }
}

function addOwner(a){ 
	 //console.log( $(a).closest('tr').clone());
    var tr = $(a).closest('tr').clone();//.insertAfter("tr:last");
    //$(tr).find('input').val('');
    $(tr).find('input').attr('readonly', true);
    $(tr).find('input:last').val('Remove').attr("onclick","removeOwner(this)");
    tr.insertBefore('#multi tbody tr:last');
    var tr = $(a).closest('tr');
   $(tr).find('input').val('');
   $(tr).find('input:last').val('Add Family');

}
function removeOwner(a)
{
	 $(a).closest('tr').remove();
}
function searchempno(){
	
	  var code = $('#code').val();	
	  //alert("searchempno()"+code);
  	  document.getElementById("code").readonly=true;
  	  
//   		 $.getJSON('employeesearchnum.action?code=' + eno, function (response) {
//   			 if (response) {				
//   				 //alert(response.dob);
//   	             if(response.Error=='Success'){
//   	             document.getElementById("name").value =response.name;
//   	           //  document.getElementById("edesignation").value =response.designation;
//   	           	 document.getElementById("basic_pay").value =response.basic_pay;
//   	         	 document.getElementById("dob").value =response.dob;  	         
//   	       		 document.getElementById("bank_acno").value =response.bank_acno;
//   	     		 document.getElementById("ifsc_code").value =response.ifsc_code;
//   	   			 document.getElementById("egst").value =response.gst_no;
//   	   		 $("#edesignation option[value="+response.designation+"]").prop('selected', true);
//   	         }}
//   		 });
  		 
  		$.get('./employeesearchnum',{code : code}, function (response) {
	             document.getElementById("name").value =response[0];
	           //	 $("#edesignation option[value="+response[1]+"]").prop('selected', true);
	           	 document.getElementById("edesignation").value =response[1];
	           	 document.getElementById("basic_pay").value =response[2];
	         	 document.getElementById("dob").value =response[3];  	         
	       		 //document.getElementById("bank_acno").value =response[4];
	     		 document.getElementById("egst").value =response[4];
	     		 document.getElementById("place").value =response[5];
	   		 	//$("#egst option[value="+response[6]+"]").prop('selected', true);
		 });
  		 
  		$.ajax({
			type: "get",
		    url: "./employeefamilysearch",
		    data: "code=" + code,
		    cache: false,
		    success: function(html)
		    {
		    	
		    	//alert(html);
		    	$("#search").hide();	
		    	$("#submit_btn").show();	
		    	$("#allowance_response").html(html);	
		    	//$("#addfamily").hide();
		    	 
		    	document.getElementById("empinsert").action = document.getElementById("formaction").value;
		    	//document.myform.action = empinsert;
		    	//return allowancecheck();
	       }
		});
  		 
  		 
}
</script>
<body>

	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<section class="container mt-5 shadow py-5 ">
		<h4 align="center" class="sendhead">EMPLOYEE INSERT</h4>
		<div align="left" style="padding-left: 50px;">

			<form:form action="./empinsert" method="post"
				onsubmit="return Validation();" modelAttribute="employee"
				name="empinsert" id="empinsert">
				<div class="abc">



					<p class="bb">
						<b>Basic Details</b>
					</p>
					<table>
						<tr>
							<td>Employee Code:</td>
							<td><form:input path="code" maxlength="4" id="code"
								onchange="searchempno()" onkeypress="return isNumberKey(event)"
								style="width: 50px;"/></td>
						</tr>
						<tr>
							<td>Employee Name:</td>
							<td><form:input path="name" maxlength="50"
								id="name" style="width: 300px;"/><br>
						</tr>
						<tr>
							<td>Designation:</td>
							<td>
							<input type="text" name="edesignation" id="edesignation" style="width: 300px; height: 26px;"/>
<!-- 							<select name="edesignation" id="edesignation" -->
<!-- 								style="width: 170px; height: 26px;"> -->
<!-- 									<option value="">-select-</option> -->
<%-- 									<c:forEach items="${desglist}" var="list"> --%>
<%-- 										<option value="${list.id }">${list.name}</option> --%>
<%-- 									</c:forEach> --%>

<!-- 							</select>  -->
							<br>
						</tr>
						<tr>
							<td>Basic Pay:</td>
							<td><form:input path="basic_pay" id="basic_pay" maxlength="6"
								onkeypress="return isNumberKey(event)"
								onchange="return rupeeformat(this.value) " style="width: 300px; height: 26px;"/><br>
						</tr>
						<!-- 	<tr><td>Date of Birth:</td><td><input type="date" name="dob" id="dob"><br></tr> -->
						<tr>
							<td>Date of Birth:</td>
							<td><form:input path="dob" id="dob" style="width: 300px; height: 26px;" /><br>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>Bank Account Number:</td> -->
<%-- 							<td><form:input path="bank_acno" id="bank_acno" --%>
<%-- 								maxlength="18" onkeypress="return isNumberKey(event)"/><br> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>IFSC Code:</td> -->
<%-- 							<td><form:input path="ifsc_code" id="ifsc_code" --%>
<%-- 								onkeypress="allowAlphaNumericSpace(event)" maxlength="11"/><br> --%>
<!-- 						</tr> -->
						<tr>
							<td>Pay Scale/Level:</td>
							<td>
									<input type="text" name="egst" id="egst" style="width: 300px; height: 26px;"> 
<!-- 								<select -->
<!-- 								name="egst" id="egst" style="width: 100px; height: 26px;"> -->
<%-- 									<c:forEach items="${pscalelist}" var="list"> --%>
<%-- 										<option value="${list.id}">${list.name}</option> --%>
<%-- 									</c:forEach> --%>

<!-- 							</select>  -->
							<br>
						</tr>

						<tr>
							<td>State / Dist Employee</td>
							<td>
							<input type="text" name="place" id="place" style="width: 500px;" />
							
<!-- 								<select name="place" id="place" > -->
<!-- 									<option value="">-select-</option> -->
<!-- 									<option value="state">State</option> -->
<!-- 									<option value="district">District</option> -->
<!-- 								</select> -->
							</td>
						</tr>
					</table>
				</div>
				<br>

				<div class="abc">
					<p class="bb">
						<b>Family Details</b>
					</p>
					<div id="allowance_response"></div>


				</div>
				<table>

					<tr>
						<td><input type="submit" class="btn btn-warning px-3"
							value="Submit" /></td>

					</tr>
				</table>
			</form:form>
		</div>


	</section>