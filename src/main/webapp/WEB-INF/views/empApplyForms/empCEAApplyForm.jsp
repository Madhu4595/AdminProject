<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEA Apply Form</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
function getEmpDetails() {
	var empCode = $("#empCode").val();

	if (empCode === null || empCode === "") {
		alert("Employee Code should not be Empty");
		$("#empCode").focus();
		return false;
	}

	$.ajax({
		type : "GET",
		url : "getEmpDetails?code=" + empCode,
		cache : false,
		success : function(resp) {
			//alert("resp"+resp);
			$("#dataBody").show();
			$("#empCode").attr('readonly', true);
			document.getElementById("empInfo").innerHTML = resp.callSign +'. '+resp.name+', '+resp.designation+', '+resp.place;
			
			var count = 0;
 			for(var i = 0; i < resp.family.length; i++){
				var fdata = resp.family[i];
				if(fdata.relation === 'Wife'){
					$("#spouseName").val(fdata.per_name);
					$("#spouseNamee").val(fdata.id);
				}else{
					count = count + 1;
					$("#familyclaims").append('<tr>'
					+'<td><input type="checkbox" class="checkSingle" name="checkClosureAlloc" value="'+count+'"  id="checkboxId'+count+'" />'
					+'<input type="hidden" name="childId" id="childId'+count+'" value="'+fdata.id+'" /></td>'
					+'<td>'+fdata.per_name+'</td>'
					+'<td><input type="text" class="form-control" name="childAcademicYear" id="childAcademicYear'+count+'"/></td>'
					+'<td><textarea class="form-control" name="childSchoolName" id="childSchoolName'+count+'" col="40" rows="2"></textarea></td>'
					+'</tr>');
					
				}
				document.getElementById("param").value=count;
			}
			
		},
		error : function(resp) {
			alert("No details found with given employee code");
		}
	});
}
function checkVal() {
	
	validate();
	
    var selopt = document.getElementsByName("checkClosureAlloc");
  	var param = $("#param").val();
   
    var flag = false;
    for (var i = 0; i < selopt.length; i++) {
        if (selopt[i].checked) { flag = true; }
    }
    if (flag) {
        if (confirm("Please Ensure That All The Details Are Entered Correctly. Once Submitted Cannot Be Edited") === true) {
            return submitClosure();;
        } else { return false; }
    } else {
        alert('Select atleast one Record to Submit');
        return false;
    }
}
function submitClosure() {
	var childIdList = "", childAcademicYearList = ""; childSchoolNameList = "";
	
	for (j = 1; j <= document.getElementById("param").value; j++)
    {
		//alert("j is--->"+j)
        if ((document.getElementById("checkboxId" + j).checked) === true)
        {
        	if(document.getElementById("childAcademicYear" + j).value === "" || document.getElementById("childAcademicYear" + j).value === null){
        		alert("Please Enter Acadamic Year for All Checked Childs"); return false;
        	}else{
        		childAcademicYearList = childAcademicYearList + document.getElementById("childAcademicYear" + j).value + ",";
        	}
        	childAcademicYearList = childAcademicYearList + document.getElementById("childAcademicYear" + j).value + ",";
        	
        	if(document.getElementById("childSchoolName" + j).value === "" || document.getElementById("childSchoolName" + j).value === null){
        		alert("Please Enter School Name for All Checked Childs"); return false;
        	}else{
        		childSchoolNameList = childSchoolNameList + document.getElementById("childSchoolName" + j).value + ",";
        	}
        	childSchoolNameList = childSchoolNameList + document.getElementById("childSchoolName" + j).value + ",";
        	
        	childIdList = childIdList + document.getElementById("childId" + j).value + ",";
        } 
        
     }
		document.getElementById("childAcademicYearr").value = childAcademicYearList;
		document.getElementById("childSchoolNamee").value = childSchoolNameList;
		document.getElementById("childIdd").value = childIdList;
}

let phdSelectedValue = 'NO';
function phdDisable(a){
	var phd = a;
	if(phd == 'YES'){
		document.getElementById("phdNature").disabled = false; 
		document.getElementById("phdDate").disabled = false;  
		document.getElementById("phdPercentage").disabled = false; 
		
		$("#phdNature").val('');
 		$("#phdDate").val('');
 		$("#phdPercentage").val('');
 		
		phdSelectedValue = 'YES';
	}else{
		document.getElementById("phdNature").disabled = true;  
		document.getElementById("phdDate").disabled = true;
		document.getElementById("phdPercentage").disabled = true; 
		
		$("#phdNature").val('NULL');
 		$("#phdDate").val('NULL');
 		$("#phdPercentage").val('NULL');
 		
		phdSelectedValue = 'NO'
	}
}

function validate(){
	
	var empCode =$("#empCode").val();
	if(empCode == null || empCode == ""){ alert("Employee code is required, Please fill that!!"); return false; }
	
	var spouseName =$("#spouseName").val();
	if(spouseName == null || spouseName == ""){ alert("Spouse Name is required, Please fill that!!"); return false; }
	
	var spouseName =$("#spouseName").val();
	if(spouseName == null || spouseName == ""){ alert("Spouse Name is required, Please fill that!!"); return false; }
	
	var spouseOrg =$("#spouseOrg").val();
	if(spouseOrg == null || spouseOrg == ""){ alert("Spouse working organisation is required, Please fill that!!"); $("#spouseOrg").focus(); return false; }
	
	var spouseDesg =$("#spouseDesg").val();
	if(spouseDesg == null || spouseDesg == ""){ alert("Spouse designation is required, Please fill that!!"); $("#spouseDesg").focus(); return false; }
	
	var spouseAddress =$("#spouseAddress").val();
	if(spouseAddress == null || spouseAddress == ""){ alert("Spouse Working Address is required, Please fill that!!"); $("#spouseAddress").focus(); return false; }
	
	
	
 	if(phdSelectedValue == 'NO'){
 		$("#phdNature").val('NULL');
 		$("#phdDate").val('NULL');
 		$("#phdPercentage").val('NULL');
 		
 		phdNature = 'NULL';
 		phdDate = 'NULL';
 		phdPercentage = 'NULL';
 		
 		$("#disabled").val('NO');
 	}
 	
 	if(phdSelectedValue == 'YES'){
 		var phdNature = $("#phdNature").val();
 		var phdDate = $("#phdDate").val();
 		var phdPercentage = $("#phdPercentage").val();
 		
 		var phdNature =$("#phdNature").val();
 	 	if(phdNature == null || phdNature == ""){ alert("Disable Nature is required, Please fill that!!"); $("#phdNature").focus(); return false; }
 		
 		var phdDate =$("#phdDate").val();
 	 	if(phdDate == null || phdDate == ""){ alert("Disable Date of Certificate is required, Please fill that!!"); $("#phdDate").focus(); return false; }
 		
 		var phdPercentage =$("#phdPercentage").val();
 	 	if(phdPercentage == null || phdPercentage == ""){ alert("Disable Percentage is required, Please fill that!!"); $("#phdNature").focus(); return false; }
 	 	
 	 	$("#disabled").val('YES');
 	 	
 		return false;
 	}
 	
}

$(document).ready(function(){
	$("#dataBody").hide();
	
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
})

function bonafideAmtAttachedd(a){
	alert(a)
	if(a == 'YES'){ document.getElementById("bonafideAmt").disabled = false; $("#bonafideAmt").val(''); }
	if(a == 'NO'){ $("#bonafideAmt").prop('disabled', true); $("#bonafideAmt").val('NULL'); }
}

 
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/banner.jsp"%>
	<%@include file="/WEB-INF/views/navbar.jsp"%>
	
	<div class="container shadow-lg rounded" align="center" style="background-color: #e6ffff;">
		<div class="row m-2">
			<div class="col-12">
				<h6 class="h6 font-weight-bolder text-info"> CEA APPLY FORM </h6>
			</div>
		</div>
		
		<form:form action="./saveempCEAApply" method="post" >
		
		<div class="row">
			<div class="col-4"> <input type="text" class="form-control m-1"  name="empCode" id="empCode" maxlength="4" onchange="return getEmpDetails()" placeholder="Employee Code" /> </div>
			<div class="col-8"> <span id="empInfo" class="text-primary"></span> </div>
		</div>
		
	<div id="dataBody"> 
		<div style="border: 1px solid black;padding: 10px;border-radius: 10px;" align="left">
		<span style="font-weight: bolder;text-decoration: underline;">Spouse Working Details</span>
		
		<div class="row">
			<div class="col-6">Name<input type="text" name="spouseName" id="spouseName" class="form-control" readonly="readonly" /><input type="hidden" name="spouseNamee" id="spouseNamee" /></div>
			<div class="col-6">Organization<input type="text" name="spouseOrg" id="spouseOrg" class="form-control" /></div>
			
		</div>
		<div class="row">
			<div class="col-6">Designation<input type="text" name="spouseDesg" id="spouseDesg" class="form-control" /></div>
			<div class="col-6">Address<input type="text" name="spouseAddress" id="spouseAddress" class="form-control" /></div>
		</div>
		
			<br>
			<span style="font-weight: bolder;text-decoration: underline;">Whom CEA/Hostel Subsidy Claimed</span>
			<table border="1" style="width: 100%;">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkedAll"/></th>
						<th>Name</th>
						<th>Academic Year</th>
						<th>Name of School</th>
					</tr>
				</thead>
				<tbody id="familyclaims"></tbody>
			</table>
			<br>
			
			Distance of Hostel of child from residence of employee (in case Hostel Subsidy is claimed) : Defalut value is NA
			<input type="text" name="distanceHostel" id="distanceHostel" value="NULL" class="form-control m-1" placeholder="Distance of Hostel of child from residence of employee (in case Hostel Subsidy is claimed) : Defalut value is NA" />
			Amount of CEA/Hostel Subsidy already received up to previous quarter : Defalut value is NILL
			<input type="text" name="hostelSubsidy" id="hostelSubsidy" value="NULL" class="form-control m-1" placeholder="Amount of CEA/Hostel Subsidy already received up to previous quarter : Defalut value is NILL" />
<!-- 			<input type="text" class="form-control m-1" placeholder="Academic Year" /> -->
			<br>
			
			Whether the child for whom the CEA is applied for is a disabled child: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="phd" value="YES" onchange="return phdDisable(this.value)"  class="form-check-input" /><b>YES</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="phd" value="NO" onchange="return phdDisable(this.value)"  class="form-check-input" checked="checked" /><b>NO</b>
			
			<input type="text" class="form-control m-1" disabled="disabled" name="phdNature"  id="phdNature" placeholder="If yes, indicate the nature of disability: Default value is NILL" />
			<input type="text" class="form-control m-1" disabled="disabled" name="phdDate" id="phdDate" placeholder="Date of disability certificate: Default value is NILL" />
			<input type="text" class="form-control m-1" disabled="disabled" name="phdPercentage" id="phdPercentage" placeholder="Indicate the percentage of disability: Default value is NILL" />
			<br>
			
			Whether the Bonafied certificate from Head of Institution has been attched: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="bonafideCertificate" value="YES" onchange="return bonafideCertificateAttach(this.value)"  class="form-check-input" checked="checked" /><b>YES</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="bonafideCertificate" value="NO" onchange="return bonafideCertificateAttach(this.value)"  class="form-check-input"  /><b>NO</b>
			<br>
			
			For Hostel, Subsidy, the Bonafide certificate from mentioning the amount is attached: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="bonafideAmtAttached" value="YES" onchange="return bonafideAmtAttachedd(this.value)"  class="form-check-input" /><b>YES</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="bonafideAmtAttached" value="NO" onchange="return bonafideAmtAttachedd(this.value)"  class="form-check-input" checked="checked" /><b>NO</b><br>
			
			<input type="text" name="bonafideAmt" class="form-control m-1" id="bonafideAmt" placeholder="Default value: NULL" disabled="disabled"/>
			
			
			
		</div>
		<input type="hidden" name="param" id="param"  />
		
		<input type="hidden" id="disabled" name="disabled">
		<input type="hidden" id="childAcademicYearr" name="childAcademicYearr">
		<input type="hidden" id="childSchoolNamee" name="childSchoolNamee">
		<input type="hidden" id="childIdd" name="childIdd">
		
		
		<input type="hidden" id="bonafideCertificatee" name="bonafideCertificatee">
		
		
		<input type="submit" onclick="return checkVal();" value="SUBMIT" class="btn btn-success m-2" />
		</div>
		</form:form>
		 
	</div>
</body>
</html>