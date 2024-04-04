<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <style>
  .getbg002 {
    background-color: #67c355;
}
.sendhead {
    color: #67c355;
    font-size: 30px;
}
.sendhead1 {
    color: #3333ff;   
}
.white {
    color: white !important;
}
.btn-warning {
    color: #ffffff !important;
    background-color: #67c355 !important;
    border-color:#67c355 !important;
    font-size: 20px !important;
    border-radius: 0 !important;
}
#maindata{border: 2px solid black; background-color: #e6f9ff; font-weight: bolder;}
h4{
	color: blue;
	text-decoration: underline;
	font-weight: bolder;
}
</style>
   <script src="./js/ajax.js" type="text/javascript"></script>
   <script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
   <script src="./js/jquery.min.js" type="text/javascript"></script>
   <script src="./bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   
  <script>
  
  function amountcheck(a,b){
	
	  if(a<b){
		  alert("Amount Approve is less than Amount Claimed");
		  return false;
	  }
  }
  
  function approvalsearch() { 
	  //alert("approvalsearch");
	      var approval_from = $('#approval_from').val();	  
	  	  var approval_to = $('#approval_to').val();
	  	  //alert(approval_from +" to "+approval_to);
	  	  
	  	  $.ajax({
					type: "get",
				    url: "./approvalsearch",
				    data: "approval_from=" + approval_from+"&approval_to="+approval_to,
				    cache: false,
				    success: function(html)
				    {
				    	//alert(html);
				    	//$("#search").hide();	
				    	$("#submit_btn").show();	
				    	$("#allowance_response").html(html);	    	
				    	
			       }
 				});
		 

	     }
  
  function generate_sanction(a){ 
	 // alert("generate_sanction");
  		var sio_date = $('#sio_date'+a).val();
  		var allowance_type = $('#allowance_type'+a).val();
  		var request_no = $('#request_no'+a).val();
  		
  		//alert("sio_date"+sio_date+",allowance_type"+allowance_type+",request_no"+request_no);
  		
  		if(sio_date=="")
	 	{
	 		alert("please enter sanction order number");
			sio_date.focus();
	 		return false;
	 	}
  		
  		$.ajax({
  			type: "get",
  			url: "./checkSO",
  			data: "siodate="+sio_date,
  			cache: false,
  			success:function(response){
  				//alert("response=> "+JSON.stringify(response));
  				
  				if(response === 200){
  					alert("sanction order number is already available"); 
  					$("#sio_date").val(''); $("#sio_date").focus();
  				}else{
  					//genersanction(request_no, allowance_type, sio_date);
  					
  					document.location.href = './generate_sanction_data?request_no='+request_no+'&allowance_type='+allowance_type+'&siodate='+sio_date;
  					
  				}
  			}
  		});
  		
  		
  	
	    	
 
  	
  }
//   function genersanction(request_no, allowance_type, sio_date){
// 	  $.ajax({
// 			type: "get",
// 		    url: "./generate_sanction_data",
// 		    data: "request_no=" + request_no+"&allowance_type="+allowance_type+"&siodate="+sio_date,
// 		    cache: false,
// 		    success: function(html)
// 		    {
// 		    	$("#maindata").hide();	
// 		     	$("#navbarhide").hide();	
// 		     	$("#navbanner").hide();	
// 		    	$("#allowance_response1").html(html);
		    	
// 	       }
// 		});
//   }
  
function form_submit(){
	document.so_form.action="./generate_sanction_data";
	document.so_form.submit();
	document.so_form.target="_blank";
	
}

  </script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sanction Order</title>
    <link rel="stylesheet" href="./sass/style.css" />
  <link rel="stylesheet" href="./sass/bootstrap.min.css"/>
   
  </head>
  <body>
  <div id="navbanner">
  <%@include file="banner2.jsp" %>
  <%@include file="navbar.jsp" %>
	</div>
	<form:form action="" method="post" name="so_form" target="_blank"> 
    	<!-- Intro Section  -->
    	<section class="container mt-5 shadow py-5" id="maindata">
    		<div class="row">
    			<div class="col-md-12  md-p-1 p-1"> 
    			<h4 align="center" >Approval of Sanction Generation Module</h4>
    			</div>
    		</div>
    		
			<div align="center" style="padding-left:50px;" class="form-group">
				<table>
					<tr>
	 				<label>Approval No From:</label> 
     				<input type="text" name="approval_from" id="approval_from" style="width:100px;">
      				<label>Approval No To:</label> 
     				<input type="text" name="approval_to" id="approval_to" style="width:100px;" onchange="approvalsearch();">
					</tr>
				</table>
				<span style="text-align: center; font-weight: bolder;" >${msg }</span>
				<br><br>
			</div>
			<input type="hidden" name="req_id" id="req_id"><input type="hidden" name="num_tab" id="num_tab"> 
			<div id="allowance_response" style="width:500px;margin-left:50px;"> </div>
			<br>
    	</section>
	</form:form>
 	<div id="allowance_response1"> </div>

  </body>
</html>
    