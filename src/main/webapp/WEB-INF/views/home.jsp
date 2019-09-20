<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Home</title>
<jsp:include page="../views/fragments/csslinks.jsp"></jsp:include>
<link rel="stylesheet"
	href="<spring:url value="/resources/stylesheets/homepage.css"/>" />
</head>

<body id="page-top">

	<!-- Navigation -->
	<jsp:include page="../views/fragments/navbar.jsp"></jsp:include>
	<!-- Header -->
	<header class="masthead">
		<div class="container d-flex h-100 align-items-center">
			<div class="mx-auto text-center">
				<h1 class="mx-auto my-0 text-uppercase">MCRH RECORDS</h1>
				<h2 class="text-white-50 mx-auto mt-2 mb-5">Ensuring all
					children records are well invented</h2>
					<spring:url value="/search" var="search"></spring:url>
					<form:form action="${search}" method="POST" class="form-group"
				modelAttribute="record" id="search">
				
				<div class="form-row">
				<div class="col-md-8">
				<form:input path="child.dob" id="datetimepicker" type="text"
								cssClass="form-control" minlength="3" placeholder="Search child by DOB" date-format="dd-mm-yyyy"/>
								<h6 style="color:red;" class="form-text text-muted" > The format is : MM/dd/yyyy</h6>
				</div>
				<div class="col-md-4">
				<form:button type="submit"
					class="w3-btn w3-ripple w3-green w3-hover-border-khaki w3-left">Search</form:button>
				</div>
					
				</div>
				
					
					</form:form>
		
			</div>
		</div>
	</header>
	<jsp:include page="../views/fragments/jslinks.jsp"></jsp:include>
	<!-- Custom scripts -->
	<script src="<spring:url value="/resources/scripts/homepage.js"/>"></script>
<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>

</html>
