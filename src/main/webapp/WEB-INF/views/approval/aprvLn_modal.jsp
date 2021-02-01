<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal modal-blur fade" id="approvalRegistModal"
	tabindex="-1" style="display: none;" aria-hidden="true"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-xl modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">결재선 지정</h5>
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body row" style="height: 400px">
				<div class="col-sm-4">
					<div class="card" style="height: 100%">
						<ul class="nav nav-tabs nav-tabs-alt" data-bs-toggle="tabs">
							<li class="nav-item"><a href="#tabs-home-10"
								class="nav-link active" data-bs-toggle="tab">조직도</a></li>
							<li class="nav-item"><a href="#tabs-profile-10"
								class="nav-link" data-bs-toggle="tab">검색</a></li>
						</ul>
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-home-10">
									<ul id="tree" class="ztree"
										style="width: 100%; overflow-y: scroll; height: 310px"></ul>
								</div>
								<div class="tab-pane show" id="tabs-profile-10">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="사원, 부서 검색.."> <span
											class="input-group-text" onclick="searchAprvLn(this)">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon"
												width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
													<circle cx="10" cy="10" r="7"></circle>
													<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</span>
									</div>
									<div class="card" id="searchResult"
										style="height: 250px; overflow-y: scroll;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2" style="position: relative;">
					<div class="card"
						style="text-align: center; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
						<div class="card-body">
							<a onclick="outAprvLnEmp()" id="outbtn"
								class="btn btn-outline-primary"
								style="width: 40px; height: 40px; padding: 0px;"><svg
									class="m-auto" stroke-width="2" height="24" width="24"
									stroke="currentColor" fill="none" style="width: 22px">
										<path fill="none" stroke="none"></path>
										<path
										d="M20 15h-8v3.586a1 1 0 0 1 -1.707 .707l-6.586 -6.586a1 1 0 0 1 0 -1.414l6.586 -6.586a1 1 0 0 1 1.707 .707v3.586h8a1 1 0 0 1 1 1v4a1 1 0 0 1 -1 1z" /></svg></a>
							<br> <br> <br> <a onclick="putAprvLnEmp()"
								class="btn btn-outline-primary"
								style="width: 40px; height: 40px; padding: 0px;"><svg
									style="width: 22px" class="m-auto" stroke-width="2" height="24"
									width="24" stroke="currentColor" fill="none">
										<path fill="none" stroke="none"></path>
										<path
										d="M4 9h8v-3.586a1 1 0 0 1 1.707 -.707l6.586 6.586a1 1 0 0 1 0 1.414l-6.586 6.586a1 1 0 0 1 -1.707 -.707v-3.586h-8a1 1 0 0 1 -1 -1v-4a1 1 0 0 1 1 -1z" /></svg></a>

						</div>
						<div class="card-footer px-1">
							<div class="subheader">합의구분</div>
							<hr class="m-0">
							<input type="radio" id="suncha" name="agreeGB" value="suncha"><label
								for="suncha" class="subheader">순차합의</label><br> <input
								type="radio" id="byeong" name="agreeGB" checked value="byeong"><label
								for="byeong" class="subheader">병렬합의</label>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="card" style="height: 100%">
						<div class="card-header py-1 text-left">
							<span class="card-title">결재선</span>
						</div>
						<div class="card-body" style="overflow-y: scroll; height: 260px">
							<table
								class="text-center table card-table table-vcenter text-nowrap datatable">
								<thead>
									<tr>
										<th style="width: 10%"><input type="checkbox"
											id="allCheck"></th>
										<th style="width: 20%">구분</th>
										<th style="width: 70%">이름</th>
										<th style="width: 10%">순번</th>
									</tr>
									<tr>
										<td><input type="checkbox" disabled></td>
										<td><select class='form-select m-0 p-0' disabled><option>상신</option></select>
										</td>
										<td value="${loginUser.emp_id }"
											data-name="${loginUser.dept_nm}/${loginUser.rank_nm}/${loginUser.emp_nm}">
											${loginUser.rank_nm}&nbsp;${loginUser.emp_nm}(${loginUser.dept_nm})
										</td>
										<td>기안</td>
									</tr>
								</thead>
								<tbody id="aprvLn">
								</tbody>
							</table>

						</div>
						<div class="card-footer row">
							<div class="col-sm-8">
								<input type="text" placeholder="사용자 결재선명" class="form-control"
									name="userAprvLnName">
							</div>
							<div class="col-sm-4 text-center">
								<input class="btn btn-info" value="결재선 등록" style="width: 70%"
									id="addAprvLnBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer row">
				<div class="col-sm-10 m-0 mt-3">
					<div id="accordion">
						<div class="card">
							<div class="card-header row" data-toggle="collapse" href="#collapseOne">
								<div class="col-sm-11">
									<a class="card-link">
										사용자 결재선 </a>
								</div>
								<div class="col-sm-1 text-right">
									<i class="fas fa-chevron-down"></i>
								</div>
							</div>
							<div id="collapseOne" class="collapse row" data-parent="#accordion">
								<div class="card col-sm-6">
									<div class="card-header p-1">
										<input type="text" class="form-control" name="udal_aprvlnnm" placeholder="사용자 결재선명 입력..">
										<input type="button" class="btn btn-outline-info h-4 p-0 px-3" value="전체목록" id="udalRefreshBtn">
										<input type="button" class="btn btn-info h-4 p-0 px-3" value="검색" id="udalSearchBtn">
									</div>
									<div class="card-body">
										<table class="table card-table table-vcenter text-nowrap datatable">
											<thead>
												<tr>
													<th style="width: 20%;" class="userAprvLnOrder" role="udal_no">구분<i class="fas fa-sort ml-3"></i></th>
													<th style="width: 50%;" class="userAprvLnOrder" role="udal_aprvlnnm">이름<i class="fas fa-sort ml-3"></i></th>
													<th style="width: 30%;" class="userAprvLnOrder" role="udal_regymd">등록일자<i class="fas fa-sort ml-3"></i></th>
												</tr>
											</thead>
											<tbody style="font-size: smaller;" id="udalListAppend">
											</tbody>
										</table>
									</div>
									<div class="card-footer d-flex justify-content-center p-1" id="udalListPaging">
									</div>
								</div>
								<div class="card col-sm-6">
									<div class="card-body" style="height: 185px;overflow-y:scroll; min-height: 165px">
										<table class="table card-table table-vcenter text-nowrap datatable">
											<thead>
												<tr>
													<th style="width: 10%;">순서</th>
													<th style="width: 20%;">구분</th>
													<th style="width: 35%;">부서</th>
													<th style="width: 35%;">이름</th>
												</tr>
											</thead>
											<tbody style="font-size: smaller;" id="selectedUalg">
											</tbody>
										</table>
									</div>
									<div class="card-footer p-1 text-right">
										<input type="hidden" id="selectedUdalNo">
										<input type="hidden" id="selectedUdalTitle">
										<input type="button" class="btn btn-cyan btn-sm" value="적용" id="inAprvLnUdalBtn">
										<input type="button" class="btn btn-danger btn-sm" value="삭제" id="deleteAprvLnBtn">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2 m-0 mt-3">
					<a href="#" class="btn btn-link link-secondary"
						data-dismiss="modal"> 닫기 </a> <a href="#" class="btn btn-primary"
						data-dismiss="modal" id="aprvLnAddBtn"> 확인 </a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="aprvLn_modal_js.jsp"%>
