<%@page import="com.app.entity.Medical_Bills_upload"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




<style>
.getbg002 {
	background-color: #67c355;
}

.sendhead {
	color: #67c355;
	font-size: 30px;
}

.sendhead1 {
	color: #67c355;
}

.white {
	color: white !important;
}

.btn-warning {
	color: #ffffff !important;
	background-color: #67c355 !important;
	border-color: #67c355 !important;
	font-size: 20px !important;
	border-radius: 0 !important;
}

.buttoncolor {
	background-color: #007bff87;
	border: none;
	color: white;
	padding: 3px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
#relationname{
font-weight: bolder;
color: blue;
font-stretch: 20px;
}
</style>
<script type="text/javascript">
  
    function addLocDept() {
   	 var rowNumber = document.getElementById("rowIndex").value;
          var value = parseInt(document.getElementById('totalprice').value);
            value = isNaN(value) ? 0 : value;
            value=value+10;
       document.getElementById('totalprice').value = value;
       $('#college_info').hide();
       document.getElementById("selected_id").disabled = true;
   	 rowNumber=parseInt(rowNumber)+1;
   	var addrs_state_p=document.getElementsByName("addrs_state_p");
           document.getElementById("addrs_state_p").style.display = "none";
    document.getElementById("addrs_district_p").style.display = "none";
    document.getElementById("addrs_mandal_p").style.display = "none";
           if(addrs_state_p.length==60){
               alert("You can select maximum of 60 ")
               return false;
           }
   	var loctextid=addrs_state_p[addrs_state_p.length-1].id;
   	var addrs_district_p=document.getElementsByName("addrs_district_p");
   	var locDistid=[addrs_district_p.length-1].id;
   	var addrs_mandal_p=document.getElementsByName("addrs_mandal_p");
   	var locmandid=addrs_mandal_p[addrs_mandal_p.length-1].id;
   	  var table = document.getElementById("locDeptTable");
   	  var newlocid='addrs_state_p'+rowNumber;
   	 // alert(newlocid);
   		var newDeptid='addrs_district_p'+rowNumber;
   		var newmandid='addrs_mandal_p'+rowNumber;
                   var x = document.getElementById("locDeptTable").rows.length;
   	  var row = table.insertRow(x-1);
   	  var cell1 = row.insertCell(0);
   	  var cell2 = row.insertCell(1);
   	  var cell3 = row.insertCell(2);
   	
   	  //cell1.innerHTML = '<select name="addrs_state_p" value id='+newlocid+' onchange="return abc(\''+newDeptid+'\',this.id,this.value);"><option value="">Select</option><option value="28">AP</option></select>';
   	  cell1.innerHTML = '<select name="addrs_state_p" style="width:150px" value id='+newlocid+' ><option value="">Select</option><option value="22">Anantapur</option><option value="23">Chittoor</option><option value="20">Cuddapah</option><option value="14">East Godavari</option><option value="17">Guntur</option><option value="16">Krishna</option><option value="21">Kurnool</option><option value="19">Nellore</option><option value="18">Prakasam</option><option value="11">Srikakulam</option><option value="13">Visakhapatnam</option><option value="12">Vizianagaram</option><option value="15">West Godavari</option></select>';
   	  cell2.innerHTML = '<select name="addrs_district_p" style="width:150px" value id='+newDeptid+' onchange="getColleges(\''+newlocid+'\',\''+newDeptid+'\',\''+newmandid+'\', \'mandals\');"><option value="">Select</option><option value="G">Government</option><option value="P">Private</option>';
   	  cell3.innerHTML = '<select name="addrs_mandal_p" style="width:250px" onchange="return abc(this.value,this.id),abcd(this.value,this.id)" value id='+newmandid+' >'

   	 $('#rowIndex').val(rowNumber);
   	  for(var i=0;i<rowNumber;i++){
    		 var nuwid=newmandid;
    		 var new_Deptid =newDeptid;
    		 var new_locid=newlocid;
                  
    	 	  if(rowNumber<10){
    	 	 nuwid= nuwid.substring(0, nuwid.length - 1);
    	 	new_Deptid= new_Deptid.substring(0, new_Deptid.length - 1);
    	 	new_locid= new_locid.substring(0, new_locid.length - 1);
    	}
    	else{
    		nuwid= nuwid.substring(0, nuwid.length - 2);
    		new_Deptid= new_Deptid.substring(0, new_Deptid.length - 2);
    		new_locid= new_locid.substring(0, new_locid.length - 2);
    	}
    	 	  nuwid=nuwid+i;
    		new_Deptid=new_Deptid+i;
    		new_locid=new_locid+i;
    		 var exist_id=document.getElementById(nuwid);
    	 	 if(exist_id){
    		  document.getElementById(nuwid).style.display = "none";
    		 document.getElementById(new_Deptid).style.display = "none";
    		 document.getElementById(new_locid).style.display = "none";
    	 	 }
    	  }
    	 
   	  var modal = document.getElementById('myModal');
   		var btn = document.getElementById("popup_id");
   		
   		var span = document.getElementsByClassName("close")[0];
   			modal.style.display = "block";
   		span.onclick = function() {
   		  modal.style.display = "none";
   		}
   		window.onclick = function(event) {
   		  if (event.target == modal) {
   		    /* modal.style.display = "none"; */
   		  }
   		}
                   return false;
   	}
    
    
    
    
    
    function getValue(radiovalue) { 
    	var rvalue = radiovalue;
    	//alert(rvalue);
        
    	if(rvalue === 'updatetypeAMA'){ 
    		var text = "If you change to Type CGHS to AMA you can loose Card number, it will not shows when you choose again CGHS";
        	if(confirm(text) === true){
        		document.getElementById("card_no").value = "";
            	document.getElementById("card_no").readOnly = true;
        	}else{
        		document.getElementById("updatetypeCGHS").checked = true;
        		document.getElementById("updatetypeAMA").value = '';
        	}
       		
        }else{
        	document.getElementById("card_no").readOnly = false;
        	
        }
      }
    function employeesearch() {   
  	 
  	  var eno = $('#eno').val();	  
  	  document.getElementById("eno").readonly=true;
  	  
  		 $.getJSON('./employeesearch.action?eno=' + eno, function (response) {
  			 if (response) {				
  	             if(response.Error=='Success'){
  	             document.getElementById("empname").innerHTML =response.name;
  	             document.getElementById("basicpay").innerHTML =response.basic_pay;
  	         }}
  		 });
  	  
    }
    
    function relationsearch() {   
     	 
    	  var patient_name = $('#updatepatient_name').val();	 
    	  var eno = $('#eno').val();
    	  $.ajax({
    	        type: "GET",
    	        contentType: "application/json",
    	         url: "./relationsearch?eno="+eno+"&patient_name="+patient_name,
    	        dataType: 'json',
    	        cache: false,
    	        timeout: 600000,
    	        success: function (data) {
    	            //id = relationname
    	            document.getElementById('relationname').innerHTML = data.relation;
    	        },
    	        error: function (data) {
    	        }
    	    });
    	  
      }
 	function addOwner(a){ 
     
		var tr = $(a).closest('tr').clone();
		$(tr).find('input').attr('readonly', true);
     	tr.insertBefore('#multi tbody tr:last');
     	
    	var tr = $(a).closest('tr');
   	 	$(tr).find('input').val('');
   	 	
     	var allbutt = document.querySelectorAll('input[type="button"]');
     	$(tr).find(allbutt).val('Add');
     	
     	$(tr).find('input:last').val('Remove');
     	
 	}
 	function removeOwner(a) {
	 	$(a).closest('tr').remove();
 	}
 	function getFamilyDetails(){
		var emp_code = $("#eno").val();
		var patient_name = $("#patient_name").val();
		
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	         url: "./getFamilyDetails?emp_code="+emp_code,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	$("#updatepatient_name").append('<option value="self">-self-</option>');
				for(var i = 0; i < data.length; i++){
					var fdata = data[i];
					$("#updatepatient_name").append('<option value="'+fdata.per_name+'">'+fdata.per_name+'</option>');
				}
			//$("#updatepatient_name option[value="+patient_name.trim()+"]").prop('selected',true);
				$('#updatepatient_name').val(patient_name);
				relationsearch();
	        },
	        error: function (data) {
	            //alert("Admission Number Not Found");
	            
	        }
	    });
		
	}
 	
 	
    function checktype(){
    	var type = $("#type").val();
    	
    	if(type === 'CGHS'){
    		document.getElementById("updatetypeCGHS").checked = true;
    	}
    	if(type === 'AMA'){
    		document.getElementById("updatetypeAMA").checked = true;
    		document.getElementById("updatetypeCGHS").checked = false;
    		document.getElementById("card_no").value  = '';
    		document.getElementById("card_no").readOnly  = true;
    	}
    	getFamilyDetails();
    }

    
    function validate(){
    	 var patient_name = $("#patient_name").val();
    	 var updatepatient_name = $("#updatepatient_name").val();
    	 
    	 if(patient_name !== updatepatient_name){
    		 $("#patient_name").val(updatepatient_name);
    	 }
    	 
    	 
    }
</script>
</head>

<body onload=checktype()>


	<section>
		<div class="col-md-12  md-p-1 p-1"></div>
		<div class="row">

			<div class="col-md-5  md-p-2 p-4">

				<div class="form-group">
					<label>Employee Code:</label> <input type="text"
						class="form-control" name="emp_code" id="eno"
						onchange="employeesearch();getSubsequentOptions('eno', 'patient_name', 'familynames');"
						maxlength="5" value="${medical_Bills_upload.emp_code }" readonly="readonly">
				</div>

				<div class="form-group" style="margin-top: 35px;">
					<input type="hidden" id="type" name="type"
						value="${medical_Bills_upload.type }"> <label>Type:
					</label> <input type="radio" id="updatetypeCGHS" name="updatetype"
						value="CGHS" onchange="getValue(this.id)"> <label
						for="CGHS">CGHS</label> <input type="radio" id="updatetypeAMA"
						name="updatetype" value="AMA" onchange="getValue(this.id)">
					<label for="AMA">AMA</label><br>
				</div>

				<div class="form-group">
					<label>Doctor Name: </label> <input type="text" name="doctor_name"
						id="doctor_name" class="form-control"
						value="${medical_Bills_upload.doctor_name }">
				</div>

				<div class="form-group">
					<label>Period of treatment:</label> <input type="text"
						name="period_of_treatment" id="period_of_treatment" class="form-control"
						value="${medical_Bills_upload.period_of_treatment }">
				</div>


				<div class="form-group">
					  <label>Name
						of Patient:</label> 
						<input type="hidden" id="patient_name" value="${medical_Bills_upload.patient_name }"/>
						<select style="width: 425px;"
						name="updatepatient_name" id="updatepatient_name"
						onchange="relationsearch()" class="form-control">
					</select>
				</div>


			</div>
			<div class="col-md-5  md-p-2 p-4">
				<div class="form-group">
					<label></label> <label></label>
					<div id="empname" class="sendhead1" style="padding-top: 10px;">
					</div>
				</div>
				<div class="form-group">
					<label>Card No:</label> <input type="text" id="card_no"
						name="card_no" class="form-control"
						value="${medical_Bills_upload.card_no }">
				</div>
				<div class="form-group">
					<label>Disease Details:</label> <input type="text" name="disease_name"
						id="disease" class="form-control"
						value="${medical_Bills_upload.disease_name }">
				</div>
				<div class="form-group">
					<label>Hospital:</label> <input type="text" name="hospital_name"
						id="hospital_name" class="form-control"
						value="${medical_Bills_upload.hospital_name }">
				</div>
				<div class="form-group">
					<label></label> <label></label>
					<p id="relationname" class="sendhead1"></p>

				</div>
			</div>


		</div>

		<div class="row">
			<div>
				<table style="BORDER-COLLAPSE: collapse;" width="90%" align="center"
					id="multi">
					<tr class="sendhead1">
						<th width="100px;">Bill No</th>
						<th width="100px;">Date</th>
						<th width="100px;">Amount</th>
						<th width="100px;">Lab Name</th>
						<th width="100px;">Add/Delete</th>
					</tr>

					<c:forEach var="mbu" items="${mbu}">
						<tr>
							<td style="width: 400px;">
							<input type="text" name="bill_no" maxlength="50" value="${mbu.bill_no }" />
							</td>
							<td style="width: 400px;">
							<input type="date" name="bill_date" maxlength="50" value="${mbu.bill_date }" />
							</td>
							<td style="width: 400px;">
							<input type="text" name="amount_claimed" maxlength="10" value="${mbu.amount_claimed }" />
							</td>
							<td style="width: 400px;">
							<input type="text" name="lab_name" maxlength="10" value="${mbu.lab_name }" />
							</td>
							<!-- 			<td  style="width:400px;"><input type="button" style="" class="buttoncolor"   name="add" value="Add" onclick="addOwner(this)" /></td> -->
							
							<td style="width: 400px;">
							<input type="button" style="" class="buttoncolor" name="remove" value="Remove" onclick="removeOwner(this)" />
							</td>
						</tr>
					</c:forEach>


				</table>

			</div>

		</div>
		<div class="form-group mt-5" style="margin-left: 40px;">
			<button type="submit" class="btn btn-warning px-5"
				onclick="return validate()">Submit</button>
		</div>

	</section>

</body>

</html>