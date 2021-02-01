<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">

					<h2 class="page-title">직급관리</h2>
				</div>
			</div>
		</div>
		<!-- page title -->

		<div class="row row-deck row-cards row-eq-height">
			<div class="col-lg-8">
				<div class="card p-3 h-100">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header">
						<h3 class="card-title">직급목록</h3>
					</div>
					<!-- card header -->
					<div class="table-responsive">
						<table
							class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="w-1"><input
										class="form-check-input m-0 align-middle" type="checkbox"
										aria-label="Select all invoices" name="allCheck"
										id="th_allCheck" onclick="allCheck();"></th>
									<th class="w-5 text-center">No.</th>
									<th>직책코드</th>
									<th>직책명</th>
									<th>상위직책명</th>
									<th class="w-5 text-center">수정</th>
									<th style="display: none;">상위직책코드</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rankList }" var="rank" varStatus="status">
									<c:if test="${rankList ne null}">
										<c:set value="${rank.rank_no }" var="modRankNO2" />
										<tr>
											<td class="w-1"><input
												class="form-check-input m-0 align-middle" type="checkbox"
												aria-label="Select invoice" name="checkRow"
												value="${rank.rank_no}"></td>
											<td class="w-5 text-center"><span class="text-muted">${status.count }</span></td>
											<td id="modRankNO2">${rank.rank_no }</td>
											<td><span class="text-muted" id="modRankNm2">${rank.rank_nm}</span>
											</td>
											<td><span class="text-muted">${rank.rank_upnm}</span></td>
											<th class="w-5 text-center"><a
												href="javascript:modifyRankForm(${rank.rank_no });"
												class="btn btn-outline-primary w-75"> 수정 </a></th>
											<td style="display: none;"><span class="text-muted"
												id="modUprank2">${rank.rank_uprank}</span></td>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- table div -->


					<div class="card-footer" style=" height: 11%;">
						<div class="row">
							<div class="col-10 col-sm-4 col-md-6 col-xl mb-3"></div>
							<div class="col-2 col-sm-8 col-md-6 col-xl mb-3"
								style="display: flex; justify-content: flex-end;">
								<a href="javascript:delRank();"
									class="btn  btn-outline-danger w-5" id="delRankBtn"> <svg
										xmlns="http://www.w3.org/2000/svg" class="icon m-0" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<line x1="4" y1="7" x2="20" y2="7" />
										<line x1="10" y1="11" x2="10" y2="17" />
										<line x1="14" y1="11" x2="14" y2="17" />
										<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
										<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- card -->
			</div>
			<%@ include file="detail.jsp"%>
			<%@ include file="rank_js.jsp" %>
		</div>
		<!-- row -->
	</div>
	<!-- containew-xl -->
</div>
