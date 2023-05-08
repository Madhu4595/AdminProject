<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GPF Withdraw</title>
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
	$(document)
			.ready(
					function() {

						$
								.ajax({
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
																	+ '<td><input type="text" name="soNum" id="soNum'+gpf.requestNo+'"/></td><td><input type="button" value="Generate Sanction Order" onClick="return generateSO(\''
																	+ gpf.requestNo
																	+ '\')"/></td></tr>');
										}

									},
									error : function(response) {
										alert("GEM Requests are not Found");
									}
								});
					});

	function generateSO(a) {
		//alert("generateSO " + a);
		var soNum = document.getElementById('soNum' + a + '').value;
		//alert("soNum  => "+soNum);
		
		if (soNum === null || soNum === "") {
			alert("Sanction Order Number is Required Please Fill that!");
			return false;
		} else {
 			document.location.href = './generateGPFWithdrawSOPrint?requestNo='
 					+ a + '&soNum=' + soNum;
			return true;
		}

	}
	function searchrequestno() {
		//alert("asdfasd"); 

		var requestno = $("#requestNo").val();
		//alert("requestno=> "+requestno);
		
		var SONum = $("#soNum").val();
		//alert("SONum=> "+SONum);
		

		if (requestno === "" || requestno === null) {
			alert("Please enter Request Number");
			$("#requestno").focus();
			return false;
		}
		
		if (SONum === "" || SONum === null) {
			alert("Please enter Sanction Order Number");
			$("#SONum").focus();
			return false;
		}
	return true;		 
	}
	function getrequestnos() {
		//alert("getrequestnos")

		var modal1 = document.getElementById("myModalSuccess");
		var span = document.getElementsByClassName("successclose")[0];

		modal1.style.display = "block";
		 span.onclick = function () {  modal1.style.display = "none"; };

		$.ajax({
			type : "get",
			url : "./getAllGPFWithDraw",
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
				$("#popuptbody").empty();
				for (var i = 0; i < response.length; i++) {
					var gpf = response[i];
					$("#popuptbody")
							.append(
									'<tr><td><a href="javascript:addRequestNo(\''
											+ gpf.requestNo + '\')">'
											+ gpf.requestNo + '</a></td><td>'+gpf.empCode+'</td><td>'
											+ gpf.gpfNo + '</td><td>'
											+ gpf.purpose + '</td><td>'+gpf.withDrawAmt+'</td><td>'+gpf.netBalance+'</td></tr>');
				}

			},
			error : function(response) {
				alert("No LTC Request are Found");
			}
		});
	}
	function addRequestNo(a){
		//alert("asdfasdfas"+a);
		
		var modal1 = document.getElementById("myModalSuccess");
		modal1.style.display = "none";
		
		$("#requestNo").val(a);
		
	}
</script>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	<div align="center">
		<h3 class="h3 font-weight-bolder">GEM - Vehicle Details</h3>

		<div class="container border" style="background-color: #e6f9ff;">
			<form:form action="./generateGPFWithdrawSOPrint" method="post">
				<div class="row g-3 align-items-center m-4 p-4">

					<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">Request
							No: </label>
					</div>
					<div class="col-auto">
						<input type="text" name="requestNo" id="requestNo"
							class="form-control" />
					</div>
					<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">Sanction
							Order Number </label>
					</div>
					<div class="col-auto">
						<input type="text" name="soNum" id="soNum" class="form-control" />
					</div>


					<div class="col-auto m-4">
						<input type="submit" value="Sanction Order"
							class="btn btn-success" onclick="return searchrequestno()" />
					</div>

				</div>

			</form:form>
			<span style="text-align: center; font-weight: bolder; color: red;">${msg }</span>
		</div>
		<div class="col-auto p-4" align="center">
			<button onclick="return getrequestnos()" id="getrequestnos"
				class="btn btn-info">Get All Request Numbers</button>
		</div>
		<div id="myModalSuccess" class="mymodalsuccess">
			<div class="successcontent">
				<center>
					<div id="scrollbar">
						<span class="successclose"
							style="text-align: right; margin-left: 50%; font-weight: bolder;">&#x2717;</span>
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
				<th>Sanction Order No</th>
				<th>Action</th>
			</thead>
			<tbody id="tbody"></tbody>
		</table>

	</div>
</body>
</html>