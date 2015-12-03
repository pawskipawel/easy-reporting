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

													<form:input path="companyName" value="${companyDB.companyName}"
														cssClass="form-control" />
												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="nip" class="col-sm-12 control-label">Nip:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">

													<form:input path="nip" value="${companyDB.nip}"
														cssClass="form-control" />
												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="phone" class="col-sm-12 control-label">Phone:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="phone" value="${companyDB.phone}"
														cssClass="form-control" />
												</div>
											</div></td>
									</tr>
									<tr>
										<td><label for="email" class="col-sm-12 control-label">Email:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="email" value="${companyDB.email}"
														cssClass="form-control" />
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>



						</div>
					</div>
					
						<!-- left Bank account -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Bank account</strong>
							</h3>
						</div>
						<div class="panel-body">

							
							<!-- loop for bank accounts  -->
							<c:set var="countAccount" value="-1" scope="page" />
							<c:forEach items="${companyBankAccountsDb}" var="bankAccount">
								<c:set var="countAccount" value="${countAccount+1}" scope="page" />
							<!--  input field for entity ID-->
							<form:input type="hidden" path="bankAccount[${countAccount}].id" value="${bankAccount.id}" />

							
							

								<table class="table table-bordered ">
									<thead>
										<tr>
											<th class="col-md-4">Fields</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody>
										<tr>

											<td><label for="bankAccount[${countAccount}].accountNumber"
												class="col-sm-12 control-label">Bank account number:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">													
														<form:input type="text" path="bankAccount[${countAccount}].accountNumber" 
														 value="${bankAccount.accountNumber}"
															 cssClass="form-control" />									
													</div>
												</div> 
												</td>
										</tr>
										
										<tr>

											<td><label for="bankAccount[${countAccount}].description"
												class="col-sm-12 control-label">Bank account number:</label></td>
											<td><div class="form-group">
													<div class="col-sm-12">													
														<form:input type="text" path="bankAccount[${countAccount}].description" 
														 value="${bankAccount.description}"
															 cssClass="form-control" />									
													</div>
												</div> 
												</td>
										</tr>
										
										<tr>										
										<td colspan="2">
										
										<c:if test="${bankAccount.isDeafultBankAccountInvoice eq 'true'}">
										<input type="radio" name="defaultInvoiceBankAccount" value="${bankAccount.id}" checked="checked"> Set as default bank account on invoice<br><br>
										</c:if>
										<c:if test="${bankAccount.isDeafultBankAccountInvoice eq 'false'}">
										<input type="radio" name="defaultInvoiceBankAccount" value="${bankAccount.id}"> Set as default bank account on invoice<br><br>
										</c:if> 
											
										<input type="hidden" name="bankAccountToDelete[]" value="${bankAccount.id}" disabled/>
											<div id="removeBankAccountButtonDiv">
												<button type="button"
													class="btn btn-warning removeBakAccountFromDB">
													Remove bank account <span class="glyphicon glyphicon-minus"></span>
												</button>
											</div>
											
											
										</td>
									</tr>
										
										

									</tbody>
								</table>

							</c:forEach>
							<input type="number" id="elementName" value="33" hidden="true">
							
							
							
							<!-- The template for adding new bank account -->

							<table class="table table-bordered hide" id="bankAccountTemlate">
								<thead>
									<tr>
										<th class="col-md-4">Fields</th>
										<th>Edit</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td><label for="bankAccount[0].accountNumber"
											class="col-sm-12 control-label">Street:</label></td>
										<td><div class="form-group" id="addStreet">
												<div class="col-sm-12">
													<form:input path="bankAccount[0].accountNumber"
														cssClass="form-control" disabled="true" />
												</div>
											</div></td>
									</tr>
									
									<tr>
										<td><label for="bankAccount[0].description"
											class="col-sm-12 control-label">Description:</label></td>
										<td><div class="form-group">
												<div class="col-sm-12">
													<form:input path="bankAccount[0].description"
														cssClass="form-control" disabled="true" />
												</div>
											</div></td>
									</tr>

									<tr>

										<td colspan="2">
											<div id="removeButtonDivBankAccount">
												<button type="button" id="removeAddedBankAccount"
													class="btn btn-warning removeButtonBankAccount">
													Remove address <span class="glyphicon glyphicon-minus"></span>
												</button>
											</div>
										</td>

									</tr>
									
								</tbody>
							</table>
							<div >
								<button type="button" id="AddMoreBankAccountId" class="btn btn-info">
									Add bank account <span class="glyphicon glyphicon-plus"></span>
								</button>
							</div>



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
										
										<c:if test="${address.isDefaultInvoiceAddress eq 'true'}">
										<input type="radio" name="defaultInvoiceAddress" value="${address.id}" checked="checked"> Set as default address on invoice<br><br>
										</c:if>
										<c:if test="${address.isDefaultInvoiceAddress eq 'false'}">
										<input type="radio" name="defaultInvoiceAddress" value="${address.id}"> Set as default address on invoice<br><br>
										</c:if>
											
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

		</form:form>

	</div>
</div>

<script>
var count = "${count}";
var countAccount = "${countAccount}";
</script>

 <script src="<c:url value="/resources/js/edit-company.js" />"></script>





