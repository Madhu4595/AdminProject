<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
	AppUser emp  = (AppUser) session.getAttribute("user");
	String empcode = String.valueOf(emp.getId());
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CGHS Entry Form</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#reqNosData").hide();
		//getAllRequest();
	});

	function getAllRequest(){
		var empcode = '<%=empcode%>';
		//alert("empcode=>"+empcode);
		$.ajax({
			type: 'get',
			url: './getAllCghsEmp?empCode='+empcode,
			cache: false,
			timeout: 600000,
			success:function(resp){
				//alert("resp=>"+JSON.stringify(resp));
				$("#reqNosData").show();
				for(var i=0; i < resp.length; i++){
					var bean = resp[i];
					//alert("resp=>"+JSON.stringify(bean));
					$("#requestNos").append('<tr><td><a href="javascript:getId(\''+bean.cghsId+'\')">'+bean.cghsId+'</td><td>'+bean.empCode+'</td><td>'+bean.patientId+'</td><td>'+bean.hospitalName+'</td></tr>');
				}
				
				
			}
		});
	}
	function getId(a){
		//alert("getId=>"+a);
		$("#requestNo").val(a);
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/banner2.jsp"%>
	<%@ include file="/WEB-INF/views/navbar2.jsp"%>
	
	<div style="color: red;" align="center"><h6><b> ${msg} </b></h6> </div>
	
	<div class="container-fluid">
			<div class="row">
				<div class="col-3">
					<div class="card"
						style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						<!-- 					<div class="card-header"> -->

						<!-- 					</div> -->
						<div class="card-body">
							<img src="data:image/png;base64,${photo }" alt="Image"
								width="100px;" height="100px;" /><br> <span
								style="color: blue;">Employee Details</span><br>
							<table>
								<tr>
									<td>Code</td>
									<td>: ${emp.code }</td>
								</tr>
								<tr>
									<td>Name</td>
									<td>: ${emp.name }</td>
								</tr>
								<tr>
									<td>Designation</td>
									<td>: ${emp.designation }</td>
								</tr>
								<tr>
									<td>Basic Pay</td>
									<td>: ${emp.basic_pay }</td>
								</tr>
								<tr>
									<td>Place</td>
									<td>: ${emp.place }</td>
								</tr>
								<tr>
									<td>E-Mail</td>
									<td>: ${emp.email }</td>
								</tr>
								<tr>
									<td>Phone No</td>
									<td>: ${emp.phno }</td>
								</tr>
								<tr>
									<td>DO Joining</td>
									<td>: ${emp.doj }</td>
								</tr>
								<tr>
									<td>DO Retirement</td>
									<td>: ${emp.date_of_retirement }</td>
								</tr>
								<tr>
									<td>DOB</td>
									<td>: ${emp.dob }</td>
								</tr>
								<tr>
									<td>Payscale</td>
									<td>: ${emp.payscale }</td>
								</tr>
								<tr>
									<td>CGHS Code</td>
									<td>: ${emp.ecghsCode }</td>
								</tr>
							</table>
						</div>
						<!-- 					<div class="card-footer"> -->
						<!-- 				<a href="#" style="border: 1px solid black;padding: 2px;border-radius: 5px;font-weight: bold;">VIEW MORE</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
						<!-- 				<a href="#" style="border: 1px solid black;padding: 2px;border-radius: 5px;font-weight: bold;">EDIT DETAILS</a> -->
						<!-- 					</div> -->
					</div>
				</div>
				<div class="col-9"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
					<div class="row align-items-center m-2">
					<div class="col-12" align="center">
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
						<input type="text" class="form-control" name="requestNo" id="requestNo" class="form-check-input" /> 
					</div>
					<div class="col-3">
						<input type="submit" class="form-control btn-success" value="Get Print" /> 
					</div>
					<div class="col-3">
						<input type="button" class="form-control btn-info" value="Find Request Numbers" onclick="getAllRequest();"  /> 
					</div>
				</div>
				</form>
				<div id="reqNosData">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Request No</th>
								<th>Employee Name</th>
								<th>Patient Name</th>
								<th>Hospital Name</th>
							</tr>
						</thead>
						<tbody id="requestNos">
							
						</tbody>
					</table>
				</div>
					</div></div></div>
	
<!--  <div align="center"> -->

<!-- 		<div class="container mt-2 mb-4 border font-weight-bolder   shadow-lg" -->
<!-- 			style="background-color: #e6ffff; border-radius: 20px;"> -->
			
			
				
				
				
				
			
<!-- 			</div></div> -->
			
				
				
				
</body>
</html>