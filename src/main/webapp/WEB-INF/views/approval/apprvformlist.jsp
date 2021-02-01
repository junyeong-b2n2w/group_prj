
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content" onload="summernoteDisabled()">
	<div class="container-xl">
		<div class="page-header d-print-none">
			<div class=" d-flex justify-content-between">
					<h3 class="page-title">양식목록</h3>
					<input type="button" class="btn btn-primary m-2 my-3" value="기안 작성" id="moveAprvPageBtn">
			</div>
		</div>
		<div class="row row-eq-height">
		
		<!-- 미리보기 -->
		<div class="col-8">
			<div class="card p-3 h-100">
				<div class="card-header"><h4 class="card-title">미리보기</h4></div>
				<div class="card-body d-flex justify-content-center">
					<div class="p-3 "
						style="width: 90%; border: 1px solid lightblue;">
						<div class="mt-3 ">
							<input type="text" placeholder="양식을 선택해주세요" name="af_nm"
								readonly class="form-control form-control-lg bg-white">
						</div>
						<div class="mt-3  d-flex justify-content-end">
							<div class="fright">
								<div class="fleft">
									<table class="table table-bordered text-center">
										<tbody>
											<tr id="aprvLnTrRank">
												<th rowspan="2" class="bg-secondary noneRemove">발<br>신<br>부<br>서
												</th>
												<th class="noneRemove">부 서 명</th>
											</tr>
											<tr id="aprvLnTrName">
												<td height="60" class="noneRemove">이 름</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div id="approvalBox" class="mt-3 row m-0 d-flex justify-content"
							style="border: 1px dashed lightgray; min-height: 20px; "></div>
						<div class="mt-3 summernoteArea" style="height: 250px; background: lightgray;" >
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--미리보기 -->
		<div class="col-4">
			<div class="card p-3 h-100">
				<div class="card-header d-flex justify-content-between">
					<div class="ms-2"><h4 class="card-title">양식선택</h4></div>
				</div>

				<div class="card-body border-bottom py-3">
					<div class="d-flex justify-content-end">
						<div class="text-muted">

							<div class="mx-2 d-inline-block">
								<select name="perPageNum" class="form-control form-control-sm ">
									<option value="5"
										${pageMaker.cri.perPageNum eq '5' ? 'selected':'' }>5개씩</option>
									<option value="10"
										${pageMaker.cri.perPageNum eq '10' ? 'selected':'' }>10개씩</option>
									<option value="20"
										${pageMaker.cri.perPageNum eq '20' ? 'selected':'' }>20개씩</option>
								</select>
							</div>

						</div>
						<div class="ms-auto ">

							<div class="searchbox ms-2 d-inline-block">
								<input type="text" name="keyword"
									class="form-control form-control-sm"
									value="${pageMaker.cri.keyword}" aria-label="Search invoice">
							</div>
						</div>
						<div class="ml-1 ms-2 d-inline-block">

							<button class="btn btn-sm btn-outline-primary w-100"
								onclick="searchList_go(1);">검색</button>
						</div>


					</div>
				</div>
				<div class="table-responsive">

					<table class="table table-vcenter card-table formSelectTable">
						<thead>
							<tr>
								<th style="width: 15%">즐겨찾기</th>
								<th style="width: 15%">NO</th>
								<th style="width: 70%">양식명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${aprvformList }" var="aprv">
								<tr>
									<td>
										<c:if test="${aprv.ff_no ne 0}">
											<label for="chk${aprv.af_no }"><i class="fas fa-bookmark" style="color: #206BC4; font-size: larger;"></i></label>
										</c:if>
										<c:if test="${aprv.ff_no eq 0}">
											<label for="chk${aprv.af_no }"><i class="far fa-bookmark" style="color: #206BC4; font-size: larger;"></i></label>
										</c:if>
										
										<input type="checkbox" id="chk${aprv.af_no }" name="favoriteSel" style="display: none;" role="${aprv.af_no}">									
									</td>
									<td>${aprv.af_no }</td>

									<td><a href="#" onclick="miribogi(${aprv.af_no})">${aprv.af_nm }</a></td>
									<td>
								</tr>

							</c:forEach>


						</tbody>
					</table>
				</div>
				<div class="card-footer d-flex justify-content-center">
					<%@include file="../common/pagination.jsp"%>
				</div>
			</div>
		
			<form role="moveAprvPageForm" method="post" action="moveAprvPage">
				<input id="aprvFormNo" name="form_no" type="hidden">
			</form>
		</div>
	</div>
	</div>
</div>
<%@ include file="apprvformlist_js.jsp" %>



