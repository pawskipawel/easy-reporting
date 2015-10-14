<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>


<table class="table  table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Team</th>
		</tr>
	</thead>
	<c:forEach items="${consultants}" var="consultant">
		<tr>
			<td><a
				href="<spring:url value="/consultants/${consultant.id}.html"></spring:url>">
					<c:out value="${consultant.name}"></c:out>
			</a></td>
		</tr>
	</c:forEach>
</table>