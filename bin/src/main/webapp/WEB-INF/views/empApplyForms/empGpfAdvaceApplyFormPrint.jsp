    <%@page import="com.app.util.LocalizationManager"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
	 <%
        Locale locale = new Locale("hi", "IN"); // Hindi (India)
        LocalizationManager localizationManager = new LocalizationManager(locale);
    %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<%
	 LocalDate currentDate = LocalDate.now();
    System.out.println("Current Date: " + currentDate);
    
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

    // Format the LocalDate to a string with the desired format
    String formattedDate = currentDate.format(formatter);

    System.out.println("Formatted Date: " + formattedDate);

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMP GPF ADVANCE PRINT</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">

<script type="text/javascript">
	function getPrint(){
		window.print();
	}
</script>
<style>
	body{
		font-size: 15px;
	}
</style>
</head>
<body onload="return getPrint();">
<div class="container-fluid border p-1">
	
	<div align="center">
			<%= localizationManager.getMessage("nic1") %><br>
			GOVERNMENT OF INDIA<br>
			
			<%= localizationManager.getMessage("nic13") %><br>
			NATIONAL INFORMATICS CENTRE<br>
			
			APPLICATION FOR ADVANCE FROM GPF FUND <br>
		</div>
		<br><br>
		<div class="row m-1">   <div class="col-7">1. <%= localizationManager.getMessage("nic47") %> / Name</div> <div class="col-4">: ${emp.name }</div> <div class="col-1"></div> </div>
		<div class="row m-1">   <div class="col-7">2. <%= localizationManager.getMessage("nic48") %> / Designation</div> <div class="col-4">: ${emp.designation }</div> <div class="col-1"></div> </div>
		<div class="row m-1">   <div class="col-7">3. <%= localizationManager.getMessage("nic49") %> / Account No.</div> <div class="col-4">: MIT / NIC / GPF / </div> <div class="col-1"></div> </div>
		<div class="row m-1">   <div class="col-7">4. <%= localizationManager.getMessage("nic50") %> / Pay</div> <div class="col-4">: <%= localizationManager.getMessage("nic53") %> / Rs. ${emp.basic_pay } /-</div> <div class="col-1"></div> </div>
		
		<div class="row m-1"> <div class="col-11">5. <%= localizationManager.getMessage("nic51") %> : <br> &nbsp;&nbsp;&nbsp; Balance at the credit of the subscriber on the date of application as below.</div> </div>
		
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">i. <%= localizationManager.getMessage("nic52") %>  </div> <div class="col-5"> : .......................................  <%= localizationManager.getMessage("nic53") %></div> </div>
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">  &nbsp;&nbsp; Closing balance as per statement for &nbsp;&nbsp;&nbsp;the year ${bean.financialYear } </div> <div class="col-5"> : Rs. ${bean.closingBalance }  </div> </div>
		
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">ii. <%= localizationManager.getMessage("nic54") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic55") %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic56") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6"> &nbsp;&nbsp; Credit from ${bean.creditOnAccountFrom } to ${bean.creditOnAccountTo } on account &nbsp;&nbsp;&nbsp;of monthly subscription  </div> <div class="col-5">: Rs. ${bean.creditOnAccountRs } /- </div> </div>
		
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">iii. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic55") %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic56") %>   </div> <div class="col-5">:  .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div>
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">&nbsp;&nbsp; Refund from ${bean.refundFrom } to ${bean.refundTo }  </div> <div class="col-5">: Rs. ${bean.refundRs } /-</div> </div>
		
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">iv. <%= localizationManager.getMessage("nic57") %> (i+ii+iii)   </div> <div class="col-5">: ....................................... <%= localizationManager.getMessage("nic53") %></div> </div>
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">&nbsp;&nbsp; TOTAL (i+ii+iii)   </div> <div class="col-5">: Rs. ${bean.total } /- </div> </div>
		
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">v. <%= localizationManager.getMessage("nic58") %> ................. <%= localizationManager.getMessage("nic55") %> ................. <%= localizationManager.getMessage("nic59") %> </div> <div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %></div> </div>
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">&nbsp;&nbsp; Withdrawal during the period from &nbsp;&nbsp;&nbsp;${bean.withdrawPeriodFrom } to  ${bean.withdrawPeriodTo }   </div> <div class="col-5">: Rs. ${bean.withdrawAmt } /- </div> </div>
		
		
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">vi. <%= localizationManager.getMessage("nic60") %> (iv - v) </div> <div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div>
		<div class="row m-1"> <div class="col-1"></div> <div class="col-6">&nbsp;&nbsp; NET BALANCE AS CREDIT (iv - v) </div> <div class="col-5">: Rs. ${bean.netCreditBalance } /- </div> </div>
		
		<div class="row m-1"> <div class="col-7">6. <%= localizationManager.getMessage("nic61") %></div><div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div>
		<div class="row m-1"> <div class="col-7">&nbsp;&nbsp; AMOUNT OF ADVANCE OUTSTANDING</div><div class="col-5">: Rs. ${bean.amtAdvanceOutstanding } /-</div> </div>
		
		<div class="row m-1"> <div class="col-7">7. <%= localizationManager.getMessage("nic62") %></div><div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div> 
		<div class="row m-1"> <div class="col-7">&nbsp;&nbsp; AMOUNT OF ADVANCE REQUIRED</div><div class="col-5">: Rs. ${bean.amtAdvanceRequired } /- </div> </div><br>
		
		
		<div class="row m-1"> <div class="col-7">8. a) <%= localizationManager.getMessage("nic63") %> </div><div class="col-5">:  .......................................</div> </div>
		<div class="row m-1"> <div class="col-7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PURPOSE FOR WHICH THE ADVANCE IS  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REQUIRED </div><div class="col-5">:  ${bean.advancePurpose }</div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp; b) <%= localizationManager.getMessage("nic64") %> </div><div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rules under which the request is covered </div><div class="col-5">:  ${bean.requestRulesCovered }</div> </div>
		
		<div class="row m-1"> <div class="col-12"> &nbsp;&nbsp;&nbsp;&nbsp;c) <%= localizationManager.getMessage("nic65") %>:- </div> </div>
		<div class="row m-1"> <div class="col-12"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If advance is bought for House Building, etc., following information may be &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;given:- </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic66") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Location & measurement of the plot </div> <div class="col-5">: ${bean.plotLocAndMeasure } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic67") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Whether the plot is freehold or on leave </div> <div class="col-5">: ${bean.plotFreehold } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iii)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic68") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plot for construction </div> <div class="col-5">: ${bean.planForConstruction } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iv)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic69") %>  </div> <div class="col-5">: .......................................</div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If the flat or plot being purchased is &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from  a H.S. Society, the name of the &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;society, the location and the &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;measurements, etc. </div> <div class="col-5">:  ${bean.platPurchaseSociety }</div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;v)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic70") %> </div> <div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div>
		<div class="row m-1"> <div class="col-7">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cost of construction </div> <div class="col-5">: ${bean.costOfConstruction } </div> </div>
		
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vi)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic71") %>  </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vi)&nbsp;&nbsp;&nbsp;If the purchase of the flat is from DDA &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or any Housing Board, etc., the location, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dimension, etc. may be given </div> <div class="col-5">: ${bean.platPurchaseBoard } </div> </div>
		
		<div class="row m-1"> <div class="col-12"> &nbsp;&nbsp;&nbsp;&nbsp;d) <%= localizationManager.getMessage("nic72") %>:- </div> </div>
		<div class="row m-1"> <div class="col-12"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If advance is required for education of children, following details may be given:- </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i)&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic73") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAME OF THE SON / DAUGHTER </div> <div class="col-5">: ${bean.nameOfSChildren } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </div> <div class="col-5"> </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii)&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic74") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Class and Institution / College where &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;studying </div> <div class="col-5">: ${bean.childrenInstitution } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iii)&nbsp;&nbsp;&nbsp;<%= localizationManager.getMessage("nic75") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whether a day-scholar or hostler </div> <div class="col-5">: ${bean.reimbursement }  </div> </div>
	 
		<div class="row m-1"> <div class="col-12"> &nbsp;&nbsp;&nbsp;&nbsp;e) <%= localizationManager.getMessage("nic76") %></div> </div>
		<div class="row m-1"> <div class="col-12"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If advance is required for treatment of aiming family members, following details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;may be given :-</div> </div>
		
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i)&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic77") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAME OF THE PATIENT AND &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RELATIONSHIP </div> <div class="col-5">: ${bean.patientNameAndRelation } </div> </div>
		 
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii)&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic78") %>. </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAME OF THE HOSPITAL / DISPENSARY &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ DOCTOR WHERE the patient is &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;undergoing treatment. </div> <div class="col-5">: ${bean.hospitalName } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iii)&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic79") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whether Outdoor / Indoor patient </div> <div class="col-5">: ${bean.indoorOrOutdoor } </div> </div>
		
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iv)&nbsp;&nbsp;&nbsp; <%= localizationManager.getMessage("nic80") %> </div> <div class="col-5">: ....................................... </div> </div>
		<div class="row m-1"> <div class="col-7"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whether re-imburesement available or &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;not </div> <div class="col-5">: ${bean.reimbursement }  </div> </div>
		<br>
		<div class="row m-1"> <div class="col-12"><%= localizationManager.getMessage("nic81") %>.</div> </div>
		<div class="row m-1"> <div class="col-12">NOTE: In case of advance under 8(c) to 8(e), no certificate or documentary evidence would be required.</div> </div>
	 	<br>
	 	<div class="row m-1"> <div class="col-7">9. <%= localizationManager.getMessage("nic82") %> : </div><div class="col-5">: .......................................  <%= localizationManager.getMessage("nic53") %> </div> </div>
	 	<div class="row m-1"> <div class="col-7">&nbsp;&nbsp;&nbsp;Amount of the consolidate advance (item No. &nbsp;&nbsp;&nbsp;6 & 7) and number of   : </div><div class="col-5">: Rs. ${bean.advanceAmt } </div> </div>
	    <div class="row m-1"> <div class="col-7">&nbsp;&nbsp;&nbsp;  the monthly installments in which  &nbsp;&nbsp;&nbsp;&nbsp;consolidated advance is proposed to be paid : </div><div class="col-5">: in ${bean.installments } installments. </div> </div>
	 	
	 	<div class="row m-1"> <div class="col-7">10. <%= localizationManager.getMessage("nic83") %> : </div><div class="col-5">: ....................................... </div> </div>
	 	<div class="row m-1"> <div class="col-7">&nbsp;&nbsp;&nbsp; Full particulars of the pecuniary circumstances &nbsp;&nbsp;&nbsp;&nbsp;of the subscriber, justifying the application for &nbsp;&nbsp;&nbsp;&nbsp;the advance : </div><div class="col-5">: ${bean.pecuniaryCircumstances }  </div> </div>

		<br><br>
		<div class="row m-1"> <div class="col-12"><%= localizationManager.getMessage("nic84") %>.</div> </div>
		<div class="row m-1"> <div class="col-12">I certify that particulars given above are correct and complete to the best of my knowledge and belief and that nothing has been concealed by me.</div> </div>

		<br><br><br><br>
		
		<div class="row">
			<div class="col-4"><%= localizationManager.getMessage("date") %> / Dated:  <%=formattedDate %></div>
			<div class="col-3"></div>
			<div class="col-5" align="right">
				<%= localizationManager.getMessage("nic85") %><br>
				Signature of the applicant<br>
				
				
			</div>
		</div>
		<br><br>
		<div align="right">
			<table>
				<tr><td><%= localizationManager.getMessage("nic47") %></td><td> / Name:--------------------------------------</td><td> </td></tr>
				<tr><td><%= localizationManager.getMessage("nic86") %></td><td> / Emp. Code No.:----------------------------</td><td> </td></tr>
				<tr><td><%= localizationManager.getMessage("nic87") %></td><td> / Branch:-------------------------------------</td><td> </td></tr>
				<tr><td><%= localizationManager.getMessage("nic88") %></td><td> / Intercom/Telephone. No:-----------------</td><td> </td></tr>
				<tr><td><%= localizationManager.getMessage("nic89") %></td><td> / E-Mail:-------------------------------------</td><td> </td></tr>
				</table>
		</div>
		 
</div>
</body>
</html>