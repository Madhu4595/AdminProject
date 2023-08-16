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
</style>
<script>
$(document).ready(function(){
	$("#editdata").hide();
	$("#gpfNodiv").hide();
	$("#gpfNodiv").val('');
	
	$("#purposediv").hide();
	$("#purposediv").val('');
	
	$("#withDrawAmtdiv").hide();
	$("#withDrawAmtdiv").val('');
	
	$("#netBalancediv").hide();
	$("#netBalancediv").val('');
	
	$("#submitdiv").hide();
});
function findRequestNo(){
	//alert("findRequestNo");
	
	var requestNo = $("#requestnoo").val();
	//alert("requestNo=> "+requestNo)
	$.ajax({
		type: "get",
		url: "./getGPFWithdrawForEdit?requestno="+requestNo,
		cache: false,
		success:function(resp){
			//alert("success=> "+resp.length);
			
			if(resp.length === 0){
				alert("No Record Found With Given Request Number");
				$("#requestnoo").val('');
				$("#requestnoo").focus();
				return false;
			}else{
				findEmp(resp.empCode);
				
				$("#editdata").show();
				
				$("#requestNo").val(resp.requestNo);
				document.getElementById("requestnoprint").innerHTML = resp.requestNo;

				$("#gpfNodiv").show();
				$("#gpfNo").val(resp.gpfNo);
				
				$("#purposediv").show();
				$("#purpose").val(resp.purpose);
				
				$("#withDrawAmtdiv").show();
				$("#withDrawAmt").val(resp.withDrawAmt);
				
				$("#netBalancediv").show();
				$("#netBalance").val(resp.netBalance);
				
				$("#submitdiv").show();
			}
		},
		error:function(resp){
			//alert("error=> "+resp);
			alert("GPF Details are NOT FOUND with Given Request Number!");
			$("#requestnoo").val('');
			$("#requestnoo").focus();
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
function findEmp(a){
	//alert("findEmp()"+a);
	$.ajax({
		type: "get",
		url: "./empNameandDesignation?empcode="+a,
		cache: false,
		success:function(resp){
			//alert("success=> "+resp);
			document.getElementById("empspan").innerHTML = resp;
		},
		error:function(resp){
			//alert("error => "+resp);
			alert("Employee is Not Found with Given Employee Code!!");
		}
	});
}
function getrequestnos() {
	//alert("getrequestnos")

	var modal1 = document.getElementById("myModalSuccess");
	var span = document.getElementsByClassName("close")[0];

	modal1.style.display = "block";
	span.onclick = function () {  modal1.style.display = "none"; };

	$.ajax({
		type : "get",
		url : "./getAllGPFWithdrawForEdit",
		cache : false,
		success : function(response) {
			//alert("success response length=> "+response.length)
			//alert("success response  => "+JSON.stringify(response))
			$("#tbody").empty();
			for (var i = 0; i < response.length; i++) {
				var gpf = response[i];
				$("#tbody").append(
						'<tr><td><a href="javascript:addRequestNo(\''
								+ gpf.requestNo + '\')">' + gpf.requestNo
								+ '</a></td><td>' + gpf.empCode
								+ '</td><td>' + gpf.gpfNo + '</td><td>' + gpf.purpose + '</td><td>' + gpf.withDrawAmt + '</td><td>' + gpf.netBalance + '</td></tr>');
			}

		},
		error : function(response) {
			alert("GEM Requests are not Found");
		}
	});
}
function addRequestNo(a) {
	//alert("addRequestNo"+a);

	var modal1 = document.getElementById("myModalSuccess");
	modal1.style.display = "none";

	$("#requestnoo").val(a);
	findRequestNo();
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
	<div class="container mt-4 mb-4 border font-weight-bolder"
		style="background-color: #e6ffff;">
		
		<div class="row align-items-center m-2">
				<div class="col-3">
					<label for="monthYear" class="col-form-label">Search Request Number</label>
				</div>
				<div class="col-2">
					<input type="text" name="requestnoo" id="requestnoo" class="form-control" maxlength="9"/>
				</div>
				<div class="col-3">
					<input type="button" class="form-control" value="Get Data" onclick="return findRequestNo()" style="background-color: green; color: white; font-weight: bold;"/>
				</div>
				<div class="col-4">
					<input type="button" class="form-control"  value="Get All Request Numbers"  onclick="return getrequestnos()" style="background-color: #6666ff; color: white; font-weight: bold;"/>
				</div>
			</div>
			
		</div>
	<div class="container mt-4 border font-weight-bolder p-4"
		style="background-color: #e6ffff;" id="editdata">
		
		<form:form action="./updateGpf" method="post" modelAttribute="gpf"  onsubmit="return validate()">
		
		<input type="hidden" name="requestNo" id="requestNo" />
			<center > 
			<b>
			Request Number: <span id="requestnoprint" style="color: #3333ff;"></span> 
			Employee Name: <span id="empspan" style="color: #3333ff;"></span>
			</b> </center><br>
 
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

	<div id="myModalSuccess" class="mymodalsuccess">
		<div class="successcontent"><span class="close">&times;</span>
			<center>
				<table border="1" class="table table-bordered table-striped">
					<thead style="background-color: black; color: white;">
						<th>Request Number</th>
						<th>Employee Code</th>
						<th>GPF Number</th>
						<th>Purpose</th>
						<th>WithDraw Amount</th>
						<th>Net Balance</th>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
			</center>
		</div>
	</div>
</body>
</html>