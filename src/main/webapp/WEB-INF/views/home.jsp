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
	<style>
	#nicimgg,#apimgg{
		width: 180px;
		height: 80px;
	}
	#nicimgg{
	margin-right: 80px;
	margin-left: 30px;
	}
	#apimgg{
	margin-left: 130px;
	}
	#titlee{
		font-size: 45px;
	}
	#bannnersection{
		border: 2px solid black;
		background: #e6ffcc;
		
	}
/* 	.container{ */
/* 		border: 2px solid black; */
/* 		margin-top: 20px; */
/* 		background-color: #ffe6ff; */
/* 	} */
	
	</style>
	
		 
</head>
<body>
<section id="bannnersection">
		<div id="banner">
			<img alt="NIC" src="./images/nic-logo.jpg" id="nicimgg"  > <b
				id="titlee">NIC APSC ADMIN BILL PROCESSING</b> <img alt="AP"
				src="./images/indialogo.jpeg" id="apimgg"  >
		</div>
	</section>
<%@include file="navbar.jsp"%>

<div style="color: red;font-weight: bold;" align="center" ><h3>
${msg}
</h3>
</div>
	 
</body>
</html>