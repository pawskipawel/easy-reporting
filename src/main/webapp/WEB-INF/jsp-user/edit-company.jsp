<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../layout/taglib.jsp"%>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<c:if test="${not empty msg}">
	<div class="alert alert-success">${msg}</div>
</c:if>

<form:form modelAttribute="company" method="post">

	<div class="row">
		<div class="col-md-6">
			<!-- left Company -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<strong>Company</strong>
					</h3>
				</div>
				<div class="panel-body">

					<table class="table table-bordered ">
						<thead>
							<tr>
								<th>Fields</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label for="companyName"
									class="col-sm-12 control-label">Company name:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
										<div data-ng-app="" data-ng-init="test='${user.name}'" >
											<form:input path="companyName" cssClass="form-control" ng-model="test"  />
</div>
										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="nip" class="col-sm-12 control-label">Nip:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="nip" cssClass="form-control" />

										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="phone" class="col-sm-12 control-label">Phone:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="phone" cssClass="form-control" />

										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="email" class="col-sm-12 control-label">Email:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="email" cssClass="form-control" />

										</div>
									</div></td>
							</tr>



						</tbody>
					</table>



				</div>
			</div>
		</div>
		<div class="col-md-6">
			<!-- Right address -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<strong>Address</strong>
					</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered ">
						<thead>
							<tr>
								<th>Fields</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td><label for="addresses[0].street"
									class="col-sm-12 control-label">Street:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="addresses[0].street"
												cssClass="form-control" />

										</div>
									</div></td>
							</tr>

							<tr>
								<td><label for="addresses[0].streetNumber"
									class="col-sm-12 control-label">Street Number:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="addresses[0].streetNumber"
												cssClass="form-control" />

										</div>
									</div></td>
							</tr>

							<tr>
								<td><label for="addresses[0].zipcode"
									class="col-sm-12 control-label">Zipcode:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="addresses[0].zipcode"
												cssClass="form-control" />
											<form:errors path="addresses[0].zipcode" />
										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="addresses[0].city"
									class="col-sm-12 control-label">City:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<form:input path="addresses[0].city" cssClass="form-control" />
											<form:errors path="addresses[0].city" />
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<center>

				<a href="<spring:url value="/user-settings.html"></spring:url>"
					type="button" class="btn btn-danger">Cancel <span
					class="glyphicon glyphicon-remove"></span>
				</a>
				<button type="submit" class="btn btn-primary">
					Submit <span class="glyphicon glyphicon-ok"></span>
				</button>
		</div>
		</center>
		<div class="col-md-4"></div>
	</div>




</form:form>

<c:out value="${formCompany.companyName}" />

<c:out value="${formCompany.addresses[0].street}" />





