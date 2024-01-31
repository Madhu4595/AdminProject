<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GPF - Withdraw SO Print</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<style>
#scrollbar { 
	height: 450px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
<script>
$(document)
.ready(
		function() {

			$
					.ajax({
						type : "get",
						url : "./getAllGPFWithdrawForSOPrint",
						cache : false,
						success : function(response) {
							//alert("success response length=> "+response.length)
							//alert("success response  => "+JSON.stringify(response))

							if(response.length === 0){
								$("#reqstable").hide();
								document.getElementById("noreqsmsg").innerHTML = "No Request Numbers are Available for Generating NoteSheet";
							}else{
								for (var i = 0; i < response.length; i++) {
									var gpf = response[i];
									$("#tbody")
											.append(
													'<tr><td>'
															+ gpf.requestNo
															+ '</td><td>'
															+ gpf.empCode
															+ '</td><td>'
															+ gpf.gpfNo
															+ '</td><td>'
															+ gpf.purpose
															+ '</td><td>'
															+ gpf.withDrawAmt
															+ '</td><td>'
															+ gpf.netBalance
															+ '</td>'
															+ '<td>'+gpf.sanctionNumber+'</td><td><input type="button" style="background-color: green; color: white; font-weight: bolder;" value="Print Sanction Order" onClick="return generateSO(\''
															+ gpf.requestNo
															+ '\')"/></td></tr>');
								}
							}
							

						},
						error : function(response) {
							alert("GEM Requests are not Found");
						}
					});
		});
		
function generateSO(a) {
	//alert("generateSO " + a);
	var requestNo = a;
	$("#requestNo").val(requestNo);
	
	document.forms[0].action="./getGPFWithdrawSOPrints";
	document.forms[0].submit();
	return true;
}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/banner2.jsp" %>
	<%@ include file="/WEB-INF/views/navbar2.jsp" %>
	
	<form:form action="" method="post">
		<input type="hidden" name="requestNo" id="requestNo"/>
	</form:form>
	
<center>
	<span style="color:blue; font-weight:bolder;">SANCTIONED DETAILS FOR GPF - Withdraw</span>
	<span id="noreqsmsg" style="font-weight: bolder; color: red;"></span>
</center>
<div id="scrollbar">
<table border="1" class="table table-stripped" id="reqstable">
			<thead style="background-color: black; color: white;">
				<th>Request Number</th>
				<th>Employee Code</th>
				<th>GPF Number</th>
				<th>Purpose</th>
				<th>Withdraw Amount</th>
				<th>Net Balance</th>
				<th>Sanction Order No</th>
				<th>Action</th>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
		</div>
		
</body>
</html>