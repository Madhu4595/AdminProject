<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
	function getData() {
		//alert("getdata");

		var requestnoo = $("#requestnoo").val();
		//alert("requestno=>"+requestnoo);

		if (requestnoo === "" || requestnoo === null) {
			alert("Request Number is Required Please fill that");
			$("#requestno").focus();
			return false;
		} else {
			document.forms["searchform"].action = "./findbriefcase";
			document.forms["searchform"].submit();
		}
	}
	
	function getrequestnos(){
		//alert("getrequestnos");
		var findByNoteStatus = false;
		$.ajax({
			type: "get",
			url: "./findByNoteStatus?noteStatus="+findByNoteStatus,
			cache: false,
			success: function(resp){
				//alert("resp=>"+JSON.stringify(resp));
				
				if(resp.length > 0){
					var modal = document.getElementById("myModal");
					var span = document.getElementsByClassName("close")[0];
					  
					modal.style.display = "block";
					span.onclick = function() { modal.style.display = "none"; }
					
					for(var i = 0; i < resp.length; i++){
						var bean = resp[i];
						$("#tbody").append('<tr>'
								+'<td><a href="javascript:addReqno(\''+bean.requestno+'\')">'+bean.requestno+'</a></td>'
								+'<td>'+bean.invoiceNo+'</td>'
								+'<td>'+bean.invoiceDate+'</td>'
								+'<td>'+bean.shopName+'</td>'
								+'<td>'+bean.amountClaimed+'</td>'
								+'</tr>');
					}
					 
				}else{
					alert("No data is available for edit");
				}
				
			}
			
		});
	}
	function addReqno(a){
		//alert("addReqno=>"+a);
		$("#requestnoo").val(a);
		getData();
	}
	
</script>
 
<style>
span {
	font-weight: bolder;
}
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="banner.jsp"%>
	<%@include file="navbar.jsp"%>

	<div align="center">
		<h6 class="h6 font-weight-bolder text-danger"> BRIEFCASE
			ALLOWANCE EDIT FORM</h6>
	</div>
	<div class="container border"
		style="background-color: #e6f9ff; border-radius: 20px;">
		<form name="searchform">
		<input type="hidden" name="notesheet" value="EDIT"/>
			<div class="row g-3 align-items-center m-4 p-4">
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">Request
						No: </label>
				</div>
				<div class="col-auto">
					<input type="text" name="requestnoo" id="requestnoo"
						class="form-control" />
				</div>
				<div class="col-auto">
					<input type="button" id="getdata" class="form-control"
						value="Get Data" onclick="return getData()"
						style="background-color: green; color: white; font-weight: bold;" />
				</div>
				<div class="col-auto">
					<input type="button" class="form-control"
						value="Get All Request Numbers" onclick="return getrequestnos()"
						style="background-color: #6666ff; color: white; font-weight: bold;" />
				</div>
			</div>
		</form>
	</div>
	<br>
	<c:if test="${open}">
		<div align="center">
			<div class="text-decoration-underline text-primary">
				Briefcase Details for Given Request No: <span>${bean.requestno }</span>

			</div>
			<div class="container border"
		style="background-color: #e6f9ff; border-radius: 20px;">
			<form:form action="./saveEditBriefCase" modelAttribute="briefcase" method="post" onsubmit="return Validate()">
			
			<input type="hidden" name="requestno" value="${bean.requestno }"/>
			
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Employee Code:</label>
				</div>
				<div class="col-4">
					<form:input path="empCode" id="eno" value="${bean.empCode }" onChange="return employeesearch(this)" 
					class="form-control" placeholder="Enter Employee Code Example: 3586" maxlength="4" />
				</div>
				<div class="col-4"><span id="empName"></span></div>
			</div>
			
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Invoice Date:</label>
				</div>
				<div class="col-4">
					 <input type="date" name="invoiceDate" id="invoiceDate" value="${bean.invoiceDate }" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Invoice No:</label>
				</div>
				<div class="col-4">
					 <input type="text" name="invoiceNo" id="invoiceNo" value="${bean.invoiceNo }" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Shop Name:</label>
				</div>
				<div class="col-4">
					 <input type="text" name="shopName" id="shopName" value="${bean.shopName }" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row align-items-center m-2">
				 
				<div class="col-4">
					<label for="requestno" class="col-form-label">Amount Claimed:</label>
				</div>
				<div class="col-4">
					 <input type="text" name="amountClaimed" id="amountClaimed" value="${bean.amountClaimed }" class="form-control"/>
				</div>
				<div class="col-4"></div>
			</div>
			 
			 <div class="row m-1" id="submit">
					<div class="col-4"></div>
					<div class="col-4">
						<input type="submit" id="search" class="btn btn-success px-3 form-control"  
							onchange="return Validate(this)" value="Update" />
					</div>
					<div class="col-4"></div>
				</div>
		</form:form>
		</div>
		</div>
	</c:if>

	<div  align="center">
		<h5>
			  ${msg} 
		</h5>
	</div>
	<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div align="right"><span class="close" >&times;</span></div>
    
    <div id="data">
    	<table class="table table-bordered">
    		<thead class="text-light bg-dark">
    			<tr>
    				<td>Request No</td>
    				<td>Invoice No</td>
    				<td>Invoice Date</td>
    				<td>Shop Name</td>
    				<td>Amount Claimed</td>
    			</tr>
    		</thead>
    		<tbody id="tbody"></tbody>
    	</table>
    </div>
  </div>

</div>
	
</body>
</html>