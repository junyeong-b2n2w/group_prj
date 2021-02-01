<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<div class="content">
	<div class="container">
	 <div class="page-header d-print-none">
          <div class="row align-items-center">
            <div class="col">
              <h3 class="page-title">
              	업무 발신함
              </h3>
            </div>
          </div>
      </div>
		<div class="card p-3">
			<div class="card-header d-flex justify-content-between">
				<h3>업무 발신함</h3>
				<div>
					<a href="" class="btn btn-primary  w-200" data-keyboard="false" data-backdrop="static" data-toggle="modal" data-target="#modal-report" id="modalRegistBtn"> 업무 등록 </a>
				</div>
			</div>
			<div class="card-body border-bottom py-3">

				<div class="card-body py-3">
					<div class="d-flex justify-content-end">
						
						<div class=" text-muted">

							<div class=" d-inline-block">
								<select class="form-select form-select-sm" name="searchtaskType">
									<option value="task_title">제목</option>
									<option value="task_cont">내용</option>
								</select>
							</div>
							<div class=" d-inline-block">
								<input type="text" class="form-control form-control-sm" aria-label="Search invoice" name="task_search" placeholder="검색어를 입력하세요">
							</div>
							<div class=" d-inline-block">
								<a href="#" class="btn btn-white btn-sm " id="searchtaskType">검색 </a>
							</div>
						</div>
					</div>
					<div class="table-responsive mt-3">
						<table class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="w-1">No.</th>
									<th class="w-25">제목</th>
									<th>수신자</th>
									<th>요청일</th>
									<th>마감일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="TaskList">

							</tbody>
						</table>
					</div>


				</div>
			</div>



			<div class="card-footer d-flex justify-content-center">
				<div id="post_lists"></div>
				<div id="NMG"></div>
			</div>
		</div>

		<div class="modal modal-blur fade" id="modal-report" tabindex="-1" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">업무 등록</h5>
						<input type="hidden" id="id" value="${ loginUser.emp_id}">

						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<div class="mb-3">
							<label class="form-label">제목</label> <input type="text" class="form-control" id="Registtask_title" placeholder="Title">
						</div>

						<div class="mb-3 row">
							<div class="col-6">
								<label class="form-label">업무 형태 </label> 
								
								<div class="row">
									<label class="form-selectgroup-item col-6">
		                              <input type="radio" name="chk_info" class="form-selectgroup-input" onclick="CustomerS()" value="나의 할일">
		                              <span class="form-selectgroup-label">나의 할일</span>
		                            </label>
		                            
		                            <label class="form-selectgroup-item col-6">
		                              <input type="radio" name="chk_info" class="form-selectgroup-input" onclick="TaskSend()" value="업무 요청">
		                              <span class="form-selectgroup-label">업무 요청</span>
		                            </label>
		                            
		                            
								</div>
									 
									<input type="hidden" name="loginUserId" value="${loginUser.emp_id}">
							</div>
							<div class="col-6">
									<label class="form-label">업무 기한</label> <input type="date" class="form-control">
							</div>
						</div>



						


						<div class="mb-3 Customer">
							<label class="form-label">담당자</label> 
							<div class="row">
								<div class="col-9">
									<input  type="text" class="form-control" id="Registtast" placeholder="담당자">
								</div>
								<div class="col-3">
								 	<input type="button" id="TaskBtn" name="aprvReference" class="btn btn-primary w-100" value="사용자">
								 </div>
							 </div>
						</div>


						<div class="mb-3" id="summernoteAppendRegist">
							<label class="form-label" class="post_content">내용</label>
						</div>

						<div class="form-group" id="fileDrop">
							<label class="form-label">파일첨부</label>
							<div class="divide-y" id="appendArea">
								<label class="row m-0" style="border: 1px dotted gray; height: 100px;"  id="dragHere"> <span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
								</label>
							</div>
						</div>


					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-danger" data-dismiss="modal" onclick="cancelRegistModal()"> 닫기 </a> 
						<a href="" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="TaskInsert();"> 
						  등록
						</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 샤용자 지정 모달 -->
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
		<!-- 사용자 지정 모달 끝 -->


	</div>
</div>


<div class="peopleList"></div>
<script>
	
</script>
<%@ include file="list_detail_js.jsp"%>



