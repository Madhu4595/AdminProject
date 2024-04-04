<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#scrollbar {
	width: 1100px;
	height: 440px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/banner2.jsp"%>
	<%@ include file="/WEB-INF/views/empLogin.jsp"%>

	<div style="color: red;" align="center">
		<h3>
			<b> ${msg} </b>
		</h3>
	</div>
	<div align="center">
		<h6 class="h6"
			style="font-weight: bold; text-decoration: underline; color: blue;">AVAILABE
			EMP CEA APPLIES</h6>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-12"
				style="background-color: #e6ffff; border-radius: 20px; border: 2px solid black;">
				<div id="scrollbar">
					<div id="content" align="center">
						<table class="table">
							<thead>
								<tr style="background-color: black; color: white;">
									<th>CHILD ONE NAME</th>
									<th>CHILD ONE ACADAMIC YEAR</th>
									<th>CHILD ONE SCHOOL NAME</th>

									<th style="color: blue;">CHILD TWO NAME</th>
									<th style="color: blue;">CHILD TWO ACADAMIC YEAR</th>
									<th style="color: blue;">CHILD TWO SCHOOL NAME</th>
									<th style="color: blue;" colspan="2">ACTIONS</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="bean" items="${list }">
									<tr>
										<td>${bean.childNameOne }</td>
										<td>${bean.childAcadamicYearOne }</td>
										<td>${bean.childSchoolNameOne }</td>

										<td>${bean.childNameTwo }</td>
										<td>${bean.childAcadamicYearTwo }</td>
										<td>${bean.childSchoolNameTwo }</td>
										<td><a href="./empCeaPrint?id=${bean.id }">Download</a> <%-- 			<td><a href="./empCeaPrintt?id=${bean.id }">Download</a> --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 	<div align="center"><h3><b> SPOUSE NAME : ${spouseName } </b></h3> </div> --%>

</body>
</html>