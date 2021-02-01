<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 부서 등록 -->
<div class="modal modal-blur fade" id="registDept" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">부서등록</h5>
			</div>
			<div class="modal-body">
				<form id="registForm"
					action="<%=request.getContextPath()%>/role/dept/registDept"
					method="post">
					<div class="mb-3">
						<div class="row">
							<div class="col">
								<label class="form-label">회사명</label> <input type="text"
									class="form-control" disabled value="${companyName }">
							</div>
							<div class="col">
								<label class="form-label">활성상태</label> <input type="text"
									class="form-control" disabled placeholder="직원 등록시 활성상태로 변경됩니다">
							</div>

						</div>
					</div>
					<div class="mb-3">
						<div class="row g-2">
							<div class="col">
								<label class="form-label">부서이름</label> <input type="text"
									class="form-control" name="dept_nm" placeholder="부서이름을 입력해주세요"
									required id="regDeptNm">

							</div>
							<div class="col">

								<label class="form-label">상위부서</label> <select
									class="form-select" name="dept_updept" id="regDeptUpdept">
									<c:forEach items="${allDeptList }" var="dept">
										<c:if test="${dept.dept_actvyn eq 'Y'}">
											<option value="${dept.dept_no }">${dept.dept_nm }</option>
										</c:if>

									</c:forEach>

								</select>
							</div>
							<div class="col">
								<label class="form-label">부서전화번호</label> <input type="text"
									class="form-control" id="regDeptPh" name="dept_ph"
									pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
									placeholder="예) 010-1234-5678">

							</div>

						</div>
						<!-- row g2 -->
					</div>
					<div class="mb-3">
						<label class="form-label">부서위치</label> <input type="text"
							class="form-control" name="dept_loc"
							placeholder="부서 위치 정보를 입력해 주세요" maxlength="40" id="regDeptLoc">
					</div>
					<div class="mb-3">
						<label class="form-label">부서장 지정</label>
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-8 searchbox mx-0 px-0">
										<input type="text" class="form-control searchInput"
											placeholder="사원명을 검색해주세요" name="emp_nm" value="">
									</div>
									<div class="col-auto mx-0 px-0">
										<a href="javascript:void(0);" class="btn btn-white btn-icon"
											aria-label="Button" id="searchBtn"> <svg
												xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
												height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
												<circle cx="10" cy="10" r="7"></circle>
												<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</a> <a href="javascript:void(0);" id="refreshBtn"
											class="btn btn-white btn-icon" aria-label="Button"> <svg
												xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
												height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
												<line x1="9" y1="6" x2="20" y2="6"></line>
												<line x1="9" y1="12" x2="20" y2="12"></line>
												<line x1="9" y1="18" x2="20" y2="18"></line>
												<line x1="5" y1="6" x2="5" y2="6.01"></line>
												<line x1="5" y1="12" x2="5" y2="12.01"></line>
												<line x1="5" y1="18" x2="5" y2="18.01"></line></svg>
										</a>
									</div>
								</div>
							</div>
							<table class="table card-table table-vcenter">
								<thead>
									<tr>
										<th class="w-1"></th>
										<th>사원ID</th>
										<th>직책명</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody id="empList">
								</tbody>
							</table>
							<div class="card-footer d-flex"
								style="justify-content: flex-end;" id="paginationDiv"></div>
						</div>

					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn btn-link link-secondary" data-dismiss="modal">
					취소 </a> <a href="javascript:registDeptBtn();"
					class="btn btn-primary ms-auto"> 저장 </a>
			</div>
		</div>
	</div>
</div>


<!-- 상세보기 modal -->
<div class="modal modal-blur fade" id="detailDept" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상세조회</h5>
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<div class="row">
					<div class="col">
						<label class="form-label">회사코드</label> <input type="text"
						class="form-control" id="companycode" name="companycode" readonly>
					</div>
					<div class="col">
					<label class="form-label">부서코드</label> <input type="text"
						class="form-control" id="deptcode" name="deptcode" readonly>
						</div>
					</div>
				</div>
				<div class="mb-3">
				<div class="row">
					<div class="col">
					
					<label class="form-label">부서이름</label> <input type="text"
						class="form-control" id="deptname" name="deptname">
				</div>
				<div class="col">
				<label class="form-label">상위부서</label> <select class="form-select"
						id="updeptname" name="updeptname">
					</select>
				</div>
				
				</div>
				</div>
				<div class="mb-3">
					<label class="form-label">부서위치</label> <input type="text"
						class="form-control" id="deptloc" name="deptloc">
				</div>
				<div class="mb-3">
				<div class="row">
					<div class="col">
					
					<label class="form-label">부서전화번호</label> <input type="text"
						class="form-control" id="deptph" name="deptph">
					</div>
					<div class="col">
					
					<label class="form-label">활성상태</label> <select class="form-select"
						id="deptactvyn" name=deptactvyn>
					</select>
					</div>
					
					</div>
					
				</div>
						<div class="mb-3">
						<label class="form-label">부서장 지정</label>
						<div class="card">
							<div class="card-header">
							<div class="row mr-2">
							<div class="col">
								<input type="text" class="form-control" id="depthead" name="depthead">
								<input type="hidden" class="form-control" id="deptheadid" name="deptheadid">
									
							</div>
							</div>
								<div class="row">
									<div class="col-8 searchbox mx-1 px-0">
										<input type="text" class="form-control searchInput"
											placeholder="사원명을 검색해주세요" name="emp_nm" value="">
									</div>
									<div class="col-auto mx-0 px-0">
										<a href="javascript:void(0);" class="btn btn-white btn-icon"
											aria-label="Button" id="searchBtn2"> <svg
												xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
												height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
												<circle cx="10" cy="10" r="7"></circle>
												<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</a> <a href="javascript:void(0);" id="refreshBtn2"
											class="btn btn-white btn-icon" aria-label="Button"> <svg
												xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
												height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
												<line x1="9" y1="6" x2="20" y2="6"></line>
												<line x1="9" y1="12" x2="20" y2="12"></line>
												<line x1="9" y1="18" x2="20" y2="18"></line>
												<line x1="5" y1="6" x2="5" y2="6.01"></line>
												<line x1="5" y1="12" x2="5" y2="12.01"></line>
												<line x1="5" y1="18" x2="5" y2="18.01"></line></svg>
										</a>
									</div>
								</div>
							</div>
							<table class="table card-table table-vcenter">
								<thead>
									<tr>
										<th class="w-1"></th>
										<th>사원ID</th>
										<th>직책명</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody id="empList2">
								</tbody>
							</table>
							<div class="card-footer d-flex"
								style="justify-content: flex-end;" id="paginationDiv2"></div>
						</div>

					</div>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn btn-link link-secondary" data-dismiss="modal">
					취소 </a> <a href="javascript:modifyDeptBtn();"
					class="btn btn-primary ms-auto"> 저장 </a>
			</div>
		</div>
	</div>
</div>
