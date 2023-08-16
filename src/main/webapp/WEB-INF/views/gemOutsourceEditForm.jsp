<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>GEM-Vehicle</title>

<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./sass/bootstrap.min.css" />

<script>
	$(document).ready(function() {
		$("#myModalSuccess").hide();
		$("#editdata").hide();
		$("#monthYeardiv").hide();
		$("#monthYear").val('');

		$("#perioddiv").hide();
		$("#period").val('');

		$("#billnodiv").hide();
		$("#billno").val('');

		$("#billdatediv").hide();
		$("#billdate").val('');

		$("#amountdiv").hide();
		$("#amount").val('');

		$("#submitdiv").hide();
	});
	function getrequestnos() {
		//alert("getrequestnos")

		var modal1 = document.getElementById("myModalSuccess");
		var span = document.getElementsByClassName("successclose")[0];

		modal1.style.display = "block";
		span.onclick = function () {  modal1.style.display = "none"; };

		$.ajax({
			type : "get",
			url : "./getAllGemOutsourceForEdit",
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
				$("#tbody").empty();
				for (var i = 0; i < response.length; i++) {
					var gem = response[i];
					$("#tbody").append(
							'<tr><td><a href="javascript:addRequestNo(\''
									+ gem.requestno + '\')">' + gem.requestno
									+ '</a></td><td>' + gem.billno
									+ '</td><td>' + gem.amount + '</td></tr>');
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

		$("#requestno").val(a);
		searchrequestno(a);
	}

	function searchrequestno(a) {
		//alert("searchrequestno"+a);
		var requestnopattern = /^[A-Z]{3}[0-9]{4}$/;

		if (a.match(requestnopattern)) {
			//alert("matched");
			$.ajax({
				type : "get",
				url : "./getGemOutsourceForEdit",
				data : "requestno=" + a,
				cache : false,
				success : function(response) {
					//alert("response success=> "+JSON.stringify(response));
					//alert("response success=> "+response.length);
					
					if(response.length === 0){
						alert("No Record Found With Given Request Number");
						$("#requestnoo").val('');
						$("#requestnoo").focus();
						return false;
					}else{
						$("#editdata").show();
						
						$("#requestno").val(response.requestno);
						document.getElementById("requestnoprint").innerHTML = response.requestno;
						
						$("#monthYeardiv").show();
						$("#monthYear").val(response.monthYear);
						$("#perioddiv").show();
						$("#period").val(response.period);
						$("#billnodiv").show();
						$("#billno").val(response.billno);
						$("#billdatediv").show();
						$("#billdate").val(response.billdate);
						$("#amountdiv").show();
						$("#amount").val(response.amount);
						$("#submitdiv").show();
					}
					
				},
				error : function(response) {
					alert("Request Number Not Found!");
				}
			});
		} else {
			alert("Request Number Invalid");
			$("#requestno").val('');
			$("#requestno").focus();
		}

	}
	function getGemDataForEdit(){
		var requestnoo = $("#requestnoo").val();
		
		if(requestnoo === null || requestnoo === ""){
			alert("Search Request Number is Required, Please Enter");
			$("#requestnoo").val('GEM');
			$("#requestnoo").focus();
			return false;
		}else{
			searchrequestno(requestnoo);
		}
		
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
		<h3 class="h3 font-weight-bolder">GEM - Outsource Details Edit Form</h3>
	</div>
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
					<input type="button" class="form-control" value="Get Data" onclick="return getGemDataForEdit()" style="background-color: green; color: white; font-weight: bold;"/>
				</div>
				<div class="col-4">
					<input type="button" class="form-control"  value="Get All Request Numbers"  onclick="return getrequestnos()" style="background-color: #6666ff; color: white; font-weight: bold;"/>
				</div>
			</div>
			
		</div>

	<div class="container border font-weight-bolder" style="background-color: #e6ffff;" id="editdata">
		
		<form:form action="./updateGEMOutsourcing" method="post" modelAttribute="gem">
			
			<input type="hidden" name="requestno" id="requestno" />
			<center style="color: #3333ff;"> <b>Request Number: <span id="requestnoprint"></span> </b> </center><br>
			 
			<div class="row align-items-center m-2" id="monthYeardiv">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="monthYear" class="col-form-label">Month & Year:</label>
				</div>
				<div class="col-4">
					<input type="text" name="monthYear" id="monthYear"
						class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="perioddiv">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="period" class="col-form-label">Period:</label>
				</div>
				<div class="col-4">
					<input type="text" name="period" id="period" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="billnodiv">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="billno" class="col-form-label">Bill Number:</label>
				</div>
				<div class="col-4">
					<input type="text" name="billno" id="billno" class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="billdatediv">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="billdate" class="col-form-label">Bill Date:</label>
				</div>
				<div class="col-4">
					<input type="text" name="billdate" id="billdate"
						class="form-control" />
				</div>
				<div class="col-2"></div>
			</div>
			<div class="row align-items-center m-2" id="amountdiv">
				<div class="col-2"></div>
				<div class="col-4">
					<label for="amount" class="col-form-label">Amount:</label>
				</div>
				<div class="col-4">
					<input type="text" name="amount" id="amount" class="form-control" />
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
		<div class="successcontent">
		<span class="successclose" style="text-align: right; margin-left: 50%; font-weight: bolder;">&#x2717;</span>
			<center>
			<div id="scrollbar">
				<table border="1" class="table table-bordered table-striped">
					<thead style="background-color: black; color: white;">
						<th>Request Number</th>
						<th>Bill Number</th>
						<th>Amount</th>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
				</div>
			</center>
		</div>
	</div>

</body>
</html>