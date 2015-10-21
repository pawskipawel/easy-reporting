<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--
REQUIRED taglib for tiles		
-->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html>
<html>
<head>

<%-- REQUIRED taglib for spring links	
Example: href='<spring:url value="/" /> 
absolute url	 --%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>


<!--  TAG FOR JQUERY VALIDATION PLUGIN -->
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- taglib for Security expressions   -->
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<script type="text/javascript">
	$(function() {
		$('[data-toggle="popover"]').popover()
	})
</script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"></tiles:getAsString></title>

</head>
<body>

	<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
		prefix="tilesx"%>

	<!-- this tag will read value of the current attribute from general - depend on the jsp page value will be the name of the page -->
	<tilesx:useAttribute name="current" />

	<div class="container-full">

		<div class="container-full">

			<!-- Static navbar -->
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<security:authorize access="isAnonymous()">
							<a class="navbar-brand" href='<spring:url value="/index.html"/>'>Easy
								reporting</a>
						</security:authorize>
						<security:authorize access="hasRole('ADMIN')">
							<a class="navbar-brand"
								href='<spring:url value="/companies.html"/>'>Easy reporting</a>
						</security:authorize>
						<security:authorize access="hasRole('USER')">
							<a class="navbar-brand"
								href='<spring:url value="/account.html"/>'>Easy reporting</a>
						</security:authorize>

						<!-- Left site of menu -->
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">

							<security:authorize access="hasRole('ADMIN')">
								<li class="${current == 'companies' ? 'active' : ''}"><a
									href="<spring:url value="/companies.html"/>">Companies</a></li>
							</security:authorize>

							<security:authorize access="!isAuthenticated()">
								<li class="${current == 'user-register' ? 'active' : ''}"><a
									href="<spring:url value="/register.html"/>">Register</a></li>
							</security:authorize>

							<security:authorize access="hasRole('USER')">
								<li class="${current == 'user-details' ? 'active' : ''}"><a
									href="<spring:url value="/account.html"/>">Account</a></li>
							</security:authorize>

							<security:authorize access="isAuthenticated()">
								<li class="${current == 'store' ? 'active' : ''}"><a
									href="<spring:url value="/store.html"/>">Store</a></li>
							</security:authorize>


							<security:authorize access="!isAuthenticated()">
								<li class="${current == 'login' ? 'active' : ''}"><a
									href="<spring:url value="/login.html"/>">Login</a></li>
							</security:authorize>

						</ul>

						<!-- Right site of menu -->
						<ul class="nav navbar-pills navbar-right">
							<security:authorize access="isAuthenticated()">
								<li><p>
									<p>
										<a href="<spring:url value="/logout"></spring:url>"
											type="button" class="btn btn-danger"> <span
											class="glyphicon glyphicon-off"></span>
										</a></li>
							</security:authorize>
						</ul>

						<ul class="nav navbar-pills navbar-right">
							<security:authorize access="isAuthenticated()">
								<li><p>
									<p>

										<a role="button" class="btn btn-default" data-container="body"
											data-toggle="popover" data-placement="bottom"
											data-content="phone number">Help <span
											class="glyphicon glyphicon-earphone"></span></a></li>
							</security:authorize>
						</ul>




						<ul class="nav navbar-pills navbar-right">
							<security:authorize access="hasRole('USER')">
								<li><p>
									<p>
										<a href="<spring:url value="/user-settings.html"></spring:url>"
											type="button" class="btn btn-default">${pageContext.request.userPrincipal.name}
											<span class="glyphicon glyphicon-cog"></span>
										</a></li>
							</security:authorize>
						</ul>
						
						<ul class="nav navbar-pills navbar-right">
							<security:authorize access="hasRole('ADMIN')">
								<li><p>
									<p>
										<a href="<spring:url value="/admin-settings.html"></spring:url>"
											type="button" class="btn btn-default">${pageContext.request.userPrincipal.name}
											<span class="glyphicon glyphicon-cog"></span>
										</a></li>
							</security:authorize>
						</ul>
						

					</div>
					<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid -->
			</nav>

			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<tiles:insertAttribute name="body" />
				</div>
			</div>

			<br> <br>
			<center>
				<tiles:insertAttribute name="footer" />
			</center>

		</div>
	</div>
</body>
</html>