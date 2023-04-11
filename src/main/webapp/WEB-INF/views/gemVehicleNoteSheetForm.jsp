<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		url : "./getAllGEMs",
		cache : false,
		success : function(response) {
			//alert("success response length=> "+response.length)
			//alert("success response  => "+JSON.stringify(response))

			for (var i = 0; i < response.length; i++) {
				var gem = response[i];
				$("#tbody").append(
						'<tr><td>' + gem.requestno
								+ '</td><td>' + gem.billno
								+ '</td><td>' + gem.amount + '</td><td>'+gem.billdate+'</td><td>'+gem.monthYear+'</td><td>'+gem.period+'</td>'
								+'<td><a href=\"generateGEMNoteSheet?requestno='+gem.requestno+'\">Generate NoteSheet</a></td></tr>');
			}

		},
		error : function(response) {
			alert("GEM Requests are not Found");
		}
	});
});
</script>
</head>
<body>
<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	<div align="center">
		<h3 class="h3 font-weight-bolder">GEM - Vehicle Details </h3>
		
		<table border="1" class="table table-stripped">
					<thead>
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