<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GPF Withdraw NoteSheet</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<style>
.mymodalsuccess {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 220px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.successcontent {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.successclose {
	float: left;
	padding: 3px;
	width: 50%;
}

#scrollbar {
	width: 800px;
	height: 300px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
<script>
	$(document).ready(function() {

						$.ajax({
									type : "get",
									url : "./getAllGPFWithdrawForNS",
									cache : false,
									success : function(response) {
										//alert("success response length=> "+response.length)
										//alert("success response  => "+JSON.stringify(response))
										
										if(response.length === 0){
											$("#reqstable").hide();
											document.getElementById("noreqsmsg").innerHTML = "No Request Numbers are Available for Generating NoteSheet";
										}else{
											for (var i = 0; i < response.length; i++) {
												var gpf = response[i];
												$("#tbody")
														.append(
																'<tr><td>'
																		+ gpf.requestNo
																		+ '</td><td>'
																		+ gpf.empCode
																		+ '</td><td>'
																		+ gpf.gpfNo
																		+ '</td><td>'
																		+ gpf.purpose
																		+ '</td><td>'
																		+ gpf.withDrawAmt
																		+ '</td><td>'
																		+ gpf.netBalance
																		+ '</td>'
																		+ '<td><a href=\"generateGPFWithdrawNS?requestNo='
																		+ gpf.requestNo
																		+ '\">Generate NoteSheet</a></td></tr>');
											}
										}
									},
									error : function(response) {
										alert("GEM Requests are not Found");
									}
								});
					});
	function getrequestnos() {

		var modal1 = document.getElementById("myModalSuccess");
		var span = document.getElementsByClassName("close")[0];

		modal1.style.display = "block";
		span.onclick = function() {
			modal1.style.display = "none";
		};

		$.ajax({
			type : "get",
			url : "./getAllGPFWithdrawForNS",
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
				$("#popuptbody").empty();
				for (var i = 0; i < response.length; i++) {
					var gpf = response[i];
					$("#popuptbody").append(
							'<tr><td><a href="javascript:addRequestNo(\''
									+ gpf.requestNo + '\')">' + gpf.requestNo
									+ '</a></td><td>' + gpf.empCode
									+ '</td><td>' + gpf.gpfNo + '</td><td>'
									+ gpf.purpose + '</td><td>'
									+ gpf.withDrawAmt + '</td><td>'
									+ gpf.netBalance + '</td></tr>');
				}

			},
			error : function(response) {
				alert("GEM Requests are not Found");
			}
		});
	}
	function validate(){
		var requestno = $("#requestNo").val();
		//alert("requestNo "+requestno);
		
		if (requestno === "" || requestno === null) {
		alert("Please enter Request Number");
		$("#requestno").focus();
		return false;
	}
	else{
		//alert("elseeeeeeeeeeeeeeeeeeeeeeeeeeeee")
		$.ajax({
			type : "get",
			url : "./getGPFWithdrawForNS?requestno="+requestno,
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
				
				if(response.length === 0){
					alert("No record Found with Given Request Number for Approval");
					$("#requestno").val('');
					$("#requestno").focus();
					return false;
				}else{
					document.forms[0].action="./generateGPFWithdrawNS";
					document.forms[0].submit();
					return true;
				}

			},
			error : function(response) {
				alert("No GEM Request are Found");
			}
		});
		
		return true; 
	}
		
	return true;	
	}
	function addRequestNo(a){
		//alert("addRequestNo=> "+a);
		
		var modal1 = document.getElementById("myModalSuccess");
		modal1.style.display = "none";
		
		$("#requestNo").val(a);
		
	}
</script>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div class="container mt-4 border font-weight-bolder p-4"
		style="background-color: #e6ffff;">
		<form:form action="" method="post" onsubmit="return validate()">
		
		<div class="row align-items-center m-2">
		
				<div class="col-3">
					<label for="monthYear" class="col-form-label">Search Request Number</label>
				</div>
				<div class="col-2">
					<input type="text" name="requestNo" id="requestNo" placeholder="Ex: GPF_0001" class="form-control" />
				</div>
				<div class="col-3">
					<input type="button" class="form-control" value="Generate Note Sheet" onclick="return validate()" style="background-color: green; color: white; font-weight: bold;"/>
				</div>
				<div class="col-4">
					<input type="button" class="form-control" onclick="return getrequestnos()"  value="Get All Request Numbers"   style="background-color: #6666ff; color: white; font-weight: bold;"/>
				</div>
			</div>

		</form:form>
	</div>
 <br>

	<div id="myModalSuccess" class="mymodalsuccess">
		<div class="successcontent">
			<span class="close">&times;</span>
			<center>
				<div id="scrollbar">
					<table class="table table-bordered table-striped">
						<thead style="background-color: black; color: white;">
							<th>Request Number</th>
							<th>Employee Code</th>
							<th>GPF Number</th>
							<th>Purpose</th>
							<th>Withdraw Amount</th>
							<th>Net Balance</th>
						</thead>
						<tbody id="popuptbody"></tbody>
					</table>
				</div>
			</center>
		</div>
	</div>
	<center><span id="noreqsmsg" style="font-weight: bolder; color: red;"></span></center>
	<table border="1" class="table table-stripped" id="reqstable">
		<thead style="background-color: black; color: white;">
			<th>Request Number</th>
			<th>Employee Code</th>
			<th>GPF Number</th>
			<th>Purpose</th>
			<th>Withdraw Amount</th>
			<th>Net Balance</th>
			<th>Action</th>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
</body>
</html>