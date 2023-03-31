<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

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
</style>
<script type="text/javascript">
    function checktype(){
   	 var type=" ";
   	 var billdate=" ";
   	// alert(billdate);
   	 if(type=="CGHS"){
   	   	document.getElementById("CGHS").checked = true; 
   	 }else{
   		document.getElementById("AMA").checked = true; 
   	 }

    }
    function validate(){
    	 var rowNumber = document.getElementsByName("m_billno").value;
    	//alert(rowNumber.length);    	
    }
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
        if(radiovalue=='AMA'){        	
       document.getElementById("card_no").value = "";
        	document.getElementById("card_no").readOnly = true;
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
     	 
    	  var patient_name = $('#patient_name').val();	  
    	  var eno = $('#eno').val();
    	  
    		 $.getJSON('./relationsearch.action?eno=' + eno+"&patient_name="+patient_name, function (response) {
    			 if (response) {				
    	             if(response.Error=='Success'){

    	             document.getElementById("relationname").innerHTML ="Relation: "+response.relation;
    	         }}
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
 function replaceNbsps(str) {
	  var re = new RegExp(String.fromCharCode(160), "g");
	  return str.replace(re, " ");
	}

</script>
</head>

<body>

	<section>
		<div class="col-md-12  md-p-1 p-1"></div>

		<div class="row">
			<div>
				<input type="hidden" name="formaction" id="formaction"
					value="saveEmp">

				<table style="BORDER-COLLAPSE: collapse;" width="90%" align="right"
					id="multi">
					<tr class="sendhead1">
						<th width="100px;">Name</th>
						<th width="100px;">Relation</th>
						<th width="100px;">Date of Birth</th>
						<th width="100px;">Dependency</th>
					</tr>
					<c:forEach var="ef" items="${emp_family }">
						<tr>
							<td>
							<input style="width: 300px;"
								name="per_name" maxlength="50" value="${ef.per_name }"/></td>
							<td><input name="relation"
								maxlength="50" value="${ef.relation }"/></td>
							<td><input type="date" name="editdob" maxlength="10"
								value="${ef.dob }"/></td>
							<td><input name="editdependency" maxlength="10"
								value="${ef.dependency }"/></td>

							<c:choose>
								<c:when test="#list.index.equals(list.size-1)">
									<td><input type="button" style="" class="buttoncolor"
										name="add" value="Add" onclick="addOwner(this)" /></td>
								</c:when>
								<c:otherwise>
									<td><input type="button" style="" class="buttoncolor"
										name="add" value="Remove" onclick="removeOwner(this)" /></td>
								</c:otherwise>
							</c:choose>

						</tr>
					</c:forEach>

					<tr>
						<td><input type="text" style="width: 300px;" name="per_name"
							maxlength="50" /></td>
						<td><input type="text" name="relation" maxlength="50" /></td>
						<td><input type="date" name="editdob" maxlength="10" /></td>
						<td><input type="text" name="editdependency" maxlength="10" /></td>
						<td><input type="button" class="buttoncolor" name="add"
							value="Add" onclick="addOwner(this)" /> <input type="button"
							class="buttoncolor" name="add" value="Remove"
							onclick="removeOwner(this)" /></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>

</html>