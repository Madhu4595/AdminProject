<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<section>
		<div id="banner">
			<img alt="NIC" src="./images/nic-logo.jpg" id="nicimg"  > <b
				id="title">NIC APSC ADMIN BILL PROCESSING</b> <img alt="AP"
				src="./images/indialogo.jpeg" id="apimg"  >
		</div>
	</section>
<%@include file="navbar.jsp"%>

<center style="color: red;"><h3><b>
${msg}
</b></h3>
</center>
	 
</body>
</html>