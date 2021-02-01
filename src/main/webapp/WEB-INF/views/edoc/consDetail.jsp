<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="card mt-3">
	<div class="card-status-top bg-primary"></div>
	<div class="card-header">
		<h3 class="m-0 card-title">합&nbsp;&nbsp;의</h3>
	</div>
	<div class="card-body">
		<form role="aprvRegistForm">
			<table class="table table-vcenter card-table table-striped">
				<tr>
					<th width="33%">작성자</th>
					<td>${cons.dept_nm}&nbsp;-&nbsp;${cons.rank_nm} ${cons.emp_nm}</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 190px; overflow-y:scroll;">
					${cons.cons_comm}
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>