<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CGHS</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<style>
body{
	font-size: 22px;
}
</style>
<script>
	function printdata(){
		window.print();
	}
</script>
</head>
<body onload="return printdata();">


<div class="container" style="border: 2px solid black; border-radius: 10px;">
	
	<div align="center" style="margin: 5px;">
				<span style="font-weight: bold;text-decoration: underline;font-size: 25px;">CENTRAL GOVERNMENT HEALTH SCHEME</span><br>
				<span style="font-weight: bold;text-decoration: underline;font-size: 22px;">MEDICAL REIMBURSEMENT CLAIM FORM </span><br>
				<span style="font-size: 15px;">(To be filled up by the Principal Card holder in <b>BLOCK LETTERS</b>)</span>
		 
	</div>
	
	<div class="row">
		<div class="col-6">1. (a) Name of the Principal CGHS Card Holder</div>
		<div class="col-6">: ${bean.empName }</div>
	</div>
	<div class="row">
		<div class="col-6">(b) CGHS Ben ID No</div>
		<div class="col-6">: ${bean.ecghsCode }</div>
	</div>
	<div class="row">
		<div class="col-6">(c) Employee Code No</div>
		<div class="col-6">: ${bean.empCode }</div>
	</div>
	<div class="row">
		<div class="col-6">(d) Ward Entitlement - Pvt./Semi-Pvt./General</div>
		<div class="col-6">: ${bean.wardEntitlement }</div>
	</div>
	<div class="row">
		<div class="col-6">(e) Full Address</div>
		<div class="col-6">: ${bean.address }</div>
	</div>
	<div class="row">
		<div class="col-8">
			<div class="row">
				<div class="col-6">2. (a) Patient's Name</div>
				<div class="col-6">: ${bean.patientName }</div>
			</div>
			<div class="row">
				<div class="col-6">(b) Patient's CGHS Ben ID No</div>
				<div class="col-6">: ${bean.patientCghsCode }</div>
			</div>
			<div class="row">
				<div class="col-6">(c) Relationship with the Principal CGHS card holder</div>
				<div class="col-6">: ${bean.patientRelation }</div>
			</div>
		
		
		</div>
		<div class="col-4">
			<img src="data:image/png;base64, ${bean.strDoc }" alt="DOC" width="300px;" height="200px;">
		</div>
	</div>
		
	<div class="row">
		
		<div class="col-7 mt-2"> <span> &nbsp;3. Name & address of the hospital / diagnostic center / &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;imaging center where treatment is taken or tests &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;done</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.hospitalName }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;4. Whether the hospital/diagnostic/imaging center is &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;empanelled under CGHS</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.empalledUnderCGHS }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;5. Treatment for which reimbursement claimed  </span> </div> 
		<div class="col-5 mt-2"></div>
		
		<div class="col-7 mt-2"> <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(a) OPD Treatment/Test & investigations </span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.opdTreatment }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) Indoor Treatment</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.indoorTreatment }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;6. Whether treatment was taken in emergency</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.emergencyTreatment }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;7. Whether prior permission was taken for the &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;treatment</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.treatmentPermission }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;8. Whether subscribing to any health/medical insurance &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;scheme, If yes, amount claimed/received</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.healthMedicalInsuranceScheme }</div>
		
		<div class="col-7 mt-2"> <span> &nbsp;9. Details of Medical Advance taken, if any</span> </div> 
		<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.healthMedicalInsuranceSchemeIfYes }</div>
	</div>
		<div class="row">
			<div class="col-7 mt-2"> <span> 10. <b>Total amount claimed</b></span> </div> 
			<div class="col-5 mt-2">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${totAmoutClaimed }</b></div>
		</div>
		<div class="row">
			<div class="col-4 mb-1"> <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(a) OPD Treatment</span>: ${bean.opdTotal } </div> 
			<div class="col-4 mb-1"> <span> &nbsp;&nbsp;&nbsp;(b) Indoor Treatment</span>: ${bean.indoorTotal } </div> 
			<div class="col-4 mb-1"> <span> &nbsp;&nbsp;&nbsp;(c) Tests/Investigations</span>: ${bean.testsTotal } </div> 
			 
		</div>
		<div class="row">
			<div class="col-4 mb-1"> <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) Procedure</span>: ${bean.procedureTotal } </div>
		</div>
	<div align="center" style="font-size: 15px;margin-top: 30px;" >
				<span style="font-weight: bold;text-decoration: underline;font-size: 20px;">DECLARATION</span><br>
	</div>
	
	<div style="text-align: justify;">
			I hereby declare that the statements made in the application are true to the best of my knowledge and belief and the person for whom medical expenses were incurred is 
			wholly dependent on me. I am a CGHS beneficiary and the CGHS card was valid at the time of treatment. I agree for the reimbursement as is admissible under the rules.
	</div>
	<br><br>
	<div class="mt-4 mb-4">
		Date : ${bean.date }<br>
		<span>Place : ${bean.place }</span><span style="margin-left: 200px;">Signature of the Principal CGHS card holder</span>
	</div>
	
</div>	
	 
	
	
</body>
</html>