<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.app.entity.AppUser"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>abcd | Home</title>
<link rel="icon" type="image/png" href="assests/img/fav.png">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="./bootstrap/bootstrap452.min.css">

<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<%
	//String role = session.getAttribute("role").toString();
%>
<style>
.dropdown-menu {
	padding: 0;
	margin: 0;
	border: 0 solid transition !important;
	border: 0 solid rgba(0, 0, 0, .15);
	border-radius: 0;
	-webkit-box-shadow: none !important;
	box-shadow: none !important
}

.mainmenu a, .navbar-default .navbar-nav>li>a, .mainmenu ul li a,
	.navbar-expand-lg .navbar-nav .nav-link {
	color: #fff;
	font-size: 15px;
	text-transform: capitalize;
	padding: 6px 10px;
	font-family: 'Roboto', sans-serif;
	display: block !important;
}

.mainmenu .active a, .mainmenu .active a:focus, .mainmenu .active a:hover,
	.mainmenu li a:hover, .mainmenu li a:focus, .navbar-default .navbar-nav>.show>a,
	.navbar-default .navbar-nav>.show>a:focus, .navbar-default .navbar-nav>.show>a:hover
	{
	color: #fff;
	background: utline: 0;
}
/*==========Sub Menu=v==========*/
.mainmenu .collapse ul>li:hover>a {
	background: pink;
}

.mainmenu .collapse ul ul>li:hover>a, .navbar-default .navbar-nav .show .dropdown-menu>li>a:focus,
	.navbar-default .navbar-nav .show .dropdown-menu>li>a:hover {
	background: pink;
}

.mainmenu .collapse ul ul ul>li:hover>a {
	background: #4CAF50;
}

.mainmenu .collapse ul ul, .mainmenu .collapse ul ul.dropdown-menu {
	background: #1565C0;
}

.mainmenu .collapse ul ul ul, .mainmenu .collapse ul ul ul.dropdown-menu
	{
	background: #1E88E5
}

.mainmenu .collapse ul ul ul ul, .mainmenu .collapse ul ul ul ul.dropdown-menu
	{
	background: #64B5F6
}

/******************************Drop-down menu work on hover**********************************/
.mainmenu {
	background: none;
	border: 0 solid;
	margin: 0;
	padding: 0;
	min-height: 20px;
	width: 100%;
}

@media only screen and (min-width: 767px) {
	.mainmenu .collapse ul li:hover>ul {
		display: block
	}
	.mainmenu .collapse ul ul {
		position: absolute;
		top: 100%;
		left: 0;
		min-width: 250px;
		display: none
	}
	/*******/
	.mainmenu .collapse ul ul li {
		position: relative
	}
	.mainmenu .collapse ul ul li:hover>ul {
		display: block
	}
	.mainmenu .collapse ul ul ul {
		position: absolute;
		top: 0;
		left: 100%;
		min-width: 250px;
		display: none
	}
	/*******/
	.mainmenu .collapse ul ul ul li {
		position: relative
	}
	.mainmenu .collapse ul ul ul li:hover ul {
		display: block
	}
	.mainmenu .collapse ul ul ul ul {
		position: absolute;
		top: 0;
		left: -100%;
		min-width: 250px;
		display: none;
		z-index: 1
	}
}

@media only screen and (max-width: 767px) {
	.navbar-nav .show .dropdown-menu .dropdown-menu>li>a {
		padding: 16px 15px 16px 35px
	}
	.navbar-nav .show .dropdown-menu .dropdown-menu .dropdown-menu>li>a {
		padding: 16px 15px 16px 45px
	}
}

#menu_area {
	border-radius: 20px;
}
</style>

<script>
	(function($) {
		$('.dropdown-menu a.dropdown-toggle').on(
				'click',
				function(e) {
					if (!$(this).next().hasClass('show')) {
						$(this).parents('.dropdown-menu').first().find('.show')
								.removeClass("show");
					}
					var $subMenu = $(this).next(".dropdown-menu");
					$subMenu.toggleClass('show');

					$(this).parents('li.nav-item.dropdown.show').on(
							'hidden.bs.dropdown',
							function(e) {
								$('.dropdown-submenu .show')
										.removeClass("show");
							});

					return false;
				});
	})(jQuery)
</script>
<link rel="stylesheet" href="./customCSS/navbarCss.css" />

</head>

<%
String role2= (String)session.getAttribute("role");
System.out.println("role=>"+role2);
AppUser user2= (AppUser)session.getAttribute("user");
System.out.println("user=>"+user2.toString());
%>
<div id="menu_area" class="menu-area">
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-light navbar-expand-lg mainmenu ">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li><a href="/">Home</a></li>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Allowance/Bills </a>
							
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<% if(role2.equalsIgnoreCase("ROLE_USER")){ %>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> CEA </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="./empceaform">New</a></li>
										<li><a href="./empCEAEditForm">Modify</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Medical </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="billsupload_edit">Modify</a></li>
										<li><a href="billsupload2">New</a></li>
									</ul>
								</li>
								<li><a href="home">Vendor</a></li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> LTC- EL Enacachment </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="ltcEnacachment">New</a></li>
										<li><a href="ltcEnacachmentedit">Modify</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> LTC- Advance Enacachment </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="ltcAdvanceEnacachment">New</a></li>
										<li><a href="ltcAdvanceEnacachmentedit">Modify</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> GEM-Vehicle </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gemVehicleForm">New</a></li>
										<li><a href="gemVehicleEditForm">Modify</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> GEM-OutSourcing </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gemOutsourceForm">New</a></li>
										<li><a href="gemOutsourceEditForm">Modify</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> GPF-WithDraw </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gpfWithDrawForm">New</a></li>
										<li><a href="gpfWithDrawEditForm">Modify</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> BriefCase </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="briefcaseForm">New</a></li>
										<li><a href="briefcaseEditForm">Modify</a></li>
									</ul>
								</li>
								<% } %>
								<% if(role2.equalsIgnoreCase("ROLE_EMP")){ %>
								<li><a href="cghsForm">CGHS MRCF Reibursement</a></li>
								<li><a href="empCEAApplyForm">CEA Apply Form</a></li>
								<li><a href="empGpfApplyForm">GPF Withdraw Apply Form</a></li>
								<li><a href="empGpf2ApplyForm">GPF Advance Apply Form</a></li>
								<% } %>
							</ul>
						</li>
					 <% if(role2.equalsIgnoreCase("ROLE_USER")){ %>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Approval Details</a>

							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="./empCEANSForm">CEA</a></li>
								<li><a href="medicalNoteSheetForm">Medical</a></li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">LTC </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="ltcElEnacachmentNSForm">LTC- EL Enacachment</a></li>
										<li><a href="ltcAdvanceNSForm">LTC- Advance</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">GEM </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gemVehicleNoteSheet">Vehicle NoteSheet</a></li>
										<li><a href="gemOutsourcingNoteSheet">Outsourcing NoteSheet</a></li>
									</ul>
								</li>

								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">GPF-WithDraw </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gpfWithDrawNSForm">WithDraw</a></li>
									</ul>
								</li>
								<li><a href="briefcaseNSForm">Briefcase</a></li>

							</ul>
						</li>
					 <% } %>
					 <% if(role2.equalsIgnoreCase("ROLE_USER")){ %>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sanction Order Generation</a>
							
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="./empCEASOForm">CEA</a></li>
								<li><a href="medicalSOForm">Medical</a></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">LTC </a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="ltcELEnacachmentSOForm">LTC- EL Enacachment</a></li>
										<li><a href="ltcAdvanceSOForm">LTC- Advance</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">GEM</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gemVehicleSOForm">Vehicle </a></li>
										<li><a href="gemOutsourcingSOForm">Outsourcing </a></li>
									</ul>
								</li>
								<li class="dropdown"><a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">GPF</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gpfWithdrawSOForm">Withdraw</a></li>
									</ul>
								</li>
								<li><a href="briefcaseSOForm">Briefcase</a></li>
							</ul>
						</li>
						<% } %>
						<% if(role2.equalsIgnoreCase("ROLE_USER")){ %>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Notesheet Prints</a>
							
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="ceaNSPrints">CEA</a></li>
								<li><a href="gpfWithdrawNSPrint">GPF-withdraw</a></li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">GEM</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gemVehicleNSPrints">Vehicle</a></li>
										<li><a href="gemOutsourcingNSPrints">Outsourcing</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">LTC</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="ltcEncashmentsNSPrints">Encashment</a></li>
										<li><a href="ltcAdvanceNSPrints">Advance</a></li>
									</ul>
								</li>
								<li><a href="medicalNSPrintsForm">Medical</a></li>
								<li><a href="briefcaseNSPrintForm">BRIEF CASE</a></li>
							</ul>
						</li>
						<%} %>
						<% if(role2.equalsIgnoreCase("ROLE_USER")){ %>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sanction Order Prints</a>
							
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="gpfWithdrawSOPrint">GPF-withdraw</a></li>
								<li><a href="ceaSOPrintForm">CEA</a></li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">GEM</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="gemVehicleSOPrints">Vehicle</a></li>
										<li><a href="gemOutsourcingSOPrints">Outsourcing</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">LTC</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
										<li><a href="ltcEncashmentsSOPrints">Encashment</a></li>
										<li><a href="ltcAdvanceSOPrints">Advance</a></li>
									</ul>
								</li>
								<li><a href="medicalSOPrintsForms">Medical</a></li>
								<li><a href="briefcaseSOPrintForm">BRIEF CASE</a></li>
							</ul>
						</li>
						<% } %>
						<% if(role2.equalsIgnoreCase("ROLE_EMP")){ %>
						<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown">Prints</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="cghsmrcfPrintform">CGHS MRCF</a></li>
								<li><a href="empCeaApplyPrintForm?code=<%=user2.getId()%>">CEA APPLY PRINTS</a></li>
								<li><a href="empGpfApplyPrintForm?code=<%=user2.getId()%>">GPF Withdraw APPLY PRINTS</a></li>
								<li><a href="empGpfAdvanceApplyPrintForm?code=<%=user2.getId()%>">GPF Advance APPLY PRINTS</a></li>
							</ul>
						</li>
						<% } %>
						<% if(role2.equalsIgnoreCase("ROLE_USER")){ %>
						<li style="width: 100px;"><a href="employee_insert">Employee</a></li>
						<li style="width: 100px;"><a href="vendor_insert">Vendor</a></li>
						<% } %>
						
						<li><span style="color: blue;font-size: 20px;"><%= user2.getLastName() %></span></li>
						<li><a href="logout" style="font-weight: bolder; color: red;">Logout</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>

</html>