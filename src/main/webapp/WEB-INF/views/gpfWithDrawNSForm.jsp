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
									url : "./getAllGPFWithDraw",
									cache : false,
									success : function(response) {
										//alert("success response length=> "+response.length)
										//alert("success response  => "+JSON.stringify(response))

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
			url : "./getAllGPFWithDraw",
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))

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
		document.location.href='./generateGPFWithdrawNS?requestNo='+requestno;
	}
	function addRequestNo(a){
		alert("addRequestNo=> "+a);
		
		var modal1 = document.getElementById("myModalSuccess");
		modal1.style.display = "none";
		
		$("#requestNo").val(a);
		validate();
		
	}
</script>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div class="container mt-4 border font-weight-bolder p-4"
		style="background-color: #e6ffff;">
		<form:form action="./generateGPFWithdrawNS" method="post" onsubmit="return validate()">

			<div class="row align-items-center m-2 mb-4">
				<div class="col-4">
					<label for="monthYear" class="col-form-label">Request
						Number:</label>
				</div>
				<div class="col-4">
					<input type="text" name="requestNo" id="requestNo"
						placeholder="Ex: GPF_0001" class="form-control" />
				</div>
				<div class="col-4">
					<input type="submit" class="btn btn-success w-50"
						style="width: 300px;" />
				</div>
			</div>
		</form:form>
	</div>

	<div class="col-auto p-4" align="center">
		<button onclick="return getrequestnos()" id="getrequestnos"
			class="btn btn-info">Get All Request Numbers</button>
	</div>

	<div id="myModalSuccess" class="mymodalsuccess">
		<div class="successcontent">
			<span class="close">&times;</span>
			<center>
				<div id="scrollbar">
					<table class="table table-bordered table-striped">
						<thead>
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

	<table border="1" class="table table-stripped">
		<thead>
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