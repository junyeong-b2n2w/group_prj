<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">

					<h2 class="page-title">조직도관리</h2>
				</div>
			</div>
		</div>
		<!-- page title -->

		<div class="row row-deck row-cards">
			<div class="col-12">
				<div class="card p-3">
					<div class="card-header">
						<div class="col-md-10">
							<h3 class="card-title">부서목록</h3>
						</div>

					</div>
					<!-- card header -->
					<div class="card-body border-bottom py-3 ps-1">
						<div class="row align-items-center">
							<div class="col">
								<div class="row">
									<div class="col-3 searchbox mx-0 px-0">
										<input type="text" class="form-control"
											placeholder="부서명을 검색해주세요" id="keyword" name="keyword"
											value="${pageMaker.cri.keyword }">
									</div>
									<div class="col-auto mx-0 px-0">
										<a href="javascript:searchList_go(1);"
											class="btn btn-white btn-icon" aria-label="Button"> <svg
												xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
												height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
												<circle cx="10" cy="10" r="7"></circle>
												<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</a>
									</div>
									<div class="col-1">
										<a href="javascript:goBack();" class="btn btn-white btn-icon"
											aria-label="Button"> <svg
												xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
												height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none" />
												<line x1="9" y1="6" x2="20" y2="6" />
												<line x1="9" y1="12" x2="20" y2="12" />
												<line x1="9" y1="18" x2="20" y2="18" />
												<line x1="5" y1="6" x2="5" y2="6.01" />
												<line x1="5" y1="12" x2="5" y2="12.01" />
												<line x1="5" y1="18" x2="5" y2="18.01" /></svg>
										</a>
									</div>
								</div>
							</div>
							<div class="col-auto ms-auto">
								<div class="btn-list">
									<span class="d-none d-sm-inline"> <a
										href="javascript:checkDept();" class="btn btn-outline-primary">
											활성상태 변경 </a>
									</span> <a href="#" class="btn btn-primary " data-toggle="modal"
										data-target="#registDept"> <svg
											xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
											height="24" viewBox="0 0 24 24" stroke-width="2"
											stroke="currentColor" fill="none" stroke-linecap="round"
											stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
											<line x1="12" y1="5" x2="12" y2="19"></line>
											<line x1="5" y1="12" x2="19" y2="12"></line></svg> 부서등록
									</a>
								</div>
							</div>
						</div>
					</div>
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
									<th>회사명</th>
									<th>부서코드</th>
									<th>부서명</th>
									<th>부서전화번호</th>
									<th>비고</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${deptList }" var="dept" varStatus="status">
									<c:if test="${deptList ne null}">
										<tr>
											<td class="w-1"><input
												class="form-check-input m-0 align-middle" type="checkbox"
												aria-label="Select invoice" name="checkRow"
												value="${dept.dept_no }"></td>
											<td class="w-5 text-center"><span class="text-muted">${status.count }</span></td>
											<td><span class="text-muted">${companyName}</span></td>
											<td><a class="detailView" href="#detailDept"
												data-companycode="${dept.dept_compno }"
												data-deptcode="${dept.dept_no }"
												data-deptname="${dept.dept_nm }"
												data-updeptname="${dept.dept_upnm }"
												data-updeptno="${dept.dept_updept }"
												data-deptloc="${dept.dept_loc }"
												data-deptph="${dept.dept_ph }"
												data-dept_actvyn="${dept.dept_actvyn }" data-toggle="modal">${dept.dept_no }
											</a></td>
											<td><span class="flag flag-country-us"></span>
												${dept.dept_nm }</td>
											<td>${dept.dept_ph}</td>

											<c:if test="${dept.dept_actvyn eq 'Y'}">
												<td><span class="text-muted bg-indigo-lt">활성</span></td>
											</c:if>
											<c:if test="${dept.dept_actvyn ne 'Y'}">
												<td><span class="text-muted  bg-red-lt">비활성</span></td>
											</c:if>
									</c:if>
									<c:if test="${empty deptList }">
										<tr colspan="3">
											<td>조회되는 부서 목록이 없습니다</td>
										</tr>
									
									</c:if>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<!-- table div -->


					<div class="card-footer">
						<div class="row">
							<div class="col-12"
								style="display: flex; justify-content: center;">
								<%@include file="../common/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
				<!-- card -->
			</div>
		</div>
		<!-- row -->
	</div>
	<!-- containew-xl -->
</div>

<%@ include file="deptModal.jsp" %>
<%@ include file="dept_js.jsp" %>
<%@ include file="../common/pagination2.jsp" %>
    
   