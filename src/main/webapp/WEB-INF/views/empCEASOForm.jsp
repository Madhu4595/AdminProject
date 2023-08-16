<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Notesheet Form</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script>
	let allAllowances;
	$(document).ready(
			function() {
				//$("#scrollbar").hide();
				//$("#submitbtn").hide();

				//getEmps
				$.ajax({
					type : "get",
					url : "./getEmps",
					cache : false,
					success : function(response) {
						//alert("success response length=> "+response.length)
						//alert("success response  => "+JSON.stringify(response))

						if (response.length === 0) {
							alert("Employee Details are not Loaded");
						} else {
							for (var i = 0; i < response.length; i++) {
								var bean = response[i];
								$("#emp_code").append(
										'<option value="'+bean.code+'">'
												+ bean.code + ', ' + bean.name
												+ '</option>');
							}

						}
					},
					error : function(response) {
						alert("Employee Details are not Loaded");
					}
				});
				//getAllAllowancesForNS
				$.ajax({
					type : "get",
					url : "./getCEAsForSO",
					cache : false,
					success : function(response) {
						//alert("success response length=> "+response.length)
						//alert("success response  => "+JSON.stringify(response))
						allAllowances = response;
						//alert("asdfasdf"+JSON.stringify(allAllowances));
						 
					},
					error : function(response) {
						alert("Employee Allowance Details are not Loaded");
					}
				});

			});
	
	function validate(){
		//alert("validate");
		
		var emp_code = $("#emp_code").val();
		//alert("emp_code==> "+emp_code);
		var request_no = $("#request_no").val();
		//alert("request_no==> "+request_no);
		
		if(emp_code == "" || emp_code == null){
			if(request_no == "" || request_no == null){
				alert("Anyone Value either Employee Code or Request Number is Required for Getting Bills Data"); return false;
			}else{
				
			}
		
		} else{
			//alert("else");
			
			try {
				const arraycodes = String(emp_code).split(",");
				let count = 0;
				//alert("size=> "+arraycodes.length);
				$("#tbody").empty();
				
				for(var j=0; j< arraycodes.length;j++){
					var bean = arraycodes[j];
					//alert("emp_code=> "+bean)
					var id = null;
					
					for(var i=0; i<allAllowances.length;i++){
						
						var allowances = allAllowances[i];
						//alert("allowances.emp_code => "+allowances.code);
						
						if(allowances.empCode === bean){
							//alert("noofchilds==> "+allowances.noofchilds);
							
							if(allowances.noofchilds === "1"){
								//alert("1111111111111111111");
								count = count + 1;
								$("#tbody").append('<tr>'
										+'<td><input type="checkbox" class="checkSingle" name="checkClosureAlloc" value="'+count+'"  id="checkboxId'+count+'" /></td>'
										+'<td><input type="hidden" name="reqno" id="reqno'+count+'" value="'+allowances.requestno+'"/>'+allowances.requestno+'</td>'
										+'<td><input type="hidden" name="code" id="code'+count+'" value="'+allowances.empCode+'"/>'+allowances.empCode+'</td>'
										+'<td><input type="hidden" name="name_class_of_child1" id="name_class_of_child'+count+'" value="'+allowances.name_class_of_child1+'"/>'+allowances.name_class_of_child1+'</td>'
										+'<td><input type="hidden" name="amount_claimed" id="amount_claimed'+count+'" value="'+allowances.amount_claimed+'"/>'+allowances.amount_claimed+'</td>'
										+'<td><input type="hidden" name="amount_approved" id="amount_approved'+count+'" />'+allowances.amount_approved+'</td>'
										+'</tr>');
								 
							}
							if(allowances.noofchilds === "2"){
								//alert("22222222222222222222");
								count = count + 1;
								$("#tbody").append('<tr>'
										+'<td><input type="checkbox" class="checkSingle" name="checkClosureAlloc" value="'+count+'"  id="checkboxId'+count+'" /></td>'
										+'<td><input type="hidden" name="reqno" id="reqno'+count+'" value="'+allowances.requestno+'"/>'+allowances.requestno+'</td>'
										+'<td><input type="hidden" name="code" id="code'+count+'" value="'+allowances.empCode+'"/>'+allowances.empCode+'</td>'
										+'<td><input type="hidden" name="name_class_of_child1" id="name_class_of_child'+count+'" value="'+allowances.name_class_of_child1+'"/>'+allowances.name_class_of_child1+'</td>'
										+'<td><input type="hidden" name="cea_amount_child1" id="amount_claimed'+count+'" value="'+allowances.cea_amount_child1+'"/>'+allowances.cea_amount_child1+'</td>'
										+'<td><input type="hidden" name="amount_approve1" id="amount_approve1'+count+'" />'+allowances.amount_approve1+'</td> '
										+'</tr>');
								count = count + 1;
								$("#tbody").append('<tr>'
										+'<td><input type="checkbox" class="checkSingle" name="checkClosureAlloc" value="'+count+'"  id="checkboxId'+count+'" /></td>'
										+'<td><input type="hidden" name="reqno" id="reqno'+count+'" value="'+allowances.requestno+'"/>'+allowances.requestno+'</td>'
										+'<td><input type="hidden" name="code" id="code'+count+'" value="'+allowances.empCode+'"/>'+allowances.empCode+'</td>'
										+'<td><input type="hidden" name="name_class_of_child2" id="name_class_of_child'+count+'" value="'+allowances.name_class_of_child2+'"/>'+allowances.name_class_of_child2+'</td>'
										+'<td><input type="hidden" name="cea_amount_child2" id="amount_claimed'+count+'" value="'+allowances.cea_amount_child2+'"/>'+allowances.cea_amount_child2+'</td>'
										+'<td><input type="hidden" name="amount_approve2" id="amount_approve2'+count+'" />'+allowances.amount_approve2+'</td></td>'
										+'</tr>');
							}
							
						} 
					}
				}
				document.getElementById("param").value=count;
				
				}
				catch (err) {
				  document.getElementById("demo").innerHTML = err;
				}
		}
		
	}
	
function checkVal() {
		
        var selopt = document.getElementsByName("checkClosureAlloc");
       // alert("selopt=> "+selopt.length);
       
      	var param = $("#param").val();
      	//alert("param==> "+param);
       
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
            if (confirm("Please Ensure That All The Details Are Entered Correctly. Once Submitted Cannot Be Edited") === true) {
                return submitClosure();
            } 
            else { return false; }

        } else {
            alert('Select atleast one Record to Submit');
            return false;
        }
    }
	function submitClosure() {
 		var soNumber = $("#soNumber").val();
 		checkso(soNumber);
	}
	function checkso(a){
		//alert("ddddddddddddddd=> "+a);
		$.ajax({
			type : "get",
			url : "./checkSO?siodate="+a,
			cache : false,
			success : function(response) {
				//alert("success response length=> "+response)
				//alert("success response  => "+JSON.stringify(response))
				
				if(response === "200"){
					//alert("in if");
					alert("Sanction Order Number is Already Available, Please change Sanction Order Number");
					$("#soNumber").val('');
					$("#soNumber").focus();
					return false;
				}
				else{
					var request_noList = ""; 
					for (j = 1; j <= document.getElementById("param").value; j++)
			        {
						//alert("j is--->"+j)
			            if ((document.getElementById("checkboxId" + j).checked) === true)
			            {
			            	
			            	if(document.getElementById("soNumber").value === "" || document.getElementById("soNumber").value === null){
			            		alert("Please Enter Sanction Order Number for selected Bill No");
			            		$("#soNumber").focus();
			            		return false;
			            	} 
			            	request_noList = request_noList + document.getElementById("reqno" + j).value + ",";
			            }
			            
			         }
						document.getElementById("requestno").value = request_noList;
						document.forms[0].action="./empCEASOPrint";
						document.forms[0].submit();
				}
				
				 
			},
			error : function(response) {
				alert("Employee Allowance Details are not Loaded");
			}
		});
	}
	
	 $(document).ready(function () {
         $("#checkedAll").change(function () { 
             if (this.checked) {
                 $(".checkSingle").each(function () { this.checked = true; })
             } else {
                 $(".checkSingle").each(function () { this.checked = false; })
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
</script>
<style>
#scrollbar {
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
		<h3 class="h5 font-weight-bolder">EMPLOYEE ALLOWANCES SANCTION ORDER FORM</h3>
	</div>
	

	<div class="container mt-1 border font-weight-bolder"
		style="background-color: #e6ffff;">
		<div class="row align-items-center m-2">
			<div class="col-2">
				<label for="emp_code" class="col-form-label">Employee Code :</label>
			</div>
			<div class="col-4">
				<select name="emp_code" id="emp_code" class="form-control"
					multiple="multiple">

				</select>
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
			<div class="col-4"></div>
			<div class="col-4">
				<input type="button" class="btn btn-success" value="Get Data"
					style="width: 300px;" onclick="return validate()" />
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row align-items-center m-2">
			<div class="col-12  fs-5 fw-bolder text-primary">Note : You can
				get Bills Data based on Request Number Or Employee Code. Among two
				one input is requesting.</div>
		</div>
	</div>
	<center style="color: red;">
		<h4>
			<b> ${msg} </b>
			
		</h4>
		<p id="demo"></p>
	</center>
	<form:form action="" method="post" target="_blank;">
<div id="scrollbar"> 
<div id="content">
	
	<table class="table table-bordered table-striped mt-4">
		<thead class="bg-secondary text-light">
			<th><input type="checkbox" id="checkedAll"/></th> 
			<th>Req No</th>
			<th>Emp. Code</th>
			<th>Name and Class of Child</th>
<!-- 			<th>Bill Type</th> -->
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
				
				<input type="button" class="btn btn-success" value="Generate Sanction Order"
					style="width: 300px;" onclick="return checkVal();"/>
			</div>
			<div class="col-4"></div>
		</div>
	</div>	
	
	<input type="hidden" id="requestno" name="requestno">
<!-- 	<input type="hidden" id="code" name="codeList"> -->
<!-- 	<input type="hidden" id="name_class_of_childList" name="name_class_of_childList"> -->
<!-- 	<input type="hidden" id="amount_claimedList" name="amount_claimedList"> -->
<!-- 	<input type="hidden" id="amount_approvedList" name="amount_approvedList"> -->
<!-- 	<input type="hidden" id="so_noList" name="so_noList"> -->
	
	<input type="hidden" name="param" id="param"  />
	
	</form:form>
</body>
</html>