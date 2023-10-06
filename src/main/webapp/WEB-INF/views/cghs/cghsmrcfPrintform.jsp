<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/banner.jsp"%>
	<%@ include file="/WEB-INF/views/navbar.jsp"%>
	
 <div align="center">

		<div class="container mt-2 mb-4 border font-weight-bolder   shadow-lg"
			style="background-color: #e6ffff; border-radius: 20px;">
			
			<div class="row align-items-center m-2">
					<div class="col-12">
						<h6 class="h6 font-weight-bolder text-primary "> CGHS Prints</h6>
					</div>
				</div>
				<form action="./cghsmrcfPrint" >
				<div class="row align-items-center m-2">
					<div class="col-2">
						<label for="monthYear" class="col-form-label float-right">
							Request Number</label>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" name="requestNo" class="form-check-input" /> 
					</div>
					<div class="col-3">
						<input type="submit" class="form-control btn-success" value="Get Print" /> 
					</div>
					<div class="col-3">
						<input type="button" class="form-control btn-info" value="Find Request Numbers"  /> 
					</div>
				</div>
				</form>
			
			</div></div>
			
				<div style="color: red;" align="center"><h6><b>
${msg}
</b></h6>
</div>
</body>
</html>