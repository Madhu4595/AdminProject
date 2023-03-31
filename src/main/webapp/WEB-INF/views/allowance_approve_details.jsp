<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  
  //amount_approve1 Validation
    function amount_approve1Validation()
  {   	  
	    amount_approve1=document.getElementById('amount_approve1').value;
      if ($('#cea_amount_child1').text() < amount_approve1){   
    	  
    	  alert('Amount approved for child1 is more than Amount claimed');
    	  document.getElementById('amount_approve1').value = "";
          return false;
      }
      else {    
              return true;
          }
      }
   
  //amount_approve2 Validation
   function amount_approve2Validation()
  {   	  	 
	    amount_approve2=document.getElementById('amount_approve2').value;
      if ($('#cea_amount_child2').text() < amount_approve2){   	           
    	  alert('Amount approved for child2 is more than Amount claimed');
    	  document.getElementById('amount_approve2').value = "";
          return false;
      }
      else {    
              return true;
          }
      }	 
  
//   //amount_approve validation
   function amount_approveValidation()
   {   	  	 
	   amount_approve=document.getElementById('amount_approve').value;
       if ($('#cea_amount_child2').text() < amount_approve){   	           
     	  alert('Amount approved is more than the Amount claimed');
     	  document.getElementById('amount_approve').value = "";
           return false;
       }
       else {    
               return true;
           }
       }	 
  
   function abc()
   {	 
	   //alert("abc()")
	   var typeofbill=$('#allowance_type').val();
	   var noofchilds=$('#noofchilds').val();
	   
		   if(typeofbill=="CEA")
			{
			   if(noofchilds === "1"){
				   $('#rowc0').show();
				   $('#rowc1').show();
				   $('#rowc2').hide();
			   }
			   if(noofchilds === "2"){
				   //alert("no of childs 2");
				   $('#rowc0').show();
				   $('#rowc1').show();
				   $('#rowc2').show();  
			   }
			}
		  if(typeofbill=="GPA")
			{
			  $('#amount_approve00').show();
			  $('#amount_approve1_0').hide();
			  $('#amount_approve1_1').hide();	
			  $('#amount_approve1_2').hide();
			}
		  if(typeofbill=="GPF")
			{
			  $('#amount_approve00').show();
			  $('#amount_approve1_0').hide();
			  $('#amount_approve1_1').hide();	
			  $('#amount_approve1_2').hide();
			}
		  if(typeofbill=="BRIEF CASE")
			{
			  //alert("ddddddddddddddddddddddddddddddddd")
			  $('#rowc3').show();  
			}
	}
	     
  </script>
<style>
#home {
	font-weight: bolder;
	margin-left: 300px;
}

table {
	background-color: teal;
	margin-bottom: 10px;
}

.col-5 {
	color: black;
	font-weight: bolder;
}
</style>
</head>
<body>
	<div id="home">
		<div id="details_emp" style="display: none">
			<div class="row">
				<div class="col-3">Employee Code:</div>
				<div class="col-5">
					<span id="emp_id"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-3">Type of Bill:</div>
				<div class="col-5">
					<span id="bill_type"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-3">Amount Claimed:</div>
				<div class="col-5">
					<span id="claimed_amount"></span>
				</div>
			</div>
		</div>
		<br> 
		<input type="hidden" name="amount_cla" id="amount_cla">
		<input type="hidden" name="allowance_type" id="allowance_type">
		<input type="hidden" name="noofchilds" id="noofchilds"/>

		<div class="row" id="rowc0">
			<div class="col-2"></div>
			<div class="col-3">Amount claimed</div>
			<div class="col-4">Amount Approved</div>
		</div>
		<div class="row" id="rowc1">
			<div class="col-2">Child - 1</div>
			<div class="col-3"><span id="cea_amount_child1"></span> </div>
			<div class="col-4"> 
				<input name="amount_approve1" id="amount_approve1" onChange="amount_approve1Validation()" />
			</div>
		</div>
		<div class="row" id="rowc2">
			<div class="col-2">Child - 2</div>
			<div class="col-3"><span id="cea_amount_child2"></span></div>
			<div class="col-4"> 
				<input name="amount_approve2" id="amount_approve2" onchange="amount_approve2Validation();" />
			</div>
		</div>
		
		<div class="row" id="rowc3" style="display: none">
			<div class="col-4">Amount Approved</div>
			<div class="col-4"><input name="amount_approved" id="amount_approved" /></div>
		</div>
 
	</div>
</body>
</html>