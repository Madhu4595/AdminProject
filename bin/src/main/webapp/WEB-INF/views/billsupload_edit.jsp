<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />
<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="./customCSS/employee_allowance_editCSS.css" />

<style>
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	border-top: 0px solid #ddd;
	height: 0px;
}

#section {
	border: 2px solid black;
	background-color: #e6f9ff;
}

h4 {
	font-weight: bolder;
	color: blue;
	text-decoration: underline;
}

#form1 {
	margin: 2px;
	align-content: center;
	margin-left: 300px;
	font-weight: bolder;
}
</style>



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
	  
	  if(document.getElementById('balpersp').style.display != 'none')
		  {
		 
		  var balance_accounts = $('#balance_accounts').val();
		    var subseq_depo = $('#subseq_depo').val();
		    var num=parseInt(balance_accounts)+parseInt(subseq_depo);
		  
			document.getElementById("total").value = Math.round(num);
			document.getElementById("total").readOnly=true;
		  }
	  else{		
		
		  var balance_accounts = $('#closing_amt_bills').val();
		    var subseq_depo = $('#subseq_depo').val();
		    var num=parseInt(balance_accounts)+parseInt(subseq_depo);
		  
			document.getElementById("total").value = Math.round(num);
			document.getElementById("total").readOnly=true;
	  }
		
	   
	}
  
  function cea_amount() {    
	  	  if(document.getElementById('amountclaimchild1').style.display != 'none')
		  {		
		  var cea_1 = $('#cea_amount_child1').val();
		    var cea_2 = $('#cea_amount_child1').val();
		    var num=parseInt(cea_1)+parseInt(cea_2);
		  
			document.getElementById("amount_cla").value = Math.round(num);
			document.getElementById("amount_cla").readOnly=true;
		  }		   
	}
  
  
  
  function balanceamounts() {    
		var total = $('#total').val();
	    var subseq_withdw = $('#subseq_withdw').val();
	    var nums=parseInt(total)+parseInt(subseq_withdw);
	  
		document.getElementById("balance").value = Math.round(nums);
		document.getElementById("balance").readOnly=true;
	   
	}


  function helprequestnosearch() { 
	  var modal1 = document.getElementById("myModal1");
	    var span = document.getElementsByClassName("close1")[0];
	    modal1.style.display = "block";
	    span.onclick = function () {
	        modal1.style.display = "none";
	    };
			 $.ajax({
					type: "get",
				    url: "./medicalrequestnos",
				    cache: false,
				    success: function(html)
				    {
				    	$("#content").html(html);
				    	$("#myModal1").show();
				    	//$("#myModal .modal-body").html(html)				    	
				    	//$('#myModal').modal('show'); 
				    	//$("#submit_btn").show();	
			       }
				});
	  }
  	function callrequestno(a){
  		
	  	document.getElementById("request_no").value=a;
  		$("#submit_btn").show();
  	 	requestnosearch(a);
  	}
    
    function requestnosearch(a) { 
    	//alert("requestnosearch=> "+a);
  		  var request_no = $('#request_no').val();
  		 document.getElementById("request_no").readOnly=true;
  		 //$('#myModal').modal('hide');
  		 $("#myModal1").hide();
   
  		$.ajax({
  			type: "get",
  			url: "./medicalreqnosearch",
  			data: "request_no="+request_no,
  			cache: false,
  			success: function(html){
  				$("#search").hide();	
  				$("#submit_btn").show();
  				$("#allowance_response").show();
  				$("#allowance_response").html(html);
  				return checktype();
  			}
  		});
  }
  	 function myFunction(){
  		  $('#myModal').modal('hide');
  		 
  		 
  	  }
  	 
  	 
  </script>

</head>
<body>
	<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>

	<!-- Intro Section  -->
	<section class="container mt-5 shadow py-5" id="section">
		<h4 align="center">MEDICAL ALLOWANCES EDIT</h4>

		<div align="left" style="padding-left: 50px;">
			<form:form action="./billsuploadeditsave" modelAttribute="bills_Upload"
				method="post">

				<div id="form1">
					<label>Request No:</label> <input type="text" name="request_no"
						id="request_no" onchange="requestnosearch()" /> <input
						type="button" id="search" class="btn btn-warning px-3"
						value="Search Request No" onclick="helprequestnosearch()" />
				</div>



				<div id="allowance_response" style="display: none">
				</div>
 
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
