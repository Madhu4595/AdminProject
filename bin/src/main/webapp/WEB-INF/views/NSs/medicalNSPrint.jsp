<%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.app.entity.Medical_Bills_upload"%>
<%@page import="com.app.util.MyUtil"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
	 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
<%
	Medical_Bills_upload upload = (Medical_Bills_upload) request.getAttribute("medical_Bills_upload3");
//String words = MyUtil.convert(Long.valueOf(upload.getTotAmountApproved()));
//String words = String.valueOf(request.getAttribute("tot_amount"));
//System.out.println("words==========> "+words);

Integer totAmountApproved = (Integer) request.getAttribute("totAmountApproved");
System.out.println("totAmountApproved=> " + totAmountApproved);
String words = String.valueOf(totAmountApproved);
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="css/home-style.css" /> -->
<script src="https://kit.fontawesome.com/2c3c26015e.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
<script>
function myFunction() {
	var num = '<%=words%>';
		var a = [ '', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ',
				'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ',
				'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ',
				'Eighteen ', 'Nineteen ' ];
		var b = [ '', '', 'Twenty', 'Thirty', 'Fourty', 'Fifty', 'Sixty',
				'Seventy', 'Eighty', 'Ninety' ];

		if ((num = num.toString()).length > 9)
			return 'overflow';
		n = ('000000000' + num).substr(-9).match(
				/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
		if (!n)
			return;
		var str = '';
		str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]])
				+ 'Crore ' : '';
		str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]])
				+ 'Lakh ' : '';
		str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]])
				+ 'Thousand ' : '';
		str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]])
				+ 'Hundred ' : '';
		str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) : '';
		document.getElementById("words").innerHTML = str;
	}
</script>
<style>
/* styles.css */

body,.universeStyle {
    font-family: "Times New Roman", Times, serif;
    font-size: 10pt;
    margin: 0;
    padding: 0;
}

</style>
</head>

<body onload="myFunction();">


	<section class="container mt-5 pt-2 border">
		<div class="row">
			<div class="col-md-12">
				<div>
					<div style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;"   align="center">
						<%= localizationManager.getMessage("nic1") %> / GOVERNMENT OF INDIA<br>
						<%= localizationManager.getMessage("nic32") %> / MINISTRY OF ELECTRONICS & INFORMATION TECHNOLOGY<br>
						<%= localizationManager.getMessage("nic33") %> / NATIONAL INFORMATICS CENTRE<br>
						<%= localizationManager.getMessage("nic34") %> / ANDHRA PRADESH STATE CENTRE<br>
						<%= localizationManager.getMessage("nic35") %> - <%= localizationManager.getMessage("nic17") %> /  VIJAYAWADA - 520010
					</div>
<br>
					<div>

						<div style="text-align: right;">
							<%= localizationManager.getMessage("nic37") %> / Date  : <b>${todaydate }</b>
						</div>
						<br>
						<div style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;font-weight: bold;text-decoration: underline;" align="center">
							 Subject: Verified medical claim for approval 
						</div>
						<br>

						<div>
							<table >
								<tr>
									<td>1. Full Name of claimant (Block Letters)</td>
									<td>: ${employee.callSign }. ${employee.name.toUpperCase()}</td>
								</tr>
								<tr>
									<td>2. Designation & Emp. Code</td>
									<td>: ${employee.designation } & ${employee.code}</td>
								</tr>
								<tr>
									<td>3. CGHS card No. (if CGHS beneficiary) /Name of AMA</td>
									<td>: ${typecghsno }</td>
								</tr>
								<tr>
									<td>4.Name of the patient & relationship With the
										Government Servant</td>
									<td>: ${relationn } </td>
								</tr>
								<tr>
									<td>5. Pay in Pay Band (Without Grade Pay)</td>
									<td>: ${employee.basic_pay}/-</td>
								</tr>
								<tr>
									<td>6. Name of the Hospital /Diagnostic Centre</td>
									<td>: ${medical_Bills_upload3.hospital_name }</td>
								</tr>
								<tr>
									<td>7. Total amount claimed (Enclosed all relevant
										documents)</td>
									<td>: &#8377; ${totAmountClaimed }/-</td>
								</tr>
								<tr>
									<td>8. Admissible amount (as per details enclosed)</td>
									<td>: <b>&#8377; ${totAmountApproved }/- </b>
									</td>
								</tr>

							</table>

						</div>
						<br>
						<div style="font-size: 12pt;">
							1. The declaration of the above officer is available with office
							that the income from all sources does not exceed Rs. 9,000/- per
							month of the above said patient (applicable where the patient is
							dependant) and claimant is entitle for medical reimbursement as
							per CGHS/CSMA rules.<br>
							<br> 2. The Joint Declaration is also available with office
							of the claimant for taking this facility from NIC (in case of
							spouse is serving)

						</div>
						<div>
							<div style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;font-weight: bold;text-decoration: underline;" align="center">
								Bill Details
							</div>
							<div>
								<table style="font-family: 'Times New Roman', Times, serif;font-size: 12pt;margin: 0;padding: 0;">
									<tr>
										<td>1. Name of the Patient</td>
										<td>: ${medical_Bills_upload3.patient_name }</td>
									</tr>
									<tr>
										<td>2. Name of the diseases / treatment</td>
										<td>: ${medical_Bills_upload3.disease_name }</td>
									</tr>
									<tr>
										<td>3. Period of treatment</td>
										<td>: ${medical_Bills_upload3.period_of_treatment }</td>
									</tr>
								</table>
							</div>
						</div>


					</div>
					<br>


					<table width="1000px;" border="2" style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;">
						<tr>
							<th>Bill No</th>
							<th>Procedure / Test Name with CGHS rate list No.</th>
							<th>Amount Claimed</th>
							<th>Amount Approved</th>
							<th>Remarks</th>
						</tr>

						<tbody>

							<c:forEach var="medical_Bills_upload4"
								items="${medical_Bills_upload4 }">
								<tr>
									<td>${medical_Bills_upload4.bill_no }</td>
									<td>${medical_Bills_upload4.lab_name }</td>
									<td>${medical_Bills_upload4.amount_claimed }</td>
									<td>${medical_Bills_upload4.amount_approved }</td>
									<td>CGHS rates</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="2" align="center"><b>Total</b></td>
								<td><b>${totAmountClaimed }</b></td>
								<td><b> ${totAmountApproved }</b></td>
								<td></td>
							</tr>

						</tbody>
					</table>

					<div style="font-family: 'Times New Roman', Times, serif;font-size: 10pt;margin: 0;padding: 0;">
						<p>Certified that:</p>
						1. The medicine mentioned in the prescription / bill are
						admissible as per CGHS / CSMA rules.<br> 2. Serial no.
						mentioned in the bill as per admissible list of CGHS / CSMA.<br>
						(In case of Ayurvedic, Siddha, Unani and Homeopathic medicine
						only).<br> 3. Discharge summary is enclosed herewith (In case
						of in-patient treatment).<br> 4. The AIIMS rates are applied
						where CGHS rates are not available.<br> 5. The actual paid
						amount has been verified where CGHS / AIIMS rate are not
						available.<br> 6.In case treatment taken in emergency and
						cover under emergency as per CGHS / CSMA rules (Emergency
						certificate enclosed).<br>
						<br> Above-said claim is in order. As per the delegation of
						power issued vide office order No. M -11017/2014 - MS (O&M) Dt.
						17/07/2014. Head of State NIC Centre being the authority competent
						if the claim admissible not exceeds Rupees Two Lakhs may kindly
						approve the reimbursement of admissible amount for <b>&#8377;
							${totAmountApproved }/- ( Rupees <span id="words"></span>
							Only).
						</b>
					</div>
<!-- <br><br><br><br> -->
<!-- 					<div style="text-align: right;"> -->
<!-- 						<b> <u> -->
<%-- 								<p><%= localizationManager.getMessage("DyDirector") %> / Dy.Director</p> --%>
<!-- 						</u></b> -->
<!-- 					</div> -->

<!-- <br> -->
<!-- 					<div style="text-align: left;"> -->
<%-- 						<b><u><%= localizationManager.getMessage("HeadofOffice") %> / Head of Office</u></b> --%>
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<br> -->
<!-- 					<br> -->
<!-- 					<div style="text-align: left;"> -->
<%-- 						<b><u><%= localizationManager.getMessage("StateInformaticsOfficer") %> / State Informatics Officer</u></b> --%>
<!-- 					</div> -->
<!-- 					<br> -->
<!-- 					<br> -->
					<br>

				</div>



			</div>
			</div>
	</section>






	</form>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
<!-- 	<script src="assests/owlCarousel/owl.carousel.min.js" -->
<!-- 		type="text/javascript"></script> -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>

</body>
<!--<h3 align="center"><input type="button"  
           value="Print Receipt" onclick="return myFunction();" class="btn btn-primary"/></h3>-->
</html>