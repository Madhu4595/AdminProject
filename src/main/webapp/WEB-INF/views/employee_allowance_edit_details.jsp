<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	border-top: 0px solid #ddd;
	height: 0px;
}

.row {
	font-weight: bolder;
}
</style>
<script>
// 	function allowancecheck() {
// 		var allowancevalue = document.getElementById("allowance_type").value;
// 		//alert("allowancevalue=> "+allowancevalue)
// 		var noofchilds = document.getElementById("noofchilds").value;
// 		if (allowancevalue == "1") {
// 			if (noofchilds == "1") {
// 				$('#name_class_of_child2').hide();
// 				$('#period_of_claim_child2').hide();
// 				$('#cea_type_child2').hide();
// 				$('#cea_amount_child2').hide();
// 				$('#name_class_of_child2label').hide();
// 				$('#name_class_of_child2input').hide();
// 				$('#period_of_claim_child2label').hide();
// 				$('#period_of_claim_child2input').hide();
// 				$('#cea_type_child2label').hide();
// 				$('#cea_type_child2input').hide();
// 				$('#cea_amount_child2label').hide();
// 				$('#cea_amount_child2input').hide();
// 			}
// 			if (noofchilds == "2") {
// 				$('#name_class_of_child2').show();
// 				$('#period_of_claim_child2').show();
// 				$('#cea_type_child2').show();
// 				$('#cea_amount_child2').show();
// 				$('#name_class_of_child2label').show();
// 				$('#name_class_of_child2input').show();
// 				$('#period_of_claim_child2label').show();
// 				$('#period_of_claim_child2input').show();
// 				$('#cea_type_child2label').show();
// 				$('#cea_type_child2input').show();
// 				$('#cea_amount_child2label').show();
// 				$('#cea_amount_child2input').show();
// 			}

// 			$('#allowlist').html("CEA");
// 			$('#pofc').show();
// 			$('#adamt').show();
// 			$('#amountclaimchild1').show();
// 			$('#ceares').show();
// 			$('#amountclaim').show();
// 			$('#cea_file').show();
// 			$('#headop').show();
// 			$('#ceaname').show();

// 			$('#comser').hide();
// 			$('#balpersp').hide();
// 			$('#gsubdeps').hide();
// 			$('#gpftot').hide();
// 			$('#gsubwith').hide();
// 			$('#gbal').hide();
// 			$('#gpf_file').hide();

// 			$('#gaclse').hide();
// 			$('#gasubdep').hide();
// 			$('#gasubwith').hide();

// 			$('#billno').hide();
// 			$('#billdate').hide();
// 			$('#shopname').hide();
// 			$('#lclaim').hide();

// 		}
// 		if (allowancevalue == "2") {
// 			$('#comser').show();
// 			$('#balpersp').show();
// 			$('#gsubdeps').show();
// 			$('#gpftot').show();
// 			$('#gsubwith').show();
// 			$('#gbal').show();
// 			$('#amountclaim').show();
// 			$('#gpf_file').show();
// 			$('#ceares').show();
// 			$('#headop').show();
// 			document.getElementById('subseq_depo').value = '';
// 			document.getElementById('total').value = '';
// 			document.getElementById('subseq_withdw').value = '';
// 			document.getElementById('balance').value = '';

// 			$('#pofc').hide();
// 			$('#adamt').hide();
// 			$('#amountclaimchild1').hide();
// 			$('#cea_file').hide();
// 			$('#ceaname').hide();

// 			$('#gaclse').hide();
// 			$('#gasubdep').hide();
// 			$('#gasubwith').hide();

// 			$('#billno').hide();
// 			$('#billdate').hide();
// 			$('#shopname').hide();
// 			$('#lclaim').hide();

// 		}
// 		if (allowancevalue == "3") {
// 			$('#gaclse').show();
// 			$('#gsubdeps').show();
// 			$('#gsubwith').show();
// 			$('#gpftot').show();
// 			$('#gsubwith').show();
// 			$('#gbal').show();
// 			$('#amountclaim').show();
// 			$('#gpf_file').show();
// 			$('#ceares').show();
// 			$('#headop').show();
// 			document.getElementById('subseq_depo').value = '';
// 			document.getElementById('total').value = '';
// 			document.getElementById('subseq_withdw').value = '';
// 			document.getElementById('balance').value = '';

// 			$('#pofc').hide();
// 			$('#adamt').hide();
// 			$('#amountclaimchild1').hide();
// 			$('#cea_file').hide();
// 			$('#ceaname').hide();

// 			$('#comser').hide();
// 			$('#balpersp').hide();

// 			$('#billno').hide();
// 			$('#billdate').hide();
// 			$('#shopname').hide();
// 			$('#lclaim').hide();

// 		}
// 		if (allowancevalue == "4") {
// 			$('#allowlist').html("BriefCase");
// 			$('#billno').show();
// 			$('#billdate').show();
// 			$('#shopname').show();
// 			$('#lclaim').show();
// 			$('#ceares').show();
// 			$('#amountclaim').show();
// 			//$('#ceares').show();	
// 			$('#headop').show();
// 			$('#gpf_file').show();
// 			$('#pofc').hide();
// 			$('#adamt').hide();
// 			$('#amountclaimchild1').hide();

// 			$('#comser').hide();
// 			$('#balpersp').hide();
// 			$('#gsubdeps').hide();
// 			$('#gpftot').hide();
// 			$('#gsubwith').hide();
// 			$('#gbal').hide();
// 			$('#ceaname').hide();

// 			$('#gaclse').hide();
// 			$('#gasubdep').hide();
// 			$('#gasubwith').hide();
// 		}
// 		//alert(type);
// 	}
</script>
<script src="./js/ajax.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>


<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>VENDOR</title>
<link rel="stylesheet" href="./sass/style.css" />
<link rel="stylesheet" href="./sass/bootstrap.min.css" />

</head>
<body>
	<%
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	int current_year = Integer.parseInt(format.format(date));

	int start_year = 2010;
	int substart_year = 2010;
	int end_year = current_year + 1;
	
	String year_value1="";
	String year_value="";
	
 
	
	int start_year2 = 2010;
	int substart_year2 = 2010;
	int end_year2 = current_year + 1;
	%>
	<!-- Intro Section  -->

	<div align="left">

		<div class="row">
			<div class="col-2">
				<label for="requestno" class="col-form-label">Employee Code:</label>
				<input type="hidden" name="request_no" id="request_no">
			</div>
			<div class="col-4">
				<input type="text" name="eno" id="eno" readonly
					onchange="employeesearch()" maxlength="5">
			</div>
			<div class="col-4">
				<span id="empname"></span>
			</div>
		</div>

		<div class="row">
			<div class="col-2">
				<label for="allowance_type" class="col-form-label">Type Of
					Allowances:</label>
			</div>
			<div class="col-4" id="allowlist">
				<input type="text" name="allowance_type" id="allowance_type">
			</div>
			<div class="col-4">
				<input type="hidden" name="noofchilds" id="noofchilds" />
			</div>
		</div>

		<div class="row" id="name_class_of_child_row">
			<div class="col-2" id="ceaname">
				<label for="name_class_of_child1" class="col-form-label">Name
					and Class of Child1:</label>
			</div>
			<div class="col-3">
				<input type="text" name="name_class_of_child1"
					id="name_class_of_child1" />
			</div>
			<div class="col-3" id="name_class_of_child2label">
				<label for="name_class_of_child2" class="col-form-label">Name
					and Class of Child2:</label>
			</div>
			<div class="col-3" id="name_class_of_child2input">
				<input type="text" name="name_class_of_child2"
					id="name_class_of_child2" />
			</div>
		</div>

		<div class="row" id="period_of_claim_childrow">
			<div class="col-2" id="pofc">
				<label for="period_of_claim_child1" class="col-form-label">Period
					of Claim for child1:</label>
			</div>
			<div class="col-3">
				<select name="period_of_claim_child1" id="period_of_claim_child1">
							<%
								for (int i = start_year; i < end_year; i++) {
									 year_value=String.valueOf(i)+"-"+String.valueOf(++substart_year);
									System.out.println("dshjkgsdg"+year_value);
							%>
							<option value='<%=year_value%>'>
								<%=year_value%>
							</option>
							<%
								}
							%>
				</select>
			</div>
			<div class="col-3" id="period_of_claim_child2label">
				<label for="period_of_claim_child2" class="col-form-label">Period
					of Claim for child2:</label>
			</div>
			<div class="col-3" id="period_of_claim_child2input">
				<select name="period_of_claim_child2" id="period_of_claim_child2">
							<%
								for (int i = start_year2; i < end_year2; i++) {
									  year_value1=String.valueOf(i)+"-"+String.valueOf(++substart_year2);
							%>
							<option value="<%=year_value1%>">
								<%=year_value1%>
							</option>
							<%
								}
							%>
				</select>
			</div>
		</div>
		<div class="row" id="adamt">
			<div class="col-2">
				<label for="cea_type_child1" class="col-form-label">Type:</label>
			</div>
			<div class="col-3" id="cea_type_child1input">
				<select name="cea_type_child1" id="cea_type_child1"
					style="width: 200px; height: 26px;">
					<option value="sfee">School Fee</option>
					<option value="sfeehstl">School Fee & Hostel</option>
					<option value="sfeedisabled">School Fee For Disabled</option>
					<option value="sfeehstldisabled">School Fee For Disabled &
						Hostel</option>
				</select>
			</div>
			<div class="col-3" id="cea_type_child2label">
				<label for="cea_type_child2" class="col-form-label">Type:</label>
			</div>
			<div class="col-3" id="cea_type_child2input">
				<select name="cea_type_child2" id="cea_type_child2"
					style="width: 200px; height: 26px;">
					<option value="sfee">School Fee</option>
					<option value="sfeehstl">School Fee & Hostel</option>
					<option value="sfeedisabled">School Fee For Disabled</option>
					<option value="sfeehstldisabled">School Fee For Disabled &
						Hostel</option>
				</select>
			</div>
		</div>

		<div class="row" id="amountclaimchild1">
			<div class="col-2" id="cea_amount_child1label">
				<label for="cea_amount_child1" class="col-form-label">Amount
					Claimed for child1:</label>
			</div>
			<div class="col-3" id="cea_amount_child1input">
				<input type="text" name="cea_amount_child1" id="cea_amount_child1"
					onchange="return ceaamtc1();" />
			</div>
			<div class="col-3" id="cea_amount_child2label">
				<label for="cea_amount_child2" class="col-form-label">Amount
					Claimed for child2:</label>
			</div>
			<div class="col-3" id="cea_amount_child2input">
				<input type="text" name="cea_amount_child2" id="cea_amount_child2"
					onchange="return cea_amount();" />
			</div>
		</div>

		<div class="row" id="amountclaim">
			<div class="col-2" id="amount_claimedlabel">
				<label for="amount_claimed" class="col-form-label">Amount
					Claimed:</label>
			</div>
			<div class="col-4" id="amount_claimedinput">
				<input type="text" name="amount_claimed" id="amount_claimed" />
			</div>
		</div>

		<div class="row" id="ceares">
			<div class="col-2" id="remarkslabel">
				<label for="remarks" class="col-form-label">Remarks:</label>
			</div>
			<div class="col-4" id="remarksinput">
				<textarea name="remarks" id="remarks" cols="22">  </textarea>
			</div>
		</div>

		<table class="table">

			<tr style="display: none" id="comser">
				<th>Completed Service:</th>
				<td><input type="text" name="completed_service"
					id="completed_service"></td>
			</tr>
			<tr style="display: none" id="balpersp">
				<th>Balance as per accounts slip:</th>
				<td><input type="text" name="balance_asper_accountsslip"
					id="balance_asper_accountsslip" /></td>
			</tr>
			<tr style="display: none" id="gaclse">
				<th>Closing Balance as per Accounts:</th>
				<td><input type="text" name="closing_balance_asper_accounts"
					id="closing_balance_asper_accounts" /></td>
			</tr>
			<tr style="display: none" id="gsubdeps">
				<th>Subsequent deposits:</th>
				<td><input type="text" name="subsequent_deposits"
					id="subsequent_deposits" onchange="return balanceamount();" /></td>
			</tr>
			<tr style="display: none" id="gpftot">
				<th>Total:</th>
				<td><input type="text" name="total" id="total" /></td>
			</tr>
			<tr style="display: none" id="gsubwith">
				<th>Subsequent withdrawals:</th>
				<td><input type="text" name="subsequent_withdrawals"
					id="subsequent_withdrawals" onchange="return balanceamounts();" />
				</td>
			</tr>
			<tr style="display: none" id="gbal">
				<th>Balance:</th>
				<td><input type="text" name="balance" id="balance" /></td>
			</tr>
			<tr style="display: none" id="billnotr">
				<th>Bill No:</th>
				<td><input type="text" name="billno" id="billno"></td>
			</tr>
			<tr style="display: none" id="billdate">
				<th>Bill Date:</th>
				<td><input type="date" name="billdate" id="billdate"
					style="width: 200px;"></td>
			</tr>
			<tr style="display: none" id="shopname">
				<th>Shop Name:</th>
				<td><input type="text" name="shopname" id="shopname"></td>
			</tr>
			<tr style="display: none" id="lclaim">
				<th>Last Claimed:</th>
				<td><input type="text" name="last_claimed" id="last_claimed"></td>
			</tr>

		</table>

		<table>
			<tr>
				<td><input type="submit" id="search"
					class="btn btn-success px-3" value="Update Employee Details" /></td>
			</tr>
		</table>
	</div>

	<div class="container-fluid px-5">
		<div class="row">
			<!-- Breadcrumbs  -->
			<div class="col-md-12"></div>
		</div>
		<div class="row py-1">
			<div class="col-lg-8 text-justify py-2 align-self-center"></div>
		</div>
	</div>

</body>
</html>
