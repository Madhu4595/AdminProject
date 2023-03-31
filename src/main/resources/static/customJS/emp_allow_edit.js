/**
 * 
 */
function helprequestnosearch() {
	
	 var modal1 = document.getElementById("myModal1");
	    var span = document.getElementsByClassName("close1")[0];
	    modal1.style.display = "block";
	    span.onclick = function () {
	        modal1.style.display = "none";
	    };
	    
	$.ajax({
		type : "get",
		url : "./getrequestnos",
		cache : false,
		success : function(html) {
			$("#content").html(html);
		}
	});
}

function callrequestno(a) {
	document.getElementById("request_no").value = a;
	$("#submit_btn").show();
	requestnosearch();
}

function requestnosearch() {
	var request_no = $('#request_no').val();
	document.getElementById("request_no").readOnly = true;
	
	$.get('./employeereqnosearch', {
		request_no : request_no
	}, function(response) {
		//alert("employeereqnosearch");
		var allowance_type = response[0];
		//alert("allowance_type=> "+allowance_type);
		
		$('#myModal1').hide();
		
		$("#search").hide();
		$("#submit_btn").show();
		$("#allowance_response").show();
		$('#myModal').modal('hide');
		
		$("#eno").val(response[2]);
		$("#request_no").val(response[3]);
		$("#empname").text(response[4]);
		
		if(allowance_type === '4'){
			$("#allowance_type").val('BRIEF CASE');
			document.getElementById("allowance_type").readOnly = true;
			
			$("#name_class_of_child_row").hide();
			document.getElementById("name_class_of_child1").value = '';
			document.getElementById("name_class_of_child2").value = '';
			
			$("#period_of_claim_childrow").hide();
			document.getElementById("period_of_claim_child1").value = '';
			document.getElementById("period_of_claim_child2").value = '';
			
			$("#adamt").hide();
			document.getElementById("cea_type_child1").value = '';
			document.getElementById("cea_type_child2").value = '';
			
			$("#amountclaimchild1").hide();
			document.getElementById("cea_amount_child1").value = '';
			document.getElementById("cea_amount_child2").value = '';
			
			$("#amountclaim").show(); $("#amount_claimedlabel").show(); $("#amount_claimed").val(response[9]); 
			
		}
		if(allowance_type === '1'){
			//alert("allowance_type=> "+allowance_type);
			
			$("#allowance_type").val('CEA');
			document.getElementById("allowance_type").readOnly = true;
			
			var noofchilds = response[6];
			$("#noofchilds").val(noofchilds);
			
			if(noofchilds === "1"){
				//alert("noofchilds === 1");
				
				$("#name_class_of_child_row").show();
				$("#name_class_of_child1").val(response[8]);
				
				$("#name_class_of_child2label").hide();
				$("#name_class_of_child2input").hide();
				$("#name_class_of_child2").val(''); 
				
				$("#period_of_claim_childrow").show();
				$("#period_of_claim_child1").val(response[9]); 
				
				$("#period_of_claim_child2label").hide();
				$("#period_of_claim_child2input").hide();
				$("#period_of_claim_child2").val(''); 
				
				$("#adamt").show();
				$("#cea_type_child1").val(response[10]);
				
				$("#cea_type_child2label").hide();
				$("#cea_type_child2input").hide();
				$("#cea_type_child2").val('');
				
				$("#amountclaimchild1").show();
				$("#cea_amount_child1").val(response[11]);
				
				$("#cea_amount_child2label").hide();
				$("#cea_amount_child2input").hide();
				$("#cea_amount_child2").val('');
				
				document.getElementById("amount_claimed").readOnly = true;
				$("#amount_claimed").val(response[11]);
			}
			
			if(noofchilds === "2"){
				//alert("noofchilds === 2=>"+noofchilds);
				
				$("#name_class_of_child_row").show();
				$("#name_class_of_child1").val(response[8]);
				
				$("#name_class_of_child2label").show();
				$("#name_class_of_child2input").show();
				$("#name_class_of_child2").val(response[13]); 
				
				$("#period_of_claim_childrow").show();
				$("#period_of_claim_child1").val(response[9]); 
				
				$("#period_of_claim_child2label").show();
				$("#period_of_claim_child2input").show();
				$("#period_of_claim_child2").val(response[14]); 
				
				$("#adamt").show();
				$("#cea_type_child1").val(response[10]);
				
				$("#cea_type_child2label").show();
				$("#cea_type_child2input").show();
				$("#cea_type_child2").val(response[15]);
				
				$("#amountclaimchild1").show();
				$("#cea_amount_child1").val(response[11]);
				
				$("#cea_amount_child2label").show();
				$("#cea_amount_child2input").show();
				$("#cea_amount_child2").val(response[16]);
				
				document.getElementById("amount_claimed").readOnly = true;
				$("#amount_claimed").val(response[17]);
				
				
			}
			
			
		}


	});
}

//Amount for child 2
function ceaamtc1(){
	var noofchilds = document.getElementById("noofchilds").value;
	//alert("noofchilds"+noofchilds);
	if(noofchilds === "1"){ 
		var cea_amount_child1 = document.getElementById("cea_amount_child1").value; 
		document.getElementById("amount_claimed").value = cea_amount_child1; 
		document.getElementById("amount_claimed").readOnly = true; 
		return true; 
	}
	if(noofchilds === "2"){
		//alert("if(noofchilds === 2");
		var cea_1 = $('#cea_amount_child1').val();
		var cea_2 = $('#cea_amount_child2').val();
		
		if(cea_2 === "" || cea_2 === null){
			return false;
		}else{
			var num = parseInt(cea_1) + parseInt(cea_2);
			document.getElementById("amount_claimed").value = Math.round(num);
			document.getElementById("amount_claimed").readOnly = true;
			return true; 
		}
		
	}
}
//Amount for child 2
function cea_amount(){
  //alert("cea_amount()");
  var cea_1 = $('#cea_amount_child1').val();
	var cea_2 = $('#cea_amount_child2').val();
	
	if(cea_2 === "" || cea_2 === null){
		return false;
	}else{
		var num = parseInt(cea_1) + parseInt(cea_2);
		document.getElementById("amount_claimed").value = Math.round(num);
		document.getElementById("amount_claimed").readOnly = true;
		return true; 
	}
}

