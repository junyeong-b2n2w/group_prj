<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<div class="content">
<div class="container-xl">
	<!-- Page title -->
          <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
			      <div class="page-pretitle">
			        	휴가관리
			      </div>
			      <h2 class="page-title">
			      	휴가 목록
			      </h2>
			    </div>
			    <div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                  <a href="javascript:goVactMain();" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-report">
					 <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
							height="24" viewBox="0 0 24 24" stroke-width="2"
							stroke="currentColor" fill="none" stroke-linecap="round"
							stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none" />
							<line x1="9" y1="6" x2="20" y2="6" />
							<line x1="9" y1="12" x2="20" y2="12" />
							<line x1="9" y1="18" x2="20" y2="18" />
							<line x1="5" y1="6" x2="5" y2="6.01" />
							<line x1="5" y1="12" x2="5" y2="12.01" />
							<line x1="5" y1="18" x2="5" y2="18.01" /></svg>
                   		메인 페이지
                  </a>
                </div>
              </div>
              </div>
           </div><!-- page title -->
             
	<div class="row row-deck row-cards">
		<div class="col-12">
              <div class="card p-3">
                <div class="card-body border-bottom py-3 ps-1">
                     <div class="d-flex" style="justify-content: flex-end;">
                    <div class="ms-auto text-muted">
                      <div class="ms-2 d-inline-block searchbox">
						<select class="form-select form-control-sm" name="searchType" id="searchType">
			              <option value="de" ${cri.searchType eq 'de' ? 'selected':'' }>검색구분</option>
			              <option value="d" ${cri.searchType eq 'd' ? 'selected':'' }>부서명</option>
			              <option value="e" ${cri.searchType eq 'e' ? 'selected':'' }>신청자</option>
			            </select>
                      </div>
                      <div class="ms-2 d-inline-block searchbox">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword" name="keyword" value="">
                      </div>
                      <div class="d-inline-block mx-0 px-0" >
                         <a href="javascript:searchList_go(1);" class="btn btn-white btn-icon" aria-label="Button">
                           <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
                         </a>
                       </div>
                       <div class="d-inline-block mx-0 px-0">
                           <a href="javascript:location.reload();" id="refreshBtn" class="btn btn-white btn-icon" aria-label="Button">
                           <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="9" y1="6" x2="20" y2="6"></line><line x1="9" y1="12" x2="20" y2="12"></line><line x1="9" y1="18" x2="20" y2="18"></line><line x1="5" y1="6" x2="5" y2="6.01"></line><line x1="5" y1="12" x2="5" y2="12.01"></line><line x1="5" y1="18" x2="5" y2="18.01"></line></svg>
                           </a>
                         </div>
                    </div>
                  </div>
                </div>
                
                <div class="table-responsive">
				  <table
						class="table table-vcenter">
				    <thead>
				      <tr>
				        <th class="w-5 text-center">No.</th>
						<th>휴가구분</th>
                       	<th>신청자</th>
						<th>소속</th>
                        <th>시작일</th>
                        <th>종료일</th>
                        <th>승인처리</th>
                        <th>비활성여부</th>
				      </tr>
				    </thead>
				    <tbody>
				     <c:forEach items="${vactList }" var="vact" varStatus="status">
                     <c:if test="${vactList ne null}">
				      <tr>
				        <td class="w-5 text-center"  >${status.index + 1}</td>
				        <td class="text-muted" >
				      	  ${vact.vact_gb}
				        </td>
				        <td class="text-muted" >
				      	  ${vact.vact_nm}
				        </td>
				        <td class="text-muted" ><a href="#" class="text-reset">${vact.vact_deptnm }</a></td>
				        <td class="text-muted" >
				          <fmt:formatDate value="${vact.vact_satymd }" pattern="yyyy-MM-dd"/>
				        </td>
				        <td class="text-muted" >
				          <fmt:formatDate value="${vact.vact_endymd }" pattern="yyyy-MM-dd"/>
				        </td>
				        <td>
				         <a  href="#aprvVact" class="goVactAprv"
				         		 		data-vact_no ="${vact.vact_no }"
				         		 		data-vact_id ="${vact.vact_id }"
				         		 		data-vact_nm="${vact.vact_nm }"
				         		 		data-vact_deptnm ="${vact.vact_deptnm }"
				         		 		
				         		 		data-vact_satymd ="<fmt:formatDate value="${vact.vact_satymd }" pattern="yyyy-MM-dd"/>"
				         		 		data-vact_endymd ="<fmt:formatDate value="${vact.vact_endymd }" pattern="yyyy-MM-dd"/>"
				         		 		data-vact_gb ="${vact.vact_gb }"
				         		 		data-vact_reason ="${vact.vact_reason }"
				         		 		data-vact_days ="${vact.vact_days }"
				         		 		
				         		 		data-vact_occurcnt ="<fmt:formatNumber value="${vact.vact_occurcnt }" pattern="0.0"/>"
				         		 		data-vact_usecnt ="<fmt:formatNumber value="${vact.vact_usecnt }" pattern="0.0"/>"
				         		 		data-vact_remcnt ="<fmt:formatNumber value="${vact.vact_remcnt }" pattern="0.0"/>"
				         		 		data-vact_aprvyn ="${vact.vact_aprvyn }"
				         		 		data-vact_delyn ="${vact.vact_delyn }"  data-toggle="modal">	
				         		 			<c:if test="${vact.vact_aprvyn eq 'N' &&  vact.vact_delyn eq 'N'}"><span class="badge bg-blue-lt">승인처리</span></c:if>
				         		 	</a>
				        
				        	
				         		 <a href="#detailVact" class="goVactDetail"
				         		 		data-vact_no ="${vact.vact_no }"
				         		 		data-vact_id ="${vact.vact_id }"
				         		 		data-vact_nm="${vact.vact_nm }"
				         		 		data-vact_deptnm ="${vact.vact_deptnm }"
				         		 		data-vact_satymd ="<fmt:formatDate value="${vact.vact_satymd }" pattern="yyyy-MM-dd"/>"
				         		 		data-vact_endymd ="<fmt:formatDate value="${vact.vact_endymd }" pattern="yyyy-MM-dd"/>"
				         		 		data-vact_gb ="${vact.vact_gb }"
				         		 		data-vact_reason ="${vact.vact_reason }"
				         		 		data-vact_days ="${vact.vact_days }"
				         		 		data-vact_occurcnt ="<fmt:formatNumber value="${vact.vact_occurcnt }" pattern="0.0"/>"
				         		 		data-vact_usecnt ="<fmt:formatNumber value="${vact.vact_usecnt }" pattern="0.0"/>"
				         		 		data-vact_remcnt ="<fmt:formatNumber value="${vact.vact_remcnt }" pattern="0.0"/>"
				         		 		data-vact_aprvyn ="${vact.vact_aprvyn }"
				         		 		data-vact_delyn ="${vact.vact_delyn }" 
				         		 		data-vact_regid ="${vact.vact_regid }" 
				         		 		data-vact_regdt ="${vact.vact_regdt }" 
				         		 		data-vact_udtid ="${vact.vact_udtid }" 
				         		 		data-vact_udtdt ="${vact.vact_udtdt }"  data-toggle="modal">
				         		 			<c:if test="${vact.vact_aprvyn eq 'Y' or  vact.vact_delyn eq 'Y'}"><span class="badge bg-yellow-lt">상세보기</span></c:if>
				         		 		
				         		 		</a>
				        
				        </td>
				        <td class="text-muted text-red" >
				        		<c:if test="${vact.vact_delyn eq 'Y'}">반려</c:if>
				        </td>
				      </tr>
				      </c:if>
				      </c:forEach>
				   
				    </tbody>
				  </table>
				</div>


				<div class="card-footer">
				<div class="row" >
				  <div class="col-12" style="display: flex; justify-content: center;">
				   <%@include file="../common/pagination.jsp" %>
				  </div>
					</div>
				</div>
              </div><!-- card -->
            </div>
            
		</div><!-- row -->
		
		
		</div><!-- containew-xl -->
	</div>
	
	
	
  <!-- 상세보기 modal -->
<div class="modal modal-blur fade" id="detailVact" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">휴가 내역 상세 조회</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 ID</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="detailVactId">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 이름</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly  id="detailVactNm">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">소속 부서</label>
                 <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="detailVactDeptNm">
                  </div>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">시작일자 </label>
                  <input type="test" class="form-control" id="detailVactSatDt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">종료일자 </label> 
                  <input type="text" class="form-control" id="detailVactEndDt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청일수 </label>
                  <input type="text" class="form-control" id="detailVactDays" readonly>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">발생연차 </label>
                  <input type="text" class="form-control" id="detailVactOccurCnt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">사용연차 </label>
                  <input type="text" class="form-control" id="detailVactUseCnt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">잔여연차 </label>
                  <input type="text" class="form-control" id="detailVactRemCnt" readonly>
                </div>
              </div>
            </div>
           <div class="row">
              <div class="col-lg-12">
                <div class="mb-3">
                  <label class="form-label">휴가 구분</label>
                  <input type="text" class="form-control" id="detailVactGb" readonly>
                </div>
              </div>
              <div class="col-lg-12">
                <div>
                  <label class="form-label">휴가 사유</label>
                  <textarea class="form-control" rows="3" id="detailVactReason" readonly></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-body">
           <label class="form-label" id="empInfo">승인여부</label>
           <input type="hidden" name="vact_id">
          <div class="table-responsive">
				  <table class="table table-vcenter">
				    <thead>
				      <tr>
				        <th>연도</th>
				        <th>휴가구분</th>
				        <th>휴가일수</th>
				        <th>승인날짜</th>
				        <th>승인/반려/대기</th>
				      </tr>
				    </thead>
				    <tbody id="empVactList">
				    </tbody>
				  </table>
				</div><!-- table -->
			<div class="card-footer d-flex align-items-center" style="justify-content: center;" id="paginationDiv2">
			 </div>
          </div><!-- modal body -->
          <div class="modal-footer">
          	<input type="hidden" id="detailVactNo">
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
    
    
<div class="modal modal-blur fade" id="aprvVact" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">휴가 승인</h5>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
           <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 ID</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly id="vactId">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청자 이름</label>
                  <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly autocomplete="off" id="vactNm">
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">소속 부서</label>
                 <div class="input-group input-group-flat">
                    <input type="text" class="form-control ps-0" value="" readonly autocomplete="off" id="vactDeptNm">
                  </div>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">시작일자 </label>
                  <input type="test" class="form-control" id="vactSatDt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">종료일자 </label> 
                  <input type="text" class="form-control" id="vactEndDt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">신청일수 </label>
                  <input type="text" class="form-control" id="vactDays" readonly>
                </div>
              </div>
            </div>
             <div class="row">
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">발생연차 </label>
                  <input type="text" class="form-control" id="vactOccurCnt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">사용연차 </label>
                  <input type="text" class="form-control" id="vactUseCnt" readonly>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="mb-3">
                  <label class="form-label">잔여연차 </label>
                  <input type="text" class="form-control" id="vactRemCnt" readonly>
                </div>
              </div>
            </div>
           <div class="row">
              <div class="col-lg-12">
                <div class="mb-3">
                  <label class="form-label">휴가 구분</label>
                  <input type="text" class="form-control" id="vactGb" readonly>
                </div>
              </div>
              <div class="col-lg-12">
                <div>
                  <label class="form-label">휴가 사유</label>
                  <textarea class="form-control" rows="3" id="vactReason" readonly></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-body">
           <label class="form-label">승인여부</label>
            <div class="form-selectgroup-boxes row mb-3">
              <div class="col-lg-4">
                <label class="form-selectgroup-item">
                  <input disabled type="radio" name="vactAprvyn"  value="1" class="form-selectgroup-input" >
                  <span class="form-selectgroup-label d-flex align-items-center p-3">
                    <span class="me-3">
                      <span class="form-selectgroup-check"></span>
                    </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">승인</span>
                    </span>
                  </span>
                </label>
              </div>
              <div class="col-lg-4">
                <label class="form-selectgroup-item">
                  <input disabled type="radio" name="vactAprvyn"  value="2" class="form-selectgroup-input" >
                  <span class="form-selectgroup-label d-flex align-items-center p-3">
                    <span class="me-3">
                      <span class="form-selectgroup-check"></span>
                    </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">진행중</span>
                    </span>
                  </span>
                </label>
              </div>
              <div class="col-lg-4">
                <label class="form-selectgroup-item">
                  <input disabled type="radio" name="vactAprvyn" value="3" class="form-selectgroup-input">
                  <span class="form-selectgroup-label d-flex align-items-center p-3">
                    <span class="me-3">
                      <span class="form-selectgroup-check"></span>
                    </span>
                    <span class="form-selectgroup-label-content">
                      <span class="form-selectgroup-title strong mb-1">반려</span>
                    </span>
                  </span>
                </label>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          	<button type="button" class="btn" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
    
 <%@ include file="list_js.jsp" %>
 <%@ include file="../common/pagination2.jsp" %>
