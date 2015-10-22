<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$(".triggerRemove").click(function(e) {
		e.preventDefault();
		$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
		$("#modalRemove").modal();
	});
});
</script>

<br>
<br>

<table class="table  table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Company Name</th>
			<th>NIP</th>
			<th>Phone</th>
			<th>Registration Date</th>
			<th>Operations</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${companies}" var="company">
			<tr>
				<td><c:out value="${company.companyName}" /></td>
				<td><c:out value="${company.nip}" /></td>
				<td><c:out value="${company.phone}" /></td>
				<td><c:out value="${company.registrationDate}" /></td>
				<td><a
					href="<spring:url value="/companies/${company.id}.html"></spring:url>"
					type="button" class="btn btn-info">Users</a> <a
					href="<spring:url value="/companies/${company.id}.html"></spring:url>"
					type="button" class="btn btn-danger triggerRemove"> <span
						class="glyphicon glyphicon-trash"></span>
				</a></td>
			</tr>

		</c:forEach>
	</tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Remove company</h4>
      </div>
      <div class="modal-body">
        Do you want to delete company and it's history from system?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <a href="" class="btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>





