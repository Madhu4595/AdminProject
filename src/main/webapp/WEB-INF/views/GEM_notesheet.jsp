<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="css/home-style.css" />
  <script src="https://kit.fontawesome.com/2c3c26015e.js" crossorigin="anonymous"></script>
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
  
  <script type="text/javascript">
function myFunction() {
	  //window.print();
	}
</script>
</head>
<body onload="myFunction();" >
<!-- <img src="images/itiap.jpg" class="img-fluid" alt="Responsive image" width="100%"> -->

<section class="container mt-5 pt-2">
 <h6 style="text-align: center;font-weight:50px;"><b>Government of India   </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>Ministry of Electronics & Information Technology  </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>National Informatics Centre (APSC)   </b></h6>
      <h6 style="text-align: center;font-weight:50px;"><b>VIJAYAWADA 520010.  </b></h6> 
<div class="row">
  <div class="col-md-12">
    <div> 
<b>Sub</b>:-Towards Expenditure payment for procurement of <b>${transactions.subject}</b> for ${transactions.note_para1},${transactions.note_para2} to 
<b>${vendor.name}</b>,<b>${vendor.address}</b>.
<br><br>
</div>

<div>
<b>${vendor.name}</b> has supplied <b>${transactions.subject}</b> for  ${transactions.note_para1},${transactions.note_para2} and has submitted the bill of an  expenditure  of
 <b> Rs. ${transactions.amount_claimed} </b> all-inclusive vide Bill / Invoice No.<b>${transactions.bill_no}</b> dated <b>${transactions.bill_date}</b> <b>(No.GEM-${transactions.gem_no})</b> in duplicate according to the approved
  rate inclusive  all taxes, specification and quality vide our Contract No.GEMC-
 <b>${transactions.contract_no}</b> dated <b>${transactions.contract_date}.</b> (copy enclosed).
</div>
<br>
<div>
Financial Concurrence of <b>Rs.${transactions.amount_claimed}/-</b>+ Tax as applicable towards expenditure procurement of <b>${transactions.subject}</b>
for ${transactions.note_para1} ${transactions.note_para2} vide IFD Dy.No: <b>${transactions.ifd_no}</b>  approval Dated :<b>${transactions.ifd_date}</b> under the powers delegated to DG, 
NIC vide Deity letter No. M-11019-1-99-MS (O&M) dated 26/11/2015 read with the power conferred by Rule 13(2) and Full power conferred to Head of NIC State Centre under sub-rule (3) of Rule 13 Sl. No.1.2 of  Delegation   of Powers Rules, conveyed vide NIC, Office order No. 1(06)/2014-Pers dated 19/01/2016 to the incurring of an expenditure  from
 M/s GEM Portal, Vijayawada has been obtained from the competent authority for the financial year 2020-2021.
</div>
<br>
<div>
The items purchased have been duly entered into the stock register under the Signature of Office-In-Charge, store.
</div>
<br>
<div> 
I view of the above, H.O. May kindly sanction <b>Rs.${transactions.amount_claimed}/-</b>+ Tax as applicable to <b>${vendor.name}</b>,<b>${vendor.address} </b>
towards expenditure payment for procurement of <b>${transactions.subject}</b> for ${transactions.note_para1},${transactions.note_para2} under Budget Head:-  .
</div><br>
    <div> 
    Put up for necessary action.
    </div>     
        <p align="right"><b>(BSN Murty)</b></p>
        <p align="right"><b>Deputy Director</b></p>
       
        <p align="left"><b>H.O. APSC</b></p>  
  </div>
</div>
</div>
</section>
</form>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="assests/owlCarousel/owl.carousel.min.js" type="text/javascript"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script> 
</body>
<!--<h3 align="center"><input type="button"  
           value="Print Receipt" onclick="return myFunction();" class="btn btn-primary"/></h3>-->
</html>