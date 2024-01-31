<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LTC - EL Advance</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./sass/bootstrap.min.css" />

<script>
 $(document).ready(function(){
	 //alert("asdfasdfas")
	 $("#editbody").hide();
	//requestno
	$("#requestno").focus();
 	//empcodelable
 	$("#empcodelable").hide();
 	//empcode
 	$("#empcode").hide(); $("#empcode").val('');
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
	//totalfarelable
	$("#totalfarelable").hide();
	//totalfare
	$("#totalfare").hide(); $("#totalfare").val('');
	//amountadvancelable
	$("#amountadvancelable").hide();
	//amountadvance
	$("#amountadvance").hide(); $("#amountadvance").val('');
	//submitbtn
	$("#submitbtn").hide();
	
 });

function searchrequestno(){
	 
	var requestno = document.getElementById("requestnoo").value;
	//alert("requestno=> "+requestno);
	var requestnopattern = /^[A-Z]{3}[0-9]{4}$/;
	
	if(requestno === null || requestno === ""){
		alert("Request Number is Required, Please Enter that"); $("#requestno").focus(); return false;
	}
	
	if(requestno.match(requestnopattern)){
		//alert("matched");
		$.ajax({
			type: "get",
			url: "./getLTCAdvanceForEdit",
			data: "requestno="+requestno,
			cache: false,
			success:function(response){
				
				//alert("response success=> "+JSON.stringify(response));
				
				if(response === ""){
					alert("Given Request Number is not Found");
					$("#requestnoo").focus();
					$("#editbody").hide();
					return false;
				}else{
					$("#editbody").show();
					$("#requestno").val(response.requestno)
				 	$("#empcode").val(response.empcode);
				 	
				 	document.getElementById("requestnoprint").innerHTML = response.requestno;
				 	document.getElementById("empcodeprint").innerHTML = response.empcode;
					
					$("#blockyearlable").show();
					$("#blockyear").show(); $("#blockyear").val(response.blockyear);
					
					$("#locationlable").show();
					$("#location").show(); $("#location").val(response.location);
					
					$("#visitplacelable").show();
					$("#visitplace").show(); $("#visitplace").val(response.visitplace);
					
					$("#claimedforlable").show();
					$("#claimedfor").show(); $("#claimedfor").val(response.claimedfor);
					
					$("#visitperiodlable").show();
					$("#visitperiod").show(); $("#visitperiod").val(response.visitperiod);
					
					$("#leavedetailslable").show();
					$("#leavedetails").show(); $("#leavedetails").val(response.leavedetails);
					
					$("#totalfarelable").show();
					$("#totalfare").show(); $("#totalfare").val(response.totalfare);
					
					$("#amountadvancelable").show();
					$("#amountadvance").show(); $("#amountadvance").val(response.amountadvance);
					
					$("#submitbtn").show(); 
				}
				
			},
			error: function(response){
				alert("Request Number Not Found!");
			}
		});
	}else{
		alert("Request Number Invalid");
		$("#requestnoo").val(''); $("#requestnoo").focus();
	}
	
	
}

function getrequestnos(){
	//alert("getrequestnos")
	
	var modal1 = document.getElementById("myModalSuccess");
   var span = document.getElementsByClassName("close1")[0];
	            
	    modal1.style.display = "block";
	    span.onclick = function() {
			modal1.style.display = "none";
		};
    
    $.ajax({
    	type: "get",
    	url: "./getAllLTCAdvanceForEdit",
    	cache: false,
    	success:function(response){
    		//alert("success response length=> "+response.length)
    		//alert("success response  => "+JSON.stringify(response))
    		$("#tbody").empty();
    		for(var i = 0; i < response.length; i++){
    			var ltc = response[i];
    			$("#tbody").append('<tr><td><a href="javascript:addRequestNo(\''+ltc.requestno+'\')">'+ltc.requestno+'</a></td><td>'+ltc.empcode+'</td><td>'+ltc.location+'</td></tr>');
    		}
    		
    	},
    	error:function(response){
    		alert("No LTC Requests are not available for Approval");
    	}
    });
}
function addRequestNo(a){
	//alert("asdfasdfas"+a);
	
	var modal1 = document.getElementById("myModalSuccess");
	modal1.style.display = "none";
	
	$("#requestno").val(a);
	$("#requestnoo").val(a);
	//searchrequestno();
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
table{
	overflow-y: auto;
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
</style>
</head>
<body>
	<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>
	<div align="center">
		<h3 class="h3 font-weight-bolder">LTC-EL Enacachement Edit Form</h3>
	</div>
	<div class="container border p-4 font-weight-bolder"
		style="background-color: #e6ffff;">
		 
	 
			<div class="row align-items-center m-2">
				<div class="col-auto" style="width: 200px;">
					<label for="requestno" class="col-form-label">Searching Request No:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="requestnoo" id="requestnoo" class="form-control" maxlength="9"/>
					<span></span>
				</div>
				<div class="col-auto" style="width: 200px;">
					<input type="button" id="getdata" class="form-control"  value="Get Data" onclick="return searchrequestno()" style="background-color: green; color: white; font-weight: bold;"/>
				</div>
				<div class="col-auto">
					<input type="button" class="form-control"  value="Get All Request Numbers"  onclick="return getrequestnos()" style="background-color: #6666ff; color: white; font-weight: bold;"/>
				</div>
			</div>
			
			</div><br>
	<div class="container border p-4 font-weight-bolder" style="background-color: #e6ffff;" id="editbody">

		<form:form action="./updateltcadvanceEnacachment" method="post" modelAttribute="updateltc">
		
			<input type="hidden" name="requestno" id="requestno" />
			 <input type="hidden" name="empcode" id="empcode" />
			 
			 <center style="color: #3333ff;">
			 	<b>Request Number: <span id="requestnoprint"></span> 
			 	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			 	&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			 	Employee Code: <span id="empcodeprint"></span></b>
			 </center><br>

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
			 
				<div class="col-auto" style="width: 200px;" id="totalfarelable">
					<label for="leavedetails" class="col-form-label">Total
						Fare:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="totalfare" id="totalfare"
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

	<div id="myModalSuccess" class="mymodalsuccess">
		<div class="successcontent">
		<span class="close1" style="color: red; font-weight: bold;">&#9746;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<center>
				<table class="table table-bordered table-striped" >
					<thead style="background-color: black; color: white;">
						<th>Request Number</th>
						<th>Employee Code</th>
						<th>Place of visit</th>
					</thead>
					<tbody id="tbody"></tbody>
				</table>

			</center>
		</div>
	</div>

</body>
</html>