var http=getXMLHTTPRequest();
function getXMLHTTPRequest(){
    var xmlhttp = false;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}             

function getSubsequentOptions(fromId,typeId,type,callback) {
    http = getXMLHTTPRequest(); 
    var code = document.getElementById(fromId).value; 
    var url = "./views/AjaxExecution.jsp?type="+type+"&param="+code; 
    if(type=='villages'){
    	var dist_code = document.getElementById('addrs_district_c').value;
    	url+="&distcode="+dist_code
    }
    if(type=='duplvillages'){
    	var dist_code = document.getElementById('presdist').value;
    	url+="&distcode="+dist_code
    }
    if(type=='preseditvillages'){
    	var dist_code = document.getElementById('pres_addr_district').value;
    	url+="&distcode="+dist_code
    }
    if(type=='wrkeditvillages'){
    	var dist_code = document.getElementById('pres_emp_district').value;
    	url+="&distcode="+dist_code
    }
    if(type=='wrkplacevillages'){
    	var dist_code = document.getElementById('work_place_dist').value;
    	url+="&distcode="+dist_code
    }
    if(type=='cess_villages'){
    	var dist_code = document.getElementById('cess_district').value;
    	url+="&distcode="+dist_code
    }
    
    if(type=='report_villages'){
    	var dist_code = document.getElementById('report_district').value;
    	url+="&distcode="+dist_code
    }
    if(type=='familynames'){
    	var dist_code = document.getElementById('eno').value;
    	url+="&distcode="+dist_code
    }
    http.open("GET", url, true);
    http.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    http.onreadystatechange = function() {
        return populateOptions(typeId,callback)
    };
    http.send(null);
}
      
function getSubsequentOptions1(fromId,fromId1,fromId2,typeId,type,callback) { 
    http = getXMLHTTPRequest(); 
    var code = document.getElementById(fromId).value; 
    var code1 = document.getElementById(fromId1).value;
    var code2 = document.getElementById(fromId2).value;
    var url = "AjaxExecution.jsp?type="+type+"&param="+code+"&param1="+code1+"&param2="+code2; 
    /*if(type=='validity_date'){
    	var old_regno = document.getElementById('old_regno').value;
    	var dt_of_regstrn=document.getElementById('dt_of_regstrn').value;
    	var subscription_years=document.getElementById('subscription_years').value;
    	url+="&old_regno="+old_regno+"&dt_of_regstrn="+dt_of_regstrn+"&subscription_years="+subscription_years
    }*/
    http.open("GET", url, true);
    http.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    http.onreadystatechange = function() {
        return populateOptions(typeId,callback)
    };
    http.send(null);
} 




function populateOptions(typeId,callback) {                        
    if (http.readyState == 4) {                                      
        var response = http.responseText; 
        document.getElementById(typeId).innerHTML = response;  
        if(callback!=undefined) {
            setTimeout(callback, 10);
        }
    }
}
      
        