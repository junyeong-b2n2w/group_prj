<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<div class="content">
<div class="container-xl">
	<!-- Page title -->
          <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
			      <div class="page-pretitle">
			        	휴가 기록
			      </div>
			      <h2 class="page-title">
			      	나의 휴가 현황
			      </h2>
			    </div>
              </div>
           </div><!-- pageHeader -->
            <div class="row row-cards">
			<div class="col-md-4 col-lg-4">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title"> 발생 연차</h3>
	                      <div class="h1 m-0">${anuualvo.vact_occurcnt }</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-yellow-lt">
	                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M15 4.5l-4 4l-4 1.5l-1.5 1.5l7 7l1.5 -1.5l1.5 -4l4 -4" /><line x1="9" y1="15" x2="4.5" y2="19.5" /><line x1="14.5" y1="4" x2="20" y2="9.5" /></svg>
	                    </div>
	                  </div>
			</div>
			<div class="col-md-4 col-lg-4">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">사용 연차</h3>
	                      <div class="h1 m-0">${anuualvo.vact_usecnt }</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-blue-lt">
	                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M15 4.5l-4 4l-4 1.5l-1.5 1.5l7 7l1.5 -1.5l1.5 -4l4 -4" /><line x1="9" y1="15" x2="4.5" y2="19.5" /><line x1="14.5" y1="4" x2="20" y2="9.5" /></svg>
	                    </div>
	                  </div>
			</div>
			<div class="col-md-4 col-lg-4">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">잔여 연차</h3>
	                      <div class="h1 m-0">${anuualvo.vact_remcnt }</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-red-lt">
	                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M15 4.5l-4 4l-4 1.5l-1.5 1.5l7 7l1.5 -1.5l1.5 -4l4 -4" /><line x1="9" y1="15" x2="4.5" y2="19.5" /><line x1="14.5" y1="4" x2="20" y2="9.5" /></svg>
	                     </div>
	                  </div>
			</div>
			</div>
			 <div class="row row-eq-height">
           <div class="col-6 mt-3">
             <div class="card p-3 h-100">
             <div class="card-header">
                 <div class="row">
                 <div class="col-12 d-flex"style="justify-content: flex-start;">
				      <h3 class="card-title">휴가신청 내역</h3>
                 </div>
                 
                 </div>
		    </div>
                 <div class="card-body">
                 <div class="d-flex" style="justify-content: flex-end;">
                    <div class="ms-auto text-muted">
                      <div class="ms-2 d-inline-block">
                      <select class="form-select form-control-sm" name="searchSelect" id="searchType">
			              <option value="vact_criy">기준연도</option>
			              <option value="vact_gb">휴가구분</option>
			            </select>
                      </div>
                      <div class="ms-2 d-inline-block searchbox">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword" name="searchInput" value="">
                      </div>
                      <div class="d-inline-block mx-0 px-0" >
                         <a href="javascript:void(0);" class="btn btn-white btn-icon" aria-label="Button" id="searchBtn">
                           <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
                         </a>
                         <a href="javascript:void(0);" id="refreshBtn" class="btn btn-white btn-icon" aria-label="Button">
										                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="9" y1="6" x2="20" y2="6"></line><line x1="9" y1="12" x2="20" y2="12"></line><line x1="9" y1="18" x2="20" y2="18"></line><line x1="5" y1="6" x2="5" y2="6.01"></line><line x1="5" y1="12" x2="5" y2="12.01"></line><line x1="5" y1="18" x2="5" y2="18.01"></line></svg>
										                                </a>
                       </div>
                    </div>
                  </div>
                  
                </div>
                <div class="table-responsive">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                      <tr>
                        <th class="w-1">No.</th>
                        <th>기준연도</th>
                        <th>휴가구분</th>
                        <th>휴가일수</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody id="empVactList">
                    
                    </tbody>
                  </table>
                 </div><!-- table div -->
                <div class="card-footer d-flex align-items-center" style="justify-content: center;"id="paginationDiv">
	                </div><!-- paginaion -->
	              </div><!-- card -->
		</div>
           <div class="col-6 mt-3">
             <div class="card p-3 h-100">
             <div class="card-header">
		      <h3 class="card-title">휴가신청</h3>
		    </div>
                <div class="card-body">
			      <form name="vactRegisttForm" action="<%=request.getContextPath()%>/vacation/regist" method="post" accept-charset="utf-8">
			       <div class="form-group mb-3 row">
			          <label class="form-label col-3 col-form-label required">휴가 구분</label>
			          <div class="col">
			            <select class="form-select" id="vactGB">
			              <option value="1">연차</option>
			              <option value="2">반차</option>
			              <option value="3">공가</option>
			              <option value="4">예비군</option>
			              <option value="5">병가</option>
			            </select>
			          </div>
			        </div>
			        <div class="form-group mb-3 row">
			          <label class="form-label col-3 col-form-label required">시작일자</label>
                  <div class="col">
                    <div class="input-group">
                      <input type="date" class="form-control" name="vact_satymd" id="regSatYmd">
                    </div>
                  </div>
                  <div class="col-auto">—</div>
                  <div class="col">
                    <div class="input-group"> 
                      <input type="date" class="form-control" name="vact_endymd" id="regEndYmd">
                    </div>
                  </div>
			        </div>
			        <div class="form-group mb-3 row">
			          <label class="form-label col-3 col-form-label">휴가 사유</label>
			          <div class="col">
			           <textarea class="form-control" rows="3" name ="vact_reason"></textarea></div>
			        </div>
			        <div class="form-footer d-flex" style="justify-content: flex-end;">
			        <input type="hidden" name="vact_days" id="vact_days">
			        <input type="hidden" name="vact_gb" id="vact_gb">
			        <input type="hidden" name="vact_id" value="${loginUser.emp_id }">
			       	 <c:set var="now" value="<%=new java.util.Date()%>" />
			        <input type="hidden" name="vact_criy" value="<fmt:formatDate value='${now}' pattern='yyyy' />">
			          <button type="button" class="btn btn-primary" onclick="registVact();">저장</button>
			        </div>
			      </form>
			    </div>
	              </div><!-- card -->
		</div>
		 </div><!-- row -->
           
</div>
</div>

<%@ include file="../common/pagination2.jsp" %>
<%@ include file="modify_js.jsp" %>
<%@ include file="regist_js.jsp" %>
<%@ include file="modal.jsp" %>

<form name="modifyVactForm" action="<%=request.getContextPath()%>/vacation/modify" method="post">

	<input type="hidden" name="vact_no" id="modVno">
	<input type="hidden" name="vact_satymd" id="modSymd">
	<input type="hidden" name="vact_endymd" id="modEymd">
	<input type="hidden" name="vact_gb" id="modGb">
	<input type="hidden" name="vact_reason" id="modReson">
	<input type="hidden" name="vact_days" id="modDays">

</form>
<script>

<c:if test="${msg ne null}">
alert('<c:out value="${msg}"/>');
</c:if>

var data = new Object();
window.addEventListener('load',function(){
	
var setting = {
		table : "vacation",	// DB테이블명(필수)
		searchno : "${loginUser.emp_id}",
		primarykey : "vact_no",		// DB기본키명(필수)
		defaultorderby : "vact_regdt",		// DB정렬기준 컬럼(필수)
		onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
			data =res;
			var changRes = "";
			if(res != null){
				code = "";
				$.each(res, function(i, obj) {
					code += "<tr>";
					code += " <td>"+(i+1)+"</td>";
					code += " <td>"+res[i].vact_criy+"</td>";
			      	code += " <td class='text-muted'>"+res[i].vact_gb+"</td>";
			        code += " <td class='text-muted'>"+res[i].vact_days+"</td>";
			        code += " <td><button type='button'class='badge bg-yellow-lt' onclick='detailMyVact("+res[i].vact_no+");'>상세보기</button></td>";
					code += "</tr>";
			
				})
			}else{
				code = "<tr>";
				code += " <td colspan='5'>휴가 승인 내역이 존재하지 않습니다</td>";
				code += "</tr>";
			}
			$("#empVactList").empty();
			$("#empVactList").append(code)
		},
		searchBtn : "searchBtn",// 검새버튼 아이디 추가
		refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
		sellikeMap : {selName : "searchSelect", input : "searchInput"},
		equalMap : "vact_id",// =조건 검색추가시 추가 컬럼명(TAGNAME)
		displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
		perPageNum : 3		// 한페이지당 보여줄 리스트 개수
	}
	var test = new Pagination(setting);	// pagination 객체생성
	test.setPagenation("paginationDiv","getlist", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
})


</script>