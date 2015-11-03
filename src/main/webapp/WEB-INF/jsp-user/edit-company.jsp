<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<%@ include file="../layout/taglib.jsp"%>
<body></body>

<c:if test="${not empty msg}">
	<div class="alert alert-success">${msg}</div>
</c:if>
<div data-ng-app="myApp">
	<div data-ng-controller="showData">
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

													<form:input path="companyName" ng-model="companyName"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="nip" class="col-sm-12 control-label">Nip:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">

													<form:input path="nip" ng-model="nip"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="phone" class="col-sm-12 control-label">Phone:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="phone" ng-model="phone"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="email" class="col-sm-12 control-label">Email:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="email" ng-model="email"
														cssClass="form-control" />

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
													<form:input path="addresses[0].city"
														cssClass="form-control" />
													<form:errors path="addresses[0].city" />
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>

							<!-- The template for adding new address -->
							
							<table class="table table-bordered hide" id="addressTemlate">
								<thead>
									<tr>
										<th>Fields</th>
										<th>Edit</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td><label for="addresses[100].street"
											class="col-sm-12 control-label">Street:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[100].street"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>

									<tr>
										<td><label for="addresses[100].streetNumber"
											class="col-sm-12 control-label">Street Number:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[100].streetNumber"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>

									<tr>
										<td><label for="addresses[100].zipcode"
											class="col-sm-12 control-label">Zipcode:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[100].zipcode"
														cssClass="form-control" />
													<form:errors path="addresses[100].zipcode" />
												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="addresses[100].city"
											class="col-sm-12 control-label">City:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[100].city"
														cssClass="form-control" />
													<form:errors path="addresses[100].city" />
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
							<div id="AddMoreAddressId">
							<button type="button" id="AddAddress" class="btn btn-info">
								Add address <span class="glyphicon glyphicon-plus"></span>
							</button>
						</div>

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
	</div>

	<c:out value="${formCompany.companyName}" />

	<c:out value="${formCompany.addresses[0].street}" />


	<!-- loop          -->


	<%-- 	<form:form modelAttribute="company" method="post">

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

												<form:input path="companyName" cssClass="form-control" />

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
						<c:set var="count" value="0" scope="page" />
						<c:forEach items="companyAddressessDB" var="address">
							<c:set var="count" value="${count+1}" scope="page" />
							<table class="table table-bordered ">
								<thead>
									<tr>
										<th>Fields</th>
										<th>Edit</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td><label for="addresses[${count}].street"
											class="col-sm-12 control-label">Street:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[${count}].street"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>

									<tr>
										<td><label for="addresses[${count}].streetNumber"
											class="col-sm-12 control-label">Street Number:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[${count}].streetNumber"
														cssClass="form-control" />

												</div>
											</div></td>
									</tr>

									<tr>
										<td><label for="addresses[${count}].zipcode"
											class="col-sm-12 control-label">Zipcode:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[${count}].zipcode"
														cssClass="form-control" />
													<form:errors path="addresses[${count}].zipcode" />
												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="addresses[0].city"
											class="col-sm-12 control-label">City:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[${count}].city"
														cssClass="form-control" />
													<form:errors path="addresses[${count}].city" />
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>




						</c:forEach>

						<!-- Add address -->
							<c:forEach begin="1" end="${addStop}" varStatus="loop">
							<c:set var="count" value="${5}" scope="page" />
								Index: ${loop.index}<br />
						<div id="AddAddressesList">
							<div id="addAddressDIV">
								<table class="table table-bordered ">
									<thead>
										<tr>
											<th>Fields</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td><label for="addresses[${count}].street"
												class="col-sm-12 control-label">Street:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">
														<form:input path="addresses[${count}].street"
															cssClass="form-control" />

													</div>
												</div></td>
										</tr>

										<tr>
											<td><label for="addresses[${count}].streetNumber"
												class="col-sm-12 control-label">Street Number:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">
														<form:input path="addresses[${count}].streetNumber"
															cssClass="form-control" />

													</div>
												</div></td>
										</tr>

										<tr>
											<td><label for="addresses[${count}].zipcode"
												class="col-sm-12 control-label">Zipcode:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">
														<form:input path="addresses[${count}].zipcode"
															cssClass="form-control" />
														<form:errors path="addresses[${count}].zipcode" />
													</div>
												</div></td>
										</tr>
										<tr>
											<td><label for="addresses[0].city"
												class="col-sm-12 control-label">City:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">
														<form:input path="addresses[${count}].city"
															cssClass="form-control" />
														<form:errors path="addresses[${count}].city" />
													</div>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>





						</c:forEach>
						<div id="AddMoreAddressId">
							<button type="button" id="AddAddress" class="btn btn-info">
								Add address <span class="glyphicon glyphicon-plus"></span>
							</button>
						</div>

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




	</form:form> --%>

	<c:set var="count" value="${1}" scope="page" />

</div>

<script>
	var app = angular.module('myApp', []);
	app.controller('showData', function($scope) {
		$scope.companyName = "${companyDB.companyName}";
		$scope.nip = "${companyDB.nip}";
		$scope.phone = "${companyDB.phone}";
		$scope.email = "${companyDB.email}";
	});

	$(document).ready(function() {
		var MaxInputs = 2;
		var InputsWrapper = $("#AddAddressesList");
		var AddAddressButton = $("#AddAddress");
		var x = InputsWrapper.length
		
		$(AddAddressButton).click(function (e){
			if(x <= MaxInputs) {
		var addressIndex = 1;
		addressIndex++;
		
		var $template = $('#addressTemlate'),
         $clone    = $template
                         .clone()
                         .removeClass('hide')
                         .removeAttr('id')
                         .attr('data-address-index', addressIndex)
                         .insertBefore($template);
		$clone
        .find('[path="addresses[100].street"]').attr('path', 'addresses[' + addressIndex + '].street').end()
        .find('[path="addresses[100].streetNumber"]').attr('path', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[path="addresses[100].zipcode"]').attr('path', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[path="addresses[100].city"]').attr('path', 'addresses[' + addressIndex + '].city').end()
        .find('[for="addresses[100].streetNumber"]').attr('for', 'addresses[' + addressIndex + '].street').end()
        .find('[for="addresses[100].street"]').attr('path', 'addresses[' + addressIndex + '].street').end()
        .find('[for="addresses[100].streetNumber"]').attr('path', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[for="addresses[100].zipcode"]').attr('path', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[for="addresses[100].city"]').attr('path', 'addresses[' + addressIndex + '].city').end()
		})
		

	});
</script>





