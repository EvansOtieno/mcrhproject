<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Reports</title>
<jsp:include page="../views/fragments/csslinks.jsp"></jsp:include>
</head>

<body>
	<div class="row">
		<jsp:include page="../views/fragments/navbar.jsp"></jsp:include></div>
	<div class="wrapper" style="margin-top: 75px">
		<!-- Sidebar -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<h3><strong>MCRH RECORDS</strong></h3>
			</div>

			<ul class="list-unstyled components">
				<li><strong>General Reports</strong></li>
				<li><a href="<spring:url value="/reports"/>">By Year</a></li>
				<li><a href="<spring:url value="/monthlyreport"/>">By Month</a></li>
				<li><a href="<spring:url value="/searchbtwn"/>">Search Between 2 Dates</a></li>
				
			</ul>

		</nav>
		<!-- Page Content -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item">
						<button type="button" id="sidebarCollapse" class="btn btn-info">
							<i class="fas fa-align-left"></i> <span>Toggle Sidebar</span>
						</button>
					</li>
				</ul>


				<ul class="navbar-nav" style="margin-left:80px">
					<li class="nav-item"><spring:url value="/searchbetween" var="se"></spring:url>
						<form:form action="${se}" method="POST"
							class="form-inline" modelAttribute="record" id="">
							<div class="input-group mb-3 ml-auto">
								<form:input path="notificationdate" id="datetimepicker1"
									type="search" cssClass="form-control" required="true"
									placeholder="Start Date" />

								<form:input path="child.dob" id="datetimepicker" type="search"
									cssClass="form-control" required="true" placeholder="End date" />

								<div class="input-group-append">
									<form:button type="submit" class="btn btn-info">
										<span class="fas fa-search"></span>
									</form:button>
								</div>
							</div>
						</form:form></li>

				</ul>
			</nav>
<div class="table-responsive">

			<table class="table table-striped table-bordered" id="table">
				<thead class="w3-red">
					<tr>
						<th scope="col">#</th>
						<th scope="col">SERIALNO</th>
						<th scope="col">DOB</th>
						<th scope="col">FIRSTNAME</th>
						<th scope="col">MIDDLENAME</th>
						<th scope="col">LSTNAME</th>
						<th scope="col">MOTHERS NAME</th>
						<th scope="col">MOTHER IDNO</th>
						<th scope="col">NOTIFIED TO:NAMES</th>
						<th scope="col">NOTIFIED TO:IDNO</th>
						<th scope="col">DATE ISSUED</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${results}" var="rec" varStatus="loopCounter">

						<tr>
							<td >${loopCounter.count}</td>
							<td><a href="<spring:url value="/update/${rec.child.serialno}"/>" style="color:blue">${rec.child.serialno}</a></td>
							<td>${rec.child.sdob}</td>
							<td>${rec.child.firstname}</td>
							<td>${rec.child.middlename}</td>
							<td>${rec.child.lastname}</td>
							<td>${rec.mother.firstname} ${rec.mother.lastname}</td>
							<td>${rec.mother.idno}</td>
							<td>${rec.notificationtoname}</td>
							<td>${rec.notificationtoid}</td>
							<td>${rec.snotificationdate}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		</div>
	</div>
	<jsp:include page="../views/fragments/jslinks.jsp"></jsp:include>

	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>

</html>