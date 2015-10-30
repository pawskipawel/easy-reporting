<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../layout/taglib.jsp"%>


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
											<c:out value="${companyDB.companyName}" />

										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="nip" class="col-sm-12 control-label">Nip:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<c:out value="${companyDB.nip}" />

										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="phone" class="col-sm-12 control-label">Phone:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<c:out value="${companyDB.phone}" />

										</div>
									</div></td>
							</tr>
							<tr>
								<td><label for="email" class="col-sm-12 control-label">Email:</label></td>
								<td><div class="form-group">
										<div class="col-sm-12">
											<c:out value="${companyDB.email}" />

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

<c:out value="${companyDB.companyName}" />

From DB:
<c:forEach items="${companyAddressessDB}" var="addressDB">



	<c:out value="${addressDB.street}"></c:out>
	<c:out value="${addressDB.id}"></c:out>

	<table class="table table-bordered ">
		<thead>
			<tr>
				<th>Fields</th>
				<th>Edit</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><label for="${addressDB.street}"
					class="col-sm-12 control-label">Street:</label></td>
				<td><div class="form-group">
						<div class="col-sm-12">
							<c:out value="${addressDB.street}"></c:out>
						</div>
					</div></td>
			</tr>
			<tr>
				<td><label for="${addressDB.streetNumber}"
					class="col-sm-12 control-label">Street Number:</label></td>
				<td><div class="form-group">
						<div class="col-sm-12">
							<c:out value="${addressDB.streetNumber}"></c:out>
						</div>
					</div></td>
			</tr>
			<tr>
				<td><label for="${addressDB.zipcode}"
					class="col-sm-12 control-label">Zipcode:</label></td>
				<td><div class="form-group">
						<div class="col-sm-12">
							<c:out value="${addressDB.zipcode}"></c:out>
						</div>
					</div></td>
			</tr>
			<tr>
				<td><label for="${addressDB.city}"
					class="col-sm-12 control-label">City:</label></td>
				<td><div class="form-group">
						<div class="col-sm-12">
						<c:out value="${addressDB.city}"></c:out>
						</div>
					</div></td>
			</tr>
		</tbody>
	</table>

</c:forEach>


