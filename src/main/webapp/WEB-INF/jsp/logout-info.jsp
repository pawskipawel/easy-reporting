<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../layout/taglib.jsp"%>

<br><br>

<div class="row">
  <div class="col-md-6 col-md-offset-3">
<c:if test="${param.logoutSuccess eq true}">
	<div class="alert alert-success"><center>You have been successfully
		logout</center></div>
</c:if>

<c:if test="${param.sessionExpired eq true}">
	<div class="alert alert-success">Session expired!
		logout</div>
</c:if>

</div>
</div>



