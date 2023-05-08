<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GPF - WithDraw</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script>
	$(document).ready(function(){
		
		$("#empCode").val('');
		
		$("#gpfNodiv").hide();
		$("#gpfNo").val('');
		
		$("#purposediv").hide();
		$("#purpose").val('');
		
		$("#withDrawAmtdiv").hide();
		$("#withDrawAmt").val('');
		
		$("#netBalancediv").hide();
		$("#netBalance").val('');
		
		$("#submitdiv").hide();
	});
	function findEmp(){
		//alert("findEmp()");
		var empcode = $("#empCode").val();
		$.ajax({
			type: "get",
			url: "./empNameandDesignation?empcode="+empcode,
			cache: false,
			success:function(resp){
				//alert("success=> "+resp);
				document.getElementById("empspan").innerHTML = resp;
				
				$("#gpfNodiv").show();
				$("#purposediv").show();
				$("#withDrawAmtdiv").show();
				$("#netBalancediv").show();
				$("#submitdiv").show();
				
				$("#empCode").prop('readonly',true);
			},
			error:function(resp){
				//alert("error => "+resp);
				alert("Employee is Not Found with Given Employee Code!!");
			}
		});
	}
	function validate(){
		//alert("validate")
		
		var gpfNo = $("#gpfNo").val();
		var purpose = $("#purpose").val();
		var withDrawAmt = $("#withDrawAmt").val();
		var netBalance = $("#netBalance").val();
		
		if(gpfNo === "" || gpfNo === null){ alert("GPF Number is Required Please Enter!"); $("#gpfNo").focus(); return false; }
		if(purpose === "" || purpose === null){ alert("Purpose is Required Please Enter!"); $("#purpose").focus(); return false; }
		if(withDrawAmt === "" || withDrawAmt === null){ alert("WithDraw Amount is Required Please Enter!");  $("#withDrawAmt").focus();  return false; }
		if(netBalance === "" || netBalance === null){ alert("Net Balance is Required Please Enter!");  $("#netBalance").focus(); return false; }
		
		return true;
	}
</script>
</head>
<body>

	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	
	<div align="center">
		<h3 class="h3 font-weight-bolder">GPF - WithDraw Entry Form</h3>
	</div>
	<center style="color: red;">
		<h3>
			<b> ${msg} </b>
		</h3>
	</center>
	
	<div class="container mt-4 border font-weight-bolder p-4"
		style="background-color: #e6ffff;">
		<form:form action="./saveWithDrawGpf" method="post" modelAttribute="gpf"  onsubmit="return validate()">
			<div class="row align-items-center m-2 mb-4">
				<div class="col-4">
					<label for="monthYear" class="col-form-label">Employee Code:</label>
				</div>
				<div class="col-4">
					<input type="text" name="empCode" id="empCode"
						placeholder="Ex: 3586" class="form-control" onchange="return findEmp()"/>
				</div>
				<div class="col-4"><span id="empspan"></span></div>
			</div>
			<div class="row align-items-center m-2" id="gpfNodiv">
				<div class="col-4">
					<label for="period" class="col-form-label">GPF Number:</label>
				</div>
				<div class="col-4">
					<input type="text" name="gpfNo" id="gpfNo" placeholder="Ex: PAO/NIC/GPF/2027" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="purposediv">
				<div class="col-4">
					<label for="billno" class="col-form-label">Purpose:</label>
				</div>
				<div class="col-4">
					 <form:select path="purpose" id="purpose" class="form-control">
					 	<form:option value="">-select-</form:option>
					 	<form:option value="consumer_durable15(1)(A)">Consumer Durable in terms of Rule 15(1)(A)</form:option>
					 	
					 </form:select>
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="withDrawAmtdiv">
				<div class="col-4">
					<label for="billdate" class="col-form-label">WithDraw Amount:</label>
				</div>
				<div class="col-4">
					<input type="text" name="withDrawAmt" id="withDrawAmt"
						placeholder="Ex: 20000" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="netBalancediv">
				<div class="col-4">
					<label for="amount" class="col-form-label">Net Balance:</label>
				</div>
				<div class="col-4">
					<input type="text" name="netBalance" id="netBalance" placeholder="Ex: 200000" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="submitdiv">
				<div class="col-4"></div>
				<div class="col-4">
					<input type="submit" class="btn btn-success" style="width: 300px;" />
				</div>
				<div class="col-4"></div>
			</div>
		</form:form>
	</div>

</body>
</html>