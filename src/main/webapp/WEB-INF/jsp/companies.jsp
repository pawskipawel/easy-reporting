<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/taglib.jsp"%>
<br>
<br>

<table class="table  table-bordered table-hover table-striped" >
	<thead>
		<tr>
			<th>Company Name</th>
			<th>NIP</th>
			<th>Phone</th>
			<th>Registration Date</th>
			<th>Users</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${companies}" var="company">
			<tr>
				<td><c:out value="${company.companyName}" /></td>
				<td><c:out value="${company.nip}" /></td>
				<td><c:out value="${company.phone}" /></td>
				<td><c:out value="${company.registrationDate}" /></td>
				<td><a href="<spring:url value="/companies/${company.id}.html"></spring:url>" type="button" class="btn btn-info">Users</a></td>
			</tr>

		</c:forEach>
	</tbody>
</table>






   
