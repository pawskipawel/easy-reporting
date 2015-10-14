<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>
<table class="table  table-bordered table-hover table-striped" >
	<thead>
		<tr>
			<th>Menager name</th>
			<th>Company name</th>
			<th>Emial</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${menagers}" var="menager">
			<tr>
				<td><c:out value="${menager.name}" /></td>
				<td><c:out value="${menager.companyName}" /></td>
				<td><c:out value="${menager.email}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
