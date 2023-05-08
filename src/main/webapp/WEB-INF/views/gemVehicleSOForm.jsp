<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM - Vehicle NoteSheet</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "get",
									url : "./getVehicleGems",
									cache : false,
									success : function(response) {
										//alert("success response length=> "+response.length)
										//alert("success response  => "+JSON.stringify(response))

										for (var i = 0; i < response.length; i++) {
											var gem = response[i];
											$("#tbody")
													.append(
															'<tr><td>'
																	+ gem.requestno
																	+ '</td><td>'
																	+ gem.billno
																	+ '</td><td>'
																	+ gem.amount
																	+ '</td><td>'
																	+ gem.billdate
																	+ '</td><td>'
																	+ gem.monthYear
																	+ '</td><td>'
																	+ gem.period
																	+ '</td>'
																	+ '<td><input type="text" name="sio_date" id="SONum'+gem.requestno+'"/></td>'
																	+ '<td><input type="button" value="Generate Sanction Order" onClick="return generateSO(\''
																	+ gem.requestno
																	+ '\')"/></td>'
																	+ '</tr>');
											//+'<td><a href=\"generateGEMVehicleSOPrint?requestno='+gem.requestno+'\">Generate Sanction Order</a></td></tr>');
											// 								+'<td><a this.href=\"generateGEMVehicleSOPrint?requestno='+gem.requestno+'&SONum='+document.getElementById("SONum'+gem.requestno+'").value+'\">Generate Sanction Order</a></td></tr>');
										}

									},
									error : function(response) {
										alert("GEM Requests are not Found");
									}
								});
					});
	function generateSO(a) {
		//alert("generateSO "+a);
		var SONum = document.getElementById('SONum' + a + '').value;
		//alert("SONum  ="+SONum);

		if (SONum === null || SONum === "") {
			alert("Sanction Order Number is Required Please Fill that!");
			return false;
		} else {
			document.location.href = '/generateGEMVehicleSOPrint?requestno='
					+ a + '&SONum=' + SONum;
			return true;
		}

	}

	function getrequestnos() {
		//alert("getrequestnos")

		var modal1 = document.getElementById("myModalSuccess");
		var span = document.getElementsByClassName("successclose")[0];

		modal1.style.display = "block";
		 span.onclick = function () {  modal1.style.display = "none"; };

		$.ajax({
			type : "get",
			url : "./getVehicleGems",
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
$("#popuptbody").empty();
				for (var i = 0; i < response.length; i++) {
					var gem = response[i];
					$("#popuptbody")
							.append(
									'<tr><td><a href="javascript:addRequestNo(\''
											+ gem.requestno + '\')">'
											+ gem.requestno + '</a></td><td>'
											+ gem.billno + '</td><td>'
											+ gem.amount + '</td><td>'+gem.billdate+'</td></tr>');
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
		
		$("#requestno").val(a);
		
	}
	function searchrequestno() {
		//alert("asdfasd"); 

		var requestno = $("#requestno").val();
		//alert("requestno=> "+requestno);
		
		var SONum = $("#SONum").val();
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
	 
</script>
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
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	<div align="center">
		<h3 class="h3 font-weight-bolder">GEM - Vehicle Details</h3>

		<div class="container border" style="background-color: #e6f9ff;">
			<form:form action="./generateGEMVehicleSOPrint" method="post">
				<div class="row g-3 align-items-center m-4 p-4">

					<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">Request
							No: </label>
					</div>
					<div class="col-auto">
						<input type="text" name="requestno" id="requestno"
							class="form-control" />
					</div>
					<div class="col-auto">
						<label for="inputPassword6" class="col-form-label">Sanction Order Number </label>
					</div>
					<div class="col-auto">
						<input type="text" name="SONum" id="SONum"
							class="form-control" />
					</div>
					
					
					<div class="col-auto m-4">
						<input type="submit" value="Sanction Order" class="btn btn-success"
							onclick="return searchrequestno()" />
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
					<span class="successclose" style="text-align: right; margin-left: 50%; font-weight: bolder;">&#x2717;</span>
						<table class="table table-bordered table-striped">
							<thead>
								<th>Request Number</th>
								<th>Bill Number</th>
								<th>Amount</th>
								<th>Bill Date</th>
<!-- 								<th>Month & Year</th> -->
<!-- 								<th>Period</th> -->
<!-- 								<th>Sanction Order No</th> -->
<!-- 								<th>Action</th> -->
							</thead>
							<tbody id="popuptbody"></tbody>
						</table>
					</div>
				</center>
			</div>
		</div>
		<table border="1" class="table table-stripped mt-4">
			<thead>
				<th>Request Number</th>
				<th>Bill Number</th>
				<th>Amount</th>
				<th>Bill Date</th>
				<th>Month & Year</th>
				<th>Period</th>
				<th>Sanction Order No</th>
				<th>Action</th>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
</body>
</html>