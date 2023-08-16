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
									url : "./getAllGPFWithdrawForSO",
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
																		+ '<td><input type="text" name="soNum" id="soNum'+gpf.requestNo+'" /></td><td><input type="button" style="background-color: green; color: white; font-weight: bolder;" value="Generate Sanction Order" onClick="return generateSO(\''
																		+ gpf.requestNo
																		+ '\')"/></td></tr>');
											}
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
			//alert("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
			$.ajax({
				type : "get",
				url : "./checkSO?siodate="+soNum,
				cache : false,
				success : function(response) {
					//alert("success response length=> "+response)
					//alert("success response  => "+JSON.stringify(response))
					
					if(response === "200"){
						//alert("dddddddddddddddddddddddddddd");
						alert("Sanction Order Number is Already Available, Please change Sanction Order Number");
						$("#SONum").val('');
						$("#SONum").focus();
						return false;
					}
					else{
						//alert("fffffffffffffffffffffffffffffffffffffffff")
						$("#requestNo").val(a);
						$("#sanctionNumber").val(soNum);
							document.forms[0].action="./generateGPFWithdrawSOPrint";
							document.forms[0].submit();
							return true;
					}
				},
				error : function(response) {
					alert("Employee Allowance Details are not Loaded");
				}
			});
			
 			//document.location.href = './generateGPFWithdrawSOPrint?requestNo='+ a + '&soNum=' + soNum;
			return true;
		}

	}
	function searchrequestno() {
		//alert("asdfasd"); 

		var requestno = $("#requestNo").val();
		//alert("requestno=> "+requestno);
		
		var SONum = $("#sanctionNumber").val();
		//alert("SONum=> "+SONum);
		

		if (requestno === "" || requestno === null) {
			alert("Please enter Request Number");
			$("#requestNo").focus();
			return false;
		}else{
			$.ajax({
				type : "get",
				url : "./getGPFWithdrawForSO?requestno="+requestno,
				cache : false,
				success : function(response) {
					//alert("success response length=> "+response.length)
					//alert("success response  => "+JSON.stringify(response))
					
					if(response.length === 0){
						alert("No record Found with Given Request Number for Approval");
						$("#requestNo").val('');
						$("#requestNo").focus();
						$("#sanctionNumber").val('');
						return false;
					}else{
						//alert("bbbbbbbbbbbbbbbbbbbbbbbbbbbb");
						if (SONum === "" || SONum === null) {
							alert("Please enter Sanction Order Number");
							$("#sanctionNumber").focus();
							return false;
						}
						else{
							//alert("in else")
							
							$.ajax({
								type : "get",
								url : "./checkSO?siodate="+SONum,
								cache : false,
								success : function(response) {
									//alert("success response length=> "+response)
									//alert("success response  => "+JSON.stringify(response))
									
									if(response === "200"){
										//alert("in if");
										alert("Sanction Order Number is Already Available, Please change Sanction Order Number");
										$("#sanctionNumber").val('');
										$("#sanctionNumber").focus();
										return false;
									}
									else{
											document.forms[0].action="./generateGPFWithdrawSOPrint";
											document.forms[0].submit();
											return true;
									}
									
									 
								},
								error : function(response) {
									alert("Employee Allowance Details are not Loaded");
								}
							});
							
							return false;
							//alert("aaaaaaaaaaaaaaaaaaaaaaaaaaa")
						}
					}
				},
				error : function(response) {
					alert("No GEM Request are Found");
				}
			});
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
			url : "./getAllGPFWithdrawForSO",
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
		
		<div class="container border p-4" style="background-color: #e6f9ff;">
		
			<form:form action="" method="post">
			
				<div class="row">
				
					<div class="col-3 fw-bolder">
						<label for="inputPassword6" class="col-form-label">Request No: </label>
					</div>
					<div class="col-2">
						<input type="text" name="requestNo" id="requestNo" class="form-control" />
					</div>
					<div class="col-6">
						<input type="button" class="form-control w-50" onclick="return getrequestnos()"  value="Get All Request Numbers"   style="background-color: #6666ff; color: white; font-weight: bold;"/>
					</div>
					
				</div>
				
				<div class="row mt-1">
				
					<div class="col-3">
						<label for="inputPassword6" class="col-form-label">Sanction Order Number </label>
					</div>
					<div class="col-2">
						<input type="text" name="sanctionNumber" id="sanctionNumber" class="form-control" />
					</div>
				</div>
				
				<div class="row mt-1">
					<div class="col-6">
						<input type="button" value="Generate Sanction Order" class="form-control w-50 btn btn-success" onclick="return searchrequestno()" />
					</div>
				</div>

			</form:form>
			
			<span style="text-align: center; font-weight: bolder; color: red;">${msg }</span>
		</div>
<br>
	 
		<div id="myModalSuccess" class="mymodalsuccess">
			<div class="successcontent">
				<center>
					<div id="scrollbar">
						<span class="successclose"
							style="text-align: right; margin-left: 50%; font-weight: bolder;">&#x2717;</span>
						<table border="1" class="table table-stripped">
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
				<th>Sanction Order No</th>
				<th>Action</th>
			</thead>
			<tbody id="tbody"></tbody>
		</table>

	</div>
</body>
</html>