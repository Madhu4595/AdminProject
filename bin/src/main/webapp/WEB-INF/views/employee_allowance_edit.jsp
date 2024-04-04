<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>VENDOR</title>

<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<link rel="stylesheet" href="./customCSS/employee_allowance_editCSS.css" />
<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="./customJS/emp_allow_edit.js" type="text/javascript"></script>



<%System.out.println("gdfjuhgih"); %>
<script>
   		$(document).ready(function(){
   			//alert("onload function calling");
    		$('#allowance_response').hide();
		});
   	</script>

<script>
  

  	function employeesearch() {   
	 
	  	var eno = $('#eno').val();	  
	  	document.getElementById("eno").readonly=true;
	  
		$.getJSON('./employeesearch.action?eno=' + eno, function (response) {
			 if (response) {				
	             if(response.Error=='Success'){

	             document.getElementById("empname").innerHTML =response.name.bold();
	             document.getElementById("basicpay").innerHTML =response.basic_pay.bold();
	         }}
		 });
	  
  	}
	  
  	function balanceamount() {    
	  //alert("balance amoutn")
	  if(document.getElementById('balpersp').style.display != 'none')
		  {
		 //alert("if")
		  var balance_accounts = $('#balance_asper_accountsslip').val();
		    var subseq_depo = $('#subsequent_deposits').val();
		    var num=parseInt(balance_accounts)+parseInt(subseq_depo);
		  
			document.getElementById("total").value = Math.round(num);
			document.getElementById("total").readOnly=true;
		  }
	  else{		
		//alert("else")
		  var balance_accounts = $('#closing_balance_asper_accounts').val();
		    var subseq_depo = $('#subsequent_deposits').val();
		    var num=parseInt(balance_accounts)+parseInt(subseq_depo);
		  
			document.getElementById("total").value = Math.round(num);
			document.getElementById("total").readOnly=true;
	  }
		
	   
	}
  

  
  
  function balanceamounts() {    
		var total = $('#total').val();
	    var subseq_withdw = $('#subsequent_withdrawals').val();
	    var nums=parseInt(total)+parseInt(subseq_withdw);
	  
		document.getElementById("balance").value = Math.round(nums);
		document.getElementById("balance").readOnly=true;
	   
	}
//   function allowancelist(selectObject){
// 	  var allowancevalue = selectObject.value;  
// 	  //alert(value);
// 	  if(allowancevalue=="1")
// 		{
// 		  $('#pofc').show();	
// 		  $('#adamt').show();
// 		  $('#amountclaimchild1').show();		  
// 		  $('#ceares').show();		
// 		  $('#amountclaim').show();	
// 		  $('#cea_file').show();
// 		  $('#headop').show();
// 		  $('#ceaname').show();
		  
		  
// 		  $('#comser').hide();	
// 		  $('#balpersp').hide();
// 		  $('#gsubdeps').hide();	
// 		  $('#gpftot').hide();	
// 		  $('#gsubwith').hide();	
// 		  $('#gbal').hide();
// 		  $('#gpf_file').hide();
		  
// 		  $('#gaclse').hide();	
// 		  $('#gasubdep').hide();
// 		  $('#gasubwith').hide();	
		  
// 		  $('#billno').hide();	
// 		  $('#billdate').hide();	
// 		  $('#shopname').hide();	
// 		  $('#lclaim').hide();	
		 
// 		}
// 	  if(allowancevalue=="2")
// 		{
// 		  $('#comser').show();	
// 		  $('#balpersp').show();
// 		  $('#gsubdeps').show();	
// 		  $('#gpftot').show();	
// 		  $('#gsubwith').show();	
// 		  $('#gbal').show();	
// 		  $('#amountclaim').show();
// 		  $('#gpf_file').show();
// 		  $('#ceares').show();	
// 		  $('#headop').show();
// 		  document.getElementById('subseq_depo').value='';
// 		  document.getElementById('total').value='';
// 		  document.getElementById('subseq_withdw').value='';
// 		  document.getElementById('balance').value='';
		
		  
// 		  $('#pofc').hide();	
// 		  $('#adamt').hide();
// 		  $('#amountclaimchild1').hide();	
// 		  $('#cea_file').hide();
// 		  $('#ceaname').hide();
		  
// 		  $('#gaclse').hide();	
// 		  $('#gasubdep').hide();
// 		  $('#gasubwith').hide();	
		  
// 		  $('#billno').hide();	
// 		  $('#billdate').hide();	
// 		  $('#shopname').hide();	
// 		  $('#lclaim').hide();	
		  
// 		}
// 	  if(allowancevalue=="3")
// 		{
// 		  $('#gaclse').show();	
// 		  $('#gsubdeps').show();
// 		  $('#gsubwith').show();	
// 		  $('#gpftot').show();	
// 		  $('#gsubwith').show();	
// 		  $('#gbal').show();	
// 		  $('#amountclaim').show();
// 		  $('#gpf_file').show();
// 		  $('#ceares').show();	
// 		  $('#headop').show();
// 		  document.getElementById('subseq_depo').value='';
// 		  document.getElementById('total').value='';
// 		  document.getElementById('subseq_withdw').value='';
// 		  document.getElementById('balance').value='';
		  
// 		  $('#pofc').hide();	
// 		  $('#adamt').hide();	
// 		  $('#amountclaimchild1').hide();	
// 		  $('#cea_file').hide();
// 		  $('#ceaname').hide();
		  
// 		  $('#comser').hide();	
// 		  $('#balpersp').hide();	
		  
// 		  $('#billno').hide();	
// 		  $('#billdate').hide();	
// 		  $('#shopname').hide();	
// 		  $('#lclaim').hide();	
		  
// 		}
// 	  if(allowancevalue=="4")
// 		{
// 		  $('#billno').show();	
// 		  $('#billdate').show();	
// 		  $('#shopname').show();	
// 		  $('#lclaim').show();	
// 		  $('#ceares').show();	
// 		  $('#amountclaim').show();
// 		  //$('#ceares').show();	
// 		  $('#headop').show();
// 		  $('#gpf_file').show();
// 		  $('#pofc').hide();	
// 		  $('#adamt').hide();
// 		  $('#amountclaimchild1').hide();	
		  
// 		  $('#comser').hide();	
// 		  $('#balpersp').hide();
// 		  $('#gsubdeps').hide();	
// 		  $('#gpftot').hide();	
// 		  $('#gsubwith').hide();	
// 		  $('#gbal').hide();
// 		  $('#ceaname').hide();
		  
// 		  $('#gaclse').hide();	
// 		  $('#gasubdep').hide();
// 		  $('#gasubwith').hide();
// 		}
//   }


 
  function myFunction(){
	  $('#myModal').modal('hide');
  }
  
  </script>
<style>
#form1 {
	margin: 2px;
	align-content: center;
	margin-left: 300px;
	font-weight: bolder;
}
</style>
</head>
<body>
	<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>
	<!-- Intro Section  -->
	<section class="container mt-5 shadow py-5" id="section">
		<h4 align="center">EMPLOYEE ALLOWANCES EDIT</h4>

		<div align="left" style="padding-left: 50px;">

			<form:form action="./employee_allowance_update" method="post"
				onsubmit="return validate();" >

				<div id="form1">
					<label>Request No:</label> <input type="text" name="request_no"
						id="request_no" onchange="requestnosearch()" /> <input
						type="button" id="search" class="btn btn-info px-3"
						value="Search Request No" onclick="helprequestnosearch()" />
				</div>

				<div id="allowance_response">
					<%@include file="employee_allowance_edit_details.jsp"%>
				</div>

				<!--       ============================Model for Admission Numbers Serach============-->
				<div id="myModal1" class="modal1">
					<div class="modal-content1">
						<span class="close1" style="color: red; font-weight: bold;">&#9746;</span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<center>
						<div id="scrollbar">
							<div id="content">
							</div>
						</div>
						</center>
					</div>
				</div>

			</form:form>
		</div>

	</section>

</body>
</html>
