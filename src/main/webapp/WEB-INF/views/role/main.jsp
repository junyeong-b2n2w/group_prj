
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  	
    <div class="content">
      <div class="container">
       <div class="page-header d-print-none">
          <div class="row align-items-center">
            <div class="col">
              <h3 class="page-title">
                관리자 메인
              </h3>
            </div>
          </div>
      </div>
      <div class="row">
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-danger"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								${regiEdoc.PERCENT }% <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="3 17 9 11 13 15 21 7"></polyline>
									<polyline points="14 7 21 7 21 14"></polyline></svg>
							</span>
						</div>
						<div class="h1 m-0">${regiEdoc.TODAY_COUNT }</div>
						<div class="text-muted mb-3">오늘 등록된 전자문서</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-danger"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								${ingEdoc.PERCENT }% <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="3 17 9 11 13 15 21 7"></polyline>
									<polyline points="14 7 21 7 21 14"></polyline></svg>
							</span>
						</div>
						<div class="h1 m-0">${ingEdoc.TODAY_COUNT }</div>
						<div class="text-muted mb-3">현재 진행중인 전자문서</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-danger"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								${endEdoc.PERCENT }% <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="3 17 9 11 13 15 21 7"></polyline>
									<polyline points="14 7 21 7 21 14"></polyline></svg>
							</span>
						</div>
						<div class="h1 m-0">${endEdoc.TODAY_COUNT }</div>
						<div class="text-muted mb-3">오늘 완료된 전자문서</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-primary"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								${waitTask.PERCENT }% <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="3 17 9 11 13 15 21 7"></polyline>
									<polyline points="14 7 21 7 21 14"></polyline></svg>
							</span>
						</div>
						<div class="h1 m-0">${waitTask.TODAY_COUNT }</div>
						<div class="text-muted mb-3">오늘 등록된 업무</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-primary"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								${ingTask.PERCENT }% <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="3 17 9 11 13 15 21 7"></polyline>
									<polyline points="14 7 21 7 21 14"></polyline></svg>
							</span>
						</div>
						<div class="h1 m-0">${ingTask.TODAY_COUNT }</div>
						<div class="text-muted mb-3">현재 진행중인 업무</div>
					</div>
				</div>
			</div>

			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-primary"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								${endTask.PERCENT }% <svg xmlns="http://www.w3.org/2000/svg" class="icon ms-1"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="3 17 9 11 13 15 21 7"></polyline>
									<polyline points="14 7 21 7 21 14"></polyline></svg>
							</span>
						</div>
						<div class="h1 m-0">${endTask.TODAY_COUNT }</div>
						<div class="text-muted mb-3">오늘 완료된 업무</div>
					</div>
				</div>
			</div>


		</div>
      <!--  2행  -->
      <div class="row mt-3">
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-cyan"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								
							</span>
						</div>
						<div class="h1 m-0">${calData.TODAY_REGI }</div>
						<div class="text-muted mb-3">오늘 등록된 일정</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-cyan"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
							</span>
						</div>
						<div class="h1 m-0">${calData.TODAY }</div>
						<div class="text-muted mb-3">오늘 예정된 일정</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-yellow"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
								
							</span>
						</div>
						<div class="h1 m-0">${todayGTWCnt }</div>
						<div class="text-muted mb-3">오늘 출근자</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-yellow"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
							</span>
						</div>
						<div class="h1 m-0">${ todayOffWCnt}</div>
						<div class="text-muted mb-3">오늘 퇴근자</div>
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-yellow"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
							</span>
						</div>
						<div class="h1 m-0">${lateCnt }</div>
						<div class="text-muted mb-3">오늘 지각자</div>
					</div>
				</div>
			</div>

			<div class="col-2">
				<div class="card">
				<div class="card-status-top bg-yellow"></div>
					<div class="card-body p-2 text-center">
						<div class="text-end text-green">
							<span class="text-green d-inline-flex align-items-center lh-1">
							</span>
						</div>
						<div class="h1 m-0">${vactCnt}</div>
						<div class="text-muted mb-3">오늘 휴가자</div>
					</div>
				</div>
			</div>


		</div>
      
       
      </div>
    </div>
    
    <script>
					
				</script>
		
