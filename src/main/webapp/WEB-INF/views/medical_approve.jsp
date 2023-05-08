<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
.getbg002 {
	background-color: #67c355;
}

.sendhead {
	color: blue;
	font-weight: bold;
	text-decoration: underline;
	font-size: large;
}

.sendhead1 {
	color: #67c355;
}

.white {
	color: white !important;
}

.btn-warning {
	color: #ffffff !important;
	background-color: #67c355 !important;
	border-color: #67c355 !important;
	font-size: 15px !important;
	border-radius: 0 !important;
}

#section {
	border: 2px solid black;
	background-color: #e6f9ff;
}

#empname {
	color: white;
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
    overflow-y:  scroll; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
.close1:hover,
.close1:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-content1{
    background-color: #e4eeb9;
    border: 2px solid black;
}
#scrollbar {
    width: 800px;
    height: 300px;
    overflow-x: hidden;
    overflow-y: auto;
    text-align:justify;
}
</style>




<script>
	function callrequestno(a) {
		document.getElementById("eno").value = a;
		$('#myModal').modal('hide');
		$("#submit_btn").show();
		medicalbilldata();
	}
	function amountcheck(a, b) {
		if (a < b) {
			//alert("Amount Approve is less than Amount Claimed");
			//return false;
		}
	}

	function medicalbilldata() {
		var eno = $("#eno").val();
		$("#myModal1").hide();
		$.ajax({
			type : "get",
			url : "./medicalbilldata",
			data : "request_no=" + eno,
			cache : false,
			success : function(html) {
				$('#allowance_response').html(html); //medical_billdata.jsp
				$('#allowance_response').show();
				$('#submit_btn').show();
			}
		});

	}

	function employeesearch() {
		var eno = $('#eno').val();
		document.getElementById("eno").readonly = true;

		$
				.getJSON(
						'employeesearch.action?eno=' + eno,
						function(response) {
							if (response) {
								if (response.Error == 'Success') {
									document.getElementById("empname").innerHTML = response.name;
									document.getElementById("basicpay").innerHTML = response.basic_pay;
								}
							}
						});

	}

	function requestnosearch() {
		var eno = $("#eno").val();
		document.getElementById("eno").readonly = true;
		
		$.get('./requestnosearch', {
			eno : eno
		}, function(response) {
			$('#empname').text(response[1] + ',' + response[2]);
			$('#helpsearch').hide();
		})

	}

	function helprequestnosearch() {
		//document.getElementById("request_no").readonly=true;
		var modal1 = document.getElementById("myModal1");
	    var span = document.getElementsByClassName("close1")[0];
	    modal1.style.display = "block";
	    span.onclick = function () {
	        modal1.style.display = "none";
	    };
		$.ajax({
			type : "get",
			url : "./medicalrequestnos",
			cache : false,
			success : function(html) {
				$("#content").html(html);
				$("#myModal1").show();
// 				$("#myModal .modal-body").html(html)
// 				$('#myModal').modal('show');
// 				$("#submit_btn").show();
			}
		});

	}
	function myFunction() {
		$('#myModal').modal('hide');
	}
	function validate(){
		//alert("Asdfasdfasdf"); 
 		var noofbills = $("#noofbills").val();
 		alert("noofbills==> "+noofbills);
		
		for(var i = 1; i <= noofbills; i++){
			var a = $("#amount_approve"+i).val();
			var b = $("#remarks"+i).val();
			
			if(a === null || a === ""){
				alert("Amount Approved is Required, Fill that"); return false;
			}
			if(b === null || b === ""){
				alert("Remarks is Required, Fill that"); return false;
			}
		}
		
		return true;
	}
</script>


</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<form:form action="./medicalallowanceapprove" method="post"
		modelAttribute="medical_Bills_upload" onsubmit="return validate()">

		<!-- Intro Section  -->
		<section class="container mt-5 shadow py-5" id="section">

			<div class="row">
				<div class="col-md-12  md-p-1 p-1">
					<h5 align="center" class="sendhead">ALLOWANCE APPROVE</h5>
				</div>
			</div>

			<div align="center" style="padding-left: 50px; font-weight: bolder;"
				class="form-group">
				<table>
					<tr>
						<td>Request No:</td>
						<td><input type="text" class="form-control" name="request_no"
							id="eno" onchange="requestnosearch(),medicalbilldata();"
							maxlength="5"></td>
						<td id="empname"></td>
						<td><input type="button" id="helpsearch"
							class="btn btn-warning px-2" value="Seach Request No"
							onclick="helprequestnosearch()" /></td>

					</tr>

				</table>
				<br> <br>
			</div>
			<span></span>
			<div id="allowance_response" style="display:none;"></div>
			<br>

		 
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
			<div style="margin-left: 400px;">
				<input class="btn btn-warning px-5" type="submit" id="submit_btn"
					style="display: none; align: center"
					class="btn nav-link btn-light p-2" value="Submit" />
			</div>
		</section>
	</form:form>



</body>
</html>
