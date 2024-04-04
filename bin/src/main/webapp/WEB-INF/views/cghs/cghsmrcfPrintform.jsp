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
		//$("#reqNosData").hide();
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
<style>
#scrollbar {
	width: 1100px;
	height: 440px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/banner2.jsp"%>
	<%@ include file="/WEB-INF/views/empLogin.jsp"%>
<%-- 	<%@ include file="/WEB-INF/views/navbar2.jsp"%> --%>
	
	<div style="color: red;" align="center"><h6><b> ${msg} </b></h6> </div>
	
	
	<div class="row align-items-center m-2">
					<div class="col-12" align="center">
						<h6 class="h6 font-weight-bolder text-primary "> CGHS Prints</h6>
					</div>
				</div>
	
	<div class="container">
			<div class="row">
				<div class="col-12"
					style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
					
				
				<form action="./cghsmrcfPrint" >
				<div class="row align-items-center m-2">
					<div class="col-4">
						<label for="monthYear" class="col-form-label float-right">
							Request Number</label>
					</div>
					<div class="col-4">
						<input type="text" class="form-control" name="requestNo" id="requestNo" class="form-check-input" /> 
					</div>
					<div class="col-4">
						<input type="submit" class="form-control btn-success" value="Get Print" /> 
					</div>
<!-- 					<div class="col-3"> -->
<!-- 						<input type="button" class="form-control btn-info" value="Find Request Numbers" onclick="getAllRequest();"  />  -->
<!-- 					</div> -->
				</div>
				</form>
				 
					</div></div></div>
					
					
					<div align="center" style="color: blue;font-weight: bold;margin-top: 10px;"> Available CGHS Bills </div>
					<div class="container mt-2" style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
						
						<div id="scrollbar"> 
						<div id="content" align="center">
						<table class="table table-bordered">
						<thead>
							<tr>
								<th>Request No</th>
								<th>Patient Name</th>
								<th>Hospital Name</th>
							</tr>
						</thead>
						<tbody id="requestNos">
						
							<c:forEach var="bean" items="${list }">
								<tr>
									<td><a href="./cghsmrcfPrint?requestNo=${bean.cghsId }">${bean.cghsId }</a></td>
									<td>${bean.patientId }</td>
									<td>${bean.hospitalName }</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					</div></div>
					</div>
	
<!--  <div align="center"> -->

<!-- 		<div class="container mt-2 mb-4 border font-weight-bolder   shadow-lg" -->
<!-- 			style="background-color: #e6ffff; border-radius: 20px;"> -->
			
			
				
				
				
				
			
<!-- 			</div></div> -->
			
				
				
				
</body>
</html>