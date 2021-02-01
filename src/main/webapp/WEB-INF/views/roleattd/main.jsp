<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
 
<div class="content">
<div class="container-xl">
	<!-- Page title -->
          <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
			      <div class="page-pretitle">
			        	근태관리
			      </div>
			      <h2 class="page-title">
			      	근태 현황 조회
			      </h2>
			    </div>
              </div>
           </div><!-- pageHeader -->
            <div class="row row-cards">

			<div class="col-md-3 col-lg-3">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">오늘 출근자 수</h3>
	                      <div class="h1 m-0"><a href="javascript:void(0);" onclick="goTodayGTWList();">${todayGTWCnt }</a></div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-green-lt">
<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><path d="M16 11l2 2l4 -4" /></svg>
	                    </div>
	                  </div>
			</div>
			<div class="col-md-3 col-lg-3">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">오늘 퇴근자 수</h3>
	                      <div class="h1 m-0"><a href="javascript:void(0);" onclick="goTodayOffList();">${todayOffWCnt }</a></div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-indigo-lt">
	                 <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><path d="M16 11l2 2l4 -4" /></svg>
	                  </div>
			</div>
			</div>
			<div class="col-md-3 col-lg-3">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">수정 요청자 수</h3>
	                      <div class="h1 m-0"><a href="javascript:void(0);" onclick="goTodayReqList();">${modReqCnt }</a></div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-cyan-lt">
	                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><path d="M16 11h6m-3 -3v6" /></svg>
	                   </div>
	                  </div>
			</div>
			<div class="col-md-3 col-lg-3">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">오늘 지각자 수</h3>
	                      <div class="h1 m-0"><a href="javascript:void(0);" onclick="goTodayLateList();">${lateCnt }</a></div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-red-lt">
	                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><line x1="19" y1="7" x2="19" y2="10" /><line x1="19" y1="14" x2="19" y2="14.01" /></svg>
	                   </div>
	                  </div>
			</div>
			
           <div class="col-12 mt-3">
				<div class="card p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header">
						<h3 class="card-title">출퇴근 목록</h3>
					</div>
							<div class="card-body">
								<div class="row">
									<div class="col-sm-2">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">부서명</span>
											<input type="text" class="form-control searchInput" name="dept_nm">
										</div>
									</div>
									<div class="col-sm-2">
										<div class="input-group mb-2">
											<span class="input-group-text font-weight-bold searchInput">사원이름</span>
											<input type="text" class="form-control searchInput" name="emp_nm">
										</div>
									</div>
									<div class="col-sm-2">
										<div class="input-group">
		                              
											<span class="input-group-text font-weight-bold searchInput">근무형태</span>
		                              <select class='m-0 p-0 form-control searchInput pl-2' name='attd_workshape'>
												<option selected disabled>형태선택</option>
												<option value="GAT01">정상처리</option>
												<option value="GAT02">근무이상</option>
												<option value="GAT03">출근</option>
												<option value="GAT04">외근/출장</option>
												<option value="GAT05">휴가</option>
												<option value="GAT06">수정요청</option>
												<option value="GAT07">비활성화</option>
											</select>
		                            </div>
									</div>
									<div class="col-sm-6">
										<div class="input-group mb-2">
											<span class="searchInput">
												<select class='form-select searchSelect' name='dateSel'>
													<option value="attd_gtwtime">출근일자</option>
													<option value="attd_offwtime">퇴근일자</option>
											</select>
											</span>
											<input type="date" class="form-control searchInput" name="startdate">&nbsp;-&nbsp;
											<input type="date" class="form-control searchInput" name="enddate"> 
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-8">
									</div>
									
									<div class="col-sm-4" style="text-align: end;">
										<input type="button" class="btn btn-outline-primary h-4 p-0 px-3" value="전체목록" id="refreshBtn">
										<input type="button" class="btn btn-primary h-4 p-0 px-3" value="검색" id="searchBtn">
									</div>
								</div>
							</div>
					<!-- card header -->
					<div class="table-responsive">
						<table
							class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="w-5 text-center roleattendorderby" role="attd_no">No.</th>
									<th class="roleattendorderby" role="dept_nm">부서명</th>
									<th>출근자ID/이름</th>
									<th class="roleattendorderby" role="attd_gtwtime">출근날짜</th>
									<th class="roleattendorderby" role="attd_offwtime">퇴근날짜</th>
									<th class="roleattendorderby" role="attd_wsnm">근무형태</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody id="attdListAppend">
							</tbody>
						</table>
					</div>
					<!-- table div -->


					<div class="card-footer d-flex" style="height: 11%;justify-content: center;">
						<div class="row">
							<div class="col-10 col-sm-4 col-md-6 col-xl mb-3" id="paginationDiv">
							</div>
						</div>
					</div>
				</div>
				<!-- card -->
		</div>
		 </div>
		</div><!-- containew-xl -->
	</div>
	<div class="modal modal-blur fade" id="detailAttend" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">상세 조회</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">ID</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="detailAttdId">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">이름</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly  id="detailAttdNm">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">소속 부서</label>
                 <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="detailAttdDeptNm">
                  </div>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-6">
                <div class="mb-3">
                  <label class="form-label">출근일자 </label>
                  <input type="text" class="form-control" id="detailAttdGTWDt" readonly>
                </div>
              </div>
              <div class="col-lg-6">
                <div class="mb-3">
                  <label class="form-label">퇴근일자일자 </label> 
                  <input type="text" class="form-control" id="detailAttdOFFDt" readonly>
                </div>
              </div>
         
            </div>
          </div>
          <div class="modal-body">
	           <div class="form-group mb-3">
		           <label class="form-label" id="empInfo">출퇴근처리형태</label>
		          <div>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox" value="GAT01" id="GAT01" name="chkWs" disabled="disabled">
		              <span class="form-check-label">정상처리</span>
		            </label>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox" value="GAT02" id="GAT02" name="chkWs" disabled="disabled">
		              <span class="form-check-label">근무이상</span>
		            </label>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox"  value="GAT03" id="GAT03" name="chkWs" disabled="disabled">
		              <span class="form-check-label">출근</span>
		            </label>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox" value="GAT04" id="GAT04" name="chkWs" disabled="disabled">
		              <span class="form-check-label">외근/출장</span>
		            </label>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox"  value="GAT05" id="GAT05" name="chkWs" disabled="disabled">
		              <span class="form-check-label">휴가</span>
		            </label>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox" value="GAT06" id="GAT06" name="chkWs" disabled="disabled">
		              <span class="form-check-label">수정요청</span>
		            </label>
		            <label class="form-check">
		              <input class="form-check-input" type="checkbox"  value="GAT07" id="GAT07" name="chkWs" disabled="disabled">
		              <span class="form-check-label">비활성화</span>
		            </label>
		          </div>
			 </div>
          </div><!-- modal body -->
          <div class="modal-footer" id="modbtnArea">
          	<input type="hidden" id="detailAttdNo">
          </div>
        </div>
      </div>
	</div>
	    <form action="<%=request.getContextPath()%>/role/attend/modifyAttend" method="post" name="modAttendForm">
		    <input type="hidden" name="attd_no">
		    <input type="hidden" name="attd_gtwtime">
		    <input type="hidden" name="attd_offwtime">
	     </form>
<%@ include file="../common/pagination2.jsp" %>	
<%@ include file="main_js.jsp" %>	
	