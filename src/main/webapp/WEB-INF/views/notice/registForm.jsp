<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">
					<h2 class="page-title">공지사항</h2>
				</div>
				<!-- Page title actions -->
				<div class="col-auto ms-auto d-print-none">
					<button type="button" class="btn btn-primary"
						onclick="javascript:goNoticeList();">
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
						목록
					</button>
				</div>
			</div>
		</div>
		<div class="card card-lg">
			<div class="card-header">
				<h3 class="card-title">공지사항 등록</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<form name="registForm" action="<%=request.getContextPath() %>/notice/regist" method="post">
						<div class="form-group mb-3 row">
							<label class="form-label col-2 col-form-label">제목</label>
							<div class="col">
								<input type="text" class="form-control" placeholder="제목을 입력해주세요"
									id="ntc_title" name="ntc_title">
							</div>
						</div>
						<div class="form-group mb-3 row">
							<label class="form-label col-2 col-form-label">작성자</label>
							<div class="col">
								<input type="text" class="form-control" placeholder="작성자ID" name="ntc_writerid"
									readonly="readonly" value="${loginUser.emp_id }">
							</div>
						</div>
						<div class="form-group mb-3 row">
							<label class="form-label col-2 col-form-label pt-0">팝업여부</label>
							<div class="col-1">
								<label class="form-check"> <input class="form-check-input" type="checkbox" id="ntc_popyn" name="ntc_popyn"> <span class="form-check-label">팝업게시</span>
								</label>
							</div>
							<div class="col-2 previewBtn" style="display: none;">
								<a href="" onclick="previewPopupOpen();"
									class="btn btn-outline-primary d-none d-sm-inline-block"
									data-toggle="modal"> <svg
										xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<circle cx="10" cy="10" r="7" />
										<line x1="7" y1="10" x2="13" y2="10" />
										<line x1="10" y1="7" x2="10" y2="13" />
										<line x1="21" y1="21" x2="15" y2="15" /></svg> 미리보기
								</a>
							</div>
						</div>
						<div class="form-group mb-2 row popupDate" style="display: none;">
							<label class="form-label col-3 col-form-label pt-0"></label>
							<div class="col-4">
								<div class="row">
									<label class="form-label col-4 col-form-label">팝업 게시 일자:</label>
									<div class="col">
										<div class="input-icon">
											<input id="startDate" type="datetime-local" class="form-control" name="ntc_popsatymd"/>
										</div>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="row">
									<label class="form-label col-4 col-form-label">팝업 종료
										일자:</label>
									<div class="col">
										<div class="input-icon">
											<input id="endDate" type="datetime-local" name="ntc_popendymd"
												class="form-control flatpickr-input">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group mb-3 row">
							<label class="form-label">내용</label>
							<div>
								<textarea class="form-control" name="ntc_cont" id="summernoteContent"></textarea>
							</div>
						</div>
						<div class="form-group mb-3 row" id="fileDrop">
						
						<div>
                              <label class="row">
                                <span class="col">파일첨부</span>
                                <span class="col-auto">
                                <a href="javascript:void(0)" class="btn btn-white mb-2" aria-label="Button"   onclick="chooseFile()">
		                              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M14 3v4a1 1 0 0 0 1 1h4"></path><path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"></path><line x1="12" y1="11" x2="12" y2="17"></line><line x1="9" y1="14" x2="15" y2="14"></line></svg>
		                         	  파일등록</a>
                                </span>
                              </label>
                            </div>
							<input type="file" multiple id="chFile" style="display: none" onchange="AjaxuploadFile();">
							<div class="divide-y" id="appendArea">
								<label class="row m-0"
									style="border: 1px dotted gray; height: 100px;" id="dragHere">
									<span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
								</label>
							</div>
						</div>
				</form>
				</div>
				<div class="form-footer">
					<button type="button" onclick="registNoticeBtn();" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal modal-blur fade" id="preViewPopup" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div class="d-flex" style="justify-content: flex-start;">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon text-danger"
						width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
						stroke="currentColor" fill="none" stroke-linecap="round"
						stroke-linejoin="round">
						<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
						<path d="M12 9v2m0 4v.01"></path>
						<path
							d="M5 19h14a2 2 0 0 0 1.84 -2.75l-7.1 -12.25a2 2 0 0 0 -3.5 0l-7.1 12.25a2 2 0 0 0 1.75 2.75"></path></svg>
					<h5 class="modal-title">&nbsp;공지사항</h5>
				</div>
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body text-center px-5">
				<p class="empty-subtitle text-muted">
					<a href="#">'게시판> 공지사항'</a> 에서 확인하실 수 있으며 아래 링크를 누르시면 바로 이동하실 수
					있습니다.
				</p>
				<div class="empty-action">
					<p class="empty-title  bg-red-lt">
						<a href="#" id="preview_title"></a>
					</p>
				</div>
				<div class="previewContent"
					style="max-height: 100%; min-height: 100%;"></div>
			</div>
			<div class="modal-footer">
				<label class="form-check form-switch"> <input
					class="form-check-input" type="checkbox"> <span
					class="form-check-label">하루동안 보지 않기</span>
				</label>
			</div>
		</div>
	</div>
</div>
<%@ include file="regist_js.jsp" %>
