<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<link rel="stylesheet" href="./customCSS/employee_allowance_editCSS.css" />
<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<style>
#section {
	border: 2px solid black;
	background-color: #e6f9ff;
}

h6 {
	color: blue;
	font-weight: bold;
	text-decoration: underline;
}

#form1 {
	margin: 2px;
	align-content: center;
	margin-left: 300px;
	font-weight: bolder;
}
/*for admission number finding*/
/* The Modal (background) */
.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 220px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow-y: scroll; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close1 {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-content1 {
	background-color: #e4eeb9;
	border: 2px solid black;
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
		$("#rowc0").hide();
		$("#rowc1").hide();
		$("#rowc2").hide();
	});

	function callrequestno(a) {
		document.getElementById("request_no").value = a;
		document.getElementById("search").hide = true;
		$('#myModal').modal('hide');
		$("#submit_btn").show();
		vendorsearch();
	}

	function amountcheck(a, b) {
		if (a < b) {
			$("#amount_approve").val("");
			return false;
		}
	}
	function vendorsearch() {
		var request_no = $('#request_no').val();
		document.getElementById("request_no").readonly = true;

		$.get('./allowancesearch', {
			request_no : request_no
		}, function(response) {
			$("#myModal1").hide();
			$("#submit_btn").show();
			$('#details_emp').show();
			$("#search").hide();

			$('#emp_id').text(
					response[0] + ',' + response[1] + ',' + response[2]);
			$('#amount_approve00').show();
			$('#bill_type').text(response[3]);
			$('#claimed_amount').text(response[4]);

			$('#cea_amount_child1').text(response[7]);
			$('#cea_amount_child2').text(response[8]);
			$('#allowance_type').val(response[3]);
			$('#noofchilds').val(response[5]);

			abc();
		})
	}

	function requestnosearch() {
		document.getElementById("request_no").readonly = true;

		var modal1 = document.getElementById("myModal1");
		var span = document.getElementsByClassName("close1")[0];
		modal1.style.display = "block";
		span.onclick = function() {
			modal1.style.display = "none";
		};

		$.ajax({
			type : "get",
			url : "./getrequestnos",
			cache : false,
			success : function(html) {

				$("#content").html(html);
				$("#myModal1").show();
			}
		});
	}
	function myFunction() {
		$('#myModal').modal('hide');
	}
	
	function validate(){
		
		var noofchilds = $('#noofchilds').val();
		//alert("validate=>noofchilds=> "+noofchilds);
		
		if(noofchilds === '1'){
			var amount_approve1 = $('#amount_approve1').val();
			//alert("validate=>noofchilds=>1=>if=> amount_approve1=> "+amount_approve1);
			
			if(amount_approve1 === null || amount_approve1 === ""){
				alert("Please Enter Amount Approved!!!"); return false;
			}
		}
		
		if(noofchilds === '2'){
			var amount_approve1 = $('#amount_approve1').val();
			var amount_approve2 = $('#amount_approve2').val();
			//alert("validate=>noofchilds=>2=>if=> amount_approve1=> "+amount_approve1);
			//alert("validate=>noofchilds=>2=>if=> amount_approve2=> "+amount_approve2);
			
			if(amount_approve1 === null || amount_approve1 === ""){
				alert("Please Enter Amount Approved for Child 1"); return false;
			}
			if(amount_approve2 === null || amount_approve2 === ""){
				alert("Please Enter Amount Approved for Child 2"); return false;
			}
			
		}
		return true;
	}
</script>

</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	<form:form action="./allowanceapprove" method="post" name="requestno"
		target="_blank" onsubmit="return validate()">

		<section class="container mt-5 shadow py-5 " id="section">
			<h6 align="center">EMPLOYEE ALLOWANCE APPROVE</h6>
			<div id="form1">
				<label>Request No:</label> <input type="text" name="request_no"
					id="request_no" /> <input type="button" id="search"
					class="btn btn-success px-2" value="Search"
					onclick="vendorsearch()" style="height: 35px;" /> <input
					type="button" id="helpsearch" class="btn btn-info px-2"
					value="Seach Request No" onclick="requestnosearch()"
					style="height: 35px;" />
			</div>

			<div id="allowance_response">
				<%@include file="allowance_approve_details.jsp"%>
			</div>

			<input type="submit" id="submit_btn"
				style="display: none; margin-left: 400px;"
				class="btn btn-success px-3" value="Generate Note Sheet" />



		</section>
	</form:form>

	<div id="myModal1" class="modal1">
		<div class="modal-content1">
			<span class="close1" style="color: red; font-weight: bold;">&#9746;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<center>
				<div id="scrollbar">
					<div id="content"></div>
				</div>
			</center>
		</div>
	</div>

</body>
</html>
