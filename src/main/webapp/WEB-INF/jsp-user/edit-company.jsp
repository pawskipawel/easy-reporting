<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<!-- jQuery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>


<!--  TAG FOR JQUERY VALIDATION PLUGIN -->
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
										<th class="col-md-4" >Fields</th>
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

							<!-- loop for addresses  -->
							<c:set var="count" value="-1" scope="page" />
							<c:forEach items="${companyAddressessDB}" var="address">
								<c:set var="count" value="${count+1}" scope="page" />
							<!--  input field for entity ID-->
							<form:input type="hidden" path="addresses[${count}].id" value="${address.id}" />

								<table class="table table-bordered ">
									<thead>
										<tr>
											<th class="col-md-4">Fields</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody>
										<tr>

											<td><label for="addresses[${count}].street"
												class="col-sm-12 control-label">Street:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">													
														<form:input type="text" path="addresses[${count}].street" 
														 value="${address.street}"
															 cssClass="form-control" />		
															 
															 <c:out value="${address.id}"/>
															 									
													</div>
												</div> 
												</td>
										</tr>

										<tr>
											<td><label for="addresses[${count}].streetNumber"
												class="col-sm-12 control-label">Street Number:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">
														<form:input path="addresses[${count}].streetNumber"
														value="${address.streetNumber}"
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
															value="${address.zipcode}" cssClass="form-control" />
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
															value="${address.city}" cssClass="form-control" />
														<form:errors path="addresses[${count}].city" />
														</div>
													</div>
												</td>
										</tr>
										<tr>										
										<td colspan="2">
										<!-- TESTY                -->
										<c:if test="${address.isDefaultInvoiceAddress eq 'true'}">
										<input type="radio" name="defaultInvoiceAddress" value="${address.id}" checked="checked"> Set as default address on invoice<br><br>
										</c:if>
										<c:if test="${address.isDefaultInvoiceAddress eq 'false'}">
										<input type="radio" name="defaultInvoiceAddress" value="${address.id}"> Set as default address on invoice<br><br>
										</c:if>
										<c:out value="${address.isDefaultInvoiceAddress}" />
										
										
										
										<input type="hidden" name="addressesToDelete[]" value="${address.id}" disabled/>
											<div id="removeButtonDiv">
												<button type="button"
													class="btn btn-warning removeAddressFromDB">
													Remove address <span class="glyphicon glyphicon-minus"></span>
												</button>
											</div>
											
											
										</td>
									</tr>
									</tbody>
								</table>

							</c:forEach>
							
							<!--  Default one address form, visible when there is no address in DB-->
							<c:if test="${count == -1}">
							<table class="table table-bordered" >
								<thead>
									<tr>
										<th class="col-md-4">Fields</th>
										<th>Edit</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td><label for="addresses[0].street"
											class="col-sm-12 control-label">Street:</label></td>
										<td><div class="form-group" id="addStreet">
												<div class="col-sm-12">
													<form:input id="street" path="addresses[0].street"
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
														cssClass="form-control"  />

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
														cssClass="form-control"  />
													<form:errors path="addresses[0].city" />
												</div>
											</div></td>
									</tr>
									<tr>
									<td colspan="2">
									</td>
									<td class="hide" >
									
									<input type="hidden" name="addressesToDelete" disabled/>
									</td>
									
									</tr>
									
									
								</tbody>
							</table>
							</c:if>

							<!-- The template for adding new address -->

							<table class="table table-bordered hide" id="addressTemlate">
								<thead>
									<tr>
										<th class="col-md-4">Fields</th>
										<th>Edit</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td><label for="addresses[0].street"
											class="col-sm-12 control-label">Street:</label></td>
										<td><div class="form-group" id="addStreet">
												<div class="col-sm-12">
													<form:input id="street" path="addresses[0].street"
														cssClass="form-control" disabled="true" />

												</div>
											</div></td>
									</tr>

									<tr>
										<td><label for="addresses[0].streetNumber"
											class="col-sm-12 control-label">Street Number:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[0].streetNumber"
														cssClass="form-control" disabled="true" />

												</div>
											</div></td>
									</tr>

									<tr>
										<td><label for="addresses[0].zipcode"
											class="col-sm-12 control-label">Zipcode:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="addresses[0].zipcode"
														cssClass="form-control" disabled="true" />
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
														cssClass="form-control" disabled="true" />
													<form:errors path="addresses[0].city" />
												</div>
											</div></td>
									</tr>
									
									<tr>

										<td colspan="2">
											<div id="removeButtonDiv">
												<button type="button" id="removeAddedAddress"
													class="btn btn-warning removebutton">
													Remove address <span class="glyphicon glyphicon-minus"></span>
												</button>
											</div>
										</td>

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

						<a href="<spring:url value="/user-settings/company-details.html"></spring:url>"
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
			
			
			
			<!-- <input type="hidden" name="testVar[]" value="2"/>
			<input type="hidden" name="testVar[]" value=""/>
			<input type="hidden" name="testVar[]" value="3"/>  -->


		</form:form>

	</div>
</div>

<script>
	//Angular
	var app = angular.module('myApp', []);
	app.controller('showData', function($scope) {
		$scope.companyName = "${companyDB.companyName}";
		$scope.nip = "${companyDB.nip}";
		$scope.phone = "${companyDB.phone}";
		$scope.email = "${companyDB.email}";
	
	});

	
	// jQuery 
	$(document).ready(function() {
		var MaxInputs = 2; // counting starts from 0 including 0
		var Outputcounter = ${count}; // (must start form -1) already displayed addresses from DB ->REQUIRE INTEGRATION   
		var AddAddressButton = $("#AddAddress");
	
		var addressIndex = ${count+1}; // variable index for list index (must start form -1): deafault addreess[index] ->REQUIRE INTEGRATION   
		
		// condition for addAddress button located in general main table. 
		if(Outputcounter >= MaxInputs) {
	            $("#AddMoreAddressId").hide();
	        }
		
		
		
	
		
		$(AddAddressButton).click(function (e){
			if(Outputcounter <= MaxInputs) {
		addressIndex++;
		Outputcounter++;
		var $template = $('#addressTemlate'),
         $clone    = $template
                         .clone()
                         .removeClass('hide')
                         .removeAttr('id')                         
                         .insertBefore($template);
		// find attribute "name" insrtead "path" - reason spring convertion -other way does not working
		$clone
        .find('[name="addresses[0].street"]').attr('name', 'addresses[' + addressIndex + '].street').end()
        .find('[name="addresses[0].streetNumber"]').attr('name', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[name="addresses[0].zipcode"]').attr('name', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[name="addresses[0].city"]').attr('name', 'addresses[' + addressIndex + '].city').end()
        
    	$clone.find("input").prop('disabled', false)
        
        .find('[for="addresses[0].street"]').attr('for', 'addresses[' + addressIndex + '].street').end()
        .find('[for="addresses[0].streetNumber"]').attr('for', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[for="addresses[0].zipcode"]').attr('for', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[for="addresses[0].city"]').attr('for', 'addresses[' + addressIndex + '].city').end();
		
		 $("#AddMoreAddressId").show();
		 if(Outputcounter == MaxInputs) {
            $("#AddMoreAddressId").hide();
        }
		
			}
			return false;
		})
		
		
		// You need to use event delegation (and class selector) because those buttons don't exist on load, but are created in table 
		$(document).on('click', 'button.removebutton', function () {
			$(this).closest('table').remove();
			addressIndex--;
			Outputcounter--;
			if(Outputcounter < MaxInputs) {
	            $("#AddMoreAddressId").show();
	        }
		     return false;
		 });
		
		$(document).on('click', 'button.removeAddressFromDB', function () {
			$(this).closest('table').find("input").prop('disabled', false)
			$(this).closest('table').hide();
		     return false;
		 });
		
		
		
	});
</script>
