<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>LTC-EL Enacachement</title>

<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>

	$(document).ready(function(){
		//alert("asdfsadfs")
		
		$("#datatable").hide();
		 $.ajax({
		    	type: "get",
		    	url: "./getAllLTCAdvanceForEdit",
		    	cache: false,
		    	success:function(response){
		    		//alert("success response length=> "+response.length)
		    		//alert("success response  => "+JSON.stringify(response))
		    		$("#tbodyy").empty();
		    		
		    		if(response.length === 0){
		    			document.getElementById("nodata").innerHTML = "NO DATA IS AVAILABLE FOR APPROVAL";
		    		}else{
		    			$("#datatable").show();
		    			for(var i = 0; i < response.length; i++){
			    			var ltc = response[i];
			    			$("#tbodyy").append('<tr>'
			    			+'<td>'+ltc.requestno+'</td>'
			    			+'<td>'+ltc.empcode+'</td>'
			    			+'<td>'+ltc.location+'</td>'
			    			+'<td><a href="javascript:geneatens(\''+ltc.requestno+'\')">Generate Note Sheet</a></td></td></tr>');
			    		}
		    		}
		    	},
		    	error:function(response){
		    		alert("No LTC Request are Found");
		    	}
		    });
	});
	
	function searchrequestno() {
		//alert("asdfasd"); 

		var requestno = $("#requestno").val();
		//alert("requestno=> "+requestno);

		if (requestno === "" || requestno === null) {
			alert("Please enter Request Number");
			$("#requestno").focus();
			return false;
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
	    		alert("No LTC Request are Found");
	    	}
	    });
	}
	function addRequestNo(a){
		//alert("asdfasdfas"+a);
		
		var modal1 = document.getElementById("myModalSuccess");
		modal1.style.display = "none";
		
		$("#requestno").val(a);
		searchrequestno();
	}
	
	function geneatens(a){
		//alert("asdfasdfas"+a);
		
		$("#requestno").val(a);
		document.forms[0].action="./ltcAdvanceNSPrint";
		document.forms[0].submit();
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
    text-align:justify;
}
#scrollbarr {
    height: 300px;
    overflow-x: hidden;
    overflow-y: auto;
    text-align:justify;
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
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div align="center">
		<h6 class="h6 font-weight-bolder text-primary">LTC- Advance Note Sheet Form</h6>
	</div>

	<div class="container border" style="background-color: #e6f9ff;">

		<form:form action="./ltcAdvanceNSPrint" method="post">
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
					 <input type="submit" id="getdata" class="form-control"  value="Generate Note Sheet" onclick="return searchrequestno()" style="background-color: green; color: white; font-weight: bold;"/>
				</div>
				<div class="col-auto">
					 <input type="button" class="form-control"  value="Get All Request Numbers"  onclick="return getrequestnos()" style="background-color: #6666ff; color: white; font-weight: bold;"/>
				</div>
			</div>
		</form:form>
	</div>

	<div class="col-auto p-4" align="center">
		
	</div>


	<div id="myModalSuccess" class="mymodalsuccess">
		<div class="successcontent">
		<span class="close1" style="color: red; font-weight: bold;">&#9746;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<center>
				<div id="scrollbar">
				<table class="table table-bordered table-striped">
					<thead style="background-color: black; color: white;">
						<th>Request Number</th>
						<th>Employee Code</th>
						<th>Place of visit</th>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
				</div>
			</center>
		</div>
	</div>
	
	<div align="center">
		<h6 class="h6 font-weight-bolder text-danger"><span id="nodata"></span>${msg}</h6>
	</div>
	<div id="scrollbarr">
	<table class="table table-bordered table-striped" id="datatable">
					<thead style="background-color: black; color: white;">
						<th>Request Number</th>
						<th>Employee Code</th>
						<th>Place of visit</th>
						<th>Action</th>
					</thead>
					<tbody id="tbodyy"></tbody>
				</table></div>
</body>
</html>