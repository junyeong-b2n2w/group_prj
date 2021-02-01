<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page">


	<div class="content">
		<div class="container-xl">
			<!-- Page title -->
			<div class="page-header d-print-none">
				<div class="row align-items-center">
					<div class="col">
						<h2 class="page-title">게시판 관리</h2>
					</div>
				</div>
			</div>
			<!-- page title -->
			<div class="row row-deck row-cards">
				<div class="col-lg-3" style="height: 420px">
					<div class="card p-3">
						<div class="card-status-top bg-primary"></div>
						<div class="card-header">
							<h3 class="card-title">활성화된 게시판 목록</h3>
						</div>
						<div class="card-body">
							<ul id="treeDemo" class="navbar-nav pt-lg-3  ztree">
							</ul>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary w-200"
								style="margin-left: 80px;" onclick="ChangeBoardType()"> 활성
								게시판 등록 </a>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="card p-3">
						<div class="card-status-top bg-primary"></div>
						<div class="card-header">
							<h3 class="card-title">비활성 게시판 목록</h3>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table
									class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th>게시판 이름</th>
											<th>게시판 작성자</th>
											<th></th>
										</tr>
									</thead>
									<c:forEach items="${NboardList }" var="list">
										<tr>
											<td>${list.board_nm }</td>
											<td>${list.board_crt }</td>
											<td>
								<a href="#" class="btn btn-sm btn-warning " onclick="modifyNboardBtn('${list.board_nm}',${list.board_pboardno},${list.board_no })"> 수정 </a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</div>

					</div>
				</div>
				<div class="col-lg-6" id="BoardModiFys">
					<div class="card p-3">
						<div class="card-status-top bg-primary"></div>
						<div class="card-header">
							<h3 class="card-title">게시판 수정</h3>
						</div>
						<div class="body">
							<div class="mb-3 mt-3">
								<label class="form-label">게시판 이름</label> <input type="text"
									value="" class="form-control" name="modfiyboard_nm"
									placeholder="Your board name"> <input type="hidden"
									name="modfiyBoard_NO">
							</div>

							<div class="mb-3">
								<label class="form-label">상위 게시판</label>
								<select class="form-select" name="modfiyboard_pboardno" id="selects">
								</select>
							</div>
							<label class="form-label">게시판 활성 여부</label>
							<div class="form-selectgroup-boxes row mb-3">
								<div class="col-lg-6">
									<label class="form-selectgroup-item"> <input
										type="radio" name="modfiyboard_actvyn" value="Y"
										class="form-selectgroup-input" checked=""> <span
										class="form-selectgroup-label d-flex align-items-center p-3">
											<span class="me-3 mr-3"> <span
												class="form-selectgroup-check"></span>
										</span> <span class="form-selectgroup-label-content"> <span
												class="form-selectgroup-title strong mb-1">활성</span> <span
												class="d-block text-muted">게시판을 활성화 합니다</span>
										</span>
									</span>
									</label>
								</div>
								<div class="col-lg-6">
									<label class="form-selectgroup-item"> <input
										type="radio" name="modfiyboard_actvyn" value="N"
										class="form-selectgroup-input"> <span
										class="form-selectgroup-label d-flex align-items-center p-3">
											<span class="me-3 mr-3"> <span
												class="form-selectgroup-check"></span>
										</span> <span class="form-selectgroup-label-content"> <span
												class="form-selectgroup-title strong mb-1">비활성</span> <span
												class="d-block text-muted">게시판을 비활성화 합니다</span>
										</span>
									</span>
									</label>
								</div>
							</div>
						</div>
						<div class=" d-flex justify-content-end">
							<a href="#" class="btn btn-primary w-200"
								onclick="beforeRename();" style=""> 등록 </a>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6" id="NBoardModiFy" style="display: none">
					<div class="card" style="padding: 20px">
						<div class="card-status-top bg-primary"></div>
						<div class="card-header">
							<h3 class="card-title">비활성화 게시판 수정</h3>
						</div>
						<div class="body">
							<div class="mb-3">
								<label class="form-label">게시판 이름</label> <input type="text"
									value="" class="form-control" name="modfiyboard_nm2"
									placeholder="Your board name">
									 <input type="hidden" name="modfiyBoard_NO2">
							</div>

							<div class="mb-3">
								<label class="form-label">상위 게시판</label> <select
									name="modfiyboard_pboardno2" id="selectsss">
									<option value='0' class="Nboard">선택X</option>
									<c:forEach items="${YboardList }" var="lists">
									<option value="${lists.board_no }">${lists.board_nm }</option>
								</c:forEach>
								</select>
							</div>
							<label class="form-label">게시판 활성 여부</label>
							<div class="form-selectgroup-boxes row mb-3">
								<div class="col-lg-6">
									<label class="form-selectgroup-item"> <input
										type="radio" name="modfiyboard_actvyn2" value="Y"
										class="form-selectgroup-input" checked=""> <span
										class="form-selectgroup-label d-flex align-items-center p-3">
											<span class="me-3 mr-3"> <span
												class="form-selectgroup-check"></span>
										</span> <span class="form-selectgroup-label-content"> <span
												class="form-selectgroup-title strong mb-1">활성</span> <span
												class="d-block text-muted">게시판을 활성화 합니다</span>
										</span>
									</span>
									</label>
								</div>
								<div class="col-lg-6">
									<label class="form-selectgroup-item"> <input
										type="radio" name="modfiyboard_actvyn2" value="N"
										class="form-selectgroup-input"> <span
										class="form-selectgroup-label d-flex align-items-center p-3">
											<span class="me-3 mr-3"> <span
												class="form-selectgroup-check"></span>
										</span> <span class="form-selectgroup-label-content"> <span
												class="form-selectgroup-title strong mb-1">비활성</span> <span
												class="d-block text-muted">게시판을 비활성화 합니다</span>
										</span>
									</span>
									</label>
								</div>
							</div>
						</div>
						<div class=" d-flex justify-content-end">
							<a href="#" class="btn btn-primary w-200"
								onclick="modifyNboard();" style=""> 등록 </a>
						</div>
					</div>
				</div>

				<div class="col-lg-6" id="BoardInsert" style="display: none">
					<div class="card p-3" >
						<form action="<%=request.getContextPath()%>/role/board/insert.do"
							role="form">
							<div class="card-status-top bg-primary"></div>
							<div class="card-header">
								<h3 class="card-title">게시판 등록</h3>
							</div>
							<div class="body">

								<div class="mb-3 mt-3">
									<label class="form-label">게시판 이름</label> <input type="text"
										class="form-control" name="board_nm"
										placeholder="Your board name">
								</div>

								<div class="mb-3">
									<label class="form-label">상위 게시판</label> <select class="form-select"
										name="board_pboardno" id="selectss">
									</select>
								</div>
								<label class="form-label">게시판 활성 여부</label>
								<div class="form-selectgroup-boxes row mb-3">
									<div class="col-lg-6">
										<label class="form-selectgroup-item"> <input
											type="radio" name="board_actvyn" value="Y"
											class="form-selectgroup-input" checked=""> <span
											class="form-selectgroup-label d-flex align-items-center p-3">
												<span class="me-3 mr-3"> <span
													class="form-selectgroup-check"></span>
											</span> <span class="form-selectgroup-label-content"> <span
													class="form-selectgroup-title strong mb-1">활성</span> <span
													class="d-block text-muted">게시판을 활성화 합니다</span>
											</span>
										</span>
										</label>
									</div>
									<div class="col-lg-6">
										<label class="form-selectgroup-item"> <input
											type="radio" name="board_actvyn" value="N"
											class="form-selectgroup-input" disabled="disabled"> <span
											class="form-selectgroup-label d-flex align-items-center p-3">
												<span class="me-3 mr-3"> <span
													class="form-selectgroup-check"></span>
											</span> <span class="form-selectgroup-label-content"> <span
													class="form-selectgroup-title strong mb-1">비활성</span> <span
													class="d-block text-muted">게시판을 비활성화 합니다</span>
											</span>
										</span>
										</label>
									</div>
								</div>
							</div>

							<div class="" style="float: right;">
								<a href="#" class="btn btn-primary w-100"
									onclick="createBoard();"> 등록 </a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>






<%@ include file="list_js.jsp"%>
