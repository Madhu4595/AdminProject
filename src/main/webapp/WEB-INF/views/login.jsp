<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" -->
<!-- 	crossorigin="anonymous"> -->

	<style>
	 	#formcontainer{ 
 		border: 2px solid black; 
 		margin-top: 20px; 
 		background-color: #ffe6ff; 
 		width: 40%;
 	} 
	</style>
	
</head>
<body>
	<%@include file="banner.jsp" %>
	<!-- 	Login Form -->
	<div class="container" id="formcontainer">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<h1>User Login</h1>
				<form:form action="login" method="post"
					modelAttribute="authenticationRequest">

					<div class="form-group">
						<label for="username"> Username: </label> <input type="text"
							class="form-control" id="username" name="username"
							autofocus="autofocus" />
					</div>
					<div class="form-group">
						<label for="password"> Password: </label> <input type="password"
							class="form-control" id="password" name="password"
							autofocus="autofocus" />
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<input type="submit" name="login-submit" id="login-submit"
									class="form-control btn btn-primary" value="Log In" />
							</div>
						</div>
					</div>
				</form:form>
				<div class="form-group">
					<!-- 					<span>New User? <a href="registration">Register Here</a></span> -->
				</div>
			</div>
		</div>


	</div>

</body>
</html>