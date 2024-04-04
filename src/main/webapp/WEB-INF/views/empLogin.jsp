<%@page import="com.app.entity.AppUser"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 
AppUser userr= (AppUser)session.getAttribute("user");
System.out.println("user=>"+userr.toString());
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>abcd | Home</title>
<link rel="icon" type="image/png" href="assests/img/fav.png">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
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

</head>
<div id="menu_area" class="menu-area">
	<div class="container">
		<div class="row"
			style="background-color: #e6ffff; border-radius: 20px;">
			<nav class="navbar navbar-light navbar-expand-lg mainmenu">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						
						<li><a href="./" style="color: blue;">Home</a></li>
						
						<li class="dropdown">
						
						<a class="dropdown-toggle" href="#"
							id="navbarDropdown" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"
							style="color: blue;">Allowance/Bills</a>

							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="./cghsForm">CGHS MRCF Reibursement</a></li>
								<li><a href="./empCEAApplyForm">CEA Apply Form</a></li>
								<li><a href="./empGpfApplyForm">GPF Withdraw Apply Form</a></li>
								<li><a href="./empGpf2ApplyForm">GPF Advance Apply Form</a></li>
							</ul>
							
							</li>
							
							<li class="dropdown">
							<a class="dropdown-toggle" href="#" id="navbarDropdown" style="color: blue;">Prints</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a href="./cghsmrcfPrintform">CGHS MRCF</a></li>
								<li><a href="./empCeaApplyPrintForm?code=<%=userr.getId()%>">CEA APPLY PRINTS</a></li>
								<li><a href="./empGpfApplyPrintForm?code=<%=userr.getId()%>">GPF Withdraw APPLY PRINTS</a></li>
								<li><a href="./empGpfAdvanceApplyPrintForm?code=<%=userr.getId()%>">GPF Advance APPLY PRINTS</a></li>
							</ul>
						</li>
						
						<li><span style="color: blue;font-size: large;margin-left: 400px;">Welcome <%= userr.getFirstName() %>, <%= userr.getLastName() %></span></li>
						<li><a href="logout" style=" color: red;">Logout</a></li>
					</ul>


				</div>


			</nav>
		</div>
	</div>
</div>
<br>
</html>