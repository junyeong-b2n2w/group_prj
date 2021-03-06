<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.searchInput {
	font-size: smaller;
	height: 27px;
}
.searchSelect{
	border: none;
	background: rgba(35,46,60,.024);
    color: #656d77;
    font-weight: bold;
}
</style>
<div class="content">
	<div class="container-xl">
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">
					<h2 class="page-title">참조/열람함</h2>
				</div>
			</div>
		</div>
		<div class="row row-deck row-cards">
			<div class="col-12">
				<div class="card p-3">
					<div class="card-body py-3"
						style="border-bottom: 2px solid #206bc4 !important;">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-6">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">
												<select class='m-0 p-0 searchSelect' name='priSearchSelect'>
													<option value="ed_aprv">결재내용</option>
													<option value="ed_aprvtitle">결재제목</option>
												</select>
											</span> <input type="text" class="form-control searchInput" name="priSearchInput">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">기안부서</span>
											<input type="text" class="form-control searchInput" name="ed_deptnm">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">기안자</span>
											<input type="text" class="form-control searchInput" name="ed_empnm">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">
												<select class='m-0 p-0 searchSelect' name='dateSel'>
													<option value="ed_regymd">기안일자</option>
													<option value="ed_comymd">완료일자</option>
											</select>
											</span>
											<input type="date" class="form-control searchInput" name="startdate">&nbsp;-&nbsp;
											<input type="date" class="form-control searchInput" name="enddate"> 
										</div>
									</div>
									<div class="col-sm-4">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">양식명</span>
											<input type="text" class="form-control searchInput" name="ed_formnm">
										</div>
									</div>
									<div class="col-sm-2" style="text-align: end;">
										<input type="button" class="btn btn-outline-info h-4 p-0 px-3" value="전체목록" id="refreshBtn">
										<input type="button" class="btn btn-info h-4 p-0 px-3" value="검색" id="searchBtn">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive mt-4">
						<div class="col-sm-12 d-flex justify-content-end"
							style="letter-spacing: 2px">
							<h6>
								결재완료<i class="fas fa-check-circle h5 text-success mr-1"></i>
							</h6>
						</div>
						<table
							class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th style="width: 11%;" class="edocListorderby" role="ed_no">문서번호<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 9%;" class="edocListorderby" role="ed_empnm">기안자<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 9%;" class="edocListorderby" role="ed_deptnm">기안부서<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 10%;" class="edocListorderby" role="ed_formnm">양식이름<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 33%;" class="edocListorderby" role="ed_aprvtitle">제목<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 11%;" class="edocListorderby" role="ed_regymd">기안일<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 11%;" class="edocListorderby" role="ed_comymd">완료일<i class="fas fa-sort ml-3"></i></th>
									<th style="width: 5%;">열람</th>
								</tr>
							</thead>
							<tbody style="font-size: smaller;" id="aprvListAppend">
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex align-items-center"
						style="justify-content: center;" id="aprvListPaging"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/pagination2.jsp" %>
<%@ include file="receiveList_js.jsp" %>
<%@include file="ReadingAuth_modal.jsp"%>