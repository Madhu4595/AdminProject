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
	function searchrequestno() {
		//alert("asdfasd"); 

		var requestno = $("#requestno").val();
		//alert("requestno=> "+requestno);

		if (requestno === "" || requestno === null) {
			alert("Please enter Request Number");
			$("#requestno").focus();
			return false;
		}

		var action = $("#action").val();
		//alert("action=> "+action);

		if (action === "" || action === null) {
			alert("Please select For Using this Request Number");
			$("#action").focus();
			return false;
		}
		if(action === "sanctionorder"){
			var da = $("#da").val();
			var so = $("#so").val();
			
			if(da === "" || da === null){
				alert("Please enter DA Percentage"); $("#da").focus(); return false;
			}
			var patternda = /^[0-9]{1,3}$/;
			if(!da.match(patternda) || da > 100 || da <= 0){
				alert("Invalid DA Percentage, It should Numeric with in range Max value is 100 and Min 1"); $("#da").val(''); $("#da").focus(); return false;
			}
			
			if(so === "" || so === null){
				alert("Please enter Sanction Order Number"); $("#so").focus(); return false;
			}
			
		}

	}
	function actionchange() {
		//alert("asdfasf")

		var requestno = $("#requestno").val();
		//alert("requestno=> "+requestno);

		if (requestno === "" || requestno === null) {
			alert("Please enter Request Number");
			$("#action").val('');
			$("#requestno").focus();
			return false;
		}

		var action = $("#action").val();
		//alert("action=> "+action);
		
		if(action === "sanctionorder"){
			$("#dalable").show();
			$("#dainput").show();
			$("#da").val('');
			$("#solable").show();
			$("#soinput").show();
			$("#so").val('');
		}else{
			$("#dalable").hide();
			$("#dainput").hide();
			$("#da").val('');
			$("#solable").hide();
			$("#soinput").hide();
			$("#so").val('');
		}

	}
	function getrequestnos(){
		//alert("getrequestnos")
		
		var modal1 = document.getElementById("myModalSuccess");
	    //var span = document.getElementsByClassName("successclose")[0];
	            
	    modal1.style.display = "block";
	   // span.onclick = function () {  modal1.style.display = "none"; };
	    
	    $.ajax({
	    	type: "get",
	    	url: "./getAllLtcs",
	    	cache: false,
	    	success:function(response){
	    		//alert("success response length=> "+response.length)
	    		//alert("success response  => "+JSON.stringify(response))
	    		
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
</style>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div align="center">
		<h3 class="h3 font-weight-bolder">LTC-EL Enacachement Form</h3>
	</div>

	<div class="container border" style="background-color: #e6f9ff;">

		<form:form action="./ltcElEncachementNotesheetPrint" method="post" target="_blank;">
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
					<label for="inputPassword6" class="col-form-label">For: </label>
				</div>
				<div class="col-auto">
					<select name="action" id="action" class="form-select p-2"
						style="border-radius: 5px;" onchange="return actionchange()">
						<option value="">-select-</option>
						<option value="notesheet">Note Sheet</option>
						<option value="sanctionorder">Sanction Order</option>
					</select>
				</div>
			</div>
			<div class="row g-3 align-items-center m-4">
				<div class="col-auto" style="display: none;" id="dalable">
					<label for="inputPassword6" class="col-form-label"> DA
						Percentage : </label>
				</div>
				<div class="col-auto" style="display: none;" id="dainput">
					<input type="text" name="da" id="da" class="form-control" />
				</div>
				<div class="col-auto" style="display: none;" id="solable">
					<label for="inputPassword6" class="col-form-label">Sanction
						order No: </label>
				</div>
				<div class="col-auto" style="display: none;" id="soinput">
					<input type="text" name="so" id="so" class="form-control" />
				</div>
			</div>
			<div class="row g-3 align-items-center m-4">
				<div class="col-auto m-4">
					<input type="submit" value="Submit" class="btn btn-success"
						onclick="return searchrequestno()" />
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
			<center>
				<div id="scrollbar">
				<table class="table table-bordered table-striped">
					<thead>
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
		<h6 class="h6 font-weight-bolder text-danger">${msg}</h6>
	</div>
</body>
</html>