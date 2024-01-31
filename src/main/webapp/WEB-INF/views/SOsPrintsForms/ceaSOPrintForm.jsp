<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEA NS Prints</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
	$(document)
			.ready(
					function() {
						//alert("asdfsadfs")

						$
								.ajax({
									type : "get",
									url : "./getDistinctSanctionOrderNumbers",
									cache : false,
									success : function(response) {
										//alert("success response length=> "+response.length)
										//alert("success response  => "+JSON.stringify(response))
										if (response.length === 0) {
											$("#reqstable").hide();
											document.getElementById("noreqsmsg").innerHTML = "No GPF Withdraw Requests Numbers are Available for Generating NoteSheet";
										} else {
											for (var i = 0; i < response.length; i++) {
												var cea = response[i];
												$("#tbodyy")
														.append(
																'<tr><td>'
																		+ cea.sanction_number
																		+ '</td><td>'
																		+ cea.requestno
																		+ '</td>'
																		+ '<td><a href=\"generateCEASOPrints?sanctionNumber='
																		+ cea.sanction_number
																		+ '\">Generate Sanction Order</a></td></tr>');
											}
										}

									},
									error : function(response) {
										alert("No LTC Request are Found");
									}
								});
					});
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/banner2.jsp"%>
	<%@include file="/WEB-INF/views/navbar2.jsp"%>

	<div align="center">
		<span style="color: blue; font-weight: bolder;">APPROVED
			DETAILS FOR CEA </span><br> <span id="noreqsmsg"
			style="font-weight: bolder; color: red;"></span>

	</div>

	<table border="1" class="table table-stripped" id="reqstable">
		<thead style="background-color: black; color: white;">
			<th>Sanction Order Number</th>
			<th>Request Numbers</th>
			<th>Action</th>
		</thead>
		<tbody id="tbodyy"></tbody>
	</table>


</body>
</html>