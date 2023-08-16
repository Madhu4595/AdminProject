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

	function getrequestnos() {
		//alert("getrequestnos");
		var findByNoteStatus = true;
		var sanctionStatus = false;
		$.ajax({
			type : "get",
			url : "./findByNoteStatusandSanctionStatus?noteStatus=" + findByNoteStatus+"&sanctionStatus="+sanctionStatus,
			cache : false,
			success : function(resp) {
				//alert("resp=>"+JSON.stringify(resp));

				if (resp.length > 0) {
					var modal = document.getElementById("myModal");
					var span = document.getElementsByClassName("close")[0];

					// When the user clicks the button, open the modal 
					modal.style.display = "block";
					$("#tbody").empty();
					for (var i = 0; i < resp.length; i++) {
						var bean = resp[i];
						$("#tbody").append(
								'<tr>' + '<td><a href="javascript:addReqno(\''
										+ bean.requestno + '\')">'
										+ bean.requestno + '</a></td>' + '<td>'
										+ bean.invoiceNo + '</td>' + '<td>'
										+ bean.invoiceDate + '</td>' + '<td>'
										+ bean.shopName + '</td>' + '<td>'
										+ bean.amountClaimed + '</td>'
										+ '</tr>');
					}

					// When the user clicks on <span> (x), close the modal
					span.onclick = function() {
						modal.style.display = "none";
					}

					// When the user clicks anywhere outside of the modal, close it
					window.onclick = function(event) {
						if (event.target == modal) {
							modal.style.display = "none";
						}
					}
				}else{
					alert("No data available for generating sanction order");
				}

			}

		});
	}
	function addReqno(a) {
		//alert("addReqno=>" + a);
		$("#requestnoo").val(a);
		getData();
	}
	
	function validate(){
		//alert("validate");
		
		var sanctionNumber = $("#sanctionNumber").val();
		
		if (sanctionNumber === "" || sanctionNumber === null) {
			alert("Sanction Order Number is Required Please fill that");
			$("#sanctionNumber").focus();
			return false;
		}else{
			//alert("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
			$.ajax({
				type : "get",
				url : "./checkSO?siodate="+sanctionNumber,
				cache : false,
				success : function(response) {
					//alert("success response length=> "+response)
					//alert("success response  => "+JSON.stringify(response))
					
					if(response === "200"){
						//alert("dddddddddddddddddddddddddddd");
						alert("Sanction Order Number is Already Available, Please change Sanction Order Number");
						$("#sanctionNumber").val('');
						$("#sanctionNumber").focus();
						return false;
					}
					else{
						//alert("fffffffffffffffffffffffffffffffffffffffff")
							document.forms["searchform2"].action = "./generateBriefSOPrint";
							document.forms["searchform2"].submit();
							return true;
					}
				},
				error : function(response) {
					//alert("Employee Allowance Details are not Loaded");
				}
			});
			
			return false;
		}
		
		
		
	}
</script>

<style>
span {
	font-weight: bolder;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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

.close:hover, .close:focus {
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
		<h6 class="h6 font-weight-bolder text-danger">BRIEFCASE ALLOWANCE
			SANCTION ORDER FORM</h6>
	</div>
	<div class="container border"
		style="background-color: #e6f9ff; border-radius: 20px;">
		<form name="searchform">
			<input type="hidden" name="notesheet" value="SO" />
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
				Briefcase Details for Giver Request No: <span>${bean.requestno }</span>

			</div>
			<form:form action="./generateBriefSOPrint" name="searchform2" method="post" onsubmit="return validate()"  >
				<div class="container m-4 border shadow-lg w-50"
					style="background-color: #e6f9ff; border-radius: 20px;">
					<input type="hidden" name="requestno" value="${bean.requestno }" />
					<div class="row g-3 align-items-center ">
						<div class="col-6">
							Shop Name: <span>${bean.shopName }</span>
						</div>
						<div class="col-6">
							Invoice Date: <span>${bean.invoiceDate }</span>
						</div>
					</div>
					<div class="row g-3 align-items-center ">
						<div class="col-6">
							Invoice No: <span>${bean.invoiceNo }</span>
						</div>
						<div class="col-6">
							Employee Code: <span>${bean.empCode }</span>
						</div>
					</div>
					
					<div class="row g-3 align-items-center ">
						<div class="col-6">
							Amount Claimed: <span>${bean.amountClaimed }</span>
						</div>
						<div class="col-6">
							Amount Approved: <span>${bean.amountApproved }</span>
						</div>
					</div>
					<br>
					<div class="row g-3 align-items-center ">
						<div class="col-4"></div>
						<div class="col-4 font-weight-bolder">
							Sanction Order No:<input type="text" name="sanctionNumber"
								id="sanctionNumber" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row g-3 align-items-center ">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" class="btn btn-success m-2"
								style="width: 100%;" class="form-control"
								value="Generate Sanction Order" />
						</div>
						<div class="col-4"></div>
					</div>

				</div>
			</form:form>
		</div>
	</c:if>

	<div style="color: blue;" align="center">
		<h5>
			<b> ${msg} </b>
		</h5>
	</div>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div align="right">
				<span class="close">&times;</span>
			</div>

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