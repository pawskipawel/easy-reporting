<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../layout/taglib.jsp"%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<div class="row">
	<div class="col-md-6">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Company</strong>
				</h3>
			</div>
			<div class="panel-body">


				<div class="list-group">
					<a href='<spring:url value="/user-settings/edit-company.html"></spring:url>' class="list-group-item">Company details</a>
					<a href="#" class="list-group-item">Users</a>
				</div>


			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Invoices</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="list-group">
					<a  href="#" class="list-group-item">Numeration</a>
					<a  href="#" class="list-group-item">Invoice options</a>
				</div>


			</div>
		</div>

	</div>
	<div class="col-md-6">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>User</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="list-group">
					<a href="#" class="list-group-item">User details</a>
					<a href="#"class="list-group-item">Change password</a>
				</div>

			</div>
		</div>


		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Others</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="list-group">
					<a href="#" class="list-group-item">Change language</a>
				</div>

			</div>
		</div>

	</div>
</div>


