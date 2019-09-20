<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<jsp:include page="../views/fragments/csslinks.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet"
	href="<spring:url value="/resources/stylesheets/homepage.css"/>" />
<title>Update</title>
</head>

<body>

	<div class="row">
		<jsp:include page="../views/fragments/navbar.jsp"></jsp:include></div>

	<div class="row"
		style="margin-top: 75px; background: -webkit-gradient(linear, left top, left bottom, from(rgba(22, 22, 22, 0.3)), color-stop(75%, rgba(22, 22, 22, 0.7)), to(#161616)), url(/MCRH/resources/images/mumchild.jpeg);">

		<br>
		<div class="col-md-2"></div>
		<div class="container-fluid col-md-8"
			style="padding: 20px; background-color: #fde3fd; margin-top: 20px; margin-bottom: 10px">
			<div class="log w3-green text-center" style="border-radius: 10px;">
				<h2>
					<b class="w3-text-middle ">Update Record</b>
				</h2>
			</div>
			<spring:url value="/register" var="reg"></spring:url>
			<form:form action="${reg}" method="POST" class="form-group"
				modelAttribute="record" id="updateform">
				<div class="row d-flex justify-content-center align-items-center">
				<div class="col-md-3"></div>
					<div class="col-md-6">
						<form:label path="">1:SERIAL NUMBER</form:label>
						<form:input required="true" path="child.serialno" id="serial"
							cssClass="w3-input" minlength="5" value="${updatee.child.serialno}" placeholder="Serialnumber" />
					</div>
					<div class="col-md-3"></div>
				</div>
				<br>
				<br>


				<div class="row">
					<div class="form-group col-md-8">
						<form:label path="">2:NAMES</form:label>
						<br>
						<div class="row">
							<div class="col-md-4">
								<form:input required="true" path="child.firstname"
									id="firstname" cssClass="w3-input" minlength="3"
									value="${updatee.child.firstname}"  placeholder="Firstname" pattern="[a-zA-Z]{3,}"
									oninvalid="setCustomValidity('Names must contain alphabets of not less than 3 characters   ')" />
							</div>
							<div class="col-md-4">
								<form:input required="true" path="child.middlename"
									id="middlename" cssClass="w3-input" minlength="3"
									value="${updatee.child.middlename}"  placeholder="Middlename" pattern="[a-zA-Z]{3,}"
									oninvalid="setCustomValidity('Names must contain alphabets of not less than 3 characters   ')" />
							</div>
							<div class="col-md-4">
								<form:input required="true" path="child.lastname" id="lastname"
									cssClass="w3-input" minlength="3" value="${updatee.child.lastname}"  placeholder="Lastname"
									pattern="[a-zA-Z]{3,}"
									oninvalid="setCustomValidity('Names must contain alphabets of not less than 3 characters   ')" />

							</div>

						</div>

					</div>
					<div class="form-group col-md-4">
						<div>

							<form:label path="">3:D.O.B</form:label>
							<form:input required="true" path="child.dob" id="datetimepicker"
								type="text" cssClass="w3-input" minlength="3"
								placeholder="MM/dd/yyyy" />
 <small class="form-text text-muted">${updatee.child.sdob}(MM/dd/yyyy)</small>


						</div>
					</div>
				</div>
				<br>
				<br>

				<div class="row">
					<div class="form group col-md-3">
						<form:label path="">4:SEX</form:label>
						<br>
						<form:radiobuttons required="true" path="child.sex" name="sex"
							items="${sex}" class="w3-radio" style="margin-left:8px" />
							<small class="form-text text-muted">${updatee.child.sex}</small>
					</div>
					<div class="form group col-md-3">
						<form:label path="">5:TYPE OF BIRTH</form:label>
						<br>
						<form:radiobuttons path="child.birthtype" name="type"
							items="${birthtype}"  class="w3-radio" style="margin-left:8px" />
							<small class="form-text text-muted">${updatee.child.birthtype}</small>
					</div>
					<div class="form group col-md-3">
						<form:label path="">Other, Specify</form:label>
						<br>
						<form:input path="child.birthtypeother" name="type"
							class="w3-input" value="${updatee.child.birthtypeother}"  placeholder="specify type" />
					</div>
					<div class="form group col-md-3">
						<form:label path="">6:NATURE OF BIRTH</form:label>
						<br>
						<form:radiobuttons required="true" path="child.birthnature"
							name="nature" items="${birthnature}" class="w3-radio"
							style="margin-left:8px"  />
							<small class="form-text text-muted" >${updatee.child.birthnature}</small>
					</div>
				</div>
				<br>
				<br>

				<div class="row">
					<div class="form-group col-md-12">
						<form:label path="">8:PLACE OF BIRTH</form:label>
						<br>
						<div class="row">
							<div class="col-md-8">
								<form:input required="true" path="child.pob" id="pob"
									cssClass="w3-input" minlength="2"
									value="${updatee.child.pob}"  placeholder="Place Of Birth Sub-location or Estate andTown or Health Instituition" />
							</div>
							<div class="col-md-4">
								<form:input required="true" path="child.pobsub" id="pobsub"
									cssClass="w3-input" minlength="3" value="${updatee.child.pobsub}"  placeholder="Sub-County" />
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>


				<div class="row">
					<div class="form-group col-md-8">
						<form:label path="">9:NAME OF MOTHER</form:label>
						<br>
						<div class="row">
							<div class="col-md-4">
								<form:input required="true" path="mother.firstname"
									id="firstname" cssClass="w3-input" minlength="3"
									value="${updatee.mother.firstname}"  placeholder="Firstname" pattern="[a-zA-Z]{3,}"
									oninvalid="setCustomValidity('Names must contain alphabets of not less than 3 characters   ')" />
							</div>
							<div class="col-md-4">
								<form:input required="true" path="mother.middlename"
									id="middlename" cssClass="w3-input" minlength="3"
									value="${updatee.mother.middlename}"  placeholder="Middlename" pattern="[a-zA-Z]{3,}"
									oninvalid="setCustomValidity('Names must contain alphabets of not less than 3 characters   ')" />
							</div>
							<div class="col-md-4">
								<form:input path="mother.lastname" id="lastname"
									cssClass="w3-input" minlength="3" value="${updatee.mother.lastname}"  placeholder="Lastname"
									pattern="[a-zA-Z]{3,}"
									oninvalid="setCustomValidity('Names must contain alphabets of not less than 3 characters   ')" />

							</div>

						</div>

					</div>
					<div class="form-group col-md-4">
						<div>

							<form:label path="">ID NO</form:label>
							<form:input required="true" path="mother.idno" id="idno"
								type="text" cssClass="w3-input" minlength="3"
								value="${updatee.mother.idno}"  placeholder="Id Number:if lacking use 0" />

						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="d-flex justify-content-center align-items-center">
					<div class="toast" role="alert" aria-live="assertive"
						aria-atomic="true">

						<div class="toast-body"></div>
					</div>

				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<div class="row">
							<div class="col-md-4">
								<form:label path="">10:NOTIFICATION OFFERED TO</form:label>
								<form:input required="true" path="notificationtoname"
									id="notname" cssClass="w3-input" minlength="3"
									value="${updatee.notificationtoname}"  placeholder="Persons Name" />
							</div>
							<div class="col-md-4">
								<form:label path="">Id Number</form:label>
								<form:input required="true" path="notificationtoid" id="notid"
									cssClass="w3-input" minlength="3" value="${updatee.notificationtoid}"  placeholder="Id NUmber" />

							</div>
							<div class="col-md-4">

								<form:label path="">Date</form:label>
								<form:input required="true" path="notificationdate"
									id="datetimepicker2" type="text" cssClass="w3-input"
									minlength="3"  placeholder="MM/dd/yyyy"/>
                       <small class="form-text text-muted">${updatee.snotificationdate}(MM/dd/yyyy)</small>


							</div>

						</div>

					</div>

				</div>

				<form:button type="submit"
					class="w3-btn w3-ripple w3-green w3-hover-border-khaki w3-right"
					id="sumitupdate">Submit</form:button>


			</form:form>
		</div>

		<div class="col-md-2"></div>

		<jsp:include page="../views/fragments/jslinks.jsp"></jsp:include>

	</div>
	<script src="<spring:url value="/resources/cssjs/main.js"/>"></script>

	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

</body>
</html>