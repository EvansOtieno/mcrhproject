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
<jsp:include page="../views/fragments/csslinks.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="<spring:url value="/resources/stylesheets/homepage.css"/>" />
</head>
<body>
	<jsp:include page="../views/fragments/navbar.jsp"></jsp:include>
	<div class="masthead container-fluid" style="margin-top: 75px">
		<div class="row login">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 ">
				<br> <br> <br> <br>
				<div class="log w3-green text-center" style="border-radius: 10px">
					<h3>
						<b class="w3-text-middle ">Login</b>
					</h3>
				</div>
				<br>
				<spring:url value="/login" var="in"></spring:url>
				<form:form action="${in}" method="POST" class="form-group"
					modelAttribute="users" id="form">

					<div>
						<form:label path="" style="color:red">Username</form:label>
						<form:input path="username" id="username" cssClass="w3-input"
							required="true" minlength="3" placeholder="username" />
					</div>
					<br>
					<div>
						<form:label path="" style="color:red">Password</form:label>
						<form:input path="password" type="password" id="password"
							cssClass="w3-input" required="true" placeholder="*******"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="must contain atleast one number and one uppercase letter, and at least 8 characters" />
					</div>
					<br>
					<c:if test="${param.error !=null}">
						<p>Invalid Username or password</p>
					</c:if>
					<c:if test="${param.logout !=null}">
						<p>Logout Successful</p>
					</c:if>
					<br>
					<form:button name="submit" type="submit" value="submit"
						id="loginsubmit" class="btn btn-primary">LogIn</form:button>

				</form:form>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
	<jsp:include page="../views/fragments/jslinks.jsp"></jsp:include>
</body>

</html>