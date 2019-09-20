<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="#page-top">MCRH</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<spring:url value="/"/>" style="text-align: center">Home</a>

				</li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<spring:url value="/add"/>" style="text-align: center">Add
						Record</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<spring:url value="/allrecords"/>" style="text-align: center">All
						Records</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<spring:url value="/reports"/>" style="text-align: center">Statistics</a>
				</li>
			
			</ul>
			<ul class="navbar-nav ml-auto">
			
				<sec:authorize access="authenticated" var="authenticated" />
			<c:choose>
				<c:when test="${authenticated}">
		
					<li class="nav-item">Welcome <sec:authentication property="name" /><a class="nav-item nav-link" id="logout"
					href="#" style="text-align: center"><strong><span
							class="glyphicon glyphicon-log-out"></span>Log out </strong></a>
					<form id="logout-form" action="<spring:url value="/logout"/>"
						method="post">
						<sec:csrfInput />
					</form></li>

				</c:when>
				<c:otherwise>
					<li><a href="<spring:url value="/login"/>">Login</a></li>
				</c:otherwise>
			</c:choose>

			</ul>
		</div>
	</div>
</nav>