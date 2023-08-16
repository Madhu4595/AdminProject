<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GEM - Vehicle NoteSheet</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type : "get",
		url : "./getAllGemOutsourceForNS",
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
									+'<td><a href=\"generateGEMOutsourceNoteSheet?requestno='+gem.requestno+'\">Generate NoteSheet</a></td></tr>');
				}
			}
		},
		error : function(response) {
			alert("No Records are available for Approval");
		}
	});
});
function getrequestnos() {
	//alert("getrequestnos")

	var modal1 = document.getElementById("myModalSuccess");
	var span = document.getElementsByClassName("successclose")[0];

	modal1.style.display = "block";
	 span.onclick = function () {  modal1.style.display = "none"; };

	$.ajax({
		type : "get",
		url : "./getAllGemOutsourceForNS",
		cache : false,
		success : function(response) {
			//alert("success response length=> "+response.length)
			//alert("success response  => "+JSON.stringify(response))
			$("#popuptbody").empty();
			for (var i = 0; i < response.length; i++) {
				var gem = response[i];
				$("#popuptbody")
						.append(
								'<tr><td><a href="javascript:addRequestNo(\''
										+ gem.requestno + '\')">'
										+ gem.requestno + '</a></td><td>'
										+ gem.billno + '</td><td>'
										+ gem.amount + '</td><td>'+gem.billdate+'</td></tr>');
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
	
	$("#requestno").val(a);
	
}
function searchrequestno() {
	//alert("asdfasd"); 

	var requestno = $("#requestno").val();
	//alert("requestno=> "+requestno);
	
	var SONum = $("#SONum").val();
	//alert("SONum=> "+SONum);
	

	if (requestno === "" || requestno === null) {
		alert("Please enter Request Number");
		$("#requestno").focus();
		return false;
	}
	else{
		
		$.ajax({
			type : "get",
			url : "./getGemOutsourceForNS?requestno="+requestno,
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response.length)
				//alert("success response  => "+JSON.stringify(response))
				
				if(response.length === 0){
					alert("No record Found with Given Request Number for Approval");
					$("#requestno").val('');
					$("#requestno").focus();
					return false;
				}else{
					document.forms[0].action="./generateGEMOutsourceNoteSheet";
					document.forms[0].submit();
					return true;
				}

			},
			error : function(response) {
				alert("No GEM Request are Found");
			}
		});
		
		return true; 
	}
	 
return true;		 
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
		<h3 class="h3 font-weight-bolder">GEM - Outsourcing Notesheet Form </h3>
		
		<div class="container border p-2 m-4" style="background-color: #e6f9ff; width: 70%;" >
			
			<form:form action="" method="post">
			
				<div class="row align-items-center m-2">
		
				<div class="col-3">
					<label for="monthYear" class="col-form-label">Search Request Number</label>
				</div>
				<div class="col-2">
					<input type="text" name="requestno" id="requestno" class="form-control" />
				</div>
				<div class="col-3">
					<input type="button" class="form-control" value="Generate Note Sheet" onclick="return searchrequestno()" style="background-color: green; color: white; font-weight: bold;"/>
				</div>
				<div class="col-4">
					<input type="button" class="form-control" onclick="return getrequestnos()"  value="Get All Request Numbers"   style="background-color: #6666ff; color: white; font-weight: bold;"/>
				</div>
			</div>

			</form:form>
			<span style="text-align: center; font-weight: bolder; color: red;">${msg }</span>
		</div>
		 
		<div id="myModalSuccess" class="mymodalsuccess">
			<div class="successcontent">
				<center>
					<div id="scrollbar">
					<span class="successclose" style="text-align: right; margin-left: 50%; font-weight: bolder;">&#x2717;</span>
						<table class="table table-bordered table-striped">
							<thead style="background-color: black; color: white;">
								<th>Request Number</th>
								<th>Bill Number</th>
								<th>Amount</th>
								<th>Bill Date</th>
							</thead>
							<tbody id="popuptbody"></tbody>
						</table>
					</div>
				</center>
			</div>
		</div>
		<span id="noreqsmsg" style="font-weight: bolder; color: red;"></span>
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