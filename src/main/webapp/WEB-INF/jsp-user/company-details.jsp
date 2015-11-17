<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../layout/taglib.jsp"%>
<body></body>

<c:if test="${not empty msg}">
	<div class="alert alert-success">${msg}</div>
</c:if>
<div data-ng-app="myApp">
	<div data-ng-controller="showData">


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
									<th class="col-md-4" >Fields</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><label class="col-sm-12 control-label">Company
											name:</label></td>
									<td><c:out value="${companyDB.companyName}"></c:out></td>
								</tr>
								<tr>
									<td><label class="col-sm-12 control-label">Nip:</label></td>
									<td><c:out value="${companyDB.nip}"></c:out></td>
								</tr>
								<tr>
									<td><label class="col-sm-12 control-label">Phone:</label></td>
									<td><c:out value="${companyDB.phone}"></c:out></td>
								</tr>
								<tr>
									<td><label class="col-sm-12 control-label">Email:</label></td>
									<td><c:out value="${companyDB.email}"></c:out></td>
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


						<c:set var="count" value="-1"/> 	
						<c:forEach items="${companyAddressessDB}" var="address" varStatus="status">
						<c:set var="count" value="count+1"/> 
							<table class="table table-bordered ">
								<thead>
									<tr>
										<th class="col-md-4" >Fields</th>
										<th>Edit</th>
									</tr>
								</thead>
								<tbody>
									<tr>

										<td><label class="col-sm-12 control-label">Street:</label></td>
										<td><c:out value="${address.street}" />
										<c:out value="${address.isDeleted}"/>
										<c:out value="${address.id}"/>
										</td>
									</tr>
									<tr>
										<td><label class="col-sm-12 control-label">Street
												Number:</label></td>
										<td><c:out value="${address.streetNumber}" /></td>
									</tr>
									<tr>
										<td><label class="col-sm-12 control-label">Zipcode:</label></td>
										<td><c:out value="${address.zipcode}" /></td>
									</tr>
									<tr>
										<td><label class="col-sm-12 control-label">City:</label></td>
										<td><c:out value="${address.city}" /></td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
						
						<c:if test="${count == -1}">
						<a
						href="<spring:url value="/user-settings/edit-company.html"></spring:url>"
						type="button" class="btn btn-info">Add address <span
						class="glyphicon glyphicon-pencil"></span>
					</a>
						</c:if>

					</div>
				</div>
			</div>


		</div>

		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<center>

					<a
						href="<spring:url value="/user-settings/edit-company.html"></spring:url>"
						type="button" class="btn btn-warning">Edit <span
						class="glyphicon glyphicon-pencil"></span>
					</a> <a href="<spring:url value="/account.html"></spring:url>"
						type="button" class="btn btn-info">Account <span
						class="glyphicon glyphicon-home"></span>
					</a>
			</div>
			</center>
			<div class="col-md-4"></div>
		</div>





	</div>
</div>


