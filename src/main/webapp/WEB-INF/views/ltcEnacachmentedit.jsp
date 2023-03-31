<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LTC - EL Enacachment</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./sass/bootstrap.min.css" />

<script>
 $(document).ready(function(){
	 //alert("asdfasdfas")
	//requestno
	$("#requestno").focus();
 	//empcodelable
 	$("#empcodelable").hide();
 	//empcode
 	$("#empcode").hide(); $("#empcode").val('');
	//blockyearlable
	$("#blockyearlable").hide();
	//blockyear
	$("#blockyear").hide(); $("#blockyear").val('');
	//locationlable
	$("#locationlable").hide();
	//location
	$("#location").hide(); $("#location").val('');
	//visitplacelable
	$("#visitplacelable").hide();
	//visitplace
	$("#visitplace").hide(); $("#visitplace").val('');
	//claimedforlable
	$("#claimedforlable").hide();
	//claimedfor
	$("#claimedfor").hide(); $("#claimedfor").val('');
	//visitperiodlable
	$("#visitperiodlable").hide();
	//visitperiod
	$("#visitperiod").hide(); $("#visitperiod").val('');
	//leavedetailslable
	$("#leavedetailslable").hide();
	//leavedetails
	$("#leavedetails").hide(); $("#leavedetails").val('');
	//encashmentlable
	$("#encashmentlable").hide();
	//encashment
	$("#encashment").hide(); $("#encashment").val('');
	//amountadvancelable
	$("#amountadvancelable").hide();
	//amountadvance
	$("#amountadvance").hide(); $("#amountadvance").val('');
	//submitbtn
	$("#submitbtn").hide();
	
 });

function searchrequestno(){
	 
	var requestno = document.getElementById("requestno").value;
	//alert("requestno=> "+requestno);
	var requestnopattern = /^[A-Z]{3}_[0-9]{4}$/;
	
	if(requestno.match(requestnopattern)){
		//alert("matched");
		$.ajax({
			type: "get",
			url: "./getltcbycode",
			data: "requestno="+requestno,
			cache: false,
			success:function(response){
				
				//alert("response success=> "+JSON.stringify(response));
				
				document.getElementById("requestno").readOnly = true;
				//searchbtn
				$("#getrequestnos").hide();
				
				$("#empcodelable").show(); 
				$("#empcode").show(); $("#empcode").val(response.empcode);
				
				$("#blockyearlable").show();
				$("#blockyear").show(); $("#blockyear").val(response.blockyear);
				
				$("#locationlable").show();
				$("#location").show(); $("#location").val(response.location);
				
				$("#visitplacelable").show();
				$("#visitplace").show(); $("#visitplace").val(response.visitplace);
				
				$("#claimedforlable").show();
				$("#claimedfor").show(); $("#claimedfor").val(response.claimedfor);
				
				$("#visitperiodlable").show();
				$("#visitperiod").show(); $("#visitperiod").val(response.visitperiod);
				
				$("#leavedetailslable").show();
				$("#leavedetails").show(); $("#leavedetails").val(response.leavedetails);
				
				$("#encashmentlable").show();
				$("#encashment").show(); $("#encashment").val(response.encashment);
				
				$("#amountadvancelable").show();
				$("#amountadvance").show(); $("#amountadvance").val(response.amountadvance);
				
				$("#submitbtn").show(); 
				
			},
			error: function(response){
				alert("Request Number Not Found!");
			}
		});
	}else{
		alert("Request Number Invalid");
		$("#requestno").val(''); $("#requestno").focus();
	}
	
	
}

function getrequestnos(){
	//alert("getrequestnos")
	
	var modal1 = document.getElementById("myModalSuccess");
    //var span = document.getElementsByClassName("successclose")[0];
            
    modal1.style.display = "block";
   // span.onclick = function () {  modal1.style.display = "none"; };
    
    $.ajax({
    	type: "get",
    	url: "./getAllLtcs",
    	cache: false,
    	success:function(response){
    		//alert("success response length=> "+response.length)
    		//alert("success response  => "+JSON.stringify(response))
    		
    		for(var i = 0; i < response.length; i++){
    			var ltc = response[i];
    			$("#tbody").append('<tr><td><a href="javascript:addRequestNo(\''+ltc.requestno+'\')">'+ltc.requestno+'</a></td><td>'+ltc.empcode+'</td><td>'+ltc.location+'</td></tr>');
    		}
    		
    	},
    	error:function(response){
    		alert("LTC Requests are not Found");
    	}
    });
}
function addRequestNo(a){
	//alert("asdfasdfas"+a);
	
	var modal1 = document.getElementById("myModalSuccess");
	modal1.style.display = "none";
	
	$("#requestno").val(a);
	searchrequestno();
}
 
</script>
<style>
.mymodalsuccess {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 220px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.successcontent {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
.successclose {
    float: left;
    padding: 3px;
    width: 50%;
}
</style>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>
	<div align="center">
		<h3 class="h3 font-weight-bolder">LTC-EL Enacachement Form</h3>
	</div>
	<div class="container border p-4 font-weight-bolder"
		style="background-color: #e6ffff;">
		 
	 <form:form action="./updateltcEnacachment" method="post" modelAttribute="updateltc">
			<div class="row align-items-center m-2">
				<div class="col-auto" style="width: 200px;">
					<label for="requestno" class="col-form-label">Request No:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="requestno" id="requestno" class="form-control" maxlength="9"/>
					<span></span>
				</div>
				
			</div>
			
			<div class="row align-items-center m-2">
				<div class="col-auto" style="width: 200px;" id="empcodelable">
					<label for="code" class="col-form-label">Employee Code:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="empcode" id="empcode" class="form-control" readonly="readonly"/>
					<span></span>
				</div>
			</div>

			<div class="row g-3 align-items-center m-2">
				<div class="col-auto" style="width: 200px;" id="blockyearlable">
					<label for="blockyear" class="col-form-label">Block Year:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="blockyear" id="blockyear"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="locationlable">
					<label for="location" class="col-form-label">Anywhere in
						India:</label>
				</div>
				<div class="col-auto">
					<select name="location" id="location" class="form-control">
						<option value="">-select-</option>
						<option value="Any Where in India">Any Where in India</option>
						<option value="Home Town">Home Town</option>
						<option value="in.lieu of Home Town">in.lieu of Home Town</option>
					</select>
				</div>
			</div>

			<div class="row g-3 align-items-center m-2" id="visitplacelable">
				<div class="col-auto" style="width: 200px;">
					<label for="visitplace" class="col-form-label">Place of
						Visit:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="visitplace" id="visitplace"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="claimedforlable">
					<label for="claimedfor" class="col-form-label">To whom
						Claimed:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="claimedfor" id="claimedfor"
						class="form-control" />
				</div>
			</div>

			<div class="row g-3 align-items-center m-2" id="visitperiodlable">
				<div class="col-auto" style="width: 200px;">
					<label for="visitperiod" class="col-form-label">Period of
						Visit:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="visitperiod" id="visitperiod"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="leavedetailslable">
					<label for="leavedetails" class="col-form-label">Leave
						Details:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="leavedetails" id="leavedetails"
						class="form-control" />
				</div>
			</div>

			<div class="row g-3 align-items-center m-2">
				<div class="col-auto" style="width: 200px;" id="encashmentlable">
					<label for="encashment" class="col-form-label">Encashment
						availed for as on date:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="encashment" id="encashment"
						class="form-control" />
				</div>

				<div class="col-auto" style="width: 200px;" id="amountadvancelable">
					<label for="leavedetails" class="col-form-label">Amount of
						advance:</label>
				</div>
				<div class="col-auto">
					<input type="text" name="amountadvance" id="amountadvance"
						class="form-control" />
				</div>
			</div>

			<div class="row g-3 align-items-center m-2" id="submitbtn">
				<input type="submit" value="Submit"
					class="form-control font-weight-bolder bg-info text-white w-25"
					style="margin-left: 38%;"  />
			</div>
		 </form:form>
<!-- 		 <button onclick="return searchrequestno()" id="searchbtn" class="btn btn-success">Submit</button> -->
		 <button onclick="return getrequestnos()" id="getrequestnos" class="btn btn-info">Get All Request Numbers</button>
	</div>
	
    <div id="myModalSuccess" class="mymodalsuccess">
        <div class="successcontent">
            <center>
                 
                 <table>
                 	<thead>
                 		<th>Request Number</th>
                 		<th>Employee Code</th>
                 		<th>Place of visit</th>
                 	</thead>
                 	<tbody id="tbody"></tbody>
                 </table>

            </center>
        </div>
    </div>
	
</body>
</html>