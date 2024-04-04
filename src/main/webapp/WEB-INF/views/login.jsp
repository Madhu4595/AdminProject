<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NIC ADMIN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./bootstrap/bootstrap452.min.css">
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>


<style>
/* 	 	#formcontainer{  */
/*  		border: 2px solid black;  */
/*  		margin-top: 20px;  */
/*  		background-color: #ffe6ff;  */
/*  		width: 40%; */
/*  	}  */
</style>

<script type="text/javascript">
	
$( document ).ready(function() {
	document.getElementById("username_label").innerHTML='Username :';
});
	
		function loginaction(){
			//alert("loginaction");
			
			const loginAs = document.querySelectorAll('input[name="loginAs"]');
			let selectedLogin = null;
			
			loginAs.forEach(input=>{
				if(input.checked){
					selectedLogin=input.value;
				}
			});
			if(selectedLogin=='admin'){
				document.getElementById("username_label").innerHTML='Username :';
			}
			if(selectedLogin == 'employee'){
				document.getElementById("username_label").innerHTML='Username (Official NIC Mail ID):';
				$("#passworddiv").empty();
				
				$("#passworddiv").append('<label for="password"> Date of Joining / Date of Birth: </label> <input type="date"'
							+'class="form-control" name="password" id="password" />');
				
			}else{
				window.location.reload();
			}
			
		}
		
		function validate(){
				//alert("validate");
			 
				const loginAs = document.querySelectorAll('input[name="loginAs"]');
			 
			 	let selectedLogin = null;
				
				loginAs.forEach(input=>{
					if(input.checked){
						selectedLogin=input.value;
					}
				});
				
				if(selectedLogin == 'employee'){
					
 					var username = $("#username").val();
 					var doj = $("#password").val();
					var dojj = doj.toString();
					//alert("username"+username);
			
 					$.ajax({
 						type: 'get',
 						url: './validateEmpLogin?username='+username+'&doj='+dojj,
 						cache: false,
 						timeout: 600000,
 						success:function(resp){
 							//alert("success resp=>"+JSON.stringify(resp));
 							
 							if(resp.found == 'found'){
 								//alert("found"+resp.username);
 								
 								$("#passworddiv").empty();
 								$("#passworddiv").append('<label for="password"> Date of Joining / Date of Birth: </label> <input type="hidden"'
 										+'class="form-control" name="password" id="password" />');
 								
 								$("#password").val(resp.username);
 								var pass = $("#password").val();
 								//alert("pass=>"+pass);
 								
 								document.forms[0].submit();
 								
 							}else{
 								//alert("notfound");
 								document.getElementById('userError').innerHTML = 'Invalid Credentials';
 							}
 						},
 						error:function(resp){
 							//alert("error=>"+resp);
 							document.getElementById('userError').innerHTML = 'Invalid Credentials';
 						}
						
 					});
 				}else{
 					document.forms[0].submit();
 				}
			}
	</script>

</head>
<body>

	<%@include file="banner2.jsp"%>
	<br>
	<!-- 	Login Form -->
	<div
					style="text-decoration: underline; color: blue; font-weight: bolder;"
					align="center">LOGIN HERE</div>
	<div class="container   ">

		<div class="row">

			<div class="col-md-3"></div>

			<div class="col-md-6 col-md-offset-3 border  "
				style="background-color: #e6ffff; border-radius: 20px;">
				
					<div ><c:if test="${param.error!= null}">
						<div class="alert alert-danger">Invalid username or password. Please try again.</div>
						</c:if>
					</div>
					<div ><c:if test="${param.logout!= null}">
						<div class="alert alert-success">You have been successfully logged out</div>
						</c:if>
					</div>
				<br> <span style="color: blue; margin-right: 20px;">
					Login As </span> <input type="radio" name="loginAs" value="employee"
					onchange="return loginaction();" style="margin-right: 5px;" />
				EMPLOYEE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="loginAs" value="admin"
					onchange="return loginaction();" checked="checked"
					style="margin-right: 5px;" /> ADMIN <br>
				<br>
				<form:form action="./login" method="post"
					modelAttribute="authenticationRequest">

					<div class="form-group">
						<label for="username"> <span id="username_label"></span> </label> <input type="text"
							class="form-control" id="username" name="username"
							autofocus="autofocus" placeholder="abc@nic.in" />
					</div>
					<div class="form-group" id="passworddiv">
						<label for="password"> Password: </label> <input type="password"
							class="form-control" id="password" name="password"
							  />
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="button" name="login-submit" id="login-submit"
									class="form-control btn btn-primary" value="Log In"
									onclick="return validate();" />
							</div>
						</div>
					</div>
				</form:form>
			</div>
			
		</div>


	</div>
	
<!-- 	<div class="col-md-3" align="center" style="color: red;"><span id="userError"></span></div> -->
<!-- 											<span>New User? <a href="registration">Register Here</a></span>  -->

<br>
<br>
<br>
<br>
<%@include file="footer.jsp"%>

</body>
</html>