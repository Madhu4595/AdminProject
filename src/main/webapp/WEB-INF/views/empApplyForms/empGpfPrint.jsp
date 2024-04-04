<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>EMP GPF PRINT</title>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<script>
	function getPrint(){
		window.print();
	}
</script>
</head>
<body onload="return getPrint();">
	<div class="container-fluid border p-1">
		<div align="center">
			GOVERNMENT OF INDIA<br>
			MINISTRY OF COMMUNICATIONS & INFORMATION TECHNOLOGY <br>
			DEPARTMENT OF INFORMATION TECHNOLOGY <br>
			NATIONAL INFORMATICS CENTRE
		</div>
		
		<div align="right" style="font-weight: bolder; ">EMPLOYEE CODE NO <input type="text" value="${bean.empCode }" style="width: 10%;" disabled="disabled"/></div>
		<div align="center" style="text-decoration: underline; ">APPLICATION FOR WITHDRAWAL FROM GPF FUND</div>
		<br>

		<div class="row m-1">
			<div class="col-5">1. Name of the subscriber</div>
			<div class="col-5"> : <input type="text" value="${emp.name }" disabled="disabled" /> </div>
			<div class="col-2"></div>
		</div>
		
		<div class="row m-1">
			<div class="col-5">2. Designation</div>
			<div class="col-5"> : <input type="text" value="${emp.designation }" disabled="disabled" /> </div>
			<div class="col-2"></div>
		</div>
		
		<div class="row m-1">
			<div class="col-5">3. Account No.</div>
			<div class="col-5"> : GPF<input type="text" value="${bean.gpfAccNo }" disabled="disabled" /> </div>
			<div class="col-2"></div>
		</div>
		
		<div class="row m-1">
			<div class="col-5">4. Basic Pay</div>
			<div class="col-5"> : <input type="text" value="${emp.basic_pay }" disabled="disabled" /> </div>
			<div class="col-2"></div>
		</div>
		
		<div class="row m-1">
			<div class="col-5">5. Date of joining in service and </div>
			<div class="col-5"> : <input type="text" value="${emp.doj }" disabled="disabled" /> </div>
			<div class="col-2"></div>
		</div>
		<div class="row m-1">
			<div class="col-5">&nbsp;&nbsp;&nbsp;date of superannuation </div>
			<div class="col-5"> : <input type="text" value="${emp.doa }" disabled="disabled" /> </div>
			<div class="col-2"></div>
		</div>
		
		<div class="row m-1">
			<div class="col-12">6. Balance at the credit of the subscriber on the date of application as given below:- </div>
		</div>
		
		<div class="row m-1">
			<div class="col-1"><b>(i)</b> </div>
			<div class="col-7"> <b>Closing balance as per statement for the year ${bean.closingBalanceyear}</b></div>
			<div class="col-4">: Rs. <u>${bean.closingBalanceRs }</u></div>
		</div>
		
		<div class="row m-1">
			<div class="col-1">(ii) </div>
			<div class="col-7">Credit from <input type="text" value="${bean.creditFrom }" disabled="disabled" style="width: 15%;" /> to  <input type="text" value="${bean.creditTo }" style="width: 15%;" disabled="disabled" /> on account of monthly subscription form </div>
			<div class="col-4">: Rs. <u>${bean.creditRs } </u></div>
		</div>
		
		<div class="row m-1">
			<div class="col-1"> (iii)  </div>
			<div class="col-7"> Refund made to the fund after closing balance vide(i) above</div>
			<div class="col-4">: Rs. <u>${bean.refundRs }</u></div>
		</div>
		
		<div class="row m-1">
			<div class="col-1"> (iv)  </div>
			<div class="col-7"> Withdrawal during the period from <input type="text" value="${bean.withdrawPeriodFrom }" disabled="disabled" style="width: 15%;" /> to <input type="text" value="${bean.withdrawPeriodTo }" disabled="disabled" style="width: 15%;" /></div>
			<div class="col-4">: Rs. <u>${bean.withdrawPeriodRs }</u></div>
		</div>
		
		<div class="row m-1">
			<div class="col-1"><b>(v)</b> </div>
			<div class="col-7"> <b>Net balance at credit on date <input type="text" value="${bean.netCreditDate }" disabled="disabled" style="width: 15%;" /> of application</b></div>
			<div class="col-4">: Rs. <u>${bean.netCreditRs }</u></div>
		</div>
		
		
		
		<div class="row m-1">
			<div class="col-12" style="font-weight: bolder;">7. AMOUNT OF WITHDRAWAL REQUIRED</div>
		</div>
		
		<div class="row m-1">
			<div class="col-1">8. (a) </div>
			<div class="col-6"> Purpose for the withdraw is required</div>
			<div class="col-4">: <input type="text" value="${bean.withdrawPurpose }" disabled="disabled" />  </div>
		</div>
		
		<div class="row m-1">
			<div class="col-1">&nbsp;&nbsp;&nbsp;(b) </div>
			<div class="col-6"> Rule under which the request is covered</div>
			<div class="col-4">: <input type="text" value="${bean.withdrawRule }" disabled="disabled" />  </div>
		</div>
		
		<div class="row m-1">
			<div class="col-7">9. Whether any withdrawal was taken for the same purpose earlier. </div>
			<div class="col-4">:  <input type="text" value="Rs. ${bean.earlierWithdrawRs }" disabled="disabled" />  </div>
		</div>
		<div class="row m-1">
			<div class="col-7">&nbsp;&nbsp;&nbsp;If so, indicate the amount and the year. </div>
			<div class="col-4">:<input type="text" value="${bean.earlierWithdrawYear }" disabled="disabled" />  </div>
		</div>
		
		<div class="row m-1">
			<div class="col-7">10. Name of the account officer maintaining the Provident Fund Account </div>
			<div class="col-4">:<input type="text" value="${bean.pfAccount }" disabled="disabled" />  </div>
		</div>
		
		
		<br><br><br><br>
		
		<div class="row m-1">
			<div class="col-4"></div>
			<div class="col-4"></div>
			<div class="col-4" align="center">
				Signature of the applicant<br>
				<br>
			</div>
		</div>
		
		<div class="row m-1">
			<div class="col-4"> </div>
			<div class="col-4"> </div>
			<div class="col-4">
			<table>
				<tr><td>Name:</td><td><input type="text" value="${emp.name }" disabled="disabled"/></td></tr>
				</table>
			</div>
		</div>
		
		<div class="row m-1">
			<div class="col-4"> </div>
			<div class="col-4"> </div>
			<div class="col-4">
			<table>
				<tr><td>Designation:</td><td><input type="text" value="${emp.designation }" disabled="disabled"/></td></tr>
				</table>
			</div>
		</div>
		
		<div class="row m-1">
			<div class="col-4"> </div>
			<div class="col-4"> </div>
			<div class="col-4">
			<table>
				<tr><td>Section/Branch:</td><td><input type="text" value="${emp.place }" disabled="disabled"/></td></tr>
				</table>
			</div>
		</div>
		
		<div class="row m-1">
			<div class="col-4"> </div>
			<div class="col-4"> </div>
			<div class="col-4">
			<table>
			<tr><td>Intercom/Telephone. No:</td><td><input type="text" value="${emp.phno }" disabled="disabled"/></td></tr>
				</table>
			</div>
		</div>
		
		<div class="row m-1">
			<div class="col-4">Dated:  <%=formattedDate %></div>
			<div class="col-4"> </div>
			<div class="col-4">
			<table>
				<tr><td>E-Mail:</td><td><input type="text" value="${emp.email }" disabled="disabled"/></td></tr>
				</table>
			</div>
		</div>
		
		
		<br><br><br><br>
		
		<div align="center"> <span style="text-decoration: underline;font-weight: bold;">Declaration Form</span></div><br>
			
			I hereby declare that the GPF withdrawal is required for the purpose &#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95; <br> 
			&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;&#95;.
			<br><br>
			The above said purpose is genuine and correct to the best of my knowledge.
			<br><br><br><br>
			<div align="right">
			<table>
				<tr><td> </td><td>Signature _____________________________</td><td> </td></tr>
				<tr><td> </td><td>Name _________________________________</td><td> </td></tr>
				<tr><td> </td><td>Designation ___________________________</td><td> </td></tr>
				</table>
		</div>
		
		<br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
		
		</div>
	
</body>
</html>