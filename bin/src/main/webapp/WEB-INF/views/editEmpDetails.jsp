<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
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
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/banner2.jsp"%>
<%-- 	<%@ include file="/WEB-INF/views/navbar2.jsp"%> --%>
	<%@ include file="/WEB-INF/views/empLogin.jsp"%>
	
	<div style="color: red;" align="center">
		<h3>
			<b> ${msg} </b>
		</h3>
	</div>
 
		
		<div class="container" style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
			<form:form action="./updateEmp" method="post"
				onsubmit="return Validation();" modelAttribute="emp"
				name="empinsert" id="empinsert" enctype="multipart/form-data">
				
				
				
				<div class="row align-items-center">
					<div class="col-sm-3" align="center">Employee Code:</div>
					<div class="col-sm-3" style="font-weight: bolder;">${emp.code }</div> 
					<div class="col-sm-3">Official Email ID: </div>
					<div class="col-sm-3" style="font-weight: bolder;">${emp.email }</div>
				</div>
				<br>
				<p class="bb"> <b>Basic Details</b> </p>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Employee Name:</div>
					<div class="col-sm-3"><form:input class="form-control"  path="name" maxlength="50" id="name" value="${emp.name }"  /></div>
					<div class="col-sm-3" align="center">Designation:</div>
					<div class="col-sm-3"><input type="text" class="form-control" value="${emp.designation }"  name="designation" id="edesignation" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Basic Pay:</div>
					<div class="col-sm-3"><form:input class="form-control"  path="basic_pay" id="basic_pay" 
					maxlength="8" onkeypress="return isNumberKey(event)" onchange="return rupeeformat(this.value) " value="${emp.basic_pay }"  /></div>
					<div class="col-sm-3" align="center">Date of Birth:</div>
					<div class="col-sm-3"><input class="form-control" type="date"  name="dob" id="dob"
					value="${emp.dob }" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Pay Scale/Level:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="payscale" id="egst" value="${emp.payscale }"  /></div>
					<div class="col-sm-3" align="center">State / Dist Employee:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="place" id="place" value="${emp.place }" /></div>
				</div>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Phone Number:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="phno" id="phno" value="${emp.phno }" /></div>
					<div class="col-sm-3" align="center">CGHS ID:</div>
					<div class="col-sm-3"><input type="text" class="form-control"  name="ecghsCode" id="ecghsCode" value="${emp.ecghsCode }" /></div>
				</div>
<!-- 				<div class="row align-items-center m-1"> -->
<!-- 					<div class="col-sm-3" align="center">Ward Entitlement:</div> -->
<!-- 					<div class="col-sm-3"><select class="form-control" name="wardEntitlement" id="wardEntitlement"> -->
<!-- 												<option value="">-select-</option> -->
<!-- 												<option value="Pvt">Private</option> -->
<!-- 												<option value="SemiPvt">Semi Private</option> -->
<!-- 												<option value="general">General</option> -->
<!-- 											</select></div> -->
<!-- 					<div class="col-sm-3" align="center">Address:</div> -->
<!-- 					<div class="col-sm-3"><textarea class="form-control"  rows="2" cols="40"  -->
<%-- 					name="address" id="address" value="${emp.address }"></textarea></div> --%>
<!-- 				</div> -->
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Date of Joining:</div>
					<div class="col-sm-3"><input type="date" class="form-control" value="${emp.doj }"  name="doj" id="doj" /></div>
					<div class="col-sm-3" align="center">Date of Superannuation:</div>
					<div class="col-sm-3"><input type="date" class="form-control"  value="${emp.doa }" name="doa" id="doa" /></div>
				</div>
				<br>
				<div class="row align-items-center m-1">
					<div class="col-sm-3" align="center">Photo:</div>
					<div class="col-sm-3">
					<input type="file" class="form-control"  name="photo_doc" id="photo_doc" />
					<img src="data:image/png;base64, ${photo}" alt="EMP PHOTO" height="100px;" width="100px;"/></div>
					<div class="col-sm-3">CGHS Photo:</div>
					<div class="col-sm-3">
						<input type="file" class="form-control"  name="cghsphoto_doc" id="cghsphoto_doc" />
						<img src="data:image/png;base64, ${empCghsPhoto }" alt="CGHS Photo" height="100px;" width="100px;">
					</div>
				</div>
				 
				<br>

				<div class="container">
					<p class="bb">
						<b>Family Details</b>
					</p>
					 
					<table style="BORDER-COLLAPSE: collapse;"  
					id="multi">
					<tr class="sendhead1">
						<th width="100px;">Name</th>
						<th width="100px;">Relation</th>
						<th width="100px;">Date of Birth</th>
						<th width="100px;">CGHS ID</th>
						<th width="100px;">CGHS Photo</th>
					</tr>
					<c:forEach var="ef" items="${empFamily }">
						<tr>
							<td> <input type="hidden" name="id" value="${ef.id }"/><input style="width: 300px;" name="per_name" maxlength="50" value="${ef.per_name }"/></td>
							<td><input name="relation" maxlength="50" value="${ef.relation }"/></td>
							<td><input type="date" name="editdob" maxlength="10" value="${ef.dob }"/></td>
							<td><input name="cghsCode" value="${ef.cghsCode }"/></td>
							<td>
								<input type="file" name="familycghsphoto" />
								<img src="data:image/png;base64, ${ef.familyCghsPhoto }" alt="FAMILY CHGS PHOTO" height="100px;" width="100px"/>
							</td>
						</tr>
					</c:forEach>
					 
				</table>


				</div>
				<div align="center"><input type="submit" class="btn btn-warning px-3"
							value="Submit" /></div>
				  
			</form:form>
		</div>
</body>
</html>