<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../layout/taglib.jsp"%>
Invalid Session


<c:if test="${param.logoutSuccess eq true}">
	<div class="alert alert-success">You have been successfully
		logout</div>
</c:if>

<c:if test="${param.sessionExpired eq true}">
	<div class="alert alert-success">Session expired!
		logout</div>
</c:if>
