///**
// * 
// */

// Validation for submitting the form page
function Validate() {

	var eno = document.getElementById('eno').value;
	if (eno == "" || eno == null) {
		alert("Please Enter Employee code");
		$("#eno").focus();
		return false;
	}

	var allowlist = document.getElementById('allowlist').value;
	if (allowlist == "" || allowlist == null) {
		alert("Please select the Type Of Allowances");
		$("#allowlist").focus();
		return false;
	}

	if (allowlist === "1") {
		var noofchilds = document.getElementById('noofchilds').value;
		if (noofchilds == "" || noofchilds == null) {
			alert("Please select the Allowance for Number of Childs");
			$("#noofchilds").focus();
			return false;
		}

		if (noofchilds === "1" || noofchilds === "2") {
			var ceaname0 = $("#ceaname0").val();
			var p_claim = $("#p_claim").val();
			var schoolfee = $("#schoolfee").val();
			var cea_amount_child1 = $("#cea_amount_child1").val();
			
			if (ceaname0 === "" || ceaname0 === null) {
				alert("Please Enter Name and Class of Child1");
				$("#ceaname0").focus();
				return false;
			}
			if (p_claim === "" || p_claim === null) {
				alert("Please Enter Period of Claim for child1");
				$("#p_claim").focus();
				return false;
			}
			if (schoolfee == "" || schoolfee == null) {
				alert("Please Choose of Type for child1");
				$("#schoolfee").focus();
				return false;
			}
			if (cea_amount_child1 == "" || cea_amount_child1 == null) {
				alert("please enter Amount Claimed for child1");
				$("#cea_amount_child1").focus();
				return false;
			}
			if (!cea_amount_child1.match('^[0-9]{1,10}$')) {
				alert("Amount Claimed for child1 is invalid, it should numeric only");
				$("#cea_amount_child1").focus();
				return false;
			}

		}
		if (noofchilds === "2") {
			var ceaname1 = $("#ceaname1").val();
			var p_claim1 = $("#p_claim1").val();
			var schoolfee1 = $("#schoolfee1").val();
			var cea_amount_child2 = $("#cea_amount_child2").val();
			
			if (ceaname1 == "" || ceaname1 == null) {
				alert("please enter Name and Class of Child2");
				$("#ceaname1").focus();
				return false;
			}
			if (p_claim1 === "" || p_claim1 === null) {
				alert("Please Enter Period of Claim for child2");
				$("#p_claim1").focus();
				return false;
			}
			if (schoolfee1 == "" || schoolfee1 == null) {
				alert("Please Choose of Type for child2");
				$("#schoolfee1").focus();
				return false;
			}
			if (cea_amount_child2 == "" || cea_amount_child2 == null) {
				alert("please enter Amount Claimed for child2");
				$("#cea_amount_child2").focus();
				return false;
			}
			if (!cea_amount_child2.match('^[0-9]{1,10}$')) {
				alert("Amount Claimed for child2 is invalid, it should numeric only");
				$("#cea_amount_child2").focus();
				document.getElementById("cea_amount_child2").value = null;
				return false;
			}
		}
	}
	
	if (allowlist === "4") {
		//alert("444444444444444444444444444444")
		var billno = document.forms["RegForm"]["billno"];
		var billdate = document.forms["RegForm"]["billdate"];
		var shopname = document.forms["RegForm"]["shopname"];
		var amount_cla = document.forms["RegForm"]["amount_claimed"];
		//var remarks = document.forms["RegForm"]["remarks"];

		if (billno.value == "") {
			alert("please enter the Bill Number");
			billno.focus();
			return false;
		}
		if (billdate.value == "") {
			alert("please enter the Bill Date");
			billdate.focus();
			return false;
		}
		if (shopname.value == "") {
			alert("Please enter the Shop Name");
			shopname.focus();
			return false;
		}
		 
		if (amount_cla.value == "") {
			alert("please enter the Amount claimed");
			amount_cla.focus();
			return false;
		}
//		if (remarks.value == "") {
//			alert("please fill the remarks ");
//			remarks.focus();
//			return false;
//		}
		return true;
	}

	var checktype = document.getElementById('allowlist').value;
	if (checktype == 2) {
		var comser0 = document.forms["RegForm"]["comser0"];
		var balance_accounts = document.forms["RegForm"]["balance_accounts"];
		var subseq_depo = document.forms["RegForm"]["subseq_depo"];
		var total = document.forms["RegForm"]["total"];
		var subseq_withdw = document.forms["RegForm"]["subseq_withdw"];
		var balance = document.forms["RegForm"]["balance"];
		var amount_cla = document.forms["RegForm"]["amount_cla"];
		//var remarks = document.forms["RegForm"]["remarks"];

		if (comser0.value == "") {
			alert("please enter the Completed service ");
			comser0.focus();
			return false;
		}
		if (balance_accounts.value == "") {
			alert("please enter Balance as per accounts slip");
			balance_accounts.focus();
			return false;
		}
		if (subseq_depo.value == "") {
			alert("please enter the Subsequent deposits");
			subseq_depo.focus();
			return false;
		}
		if (total.value == "") {
			alert("Total amount is null");
			total.focus();
			return false;
		}
		if (subseq_withdw.value == "") {
			alert("please enter the Subsequent withdrawals");
			subseq_withdw.focus();
			return false;
		}
		if (balance.value == "") {
			alert("Balance not entered");
			balance.focus();
			return false;
		}

		if (amount_cla.value == "") {
			alert("please enter the amount claimed");
			amount_cla.focus();
			return false;
		}
//		if (remarks.value == "") {
//			alert("please fill the remarks ");
//			remarks.focus();
//			return false;
//		}
		return true;
	}
	if (checktype == 3) {
		var closing_amt_bills = document.forms["RegForm"]["closing_amt_bills"];
		var subseq_depo = document.forms["RegForm"]["subseq_depo"];
		var total = document.forms["RegForm"]["total"];
		var subseq_withdw = document.forms["RegForm"]["subseq_withdw"];
		var balance = document.forms["RegForm"]["balance"];
		var amount_cla = document.forms["RegForm"]["amount_cla"];
		//var remarks = document.forms["RegForm"]["remarks"];

		if (closing_amt_bills.value == "") {
			alert("please enter Closing Balance as per Accounts");
			closing_amt_bills.focus();
			return false;
		}
		if (subseq_depo.value == "") {
			alert("please enter the Subsequent deposits");
			subseq_depo.focus();
			return false;
		}
		if (total.value == "") {
			alert("Total amount is null");
			total.focus();
			return false;
		}
		if (subseq_withdw.value == "") {
			alert("please enter the Subsequent withdrawals");
			subseq_withdw.focus();
			return false;
		}
		if (balance.value == "") {
			alert("Balance not entered");
			balance.focus();
			return false;
		}

		if (amount_cla.value == "") {
			alert("please enter the amount claimed");
			amount_cla.focus();
			return false;
		}
//		if (remarks.value == "") {
//			alert("please fill the remarks ");
//			remarks.focus();
//			return false;
//		}
		return true;
	}
 

}

// Validation for last claim:

function lclaimValidation() {
	name = document.getElementById('lclaim1').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert('last claim null');
		document.getElementById('lclaim1').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('lclaim must not contain any characters or symbols');
			document.getElementById('lclaim1').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for closing_amt_bills:

function closing_amt_billsValidation() {
	name = document.getElementById('closing_amt_bills').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('closing_amt_bills').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Closing Balance as per Accounts must not contain any characters or symbols');
			document.getElementById('closing_amt_bills').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Amount Claimed:

function amount_claValidation() {
	name = document.getElementById('amount_cla').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('amount_cla').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Amount Claimed must not contain any characters or symbols');
			document.getElementById('amount_cla').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Subsequent withdrawal:

function subseq_withdwValidation() {
	name = document.getElementById('subseq_withdw').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('subseq_withdw').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Subsequent withdrawals must not contain any characters or symbols');
			document.getElementById('subseq_withdw').value = "";
			return false;
		} else {
			return true;
		}
	}
}
// Validation for Completed Service:

function comserValidation() {
	name = document.getElementById('comser').value;
	var format = /[0123456789!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('comser').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Completed service must not contain any numbers or symbols');
			document.getElementById('comser').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Balance as per accounts slip:

function balance_accountsValidation() {
	name = document.getElementById('balance_accounts').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('balance_accounts').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Balance as per accounts slip must not contain any characters or symbols');
			document.getElementById('balance_accounts').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Balance :

function balanceValidation() {
	name = document.getElementById('balance').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('balance').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Balance must not contain any characters or symbols');
			document.getElementById('balance').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Subsequent deposits:

function subseq_depoValidation() {
	name = document.getElementById('subseq_depo').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('subseq_depo').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Subsequent deposits must not contain any characters or symbols');
			document.getElementById('subseq_depo').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Remarks:

//function remarksValidation() {
//	name = document.getElementById('ceares').value;
//	if (name == '') {
//		alert(null);
//		document.getElementById('ceares').value = "";
//		return false;
//	}
//	return true;
//}

// Validation for Name and Class of Child1:

function ceaname1Validation() {

	name = document.getElementById('ceaname0').value;
	// alert(1);
	var format = /[!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	// alert(2);
	if (name == null) {
		alert(null);
		document.getElementById('ceaname0').value = "";
		return false;
	} else if (name !== '') {
		// alert(22);
		if (name.match(format)) {
			alert('Name and Class of Child1 must not contain any symbols');
			document.getElementById('ceaname0').value = "";
			return false;
		} else if (name.length < 3) {
			alert("Name and Class of Child1 must contain at least 3 characters");
			document.getElementById('ceaname0').value = "";
			return false;
		} else if (name.length > 20) {
			alert("Name and Class of Child1 must not exceed 20 characters");
			document.getElementById('ceaname0').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Name and Class of Child2:

function ceaname2Validation() {
	name = document.getElementById('ceaname1').value;
	var format = /[!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('ceaname1').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Name and Class of Child2 must not contain any symbols');
			document.getElementById('ceaname1').value = "";
			return false;
		} else if (name.length < 3) {
			alert("Name and Class of Child2 must contain at least 3 characters");
			document.getElementById('ceaname1').value = "";
			return false;
		} else if (name.length > 20) {
			alert("Name and Class of Child2 must not exceed 20 characters");
			document.getElementById('ceaname1').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Period of Claim for child1:
function p_claimValidation() {
	name = document.getElementById('p_claim').value;
	var format = /[!@#$%^&*()+\=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('p_claim').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Period of Claim for child1 must not contain any numbers or symbols');
			document.getElementById('p_claim').value = "";
			return false;
		} else if (name.length < 3) {
			alert("Period of Claim for child1 must contain at least 2 characters");
			document.getElementById('p_claim').value = "";
			return false;
		} else if (name.length > 30) {
			alert("Period of Claim for child1 must not exceed 30 characters");
			document.getElementById('p_claim').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Period of Claim for child2:
function p_claim1Validation() {
	name = document.getElementById('p_claim1').value;
	var format = /[!@#$%^&*()+\=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('p_claim1').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Period of Claim for child1 must not contain any numbers or symbols');
			document.getElementById('p_claim1').value = "";
			return false;
		} else if (name.length < 3) {
			alert("Period of Claim for child1 must contain at least 2 characters");
			document.getElementById('p_claim1').value = "";
			return false;
		} else if (name.length > 30) {
			alert("Period of Claim for child1 must not exceed 30 characters");
			document.getElementById('p_claim1').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Amount Claimed for child1:
function cea_amount_child1Validation() {
	name = document.getElementById('cea_amount_child1').value;
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('cea_amount_child1').value = "";
		return false;
	}
	if (name !== '') {
		if (name.match(format)) {
			alert('Amount Claimed for child1 must not contain any characters or symbols');
			document.getElementById('cea_amount_child1').value = "";
			return false;
		}
	}

	var noofchilds = document.getElementById('noofchilds').value;
	if (noofchilds === "1") {
		document.getElementById('amount_cla').value = name;
		document.getElementById('amount_cla').readOnly = true;
		return true;
	}
	if (noofchilds === "2") {
		var cea_1 = $('#cea_amount_child1').val();
		var cea_2 = $('#cea_amount_child2').val();

		if (cea_2 === "" || cea_2 === null) {
			return false;
		} else {
			var num = parseInt(cea_1) + parseInt(cea_2);
			document.getElementById("amount_cla").value = Math.round(num);
			document.getElementById("amount_cla").readOnly = true;
			return true;
		}

	}
}

// Validation for Amount Claimed for child2:
function cea_amount_child2Validation() {
	name = document.getElementById('cea_amount_child2').value;
	//alert(name)
	var format = /[abcdefghijklmnopqrstuvwxyz!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('cea_amount_child2').value = "";
		return false;
	}
	if (name !== '') {
		if (name.match(format)) {
			alert('Amount Claimed for child2 must not contain any characters or symbols');
			document.getElementById('cea_amount_child2').value = "";
			return false;
		}
	}

	var noofchilds = document.getElementById('noofchilds').value;
	if (confirm("Are you sure about this amount")) {
		if (noofchilds === "2") {
			var cea_1 = $('#cea_amount_child1').val();
			var cea_2 = $('#cea_amount_child2').val();
			var num = parseInt(cea_1) + parseInt(cea_2);
			document.getElementById("amount_cla").value = Math.round(num);
			document.getElementById("amount_cla").readOnly = true;
			return true;
		}
		return true;
	} else {
		return false;
	}

}

// Validation for BillNumber:
function billnoValidation() {
	name = document.getElementById('billno').value;
	var format = /[!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == '') {
		alert(null);
		document.getElementById('billno').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('Bill no must not contain any symbols');
			document.getElementById('billno').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// Validation for Bill Date
function billdateValidation() {
	name = document.getElementById('billdate').value;
	if (name == '') {
		alert(null);
		return false;
	} else {
		return true;
	}
}

// Validation for shopname
function shopnameValidation() {

	name = document.getElementById('shopname').value;
	var format = /[!@#$%^&*()+\-=\[\]{};:\\|,<>\/?]/;
	if (name == null) {
		alert(null);
		document.getElementById('shopname').value = "";
		return false;
	} else if (name !== '') {
		if (name.match(format)) {
			alert('shopname must not contain any symbols');
			document.getElementById('shopname').value = "";
			return false;
		} else if (name.length < 3) {
			alert("shopname must contain at least 3 characters");
			document.getElementById('shopname').value = "";
			return false;
		} else if (name.length > 20) {
			alert("shopname must not exceed 20 characters");
			document.getElementById('shopname').value = "";
			return false;
		} else {
			return true;
		}
	}
}

// employee search for getting name and basic pay.
function employeesearch() {
	var code = $('#eno').val();
	if (!code.match('^[0-9]{4}$')) {
		alert("Employee Number should contain FOUR NUMBERS only");
		document.getElementById("eno").value = null;
		$("#eno").focus();
		return false;
	}

	$.ajax({
		type: "get",
		url: "./empNameandDesignation",
		data: "empcode="+code,
		cache:false,
		success:function(response){
//				alert("response=> "+response);
//				alert("response=> "+JSON.stringify(response));
			document.getElementById("empname").innerHTML = response;
			document.getElementById("eno").readOnly = true;
			$("#toallow").show();
			
		},
		error:function(response){
			alert("Employee code is not found");
			$("#eno").val(''); $("#eno").focus();
		}
	});

}
function balanceamount() {
	if (document.getElementById('balpersp').style.display != 'none') {
		var balance_accounts = $('#balance_accounts').val();
		var subseq_depo = $('#subseq_depo').val();
		var num = parseInt(balance_accounts) + parseInt(subseq_depo);
		document.getElementById("total").value = Math.round(num);
		document.getElementById("total").readOnly = true;
	} else {

		var balance_accounts = $('#closing_amt_bills').val();
		var subseq_depo = $('#subseq_depo').val();
		var num = parseInt(balance_accounts) + parseInt(subseq_depo);
		document.getElementById("total").value = Math.round(num);
		document.getElementById("total").readOnly = true;
	}
}
function balanceamounts() {
	var total = $('#total').val();
	var subseq_withdw = $('#subseq_withdw').val();
	var nums = parseInt(total) - parseInt(subseq_withdw);
	document.getElementById("balance").value = Math.round(nums);
	document.getElementById("balance").readOnly = true;

}

$(document).ready(function() {
	$('#toallow').hide();
	$('#noofchild').hide();

	$('#comser').hide();
	$('#comser0div').hide();
	$('#balpersp').hide();
	$('#balance_accountsdiv').hide();
	$('#gaclse').hide();
	$('#closing_amt_billsdiv').hide();
	$('#gsubdeps').hide();
	$('#gsubdepsdiv').hide();
	$('#gpftot').hide();
	$('#totaldiv').hide();
	$('#gsubwith').hide();
	$('#subseq_withdwdiv').hide();
	$('#gbal').hide();
	$('#balancediv').hide();
	$('#billnolabel').hide();
	$('#billnodiv').hide();
	$('#billdate').hide();
	$('#billdatediv').hide();
	$('#shopnamelabel').hide();
	$('#shopnamediv').hide();
	$('#lclaim').hide();
	$('#lclaimdiv').hide();
	$('#submit').hide();

	$('#ceanamelabelc1').hide();
	$('#ceanameinputc1').hide();
	$('#ceanamelabelc2').hide();
	$('#ceanameinputc2').hide();

	$("#pofcforc1label").hide();
	$("#pofcforc1input").hide();
	$("#pofcforc2label").hide();
	$("#pofcforc2input").hide();

	$("#type1label").hide();
	$("#type2label").hide();
	$("#type1input").hide();
	$("#type2input").hide();

	$("#acc1label").hide();
	$("#acc2label").hide();
	$("#acc1input").hide();
	$("#acc2input").hide();

	//$("#ceares").hide();

	$("#amountclaimlabel").hide();
	$("#amountclaiminput").hide();
	// document.getElementById("amount_cla").readOnly = true;

});

function childrens(selectObject) {
	var noofchilds = selectObject.value;
	//alert("noofchilds==> "+noofchilds);

	if (noofchilds == "1") {
		
		$("#ceanamelabelc1").show();
		$("#ceanameinputc1").show();
		$("#ceanamelabelc2").hide();
		$("#ceanameinputc2").hide();
		$("#ceaname1").val('');

		$("#pofcforc1label").show();
		$("#pofcforc1input").show();
		$("#pofcforc2label").hide();
		$("#pofcforc2input").hide();
		$("#p_claim1").val('');
		
		$("#type1label").show();
		$("#type1input").show();
		$("#type2label").hide();
		$("#type2input").hide();
		$("#schoolfee1").val('');
		
		$("#acc1label").show();
		$("#acc1input").show();
		$("#acc2label").hide();
		$("#acc2input").hide();
		$("#cea_amount_child2").val('');
		
		
		$("#comser").hide();
		$("#comser0div").hide();
		$("#comser0").val('');
		$("#balpersp").hide();
		$("#balance_accountsdiv").hide();
		$("#balance_accounts").val('');
		
		$("#gaclse").hide();
		$("#closing_amt_billsdiv").hide();
		$("#closing_amt_bills").val('');
		$("#gsubdeps").hide();
		$("#gsubdepsdiv").hide();
		$("#gsubdeps").val('');
		
		$("#gpftot").hide();
		$("#totaldiv").hide();
		$("#total").val('');
		$("#gsubwith").hide();
		$("#subseq_withdwdiv").hide();
		$("#subseq_withdw").val('');

		$("#gbal").hide();
		$("#balancediv").hide();
		$("#balance").val('');
		$("#billnolabel").hide();
		$("#billnodiv").hide();
		$("#billno").val('');
		
		$("#billdate").hide();
		$("#billdatediv").hide();
		$("#billdate").val('');
		$("#shopnamelabel").hide();
		$("#shopnamediv").hide();
		$("#shopname").val('');
		
		$("#lclaim").hide();
		$("#lclaimdiv").hide();
		$("#lclaim1").val('');
		
		$("#amountclaimlabel").show();
		$("#amountclaiminput").show();
		
		//$("#ceares").show();
		$("#submit").show();
		
		
	} else {
		
		$("#ceanamelabelc1").show();
		$("#ceanameinputc1").show();
		$("#ceanamelabelc2").show();
		$("#ceanameinputc2").show();

		$("#pofcforc1label").show();
		$("#pofcforc1input").show();
		$("#pofcforc2label").show();
		$("#pofcforc2input").show();
		
		$("#type1label").show();
		$("#type1input").show();
		$("#type2label").show();
		$("#type2input").show();
		
		$("#acc1label").show();
		$("#acc1input").show();
		$("#acc2label").show();
		$("#acc2input").show();
		
		$("#comser").hide();
		$("#comser0div").hide();
		$("#comser0").val('');
		$("#balpersp").hide();
		$("#balance_accountsdiv").hide();
		$("#balance_accounts").val('');
		
		$("#gaclse").hide();
		$("#closing_amt_billsdiv").hide();
		$("#closing_amt_bills").val('');
		$("#gsubdeps").hide();
		$("#gsubdepsdiv").hide();
		$("#gsubdeps").val('');
		
		$("#gpftot").hide();
		$("#totaldiv").hide();
		$("#total").val('');
		$("#gsubwith").hide();
		$("#subseq_withdwdiv").hide();
		$("#subseq_withdw").val('');

		$("#gbal").hide();
		$("#balancediv").hide();
		$("#balance").val('');
		$("#billnolabel").hide();
		$("#billnodiv").hide();
		$("#billno").val('');
		
		$("#billdate").hide();
		$("#billdatediv").hide();
		$("#billdate").val('');
		$("#shopnamelabel").hide();
		$("#shopnamediv").hide();
		$("#shopname").val('');
		
		$("#lclaim").hide();
		$("#lclaimdiv").hide();
		$("#lclaim1").val('');
		
		$("#amountclaimlabel").show();
		$("#amountclaiminput").show();
		
		//$("#ceares").show();
		$("#submit").show();
		
		
		
		
		$("#ceanamelabelc1").show();
		$("#ceanameinputc1").show();
		$("#ceanamelabelc2").show();
		$("#ceanameinputc2").show();

		$("#pofcforc1label").show();
		$("#pofcforc1input").show();
		$("#pofcforc2label").show();
		$("#pofcforc2input").show();

		$("#type1label").show();
		$("#type1input").show();
		$("#type2label").show();
		$("#type2input").show();

		$("#acc1label").show();
		$("#acc1input").show();
		$("#acc2label").show();
		$("#acc2input").show();

		$("#amountclaimlabel").show();
		$("#amountclaiminput").show();
		$("#submit").show();

		var cea_1 = $("#cea_amount_child1").val();
		var cea_2 = $("#cea_amount_child2").val();
		var num = parseInt(cea_1) + parseInt(cea_2);
		document.getElementById("amount_cla").value = Math.round(num);
		document.getElementById("amount_cla").readOnly = true;

	}

}

function allowancelist(selectObject) {
	var allowancevalue = selectObject.value;
	//alert("allowddddddddddd "+allowancevalue)
	

	if (allowancevalue == "1") {
		
		$("#noofchild").show();
		$('#comser').hide();
		$('#balpersp').hide();
		$('#gsubdeps').hide();
		$('#gpftot').hide();
		$('#gsubwith').hide();
		$('#gbal').hide();
		$('#gpf_file').hide();
		$('#gaclse').hide();
		$('#gasubdep').hide();
		$('#gasubwith').hide();
		$('#billno').hide();
		$('#billdate').hide();
		$('#shopname').hide();
		$('#lclaim').hide();
	}
	if (allowancevalue == "2") {
		$('#comser').show();
		$('#balpersp').show();
		$('#gsubdeps').show();
		$('#gpftot').show();
		$('#gsubwith').show();
		$('#gbal').show();
		$('#amountclaim').show();
		$('#gpf_file').show();
		//$('#ceares').show();
		$('#headop').show();
		document.getElementById('subseq_depo').value = '';
		document.getElementById('total').value = '';
		document.getElementById('subseq_withdw').value = '';
		document.getElementById('balance').value = '';

		$('#pofc').hide();
		$('#adamt').hide();
		$('#amountclaimchild1').hide();
		$('#cea_file').hide();
		$('#ceaname').hide();
		$('#gaclse').hide();
		$('#gasubdep').hide();
		$('#gasubwith').hide();
		$('#billno').hide();
		$('#billdate').hide();
		$('#shopname').hide();
		$('#lclaim').hide();
	}
	if (allowancevalue == "3") {
		$('#gaclse').show();
		$('#gsubdeps').show();
		$('#gsubwith').show();
		$('#gpftot').show();
		$('#gsubwith').show();
		$('#gbal').show();
		$('#amountclaim').show();
		$('#gpf_file').show();
		//$('#ceares').show();
		$('#headop').show();
		document.getElementById('subseq_depo').value = '';
		document.getElementById('total').value = '';
		document.getElementById('subseq_withdw').value = '';
		document.getElementById('balance').value = '';

		$('#pofc').hide();
		$('#adamt').hide();
		$('#amountclaimchild1').hide();
		$('#cea_file').hide();
		$('#ceaname').hide();
		$('#comser').hide();
		$('#balpersp').hide();
		$('#billno').hide();
		$('#billdate').hide();
		$('#shopname').hide();
		$('#lclaim').hide();
	}
	if (allowancevalue == "4") {
		
		$("#noofchild").hide();
		$("#noofchilds").val('');
		
		$("#ceanamelabelc1").hide();
		$("#ceanameinputc1").hide();
		$("#ceaname0").val('');
		$("#ceanamelabelc2").hide();
		$("#ceanameinputc2").hide();
		$("#ceaname1").val('');

		$("#pofcforc1label").hide();
		$("#pofcforc1input").hide();
		$("#p_claim").val('');
		$("#pofcforc2label").hide();
		$("#pofcforc2input").hide();
		$("#p_claim1").val('');
		
		$("#type1label").hide();
		$("#type1input").hide();
		$("#schoolfee").val('');
		$("#type2label").hide();
		$("#type2input").hide();
		$("#schoolfee1").val('');
		
		$("#acc1label").hide();
		$("#acc1input").hide();
		$("#cea_amount_child1").val('');
		$("#acc2label").hide();
		$("#acc2input").hide();
		$("#cea_amount_child2").val('');
		
		
		$("#comser").hide();
		$("#comser0div").hide();
		$("#comser0").val('');
		$("#balpersp").hide();
		$("#balance_accountsdiv").hide();
		$("#balance_accounts").val('');
		
		$("#gaclse").hide();
		$("#closing_amt_billsdiv").hide();
		$("#closing_amt_bills").val('');
		$("#gsubdeps").hide();
		$("#gsubdepsdiv").hide();
		$("#gsubdeps").val('');
		
		$("#gpftot").hide();
		$("#totaldiv").hide();
		$("#total").val('');
		$("#gsubwith").hide();
		$("#subseq_withdwdiv").hide();
		$("#subseq_withdw").val('');

		$("#gbal").hide();
		$("#balancediv").hide();
		$("#balance").val('');
		$("#billnolabel").show();
		$("#billnodiv").show();
		$("#billno").show();
		
		$("#billdate").show();
		$("#billdatediv").show();
		$("#shopnamelabel").show();
		$("#shopnamediv").show();
		
		$("#lclaim").hide();
		$("#lclaimdiv").hide();
		$("#lclaim1").val('');
		
		$("#amountclaimlabel").show();
		$("#amountclaiminput").show();
		
		//$("#ceares").show();
		$("#submit").show();
	}
	if (allowancevalue == "5") {
		$('#billno').show();
		$('#billdate').show();
		$('#shopname').show();
		$('#lclaim').show();
		$('#amountclaim').show();
		$('#gpf_file').show();
		//$('#remarks').show();
	}

}

/*
 * $(document).ready(function(){
 * 
 * });
 * 
 * function validate() { //eno var code = $("#eno").val(); if(code == "" || code ==
 * null){ alert("Please Enter Employee Code");
 * document.getElementById("eno").value = null; $("#eno").focus(); return false; }
 * 
 * //allowlist var allowlist = $("#allowlist").val(); if(allowlist == "" ||
 * allowlist == null){ alert("Please Chosse Allowance Type");
 * $("#allowlist").focus(); return false; } //noofchilds var noofchilds =
 * $("#noofchilds").val(); if(noofchilds == "" || noofchilds == null){
 * alert("Please Chosse noofchilds"); $("#noofchilds").focus(); return false; }
 * //ceaname0 var ceaname0 = $("#ceaname0").val(); if(ceaname0 == "" || ceaname0 ==
 * null){ alert("Please Enter Name and Class of Child1");
 * $("#ceaname0").focus(); return false; } //ceaname1 var ceaname1 =
 * $("#ceaname1").val(); if(ceaname1 == "" || ceaname1 == null){ alert("Please
 * Enter Name and Class of Child2"); $("#ceaname1").focus(); return false; }
 * //p_claim var p_claim = $("#p_claim").val(); if(p_claim == "" || p_claim ==
 * null){ alert("Please Enter Period of Claim of Child1");
 * $("#p_claim").focus(); return false; } //p_claim1 var p_claim1 =
 * $("#p_claim1").val(); if(p_claim1 == "" || p_claim1 == null){ alert("Please
 * Enter Period of Claim of Child2"); $("#p_claim1").focus(); return false; }
 * //schoolfee var schoolfee = $("#schoolfee").val(); if(schoolfee == "" ||
 * schoolfee == null){ alert("Please Choose of Type for child1");
 * $("#schoolfee").focus(); return false; } //schoolfee1 var schoolfee1 =
 * $("#schoolfee1").val(); if(schoolfee1 == "" || schoolfee1 == null){
 * alert("Please Choose of Type for child2"); $("#schoolfee1").focus(); return
 * false; } //cea_amount_child1 var cea_amount_child1 =
 * $("#cea_amount_child1").val(); if(cea_amount_child1 == "" ||
 * cea_amount_child1 == null){ alert("Please Enter Amount Claimed for child1");
 * $("#cea_amount_child1").focus(); return false; } //cea_amount_child2 var
 * cea_amount_child2 = $("#cea_amount_child2").val(); if(cea_amount_child2 == "" ||
 * cea_amount_child2 == null){ alert("Please Enter Amount Claimed for child2");
 * $("#cea_amount_child2").focus(); return false; }
 * 
 * return false; }
 * 
 * function employeesearch() { var code = $("#eno").val();
 * 
 * if (!code.match('^[0-9]{4}$')) { alert("Employee Number should contain FOUR
 * NUMBERS only"); document.getElementById("eno").value = null;
 * $("#eno").focus(); return false; }
 * 
 * $.get('/getNameDesg', { code : code }, function(response) {
 * $('#empname').html(response); $('#empname').text(response[0] + " - " +
 * response[1]); })
 *  }
 */

