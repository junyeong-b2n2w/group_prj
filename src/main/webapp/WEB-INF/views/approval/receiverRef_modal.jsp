<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal modal-blur fade" id="receiverRefModal" tabindex="-1" data-keyboard="false" data-backdrop="static"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="receiverRefModalTitle"></h5>
				<input type="hidden" id="receiverRefModalGB">
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body row" style="height: 420px">
				<div class="col-sm-5">
					<div class="card" style="height: 100%">
						<ul class="nav nav-tabs nav-tabs-alt nav-tabs2"
							data-bs-toggle="tabs">
							<li class="nav-item"><a href="#tabs-gchart-10"
								class="nav-link active" data-bs-toggle="tab">조직도</a></li>
							<li class="nav-item"><a href="#tabs-search-10"
								class="nav-link" data-bs-toggle="tab">검색</a></li>
						</ul>
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-gchart-10">
									<ul id="rrtree" class="ztree"
										style="width: 100%; overflow-y: scroll; height: 310px"></ul>
								</div>
								<div class="tab-pane show" id="tabs-search-10">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="사원, 부서 검색.."> <span
											class="input-group-text" onclick="searchAprvLn2(this)">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon"
												width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
													<circle cx="10" cy="10" r="7"></circle>
													<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</span>
									</div>
									<div class="card" id="rrsearchResult"
										style="height: 270px; overflow-y: scroll;"></div>
								</div>
							</div>
						</div>
						<div class="card-footer text-right">
							<input type="button" class="btn btn-success" value="추가"
								id="rrAddBtn">
						</div>
					</div>
				</div>
				<div class="col-sm-7" style="height: 400px">
					<div class="card" style="overflow-y: scroll; height: 380px">
						<table
							class="text-center table table-bordered">
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
			<a href="#" class="btn btn-link link-secondary" data-dismiss="modal">
				닫기 </a> <a href="#" class="btn btn-primary" data-dismiss="modal" id="rrListAddBtn">
				확인 </a>
		</div>
		</div>
	</div>
</div>
<%@ include file="receiverRef_modal_js.jsp"%>