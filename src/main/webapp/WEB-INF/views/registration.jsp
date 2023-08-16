<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
<!-- 	Registration Form -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
<!-- 				Success Message -->
					<div th:if="${param.success}">
						<div class="alert alert-info">Your successfully registered</div>
					</div>
				
			</div>
		</div>
		
		<h1>Registration</h1>
		<form:form action="./registration" method="post" modelAttribute="user">
			<div class="form-group">
				<label class="control-label" for="firstName">First Name</label>
				<input id="firstName"  class="form-control" name="firstName" required autofocus="autofocus" />
			</div>
			<div class="form-group">
				<label class="control-label" for="lastName">Last Name</label>
				<input id="lastName"  class="form-control" name="lastName" required autofocus="autofocus" />
			</div>
			<div class="form-group">
				<label class="control-label" for="email">E-Mail</label>
				<input id="email"  class="form-control" name="email" required autofocus="autofocus" />
			</div>
			<div class="form-group">
				<label class="control-label" for="password">Password</label>
				<input id="password"  class="form-control" name="password" required autofocus="autofocus" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success">Register</button>
				<span>Already Registered? <a href="/login">Login here</a></span>
			</div>
		</form:form>
	</div>
</body>
</html>