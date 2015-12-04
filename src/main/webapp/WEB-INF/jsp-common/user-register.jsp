<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user"
	cssClass="form-horizontal registrationForm">

	<c:if test="${param.success eq true}">
		<div class="alert alert-success">Registration successfull</div>
	</c:if> 
	
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" />
			<form:errors path="name" />

		</div>
	</div>

	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Email:</label>
		<div class="col-sm-10">
			<form:input path="email" cssClass="form-control" />
			<form:errors path="email" />
		</div>
	</div>
	

	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" />
			<form:errors path="password" />
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password again:</label>
		<div class="col-sm-10">
			<input type="password" name="password_again" id="password_again" class="form-control">
		</div>
	</div>
	

	<div class="form-group">
		<div class="col-sm-2">
			<input type="submit" value="Save" class="btn btn-lg btn-primary">
		</div>
	</div>

</form:form>

 <script src="<c:url value="/resources/js/validation.js" />"></script>
