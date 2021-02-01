<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/js/jquery.ztree.all.min.js"></script>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/metroStyle/metroStyle.css"/>
   

    	<div class="content">
				<div class="container">
					<div class="page-header d-print-none">
							<div class="row align-items-center">
								<div class="col">
			
								<h1 class="page-title"><a onclick="repaging();">조직도</a></h1>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-12">
							<div class="card">
							<div class="card-status-top bg-primary"></div>
								<div class="card-header">
									<h3 class="card-title">조직도 목록</h3>
									<div class="card-options">
										<a href="#" class="card-options-collapse"
											data-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a>
										<a href="#" class="card-options-remove"
											data-toggle="card-remove"><i class="fe fe-x"></i></a>
									</div>
								</div>
								<div class="card-body">
									<div class="row">
									
										<div class="col-sm-4">
											<div class="card">
												<div class="card-header">
													<h3 class="card-title">조직도</h3>
												</div>
												<div class="card-body">
													<div class="row" style="height: 675px; overflow-y: scroll;">
														<div class="col-md-12">
															<div id="chart-container" style="background-color:white;width:100%;padding:40px 0">
															
																<ul id="tree" class="ztree" style="width:100%;overflow:auto;"></ul>
															
															</div>
															
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-8">
											<div class="card">
												<div class="card-header">
													<h3 class="card-title">부서 구성원 목록</h3>
												</div>
												     <div class="card-body border-bottom py-3 ps-1">
										                  <div class="d-flex">
										                    <div class="ms-auto text-muted">
										                     	 <div class="row g-2">
										                              <div class="col searchbox mx-0 px-0" >
										                                <input type="text" class="form-control" placeholder="사원명을 검색해주세요" id="keyword" name="emp_nm" value="">
										                              </div>
										                              <div class="col-auto mx-0 px-0" >
										                                <a href="javascript:void(0);" id="searchBtn" class="btn btn-white btn-icon" aria-label="Button">
										                                  <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
										                                </a>
										                              </div>
										                              <div class="col-auto">
										                                <a href="javascript:void(0);" id="refreshBtn"class="btn btn-white btn-icon" aria-label="Button">
										                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="9" y1="6" x2="20" y2="6" /><line x1="9" y1="12" x2="20" y2="12" /><line x1="9" y1="18" x2="20" y2="18" /><line x1="5" y1="6" x2="5" y2="6.01" /><line x1="5" y1="12" x2="5" y2="12.01" /><line x1="5" y1="18" x2="5" y2="18.01" /></svg>
										                                </a>
										                              </div>
										                            </div>
										                    </div>
										                  </div>
										                </div>
						                <div class="table-responsive">
						                  <table class="table card-table table-vcenter text-nowrap datatable ms-auto">
						                    <thead>
						                      <tr>
						                        <th class="w-2">No.</th>
						                       	<th>사원이름</th>
												<th>사원ID</th>
												<th>직급명</th>
						                        <th>부서명</th>
						                        <th class="w-5 text-center">비고</th>
						                        
						                      </tr>
						                    </thead>
						                    <tbody id="empTable">
						                    <c:forEach items="${empList }" var="emp" varStatus="status">
						                    <tr>
						                    <td><span class="text-muted">${status.index+1}</span></td>
						                    <td><span class="text-muted">${emp.emp_nm }</span></td>
						                    <td><span class="text-muted">${emp.emp_id }</span></td>
						                    <td><span class="text-muted">${emp.rank_nm }</span></td>
						                    <td><span class="text-muted">${emp.dept_nm }</span></td>
						                    <td class="text-center"><span class="text-muted"><a href="javascript:detailEmpInfo('${emp.emp_id}');" class="btn btn-primary w-20">상세보기</a></span></td>
						                    </tr>
						                    </c:forEach>
						                    </tbody>
						                  </table>
						                   	<input type="hidden" name="emp_deptno"/>
						                </div><!-- table div -->
						                <div class="card-footer">
										<div class="row" >
										  <div class="col-12" style="display: flex; justify-content: center;" id="paginationDiv">
											</div>
										</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		
		
	 <div class="modal modal-center fade" id="detailEMp" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" > 
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>직원 상세 조회</label>
				</div>
				
				<div class="modal-body">
				 <div class="row">
				                      <div class="col-auto">
				                        <span class="avatar avatar-xl" id="emp_pic"></span>
				                      </div>
				                    </div>
				          <div class="row">
				                    <div class="col-md-12">
				                      <div class="form-group mb-3 mt-3">
				                        <label class="form-label">이름</label>
				                        <input type="text" class="form-control" id="emp_nm" disabled="" value="">
				                      </div>
				                    </div>
				                    <div class="col-md-12">
				                      <div class="form-group mb-3">
				                        <label class="form-label">사내이메일</label>
				                        <input type="text" class="form-control" id="emp_email" disabled="" value="">
				                      </div>
				                    </div>
				                    <div class="col-md-12">
				                      <div class="form-group mb-3">
				                        <label class="form-label">전화번호</label>
				                        <input type="text" class="form-control" id="emp_tel" disabled=""  value="">
				                      </div>
				                    </div>
				                   
				              </div>
							</div>	
					<div class="modal-footer">
						<button type="button" class="btn btn-primary ms-auto" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	
<%@ include file="gChart_js.jsp" %>
<%@ include file="../common/pagination2.jsp" %>
			