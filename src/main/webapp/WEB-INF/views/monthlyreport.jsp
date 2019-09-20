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
				<h3>MCRH RECORDS</h3>
			</div>

			<ul class="list-unstyled components">
				<li><strong>General Reports</strong></li>
				<li><a href="<spring:url value="/reports"/>">By Year</a></li>
				<li><a href="<spring:url value="/monthlyreport"/>">By Month</a></li>
				<li><a href="<spring:url value="/searchbtwn"/>">Search
						Between 2 Dates</a></li>

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


				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><spring:url value="/anymonth"
							var="search"></spring:url> <form:form action="${searchreport}"
							method="POST" class="form-inline" modelAttribute="record"
							id="searchformb">
							<div class="input-group mb-3 ml-auto">
								<form:input path="notificationdate" id="datetimepicker1"
									type="search" cssClass="form-control" required="true"
									placeholder="Search any Year and Month" />

								<div class="input-group-append">
									<form:button type="submit" class="btn btn-info"
										id="searchlinkb">
										<span class="fas fa-search"></span>
									</form:button>
								</div>
							</div>
						</form:form></li>
				</ul>
			</nav>
			<div class="col-md-10">
				<canvas id="bar"></canvas>
			</div>
			<br>
			<div class="row">
				<div class="col-md-4">
					<canvas id="genderpie"></canvas>
				</div>
				<div class="col-md-4">
					<canvas id="naturedoughnut"></canvas>
				</div>
				<div class="col-md-4">
					<canvas id="typedoughnut"></canvas>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../views/fragments/jslinks.jsp"></jsp:include>
	<script type="text/javascript">
	var token=$("meta[name='_csrf']").attr("content");
	var header=$("meta[name='_csrf_header']").attr("content");
	$.ajax({
		
		type : 'POST',
		url : "/MCRH/thismonth",
		data: {
			_csrf:token
			},
		headers :{
			Header_Name_One : header
		},
		success : function(data){
			var naturedoughnut = document.getElementById("naturedoughnut")
			.getContext('2d');
	var genderpie = document.getElementById("genderpie").getContext(
			'2d');
	var typedoughnut = document.getElementById("typedoughnut")
			.getContext('2d');
	var ctxL = document.getElementById("bar").getContext('2d');
	var myLineChart = new Chart(ctxL, {
		type : 'bar',
		data : {
			labels : [ "This Month" ],
			datasets : [  {
				label : "Total",
				data : data[0],
				backgroundColor : "#ADD8E6",
				borderColor : "#FF0000",
				borderWidth : 1
			} ]
		},
		options : {
			title : {
				display : true,
				text : "Data Enty For for This Month"
			},
			responsive : true
		}
	});
	var myPieChart = new Chart(genderpie, {
		type : 'pie',
		data : {
			labels : [ "Male", "Female" ],
			datasets : [ {
				label : "Males and Females",
				backgroundColor : [ "#8e5ea2", "#3e95cd" ],
				data : data[1]
			} ]
		},
		options : {
			title : {
				display : true,
				text : "Total Males and Females for This Month"
			},
			responsive : true
		}
	});
	var naturedoughnut = new Chart(naturedoughnut, {
		type : 'doughnut',
		data : {
			labels : [ "Alive", "Dead" ],
			datasets : [ {
				label : "Born Alive and Born Deads",
				backgroundColor : [ "#3cba9f", "#c45850" ],
				data : data[2]
			} ]
		},
		options : {
			title : {
				display : true,
				text : "Total Dead and Alive for This Month"
			},
			responsive : true
		}
	});
	var typedoughnut = new Chart(typedoughnut, {
		type : 'doughnut',
		data : {
			labels : [ "Single", "Twin", "Other" ],
			datasets : [ {
				label : "Born Alive and Born Deads",
				backgroundColor : [ "#e8c3b9", "#c8e5ea2", "#c45850" ],
				data : data[3]
			} ]
		},
		options : {
			title : {
				display : true,
				text : "Types of birth for This Month"
			},
			responsive : true
		}
	});
		}
		
	});
	</script>
	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
</body>

</html>