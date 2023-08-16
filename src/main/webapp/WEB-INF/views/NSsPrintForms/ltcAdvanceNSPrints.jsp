<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM - Outsource NoteSheet</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type : "get",
		url : "./getAllLTCAdvanceForNSPrints",
		cache : false,
		success : function(response) {
			//alert("success response length=> "+response.length)
			//alert("success response  => "+JSON.stringify(response))
			
			if(response.length === 0){
				$("#reqstable").hide();
				document.getElementById("noreqsmsg").innerHTML = "No Request Numbers are Available for Generating NoteSheet";
			}else{
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
			}

			

		},
		error : function(response) {
			alert("GEM Requests are not Found");
		}
	});
});
function geneatens(a){
	//alert("asdfasdfas"+a);
	var requestno = a;
	$("#requestno").val(requestno);
	document.forms[0].action="./getLTCAdvanceForNSPrints";
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
	 
	height: 300px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/banner.jsp"%>
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	
	<form:form action="" method="post">
	<input type="hidden" name="requestno" id="requestno"/>
	</form:form>
	
	<center>
	<span style="color:blue; font-weight:bolder;">APPROVED DETAILS FOR LTC - Advance Encashment</span><br>
	<span id="noreqsmsg" style="font-weight: bolder; color: red;"></span>
	
</center>
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