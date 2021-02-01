<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">

					<h2 class="page-title">공지사항</h2>
				</div>
			</div>
		</div>
		<!-- page title -->

		<div class="row row-deck row-cards">
			<div class="col-12">
				<div class="card p-3">
					<div class="card-header"
						style="border-bottom: 2px solid #206bc4 !important;">
						<h3 class="card-title">공지게시글 상세</h3>
					</div>
					<div class="card-body py-3">
						<form>
							<div class="form-group mb-3 ">
								<label class="form-label">제목</label>
								<div>
									<input type="text" class="form-control bg-white"
										value="${notice.ntc_title }" readonly>
								</div>
							</div>
							<div class="form-group mb-3 ">
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">작성자</label>
											<div class="input-group input-group-flat">
												<input type="text" class="form-control bg-white ps-0" readonly
													value="${notice.ntc_writerid }">
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="mb-3">
											<label class="form-label">작성일자</label> <input type="date"
												class="form-control bg-white" readonly="readonly"
												value="<fmt:formatDate value='${notice.ntc_regdt }' pattern='yyyy-MM-dd'/>">
										</div>
									</div>
									<div class="col-lg-2">
										<div class="input-icon mb-3">
											<label class="form-label">조회수</label>
											<div class="input-icon mb-3">
												<span class="input-icon-addon"> <svg
														xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
														height="24" viewBox="0 0 24 24" stroke-width="2"
														stroke="currentColor" fill="none" stroke-linecap="round"
														stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none" />
														<line x1="3" y1="12" x2="6" y2="12" />
														<line x1="12" y1="3" x2="12" y2="6" />
														<line x1="7.8" y1="7.8" x2="5.6" y2="5.6" />
														<line x1="16.2" y1="7.8" x2="18.4" y2="5.6" />
														<line x1="7.8" y1="16.2" x2="5.6" y2="18.4" />
														<path d="M12 12l9 3l-4 2l-2 4l-3 -9" /></svg>
												</span> <input type="text" class="form-control bg-white"
													value="${notice.ntc_views }" readonly>
											</div>
										</div>
									</div>
									
								</div>
							</div>
								

							<div class="form-group mb-3">
								<div class="col-lg-12">
									<div>
										<label class="form-label">내용</label>
										<div class="form-control"style="height: 500px;overflow-y: scroll;">${notice.ntc_cont }</div>
									</div>
								</div>
							</div>
							
								<c:if test="${attachList ne null}">
								<div class="form-group mb-3 row" id="fileDrop">
									<label class="form-label">첨부파일</label>
									<div class="divide-y" id="appendArea">
										<c:forEach var="attach" items="${attachList }">
											<div>
												<label class="row"> <span class="col">${attach.attc_extnm }
														<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
													<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" /><polyline points="7 11 12 16 17 11" /><line x1="12" y1="4" x2="12" y2="16" /></svg>
													</a>
												</span> 
												</label>
											</div>
										</c:forEach>
									</div>
								</div>
						</c:if>
							<!--file첨부 -->
							<div class="form-footer">
								<c:if test="${notice.ntc_writerid ne loginUser.emp_id }">
			          				<c:set var="none" value="none"></c:set>
	          					</c:if>
								<div class="d-flex" style="justify-content: flex-end;">
									<button type="button" class="btn btn-outline-yellow mx-1" onclick="goModNotice();"  style="display:${none}">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon"
											width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
											stroke="currentColor" fill="none" stroke-linecap="round"
											stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none" />
											<polyline points="6 21 21 6 18 3 3 18 6 21" />
											<line x1="15" y1="6" x2="18" y2="9" />
											<path
												d="M9 3a2 2 0 0 0 2 2a2 2 0 0 0 -2 2a2 2 0 0 0 -2 -2a2 2 0 0 0 2 -2" />
											<path
												d="M19 13a2 2 0 0 0 2 2a2 2 0 0 0 -2 2a2 2 0 0 0 -2 -2a2 2 0 0 0 2 -2" /></svg>
										수정
									</button>
									<button type="button" class="btn btn-outline-danger mx-1"
										onclick="delNotice('${notice.ntc_no}');"  style="display:${none}">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon m-0"
											width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
											stroke="currentColor" fill="none" stroke-linecap="round"
											stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<line x1="4" y1="7" x2="20" y2="7" />
										<line x1="10" y1="11" x2="10" y2="17" />
										<line x1="14" y1="11" x2="14" y2="17" />
										<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
										<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
										&nbsp;삭제

									</button>
									<button type="button" class="btn btn-primary mx-1"
										onclick="goNoticeList();">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon"
											width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
											stroke="currentColor" fill="none" stroke-linecap="round"
											stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none" />
											<line x1="9" y1="6" x2="20" y2="6" />
											<line x1="9" y1="12" x2="20" y2="12" />
											<line x1="9" y1="18" x2="20" y2="18" />
											<line x1="5" y1="6" x2="5" y2="6.01" />
											<line x1="5" y1="12" x2="5" y2="12.01" />
											<line x1="5" y1="18" x2="5" y2="18.01" /></svg>
										목록
									</button>
								</div>
							</div>
						</form>
						
					</div>

				</div>
				<!-- card -->
			</div>
			<!-- col-12 -->
		</div>
		<!-- row -->
	</div>
	<!-- containew-xl -->
</div>

<form name="deleteNotice" action="<%=request.getContextPath()%>/notice/remove" method="post">
	<input type="hidden" name="ntc_no" />
</form>

<script>
<c:if test="${msg ne null}">
	alert('<c:out value="${msg}"/>');
</c:if>


var ntc_no = ${notice.ntc_no};

function goNoticeList(){
	location.href = "<%=request.getContextPath()%>/notice/list"
}
function goModNotice(){
	location.href = "<%=request.getContextPath()%>/notice/modifyForm?ntc_no="+ntc_no;
}

function delNotice(num){
	if(confirm("정말 삭제하시겠습니까 ? ")){
		$('input[name="ntc_no"]').val(num);
		
		var form = $('form[name="deleteNotice"]');
		form.submit();
			
	}else{
		return;
	}
	
}


</script>