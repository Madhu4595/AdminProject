<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Creation</title>
 <script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
 <script>
 
 function getData(){
	 alert(";")
	 var emp_code = "3586";
	 $.ajax({
	     type: "get",
	     contentType: "application/json",
	     url: "getFamilyDetails?emp_code="+emp_code,
	     dataType: 'json',
	     cache: false,
	     timeout: 600000,
	     success: function (data) {
	         alert("success"+JSON.stringify(data));
	         document.location.href='/home';

	     },
	     error: function (data) {
	     }
	 });
 }
 

 </script>
</head>
<body>
<%@include file="navbar.jsp" %>

<button onclick="getData();">click</button>
 
</body>
</html>