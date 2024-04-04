<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
		Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	int current_year = Integer.parseInt(format.format(date));

	int start_year = 2010;
	int substart_year = 2010;
	int end_year = current_year + 1;
	String year_value="";
	int start_year2 = 2010;
	int substart_year2 = 2010;
	int end_year2 = current_year + 1;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CEA EMPLOYEE ALLOWANCE</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>

<script>

	$(document).ready(function(){
	//alert("Asdfasfs")
	  $("#contentbody").hide();
	  $("#noofchilds").attr("disabled",true);
	});
	
	function employeesearch(a){
		//alert("Asdfasfs"+a.value)
		var code = a.value;
		//alert("Asdfasfs"+code)
		
		$.ajax({
			type: "get",
			url: "./empNameandDesignation?empcode="+code,
			cache: false,
			success:function(resp){
				//alert("success=> "+resp);
				document.getElementById("empName").innerHTML = resp;
				 $("#noofchilds").attr("disabled",false);
			},
			error:function(resp){
				//alert("error=> "+resp);
				alert("NO EMPLOYEE FOUND WITH GIVEN REQUEST NUMBER");
				$("#eno").val('');
				$("#eno").focus();
				$("#noofchilds").attr("disabled",true);
				$("#noofchilds").val('');
				$("#ceaname0").val('');
				$("#ceaname1").val('');
				$("#p_claim").val('');
				$("#p_claim1").val('');
				$("#schoolfee").val('');
				$("#schoolfee1").val('');
				$("#cea_amount_child1").val('');
				$("#cea_amount_child2").val('');
				$("#amount_cla").val('');
				$("#contentbody").hide();
			}
		});
	}
	
	function childrens(a){
		var noofchilds = a.value;
		//alert("noofchilds=> "+noofchilds)
		
		if(noofchilds === "" || noofchilds === null){
			alert("Please choose No of Childs for Entering Allowance??"); 
			$("#noofchilds").focus();
			return false;
		}
		else{
			 if(noofchilds === "1"){
				 $("#contentbody").show();	
				 $("#ceaname0").val('');
				 $("#ceaname1").attr("disabled",true);
				 $("#p_claim").val('');
				 $("#p_claim1").attr("disabled",true);
				 $("#schoolfee").val('');
				 $("#schoolfee1").attr("disabled",true);
				 $("#cea_amount_child1").val('');
				 $("#cea_amount_child2").attr("disabled",true);
				 $("#amount_cla").val();
				 $("#amount_cla").attr("readonly",true);
			 }
			 if(noofchilds === "2"){
				 $("#contentbody").show();	
				 $("#ceaname0").val('');
				 $("#ceaname1").val('');
				 $("#ceaname1").attr("disabled",false);
				 $("#p_claim").val('');
				 $("#p_claim1").val('');
				 $("#p_claim1").attr("disabled",false);
				 $("#schoolfee").val('');
				 $("#schoolfee1").val('');
				 $("#schoolfee1").attr("disabled",false);
				 $("#cea_amount_child1").val('');
				 $("#cea_amount_child2").val('');
				 $("#cea_amount_child2").attr("disabled",false);
				 $("#amount_cla").val();
				 $("#amount_cla").attr("readonly",true);
			 }
		}
	}
	function Validate(){
	
		//alert("asdfasdf");
		
		var eno = $("#eno").val();
		if(eno === "" || eno === null){ alert("Employee Code is Requires, Please Enter"); $("#eno").focus(); return false; }
		
		var noofchilds = $("#noofchilds").val();
		if(noofchilds === "" || noofchilds === null){ alert("Allowance for Number of Childs is Requires, Please Enter"); $("#noofchilds").focus(); return false; }
		
		if(noofchilds === "1"){
			var ceaname0 = $("#ceaname0").val();
			if(ceaname0 === "" || ceaname0 === null){ alert("Name and Class of Child1 is Requires, Please Enter"); $("#ceaname0").focus(); return false; }
			
			var p_claim = $("#p_claim").val();
			if(p_claim === "" || p_claim === null){ alert("Period of Claim for child1 is Requires, Please Enter"); $("#p_claim").focus(); return false; }
			
			var schoolfee = $("#schoolfee").val();
			if(schoolfee === "" || schoolfee === null){ alert("Type for child1 is Requires, Please Enter"); $("#schoolfee").focus(); return false; }
			
			var cea_amount_child1 = $("#cea_amount_child1").val();
			if(cea_amount_child1 === "" || cea_amount_child1 === null){ alert("Amount Claimed for child1 is Requires, Please Enter"); $("#cea_amount_child1").focus(); return false; }
			
		}else{
			var ceaname0 = $("#ceaname0").val();
			if(ceaname0 === "" || ceaname0 === null){ alert("Name and Class of Child1 is Requires, Please Enter"); $("#ceaname0").focus(); return false; }
			var ceaname1 = $("#ceaname1").val();
			if(ceaname1 === "" || ceaname1 === null){ alert("Name and Class of Child2 is Requires, Please Enter"); $("#ceaname1").focus(); return false; }
			
			var p_claim = $("#p_claim").val();
			if(p_claim === "" || p_claim === null){ alert("Period of Claim for child1 is Requires, Please Enter"); $("#p_claim").focus(); return false; }
			var p_claim1 = $("#p_claim1").val();
			if(p_claim1 === "" || p_claim1 === null){ alert("Period of Claim for child2 is Requires, Please Enter"); $("#p_claim1").focus(); return false; }
			
			var schoolfee = $("#schoolfee").val();
			if(schoolfee === "" || schoolfee === null){ alert("Type for child1 is Requires, Please Enter"); $("#schoolfee").focus(); return false; }
			var schoolfee1 = $("#schoolfee1").val();
			if(schoolfee1 === "" || schoolfee1 === null){ alert("Type for child2 is Requires, Please Enter"); $("#schoolfee").focus(); return false; }
			
			var cea_amount_child1 = $("#cea_amount_child1").val();
			if(cea_amount_child1 === "" || cea_amount_child1 === null){ alert("Amount Claimed for child1 is Requires, Please Enter"); $("#cea_amount_child1").focus(); return false; }
			var cea_amount_child2 = $("#cea_amount_child2").val();
			if(cea_amount_child2 === "" || cea_amount_child2 === null){ alert("Amount Claimed for child2 is Requires, Please Enter"); $("#cea_amount_child2").focus(); return false; }
		}
		
		return true;
	}
	function cea_amount_child1Validation(){
		
		var noofchilds = $("#noofchilds").val();
		var cea_amount_child1 = $("#cea_amount_child1").val();
		
		if(noofchilds === "1"){
			$("#amount_cla").val(cea_amount_child1);
		}
	}
	function cea_amount_child2Validation(){
		//alert("asdfasdf")
		var noofchilds = $("#noofchilds").val();
		
		var cea_amount_child1 = $("#cea_amount_child1").val();
		var cea_amount_child2 = $("#cea_amount_child2").val();
		
		if(cea_amount_child1 === ""|| cea_amount_child1 === null){
			alert("Please Enter Amount For Child1");
			$("#cea_amount_child2").val('');
			$("#cea_amount_child1").focus();
			return false;
		}else{
			var amount_cla = parseInt(cea_amount_child1) + parseInt(cea_amount_child2);
			
			$("#amount_cla").val(amount_cla);
		}
	}
</script>
</head>
<body>

<%@include file="banner2.jsp"%>
	<%@include file="navbar2.jsp"%>
	
	<div align="center">
		<h6 class="h6 font-weight-bolder text-danger">EMPLOYEE CEA ALLOWANCE ENTRY FORM</h6>
	</div>
	<div class="container mt-4 border font-weight-bolder"
		style="background-color: #e6ffff;">
		<form:form action="./empCEASave" modelAttribute="cea" method="post" enctype="multipart/form-data" onsubmit="return Validate()">
			
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Employee Code:</label>
				</div>
				<div class="col-4">
					<form:input path="empCode" id="eno" onChange="return employeesearch(this)" 
					class="form-control" placeholder="Enter Employee Code Example: 3586" maxlength="4" />
				</div>
				<div class="col-4"><span id="empName"></span></div>
			</div>
			
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Allowance for Number of Childs:</label>
				</div>
				<div class="col-4">
					 <select name="noofchilds" 
							id="noofchilds" onchange="return childrens(this)" class="form-control">
							<option value="">-select-</option>
							<option value="1">ONE</option>
							<option value="2">TWO</option>
						</select>
				</div>
				<div class="col-4"></div>
			</div>
			<br>
			<div id="contentbody"> 
			<div class="row m-1">
					<div class="col-3" id="ceanamelabelc1">
						<label for="requestno" class="col-form-label">Name and Class of Child1:</label>
					</div>
					<div class="col-3" id="ceanameinputc1">
						<form:input path="name_class_of_child1" id="ceaname0"  class="form-control"
						placeholder="Ex: Madhu and Class IV" onChange="return ceaname1Validation()" />
					</div>
					<div class="col-3" id="ceanamelabelc2">
						<label for="requestno" class="col-form-label">Name and Class of Child2:</label>
					</div>
					<div class="col-3" id="ceanameinputc2">
						<form:input path="name_class_of_child2" id="ceaname1" class="form-control" 
						placeholder="Ex: Pavan and Class X" onChange="return ceaname2Validation()" />
					</div>
			</div>
			<div class="row m-1">
					<div class="col-3" id="pofcforc1label">
						<label for="requestno" class="col-form-label">Period of Claim for child1:</label>
					</div>
					<div class="col-3" id="pofcforc1input">
						<form:select path="period_of_claim_child1"
						class="form-control" id="p_claim" onChange="return p_claimValidation()"  >
							<form:option value="">-select-</form:option>
							<%
								for (int i = start_year; i < end_year; i++) {
									 year_value=String.valueOf(i)+"-"+String.valueOf(++substart_year);
									//System.out.println("dshjkgsdg"+year_value);
							%>
							<form:option value='<%=year_value%>'>
								<%=year_value%>
							</form:option>
							<%
								}
							%>

						</form:select>
					</div>
					<div class="col-3" id="pofcforc2label">
						<label for="requestno" class="col-form-label">Period of
							Claim for child2:</label>
					</div>
					<div class="col-3" id="pofcforc2input">
						<form:select path="period_of_claim_child2" id="p_claim1"
							  class="form-control"
							onChange="return p_claim1Validation()">
							<form:option value="">-select-</form:option>
							<%
								for (int i = start_year2; i < end_year2; i++) {
									String year_value1=String.valueOf(i)+"-"+String.valueOf(++substart_year2);
							%>
							<form:option value="<%=year_value1%>">
								<%=year_value1%>
							</form:option>
							<%
								}
							%>
						</form:select>
					</div>
				</div>
				<div class="row m-1">
					<div class="col-3" id="type1label">
						<label for="requestno" class="col-form-label">Type:</label>
					</div>
					<div class="col-3" id="type1input">
						<form:select path="cea_type_child1" id="schoolfee"
							 class="form-control">
							<form:option value="">-select-</form:option>
							<form:option value="sfee">School Fee</form:option>
							<form:option value="sfeehstl">School Fee & Hostel</form:option>
							<form:option value="sfeedisabled">School Fee For Disabled</form:option>
						</form:select>
					</div>
					<div class="col-3" id="type2label">
						<label for="requestno" class="col-form-label">Type:</label>
					</div>
					<div class="col-3" id="type2input">
						<form:select path="cea_type_child2" id="schoolfee1"
							  class="form-control">
							<form:option value="">-select-</form:option>
							<form:option value="sfee">School Fee</form:option>
							<form:option value="sfeehstl">School Fee & Hostel</form:option>
							<form:option value="sfeedisabled">School Fee For Disabled</form:option>
						</form:select>
					</div>
				</div>
				<div class="row m-1">
					<div class="col-3" id="acc1label">
						<label for="requestno" class="col-form-label">Amount
							Claimed for child1:</label>
					</div>
					<div class="col-3" id="acc1input">
						<form:input path="cea_amount_child1" id="cea_amount_child1" class="form-control"
							placeholder="Ex: 25000" onchange="return cea_amount_child1Validation()" />
					</div>
					<div class="col-3" id="acc2label">
						<label for="requestno" class="col-form-label">Amount
							Claimed for child2:</label>
					</div>
					<div class="col-3" id="acc2input">
						<form:input path="cea_amount_child2" id="cea_amount_child2" class="form-control"
							placeholder="Ex: 25000" onchange="cea_amount_child2Validation();" />
					</div>
				</div>
				<div class="row m-1">
					<div class="col-3" id="amountclaimlabel">
						<label for="requestno" class="col-form-label">Amount Claimed:<span style="color: red">*</span></label>
					</div>
					<div class="col-3" id="amountclaiminput">
						<form:input path="amount_claimed" id="amount_cla" 
						class="form-control" onChange="return amount_claValidation()"
						  />
					</div>
					<div class="col-3"><label for="doument" class="col-form-label">Upload Documet:</label></div>
					<div class="col-3"><input type="file" name="doc" id="doc"/></div>
				</div>
			 
			 <div class="row m-1" id="submit">
					<div class="col-4"></div>
					<div class="col-4">
						<input type="submit" id="search" class="btn btn-success px-3 form-control"  
							onchange="return Validate(this)" value="Submit" />
					</div>
					<div class="col-4"></div>
				</div>
			 </div>
		</form:form>
	</div>
	<div align="center" style="color: red;">
		<h3>
			<b> ${msg} </b>
		</h3>
	</div>
	
</body>
</html>