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

						$.ajax({
									type : "get",
									url : "./getDistinctNotenumbers",
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
																		+ cea.note_number
																		+ '</td><td>'
																		+ cea.requestno
																		+ '</td>'
																		+ '<td><a href=\"./generateCEANSPrints?noteNumber='
																		+ cea.note_number
																		+ '\">Generate NoteSheet</a></td></tr>');
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
<div class="container">
	<table border="1" class="table table-stripped" id="reqstable">
		<thead style="background-color: black; color: white;">
			<tr>
			<th>Note Number</th>
			<th>Request Numbers</th>
			<th>Action</th>
			</tr>
		</thead>
		<tbody id="tbodyy"></tbody>
	</table>
</div>

</body>
</html>