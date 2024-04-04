<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<link rel="stylesheet" href="./customCSS/employee_allowance_editCSS.css" />
<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<link type="text/css"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


<style>
#section {
	border: 2px solid black;
	background-color: #e6f9ff;
	font-weight: bolder;
}

h4 {
	color: blue;
	text-decoration: underline;
	font-weight: bolder;
}

table, .bb {
	margin-left: 150px;
}

input[type='submit'] {
	margin-left: 250px;
}
</style>

<script>
		function isNumberKey(evt){
    		var charCode = (evt.which) ? evt.which : evt.keyCode
    		if (charCode > 31 && (charCode < 48 || charCode > 57))
        	return false;
    		return true;
		}
		function allowAlphaNumericSpace(e) {
	  		var code = ('charCode' in e) ? e.charCode : e.keyCode;
	  		if (!(code == 32) && // space
	    		!(code > 47 && code < 58) && // numeric (0-9)
	    	!(code > 64 && code < 91) && // upper alpha (A-Z)
	    !(code > 96 && code < 123)) { // lower alpha (a-z)
	    e.preventDefault();
	  }
	}
	
//Validation for submit

 function Validate(){
	//alert("asdfasdfasdf")
	//vcode
	var vcode=document.getElementById("vcode").value;
	if(vcode === "" || vcode === ""){ alert("Please Enter Vendor Code"); return false; }
	
	var vname = document.getElementById("vname").value;
	if(vname === "" || vname === ""){ alert("Please Enter Vendor Name"); return false; }
	
	var vpan = document.getElementById("vpan").value;
	if(vpan === "" || vpan === ""){ alert("Please Enter PAN Numbert"); return false; }
	
	var bank_name = document.getElementById("bank_name").value;
	if(bank_name === "" || bank_name === ""){ alert("Please Enter Bank Name"); return false; }
	
	var vbank = document.getElementById("vbank").value;
	if(vbank === "" || vbank === ""){ alert("Please Enter Bank Account Number"); return false; }
	
	var vifsc = document.getElementById("vifsc").value;
	if(vifsc === "" || vifsc === ""){ alert("Please Enter IFSC Code"); return false; }
	
	var vaddress = document.getElementById("vaddress").value;
	if(vaddress === "" || vaddress === ""){ alert("Please Enter Address"); return false; }
	
	var vgst = document.getElementById("vgst").value;
	if(vgst === "" || vgst === ""){ alert("Please Enter GST Number"); return false; }
	
 	
return true;
 }

//Valiadation for Vendor Code

     function vcodeValidation()
  {   
     name = document.getElementById('vcode').value;
      var format = /[!@#$%^&*()+\=\[\]{};:\\|,<>\/?]/;  
      if (name == ''){
    	  alert("Vendor Code is null");           
          document.getElementById('vcode').value = "";
          return false;
      } else if (name !== '') {
          if (name.match(format)){
        	  alert('Vendor Code must not contain any symbols');
              document.getElementById('vcode').value = "";
              return false;
          } else if (name.length < 3){
        	  alert("Vendor Code must contain at least 3 characters");
              document.getElementById('vcode').value = "";
              return false;
          } else if (name.length > 6) {
        	  alert("Vendor Code must not exceed 6 characters");
             document.getElementById('vcode').value = "";
              return false;
          } else {    
              return true;
          }
      }
  }

//Validation for PAN Number

  function vpanValidation()
  {   
     name = document.getElementById('vpan').value;
      var format = /[!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;  
      if (name == ''){
    	  alert("PAN Number is null");           
          document.getElementById('vpan').value = "";
          return false;
      } else if (name !== '') {
          if (name.match(format)){
        	  alert('PAN Number must not contain any symbols');
              document.getElementById('vpan').value = "";
              return false;
          } else if (name.length < 3){
        	  alert("PAN Number must contain at least 3 characters");
              document.getElementById('vpan').value = "";
              return false;
          } else if (name.length > 18) {
        	  alert("PAN Number must not exceed 18 characters");
             document.getElementById('vpan').value = "";
              return false;
          } else {    
              return true;
          }
      }
  }
  
//Validation for Bank Number

function vbankValidation()
  {     
     name = document.getElementById('vbank').value;
      //var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\=\[\]{};:\\|,<>\/?]/;  
      if (name == ''){
    	  alert("Bank Number is null");           
          document.getElementById('vbank').value = "";
          return false;
      } else {    
              return true;
          }
      }
  
//Validation for IFSC Code

  function vifscValidation()
  {   
     name = document.getElementById('vifsc').value;
      var format = /[!@#$%^&*()+\=\[\]{};:\\|,<>\/?]/;  
      if (name == ''){
    	  alert("IFSC Code is null");           
          document.getElementById('vifsc').value = "";
          return false;
      } else if (name !== '') {
          if (name.match(format)){
        	  alert('IFSC Code must not contain any symbols');
              document.getElementById('vifsc').value = "";
              return false;
          } else if (name.length < 3){
        	  alert("IFSC Code must contain at least 3 characters");
              document.getElementById('vifsc').value = "";
              return false;
          } else if (name.length > 10) {
        	  alert("IFSC Code must not exceed 10 characters");
             document.getElementById('vifsc').value = "";
              return false;
          } else {    
              return true;
          }
      }
  }

//Validation for GST Number

function vgstValidation()
  {   
     name = document.getElementById('vgst').value;
      var format = /[!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;  
      if (name == ''){
    	  alert("GST Number is null");           
          document.getElementById('vgst').value = "";
          return false;
      } else if (name !== '') {
          if (name.match(format)){
        	  alert('GST Number must not contain any symbols');
              document.getElementById('vgst').value = "";
              return false;
          } else if (name.length < 3){
        	  alert("GST Number must contain at least 3 characters");
              document.getElementById('vgst').value = "";
              return false;
          } else if (name.length > 10) {
        	  alert("GST Number must not exceed 10 characters");
             document.getElementById('vgst').value = "";
              return false;
          } else {    
              return true;
          }
      }
  }

//Validtion for Name

  function vnameValidation()
  {   
     name = document.getElementById('vname').value;
      var format = /[0123456789!@#$%^*()+\-=\[\]{};:\\|,<>\?]/;  
      if (name == ''){
    	  alert("Name is null");           
          document.getElementById('vname').value = "";
          return false;
      } else if (name !== '') {
          if (name.match(format)){
        	  alert('Name of vendor must not contain any numbers or symbols');
              document.getElementById('vname').value = "";
              return false;
          } else if (name.length < 3){
        	  alert("Name of vendor must contain at least 3 characters");
              document.getElementById('vname').value = "";
              return false;
          } else if (name.length > 80) {
        	  alert("Name of vendor must not exceed 80 characters");
             document.getElementById('vname').value = "";
              return false;
          } else {    
              return true;
          }
      }
  }
//
 function searchvcode(){
	  var vcode = $('#vcode').val();
  	  document.getElementById("vcode").readonly=true; 
	
 		$.get('./vendorsearchnum',{code:vcode}, function(response){
 			//alert(response);
 					document.getElementById("vname").value =response[0];
 					document.getElementById("vpan").value =response[1];
 					document.getElementById("bank_name").value =response[2];
 					document.getElementById("vbank").value =response[3];
 					document.getElementById("vifsc").value =response[4];
 					document.getElementById("vaddress").value =response[5];
 					document.getElementById("vgst").value =response[6];
 					document.getElementById("vaddress").innerHTML =response[7];
 		});
}
</script>
</head>
<!DOCTYPE html>
<body>
	<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>
	<section class="container mt-5 shadow py-5 " id="section">
		<h4 align="center">VENDOR INSERT</h4>
		<div align="left" style="padding-left: 50px;">
			<form:form action="./saveVendor" method="POST" modelAttribute="vendor"
				onsubmit="return Validate();">
				<div class="abc">

					<table>
						<tr>
							<td>Vendor Code:</td>
							<td><form:input path="code" id="vcode" maxlength="6"
									onchange="return searchvcode()" /></td>
						</tr>
						<tr>
							<td>Vendor Name:</td>
							<td><form:input path="name" id="vname" maxlength="80"
									style="width:600px;" onChange="return vnameValidation()" /><br>
						</tr>
						<tr>
							<td>PAN Number:</td>
							<td><form:input path="pan_no" id="vpan" maxlength="18"
									onChange="return vpanValidation()" /><br>
						</tr>
						<tr>
							<td>Bank Name:</td>
							<td><form:input path="bank_name" id="bank_name" /><br>
						</tr>
						<tr>
							<td>Bank Account Number:</td>
							<td><form:input path="bank_acno" id="vbank" maxlength="18"
									onkeypress="return isNumberKey(event)"
									onChange="return vbankValidation()" /><br>
						</tr>
						<tr>
							<td>IFSC Code:</td>
							<td><form:input path="ifsc_code" id="vifsc" maxlength="10"
									onChange="return vifscValidation()" /><br>
						</tr>
						<tr>
							<td>Address:</td>
							<td><textarea name="address" id="vaddress" cols="22"></textarea>
							</td>
						</tr>
						<tr>
							<td>GST Number:</td>
							<td><form:input path="gst_no" id="vgst" maxlength="15"
									onChange="return vgstValidation()" /><br>
						</tr>
					</table>
				</div>
				<br>
				<table>
					<tr>
						<td><input type="submit" class="btn btn-success px-3"
							value="Submit" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</section>
</body>
</html>