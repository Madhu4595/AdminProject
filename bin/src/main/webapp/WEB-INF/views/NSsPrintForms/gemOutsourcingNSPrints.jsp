<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		url : "./getAllGemOutsourceForNSPrints",
		cache : false,
		success : function(response) {
			//alert("success response length=> "+response.length)
			//alert("success response  => "+JSON.stringify(response))
			
			if(response.length === 0){
				$("#reqstable").hide();
				document.getElementById("noreqsmsg").innerHTML = "No Request Numbers are Available for Generating NoteSheet";
			}else{
				for (var i = 0; i < response.length; i++) {
					var gem = response[i];
					$("#tbody").append(
							'<tr><td>' + gem.requestno
									+ '</td><td>' + gem.billno
									+ '</td><td>' + gem.amount + '</td><td>'+gem.billdate+'</td><td>'+gem.monthYear+'</td><td>'+gem.period+'</td>'
									+'<td><a href=\"./generateGEMOutsourceNSPrints?requestno='+gem.requestno+'\">Generate NoteSheet</a></td></tr>');
				}
			}

			

		},
		error : function(response) {
			alert("GEM Requests are not Found");
		}
	});
});
 
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
<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/navbar2.jsp"%>
	
	<center>
	<span style="color:blue; font-weight:bolder;">APPROVED DETAILS FOR GEM - Outsource</span><br>
	<span id="noreqsmsg" style="font-weight: bolder; color: red;"></span>
	
</center>
<div id="scrollbar">
<table border="1" class="table table-stripped" id="reqstable">
		<thead style="background-color: black; color: white;">
			<th>Request Number</th>
						<th>Bill Number</th>
						<th>Amount</th>
						<th>Bill Date</th>
						<th>Month & Year</th>
						<th>Period</th>
						<th>Action</th>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	</div>
	
	 
</body>
</html>