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
<meta charset="ISO-8859-1">
<title>Records</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<jsp:include page="../views/fragments/csslinks.jsp"></jsp:include>
</head>
</head>
<body>
	<jsp:include page="../views/fragments/navbar.jsp"></jsp:include>
	<div class="row" style="margin-top: 75px;">
		<div class="table-responsive" style="padding:20px">

			<table class="table table-striped table-bordered" id="table" style="padding:20px">
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
<jsp:include page="../views/fragments/jslinks.jsp"></jsp:include>

		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>
</html>