<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<link rel="stylesheet" href="./sass/style.css" />
<link type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function() {
    $("#dob").datepicker({ dateFormat: 'dd/mm/yy' });
});

function rupeeformat(value){
	//alert(value);
	 var x=value;
	    x=x.toString();
	    var lastThree = x.substring(x.length-3);
	    var otherNumbers = x.substring(0,x.length-3);
	    if(otherNumbers != '')
	        lastThree = ',' + lastThree;
	    var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
	    document.getElementById('basic_pay').value=res;
}

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
function Validation(){
	//alert("validation")
	var code = document.getElementById('code').value;
	var name = document.getElementById('name').value;
	var edesignation = document.getElementById('edesignation').value;
	var basic_pay = document.getElementById('basic_pay').value;
	var dob = document.getElementById('dob').value;
	
	//null check
	if(code==null || code==''){
		alert("Please Enter Employee Code");
		document.getElementById('code').focus();
		return false;
	}
	 
	if(name==null || name==''){
		alert("Please Enter Name");
		document.getElementById('name').focus();
		return false;
	}
	if(edesignation==null || edesignation==''){
		alert("Please Enter Designation");
		document.getElementById('edesignation').focus();
		return false;
	}
	if(basic_pay==null || basic_pay==''){
		alert("Please Enter Basic Pay");
		document.getElementById('basic_pay').focus();
		return false;
	}
	if(dob==null || dob==''){
		alert("Please Enter Date of Birth");
		document.getElementById('dob').focus();
		return false;
	}
 
	
	if(code.length>4){
		   alert("Please enter 4 digits Emploee Code");
		   $('#code').val('');
		   $('#code').focus();
		   return false;
	   }
	if(name.length>50){
		   alert("Please enter Name");
		   $('#name').val('');
		   $('#name').focus();
		   return false;
	   }
 
}

function addOwner(a){ 
	 //console.log( $(a).closest('tr').clone());
    var tr = $(a).closest('tr').clone();//.insertAfter("tr:last");
    //$(tr).find('input').val('');
    $(tr).find('input').attr('readonly', true);i
    $(tr).find('input:last').val('Remove').attr("onclick","removeOwner(this)");
    tr.insertBefore('#multi tbody tr:last');
    var tr = $(a).closest('tr');
   $(tr).find('input').val('');
   $(tr).find('input:last').val('Add Family');

}
function removeOwner(a)
{
	 $(a).closest('tr').remove();
}
function searchempno(){
	
	  var code = $('#code').val();	
	  //alert("searchempno()"+code);
  	  document.getElementById("code").readonly=true;
  	  
  		$.get('./employeesearchnum',{code : code}, function (response) {
	             document.getElementById("name").value =response[0];
	           	 document.getElementById("edesignation").value =response[1];
	           	 document.getElementById("basic_pay").value =response[2];
	         	 document.getElementById("dob").value =response[3];  	         
	     		 document.getElementById("egst").value =response[4];
	     		 document.getElementById("place").value =response[5];
	     		 document.getElementById("ecghsCode").value =response[6];
	     		 document.getElementById("address").value =response[9];
	     		 document.getElementById("phno").value =response[8];
	     		 document.getElementById("wardEntitlement").value =response[10];
	     		
	     		 $("#viewphoto").append('<img src="data:image/png;base64,'+response[7]+'" alt="Image" width="100px;" height="100px;" />')
	     		
	     		 
		 });
  		 
  		$.ajax({
			type: "get",
		    url: "./employeefamilysearch",
		    data: "code=" + code,
		    cache: false,
		    success: function(html)
		    {
		    	
		    	$("#search").hide();	
		    	$("#submit_btn").show();	
		    	$("#allowance_response").html(html);	
		    	 
		    	document.getElementById("empinsert").action = document.getElementById("formaction").value;
	       }
		});
  		 
  		 
}
</script>
<body>

	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid shadow align-items-center">
		<h4 align="center" class="sendhead">EMPLOYEE INSERT</h4>
		<div align="left" style="padding-left: 50px;">

			<form:form action="./empinsert" method="post"
				onsubmit="return Validation();" modelAttribute="employee"
				name="empinsert" id="empinsert" enctype="multipart/form-data">
				
				
				
				<div class="row align-items-center">
					<div class="col-sm-3" align="center">Employee Code:</div>
					<div class="col-sm-3"><form:input path="code" class="form-control" maxlength="4" id="code" onchange="searchempno()" onkeypress="return isNumberKey(event)" /></div>
					<div class="col-sm-3"></div>
					<div class="col-sm-3"></div>
				</div>
				<br>
				<p class="bb"> <b>Basic Details</b> </p>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Employee Name:</div>
					<div class="col-sm-3"><form:input class="form-control"  path="name" maxlength="50" id="name"  /></div>
					<div class="col-sm-3" align="center">Designation:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="edesignation" id="edesignation" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Basic Pay:</div>
					<div class="col-sm-3"><form:input class="form-control"  path="basic_pay" id="basic_pay" maxlength="6" onkeypress="return isNumberKey(event)" onchange="return rupeeformat(this.value) "  /></div>
					<div class="col-sm-3" align="center">Date of Birth:</div>
					<div class="col-sm-3"><form:input class="form-control"  path="dob" id="dob" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Pay Scale/Level:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="egst" id="egst"  /></div>
					<div class="col-sm-3" align="center">State / Dist Employee:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="place" id="place" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Phone Number:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="phno" id="phno" /></div>
					<div class="col-sm-3" align="center">CGHS ID:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="ecghsCode" id="ecghsCode" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Ward Entitlement:</div>
					<div class="col-sm-3"><select class="form-control" name="wardEntitlement" id="wardEntitlement">
												<option value="">-select-</option>
												<option value="Pvt">Private</option>
												<option value="SemiPvt">Semi Private</option>
												<option value="general">General</option>
											</select></div>
					<div class="col-sm-3" align="center">Address:</div>
					<div class="col-sm-3"><textarea class="form-control"  rows="2" cols="40" name="address" id="address"></textarea></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Photo:</div>
					<div class="col-sm-3"><input type="file" class="form-control"  name="photo_doc" id="photo_doc" /></div>
					<div class="col-sm-6"><span id="viewphoto"></span></div>
				</div>
				<br>

				<div class="abc">
					<p class="bb">
						<b>Family Details</b>
					</p>
					<div id="allowance_response"></div>


				</div>
				<table>

					<tr>
						<td><input type="submit" class="btn btn-warning px-3"
							value="Submit" /></td>

					</tr>
				</table>
			</form:form>
		</div>


	</div>