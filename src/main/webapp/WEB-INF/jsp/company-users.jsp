<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../layout/taglib.jsp"%>




<table class="table  table-bordered table-hover table-striped" >
	<thead>
		<tr>
			<th>Company Name</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users.users}" var="user">
			<tr>
				<td><c:out value="${user.name}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table> 

<c:out value="${users.companyName}"></c:out>
<c:out value="${users.registrationDate}"></c:out>

<%-- <br>
	<c:forEach items="${users.users.roles}" var="role">
			<tr>
				<td><c:out value="${role.name}" /></td>
			</tr>
		</c:forEach> --%>