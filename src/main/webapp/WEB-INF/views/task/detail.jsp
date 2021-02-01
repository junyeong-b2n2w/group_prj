<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.button {
	margin: .4em;
	padding: 1em;
	cursor: pointer;
	background: #e1e1e1;
	text-decoration: none;
	color: #3d3d3d;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.box-shadow-outset {
	display: inline-block;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-property: box-shadow;
	transition-property: box-shadow;
	-webkit-transform: translateZ(0);
	-ms-transform: translateZ(0);
	transform: translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	background: white;
	color: black;
	border: 1px solid;
}

.box-shadow-outset:hover {
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.6);
}
</style>
<div class="content">
	<div class="container">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">
					<h3 class="page-title">발신 업무 요청 조회</h3>
				</div>
			</div>
		</div>
		<!-- page title -->

		<div class="row row-eq-height">
			<div class="col-6">
				<div class="card p-3 h-100">
					<div class="card-header"><h3>발신 업무 요청 내용</h3></div>
					<div class="card-body py-3">
						<div class="form-group mb-2 ">
							<label class="form-label">제목</label>
							<div>
								<input type="hidden" id="tascNo" value="${task.tasc_no }"> <input type="text" class="form-control bg-white" value="${task.task_title }" readonly>
							</div>
						</div>
						<div class="form-group mb-3 ">
							<div class="row">
								<div class="col-lg-6">
									<div class="mb-2">
										<label class="form-label">업무 기한</label>
										<div class="input-group input-group-flat">
											<input type="text" class="form-control bg-white ps-0" readonly value="<fmt:formatDate value='${task.task_regdt }' pattern='yyyy-MM-dd'/> ~ <fmt:formatDate value='${task.task_ddlndt }' pattern='yyyy-MM-dd'/>">
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="mb-2">
										<label class="form-label">업무 상태</label> <input type="text" class="form-control  bg-white" readonly="readonly" value="${task.task_stt }">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group mb-2">
							<div class="col-lg-12">
								<div>
									<label class="form-label">내용</label>
									<div class= "p-2" style="border:1px dashed lightgray; min-height: 100px;">${task.task_cont }</div>
								</div>
							</div>
						</div>
						<c:if test="${attachList ne null}">
							<div class="form-group mb-3 row fileDrop">
								<label class="form-label">파일첨부</label>
								<div class="divide-y appendArea">
									<c:forEach var="attach" items="${attachList }">
										<div>
											<label class="row"> <span class="col">${attach.attc_extnm } <a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
															stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
												</a>
											</span>
											</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>

						<div class="d-flex" style="justify-content: flex-end;">
							<c:if test="${loginUser.emp_id eq task.task_empid }">

								<c:choose>
									<c:when test="${ task.task_stt ne '진행'}">

										<div class="col-6 col-sm-4 col-md-2 col-sm mr-1 mb-2">
											<a href="" class="btn btn-outline-warning   w-100" data-keyboard="false" data-backdrop="static" data-toggle="modal" data-target="#modal-report" id="modalModifyBtn">수정 </a>
										</div>
										<div class="col-6 col-sm-4 col-md-2 col-sm mr-1 mb-2">
											<a href="#" class="btn btn-outline-danger   w-100" onclick="RemoveTask(${task.tasc_no})"> 삭제 </a>
										</div>
									</c:when>
									<c:when test="${ task.task_stt eq '진행'}">
										<div class="col-6 col-sm-4 col-md-2 col-sm  mr-1 mb-2">
											<a href="" class="btn btn-outline-warning  w-100" onclick="ModifyTaskimpossible()">수정 </a>
										</div>
										<div class="col-6 col-sm-4 col-md-2 col-sm mr-1 mb-2">
											<a href="#" class="btn btn-outline-danger    w-100" onclick="ModifyTaskimpossible()"> 삭제 </a>
										</div>
									</c:when>
								</c:choose>
							</c:if>

							<div class="col-6 col-sm-4 col-md-2 col-sm mr-1 mb-2">
							<button type="button" onclick="BackTaskListGo(${task.tasc_no})" class="btn btn-primary   w-100">
								목록
							</button>
							</div>
						</div>
					</div>
				</div>
				<!-- col-12 -->
			</div>
			<!-- row -->

			<div class="col-6">
				<div class="card p-3 h-100">
				<div class="card-header ">
					<h3>수신자 목록</h3>
				</div>
				<div class="table-responsive">
					<table class="table card-table table-vcenter text-nowrap datatable" style="background: white;">
						<thead>
							<tr>
								<th>수신자 이름</th>
								<th>수신자 직급</th>
								<th>상태</th>
								<th>진척도</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${NmgList }" var="list">

								<tr onclick="OpenWindow('<%=request.getContextPath() %>/task/receivedetail?tasc_no=${list.perf_tascno }&perf_empid=${list.perf_empid }&from=1','ReceiverDetail','700','850')" onmouseover="this.style.backgroundColor='lightblue'" onmouseout="this.style.backgroundColor=''">
									<td>${list.emp_nm }</td>
									<td>${list.rank_nm }</td>
									<td>${list.perf_stt }</td>
									<td>${list.perf_progress }%</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
</div>
			</div>
		</div>




		<!-- 업무 수정 -->
		<div class="modal modal-blur fade" id="modal-report" tabindex="-1" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">업무 수정</h5>
						<input type="hidden" id="id" value="${ loginUser.emp_id}">

						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<div class="mb-3">
							<label class="form-label">제목</label> <input type="text" class="form-control" id="Registtask_title" placeholder="Title">
						</div>

						<div class="mb-3">
							<label class="form-label">업무 형태 </label> <input type="radio" name="chk_info" onclick="CustomerS()" value="나의 할일">나의 할일 <input type="radio" name="chk_info" onclick="TaskSend()" value="업무 요청">업무 요청 <input type="radio" name="chk_info" onclick="TaskBogo()" value="업무 보고">업무
							보고 <input type="radio" name="chk_info" onclick="TaskHistory()" value="업무 일지">업무 일지 <input type="hidden" name="loginUserId" value="${loginUser.emp_id}">
						</div>


						<div class="mb-3">
							<label class="form-label">중요 여부</label> <input type="radio" name="chk_Importance" value='1'>중요 <input type="radio" name="chk_Importance" value='0'>증요X
						</div>

						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">업무 기한</label> <input type="date" class="form-control">
							</div>
						</div>


						<div class="mb-3 Customer">
							<label class="form-label">담당자</label> <input style="display: inline-block; width: 88%;" type="text" class="form-control" id="Registtast" placeholder="담당자"> <input type="button" id="TaskBtn" name="aprvReference" class="btn btn-outline-primary" value="사용자">
						</div>


						<div class="mb-3">
							<label class="form-label">내용</label>
							<div>
								<textarea class="form-control" id="summernoteContent">${task.task_cont }</textarea>
							</div>
						</div>

						<c:if test="${attachList ne null}">
							<div class="form-group mb-3 row">
								<div class="divide-y">
									<c:forEach var="attach" items="${attachList }">
										<div id="fileRow">
											<div>
												<label class="row"> <span class="col">${attach.attc_extnm } <a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
																stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
													</a>
												</span> <span class="col-auto"> <label class="form-check form-check-single form-switch"> <small data-src="${attach.attc_no }" class="newFile"> <a href="javascript:void(0);" onclick="deleteFileByAttcNo('${attach.attc_no}',this)"> <svg xmlns="http://www.w3.org/2000/svg"
																		class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																			<line x1="18" y1="6" x2="6" y2="18"></line>
																			<line x1="6" y1="6" x2="18" y2="18"></line></svg>
															</a>
														</small>
													</label>
												</span>
												</label>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>




						<div class="form-group mb-3 row" id="fileDrop">
							<label class="form-label">파일첨부</label>
							<div class="divide-y" id="appendArea">
								<label class="row" style="border: 1px dotted gray; height: 100px;" id="dragHere"> <span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
								</label>
							</div>
						</div>


					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-link link-secondary" data-dismiss="modal" onclick="cancelRegistModal()"> Cancel </a> <a href="" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="TaskModify();"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
								viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="12" y1="5" x2="12" y2="19"></line>
									<line x1="5" y1="12" x2="19" y2="12"></line></svg> Create New Board
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="modal modal-blur fade" id="receiverRefModal" tabindex="-1" data-keyboard="false" data-backdrop="static" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-xl modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="receiverRefModalTitle"></h5>
						<input type="hidden" id="receiverRefModalGB">
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body row" style="height: 420px">
						<div class="col-sm-5">
							<div class="card" style="height: 100%">
								<ul class="nav nav-tabs nav-tabs-alt nav-tabs2" data-bs-toggle="tabs">
									<li class="nav-item"><a href="#tabs-gchart-10" class="nav-link active" data-bs-toggle="tab">조직도</a></li>
									<li class="nav-item"><a href="#tabs-search-10" class="nav-link" data-bs-toggle="tab">검색</a></li>
								</ul>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="tabs-gchart-10">
											<ul id="rrtree" class="ztree" style="width: 100%; overflow-y: scroll; height: 310px"></ul>
										</div>
										<div class="tab-pane show" id="tabs-search-10">
											<div class="input-group">
												<input type="text" class="form-control" placeholder="사원, 부서 검색.."> <span class="input-group-text" onclick="searchAprvLn2(this)"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
														fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
													<circle cx="10" cy="10" r="7"></circle>
													<line x1="21" y1="21" x2="15" y2="15"></line></svg>
												</span>
											</div>
											<div class="card" id="rrsearchResult" style="height: 270px; overflow-y: scroll;"></div>
										</div>
									</div>
								</div>
								<div class="card-footer text-right">
									<input type="button" class="btn btn-success" value="추가" id="rrAddBtn">
								</div>
							</div>
						</div>
						<div class="col-sm-7" style="height: 400px">
							<div class="card" style="overflow-y: scroll; height: 380px">
								<table class="text-center table table-bordered">
									<thead>
										<tr>
											<th style="width: 40%">부서</th>
											<th style="width: 50%">이름</th>
											<th style="width: 10%">삭제</th>
										</tr>
									</thead>
									<tbody id="rrAddList">
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<div class="modal-footer">
						<a href="#" class="btn btn-link link-secondary" data-dismiss="modal" id="rrListCloseBtn"> 닫기 </a> <a href="#" class="btn btn-primary" data-dismiss="modal" id="rrListAddBtn"> 확인 </a>
					</div>
				</div>
			</div>
		</div>
		<!-- 업무 수정 끝-->
	</div>

</div>
<div class="peopleList"></div>
<%@ include file="list_detail_js.jsp"%>
<%@ include file="detail_js.jsp"%>
