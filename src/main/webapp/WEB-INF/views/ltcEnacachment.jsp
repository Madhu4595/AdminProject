<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LTC EL Enacachment</title>

<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script>
$(document).ready(function(){
	
	//empcodelable
	//empcode
	//blockyearlable
	$("#blockyearlable").hide();
	//blockyear
	$("#blockyear").hide(); $("#blockyear").val('');
	//locationlable
	$("#locationlable").hide();
	//location
	$("#location").hide(); $("#location").val('');
	//visitplacelable
	$("#visitplacelable").hide();
	//visitplace
	$("#visitplace").hide(); $("#visitplace").val('');
	//claimedforlable
	$("#claimedforlable").hide();
	//claimedfor
	$("#claimedfor").hide(); $("#claimedfor").val('');
	//visitperiodlable
	$("#visitperiodlable").hide();
	//visitperiod
	$("#visitperiod").hide(); $("#visitperiod").val('');
	//leavedetailslable
	$("#leavedetailslable").hide();
	//leavedetails
	$("#leavedetails").hide(); $("#leavedetails").val('');
	//encashmentlable
	$("#encashmentlable").hide();
	//encashment
	$("#encashment").hide(); $("#encashment").val('');
	//amountadvancelable
	$("#amountadvancelable").hide();
	//amountadvance
	$("#amountadvance").hide(); $("#amountadvance").val('');
	//submitbtn
	$("#submitbtn").hide();
	
});

function empSearch(){
	var empcode = document.getElementById("empcode").value;
	var empcodepattern = /^[0-9]{4}$/;
	
	if(empcode.match(empcodepattern)){
		//alert("matched");
		$.ajax({
			type: "get",
			url: "./empNameandDesignation",
			data: "empcode="+empcode,
			cache:false,
			success:function(response){
// 				alert("response=> "+response);
// 				alert("response=> "+JSON.stringify(response));
				document.getElementById("namespan").innerHTML = response;
				document.getElementById("empcode").readOnly = true;
				
				$("#blockyearlable").show(); 	$("#blockyear").show(); $("#blockyear").val('');
				$("#locationlable").show(); 	$("#location").show(); $("#location").val('');
				$("#visitplacelable").show(); 	$("#visitplace").show(); $("#visitplace").val('');
				$("#claimedforlable").show(); 	$("#claimedfor").show(); $("#claimedfor").val('');
				$("#visitperiodlable").show(); 	$("#visitperiod").show(); $("#visitperiod").val('');
				$("#leavedetailslable").show(); $("#leavedetails").show(); $("#leavedetails").val('');
				$("#encashmentlable").show(); 	$("#encashment").show(); $("#encashment").val('');
				$("#amountadvancelable").show();$("#amountadvance").show(); $("#amountadvance").val('');
				$("#submitbtn").show();
				
			},
			error:function(response){
				alert("Employee code is not found");
				$("#empcode").val(''); $("#empcode").focus();
			}
		});
	}else{
		alert("Employee code should be numeric with max size is Four");
		$("#empcode").val(''); $("#empcode").focus();
	}
}
</script>

</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<center><b>${saveltcEnacachmentMsg }</b></center>
	<div align="center">
		<h3 class="h3 font-weight-bolder">LTC-EL Enacachement Form</h3>
	</div>
	<div class="container border p-4 font-weight-bolder"
		style="background-color: #e6ffff;">
		<form:form action="./saveltcEnacachment" method="post"
			modelAttribute="ltcEnacachment">

			<div class="row align-items-center m-2">
				<div class="col-auto" style="width: 200px;" id="empcodelable">
					<label for="code" class="col-form-label">Employee Code:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="empcode" id="empcode" class="form-control" maxlength="4" onchange="return empSearch()"/>
				</div>
				<div class="col-auto">
					<span id="namespan" style="color:red;"></span>
				</div>
			</div>

			<div class="row g-3 align-items-center m-2">
				<div class="col-auto" style="width: 200px;" id="blockyearlable">
					<label for="blockyear" class="col-form-label">Block Year:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="blockyear" id="blockyear"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="locationlable">
					<label for="location" class="col-form-label">Anywhere in
						India:</label>
				</div>
				<div class="col-auto">
					<select name="location" id="location" class="form-control">
						<option value="">-select-</option>
						<option value="Any Where in India">Any Where in India</option>
						<option value="Home Town">Home Town</option>
						<option value="in.lieu of Home Town">in.lieu of Home Town</option>
					</select>
				</div>
			</div>

			<div class="row g-3 align-items-center m-2" id="visitplacelable">
				<div class="col-auto" style="width: 200px;">
					<label for="visitplace" class="col-form-label">Place of
						Visit:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="visitplace" id="visitplace"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="claimedforlable">
					<label for="claimedfor" class="col-form-label">To whom
						Claimed:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="claimedfor" id="claimedfor"
						class="form-control" />
				</div>
			</div>

			<div class="row g-3 align-items-center m-2" id="visitperiodlable">
				<div class="col-auto" style="width: 200px;">
					<label for="visitperiod" class="col-form-label">Period of
						Visit:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="visitperiod" id="visitperiod"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="leavedetailslable">
					<label for="leavedetails" class="col-form-label">Leave
						Details:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="leavedetails" id="leavedetails"
						class="form-control" />
				</div>
			</div>

			<div class="row g-3 align-items-center m-2">
				<div class="col-auto" style="width: 200px;" id="encashmentlable">
					<label for="encashment" class="col-form-label">Encashment
						availed for as on date:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="encashment" id="encashment"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="amountadvancelable">
					<label for="leavedetails" class="col-form-label">Amount of
						advance:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="amountadvance" id="amountadvance"
						class="form-control" />
				</div>
			</div>

			<div class="row g-3 align-items-center m-2" id="submitbtn">
				<input type="submit" value="Submit"
					class="form-control font-weight-bolder bg-info text-white w-25"
					style="margin-left: 38%;" />
			</div>
		</form:form>
	</div>



</body>
</html>