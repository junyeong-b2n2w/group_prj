<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="card mt-3">
	<div class="card-status-top bg-primary"></div>
	<div class="card-header">
		<h3 class="m-0 card-title">결&nbsp;&nbsp;재</h3>
	</div>
	<div class="card-body">
		<form role="aprvRegistForm">
			<table class="table table-vcenter card-table table-striped">
				<tr>
					<th width="33%">작성자</th>
					<td>${aprv.dept_nm}&nbsp;-&nbsp;${aprv.rank_nm} ${aprv.emp_nm}</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 200px; overflow-y:scroll;">
					${aprv.aprv_comm}
					</td>
				</tr>
				<c:if test="${fn:length(attachList) > 0}">
					<tr>
					<th width="33%">첨부파일</th>
					<th></th>
					</tr>
					<c:forEach var="attach" items="${attachList}">
						<td colspan="2" style="font-size: smaller;">
							<label class="row"> 
								<span class="col">${attach.attc_extnm }
									<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" /><polyline points="7 11 12 16 17 11" /><line x1="12" y1="4" x2="12" y2="16" /></svg>
									</a>
								</span> 
							</label>
						</td>
					</c:forEach>
				</c:if>
			</table>
		</form>
	</div>
</div>