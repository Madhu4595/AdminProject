<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MEDIC SANCTION ORDER</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<style>
/*for admission number finding*/
/* The Modal (background) */
.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 220px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow-y: scroll; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.close1 {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-content1 {
	background-color: #e4eeb9;
	border: 2px solid black;
}

#scrollbar {
	width: 800px;
	height: 300px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
<script>
$(document).ready(function(){
	$("#scrollbarr").hide();
	$("#submitbtn").hide();
})
function validate(){
		//alert("validate");
		
		var emp_code = $("#emp_code").val();
		//alert("emp_code==> "+emp_code);
		var request_no = $("#request_no").val();
		//alert("request_no==> "+request_no);
		
		var patient_name = $("#patient_name").val();
		//alert("patient_name==> "+patient_name);
		
		if(emp_code == "" || emp_code == null){
			if(request_no == "" || request_no == null){
				alert("Anyone Value either Employee Code or Request Number is Required for Getting Bills Data"); return false;
			}else{
				//alert("request_no=> "+request_no);
				$.ajax({
					type : "get",
					url : "./getMedicBillsByReqNoSO2?requestNo="+request_no,
					cache : false,
					success : function(response) {
						//alert("success response length=> "+response.length)
						//alert("success response  => "+JSON.stringify(response))
						if(response.length === 0){
							$("#scrollbarr").hide();
							$("#submitbtn").hide();
							alert("No Medical Bills Data Found with Given Request Number");
						}else{
							$("#myModal1").hide();
							$("#scrollbarr").show();
							$("#submitbtn").show();
							generateTable(response);
							}
					},
					error : function(response) {
						alert("Medical Bills Requests Data are not Found");
					}
				});
			}
		
		}else{
			//alert("adfasfda")
			if(request_no == "" || request_no == null){
				$.ajax({
					type : "get",
					url : "./getMedicBillsByPatienctNameSO?patient_name="+patient_name,
					cache : false,
					success : function(response) {
						//alert("success response length=> "+response.length)
						//alert("success response  => "+JSON.stringify(response))
						$("#myModal1").hide();
						if(response.length === 0){
							alert("No Medical Bills Data Found with Given Employee Code");
						}
						$("#scrollbarr").show();
						$("#submitbtn").show();
						generateTable(response);
					},
					error : function(response) {
						alert("Medical Bills Requests Data are not Found");
					}
				});
				
			}else{
 				//alert("adsfasfas")
 				$.ajax({
 					type : "get",
 					url : "./getMedicBillsByPatienctNameandReqNoSO?emp_code="+emp_code+"&patient_name="+patient_name+"&request_no="+request_no,
 					cache : false,
 					success : function(response) {
 						//alert("success response length=> "+response.length)
 						//alert("success response  => "+JSON.stringify(response))
						$("#myModal1").hide();
 						if(response.length === 0){
 							alert("No Medical Bills Data Found with Given Employee Code");
 						}
 						$("#scrollbarr").show();
 						$("#submitbtn").show();
 						generateTable(response);
					},
 					error : function(response) {
 						alert("Medical Bills Requests Data are not Found");
 					}
 				});
				
 			}
			
			
		}
		
	}
function checkVal() {
	
    var selopt = document.getElementsByName("checkClosureAlloc");
   // alert("selopt=> "+selopt.length);
   
    var flag = false;
    for (var i = 0; i < selopt.length; i++)
    {
    	//alert("selopt=> "+selopt[i]);
        if (selopt[i].checked) {
            flag = true;
        }
    }

    if (flag)
    {

        for (i = 0; i <= document.getElementById("param").value; i++)
        {
        	//alert("iiiiiiiiiii=> "+i);
            if ((document.getElementById("checkboxId" + i).checked) === true)
            {

            }
        }

        if (confirm("Please Ensure That All The Details Are Entered Correctly. Once Submitted Cannot Be Edited") === true) {
            return submitClosure();
        } else {
            return false;
        }

    } else {
        alert('Select atleast one Record to Submit');
        return false;
    }
}
function generateTable(response){
	//alert("length=> "+response.length);
	$("#tbody").empty();
	var bean = null;
	var id = null;
	for (var i = 0; i < response.length; i++) {
		bean = response[i];
		
			$("#tbody").append('<tr>'
			+'<td><input type="checkbox" class="checkSingle" name="checkClosureAlloc" value="'+i+'"  id="checkboxId'+i+'" /></td>'
			+'<td><input type="hidden" name="request_no" id="request_no'+i+'" value="'+bean.request_no+'"/>'+bean.request_no+'</td>'
			+'<td>'+bean.emp_code+'</td>'
			+'<td>'+bean.patient_name+'</td>'
			+'<td><input type="hidden" name="bill_no" id="bill_no'+i+'" value="'+bean.bill_no+'"/>'+bean.bill_no+'</td>'
			+'<td>'+bean.bill_date+'</td>'
			+'<td>'+bean.lab_name+'</td>'
			+'<td><input type="hidden" name="amount_claimed" id="amount_claimed'+i+'" value="'+bean.amount_claimed+'"/>'+bean.amount_claimed+'</td>'
			+'<td><input type="hidden" name="amount_approved" id="amount_approved'+i+'" value="'+bean.amount_approved+'" />'+bean.amount_approved+'</td>'
			+'</tr>');
			
			id = i;
			
	}
	document.getElementById("param").value=id;
}
function submitClosure() {
	var requestNoList = "", billNoList = "", amountclaimedList = "", amount_approvedList = "";
	
	for (i = 0; i <= document.getElementById("param").value; i++)
    {
	//alert("aaaaaaaaaaaaaaaaaaaaa"+i);
        if ((document.getElementById("checkboxId" + i).checked) === true)
        {
        	//alert("in if=> "+i);
        	
        	requestNoList = requestNoList + document.getElementById("request_no" + i).value + ",";
        	billNoList = billNoList + document.getElementById("bill_no" + i).value + ",";
        	amountclaimedList = amountclaimedList + document.getElementById("amount_claimed" + i).value + ",";
        	amount_approvedList = amount_approvedList + document.getElementById("amount_approved" + i).value + ",";
        	
        	if(document.getElementById("soNumber").value === "" || document.getElementById("soNumber").value === null){
        		alert("Please Enter Sanction Order Number for selected Bill No");
        		$("#soNumber").focus();
        		return false;
        	} 
        }
        
     }
		document.getElementById("requestNo").value = requestNoList;
		document.getElementById("billNo").value = billNoList;
		document.getElementById("amountClaimed").value = amountclaimedList;
		document.getElementById("amountApproved").value = amount_approvedList;
		
}
$(document).ready(function () {
    $("#checkedAll").change(function () { 
        if (this.checked) {
            $(".mobileNo").attr('disabled', false);
            $(".mobileNo").attr('readonly', false);
            $(".checkSingle").each(function () {
                this.checked = true;
            })
        } else {
            $(".mobileNo").attr('disabled', true);
            $(".mobileNo").attr('readonly', true);
            $(".checkSingle").each(function () {
                this.checked = false;
            })
        }
    });

    $(".checkSingle").click(function () {
        if ($(this).is(":checked")) {
            var isAllChecked = 0;
            $(".checkSingle").each(function () {
                if (!this.checked)
                    isAllChecked = 1;
            })
            if (isAllChecked == 0) {
                $("#checkedAll").prop("checked", true);
            }
        } else {
            $("#checkedAll").prop("checked", false);
        }
    });
});
function getFamilyDetails(){
	 //alert("asdfasfd")
	 var emp_code = $("#emp_code").val();
		$("#patient_name").empty();
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	         url: "./getFamilyDetails?emp_code="+emp_code,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	$("#patient_name").append('<option value="self">-self-</option>');
				for(var i = 0; i < data.length; i++){
					var fdata = data[i];
					$("#patient_name").append('<option value="'+fdata.per_name+'">'+fdata.per_name+'</option>');
				}
	            
	        },
	        error: function (data) {
	            //alert("Admission Number Not Found");
	            
	        }
	    });
}
function requestnosearch() {
	// alert("requestnosearch")
	var request_no = $("#request_no").val();
	//alert("request_no==> "+request_no);
	document.getElementById("request_no").readonly = true;

	var modal1 = document.getElementById("myModal1");
	var span = document.getElementsByClassName("close1")[0];
	modal1.style.display = "block";
	span.onclick = function() {
		modal1.style.display = "none";
	};

	$
			.ajax({
				type : "get",
				url : "./getAllMedicBillss",
				cache : false,
				success : function(response) {
					//alert("success response length=> "+response.length)
					//alert("success response  => "+JSON.stringify(response))
					if (response.length === 0) {
						alert("No Medical Bills Data Found with Given Request Number");
					} else {
						$("#myModal1").show();
						$("#data").empty();
						
						for (var i = 0; i < response.length; i++) {
							bean = response[i];

							$("#data").append(
											'<tr>'
													+ '<td><a style="color:blue;" href="javascript:callrequestno(\''+bean.request_no+'\')">'+bean.request_no+'</a></td>'
													+ '<td>'+bean.emp_code+'</td>'
													+ '<td>'+bean.patient_name+'</td>'
													+ '<td>'+bean.bill_no+'</td>'
													+ '<td>'+bean.amount_claimed+'</td>'
													+ '<td>'+bean.amount_approved+'</td>'
													+ '</tr>');
							id = i;

						}

					}
				},
				error : function(response) {
					alert("Medical Bills Requests Data are not Found");
				}
			});

}
function callrequestno(a){
	//alert("callrequestno=> "+a);
	$("#request_no").val(a);
	validate();
	
}
	</script>
	<style>
#scrollbarr {
	height: 300px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
</head>
<body>
<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div align="center">
		<h3 class="h5 font-weight-bolder">MEDICAL SANCTION ORDER FORM</h3>
	</div>
	<center style="color: red;">
		<h3>
			<b> ${msg} </b>
		</h3>
	</center>
	
	<div class="container mt-1 border font-weight-bolder"
		style="background-color: #e6ffff;">

		<div class="row align-items-center m-2">
			<div class="col-2"><label for="emp_code" class="col-form-label">Employee Code :</label></div>
			<div class="col-4">
				<input type="text" name="emp_code" id="emp_code"
					placeholder="Ex: 3586" class="form-control" maxlength="4" onchange="return getFamilyDetails()"/>
			</div>
			<div class="col-2">
				<label for="request_no" class="col-form-label">Request
					Number :</label>
			</div>
			<div class="col-4">
			<input type="text" name="request_no" id="request_no"
					placeholder="Ex: 1234" class="form-control" maxlength="4" />
			</div>
		</div>
		<div class="row align-items-center m-2">
			<div class="col-2"><label for="emp_code" class="col-form-label">Patient Name :</label></div>
			<div class="col-4">
				<select name="patient_name" id="patient_name" class="form-control">
				</select>
			</div>
		</div>
		<div class="row align-items-center m-2">
			<div class="col-2"></div>
			<div class="col-4">
				<input type="button" class="btn btn-success" value="Get Data"
					style="width: 300px;" onclick="return validate()" />
			</div>
			<div class="col-4">
				<input type="button" id="helpsearch" class="btn btn-info"
					value="Seach Request No" style="width: 300px;"
					onclick="return requestnosearch()" />
			</div>
			<div class="col-2"></div>
		</div>
		<div class="row align-items-center m-2">
			<div class="col-12  fs-5 fw-bolder text-primary">Note : You can
				get Bills Data based on Request Number Or Employee Code. Among two
				one input is requesting.</div>
		</div>

	</div>
	
	<form:form action="./medicalSOPrint" method="post" target="_blank;">
<div id="scrollbarr"> 
<div id="contentt"><br>
<div align="center" style="color: blue; text-decoration: underline; font-weight: bolder;">APPROVED DETAILS ARE SHOWING BELOW </div>
<table class="table table-bordered table-striped mt-4">
		<thead class="bg-secondary text-light">
			<th><input type="checkbox" id="checkedAll"/></th> 
			<th>Req No</th>
			<th>Emp. Code</th>
			<th>Patient Name</th>
			<th>Bill No</th>
			<th>Bill Date</th>
			<th>Lab Name</th>
			<th>Amount Claimed</th>
			<th>Amount Approved</th>
		</thead>
		<tbody id="tbody"></tbody>

	</table>
</div> 
</div>

<div align="center" id="submitbtn">
		<div class="row align-items-center m-2">
			<div class="col-4"></div>
			<div class="col-4">
				<input type="text"  class="form-control" name="soNumber" id="soNumber" 
				style="width: 300px;" placeholder="Enter Sanction Order Number"/>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row align-items-center m-2">
			<div class="col-4"></div>
			<div class="col-4">
				<input type="submit" class="btn btn-success" value="Generate Sanction Order"
					style="width: 300px;" onclick="return checkVal();"/>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
 
	
	<input type="hidden" id="requestNo" name="requestNo">
	<input type="hidden" id="billNo" name="billNo">
	<input type="hidden" id="amountApproved" name="amountApproved">
	<input type="hidden" id="amountClaimed" name="amountClaimed">
	<input type="hidden" name="param" id="param"  />
	
	
	</form:form>
	<div id="myModal1" class="modal1">
		<div class="modal-content1">
			<span class="close1" style="color: red; font-weight: bold;">&#9746;</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<center>
				<div id="scrollbar">
					<div id="content">
					<table class="table table-stripped">
							<thead>
								<th>Request No</th>
								<th>Emp Code</th>
								<th>Patient Name</th>
								<th>Bill No</th>
								<th>Amount Claimed</th>
								<th>Amount Approved</th>
							</thead>
							<tbody id="data"></tbody>
						</table>
					</div>
				</div>
			</center>
			
			 
		</div>
	</div>
</body>
</html>