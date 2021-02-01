<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="content">
	<div class="container-xl">
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">
					<h2 class="page-title">기안등록</h2>
				</div>
			</div>
		</div>
		<hr class="m-0 mb-2">
		<div style="text-align: right;">
			<input type="button" name="aprvReciveTarget"
				class="btn btn-outline-primary" value="수신처 설정"> <input
				type="button" name="aprvReference" class="btn btn-outline-primary"
				value="참조자 설정"> <a href="#" class="btn btn-primary"
				data-toggle="modal" data-target="#approvalRegistModal">결재선 지정</a> <a
				href="#" class="btn btn-primary aprvFormRegistBtn">결재 요청</a> <a
				href="#" class="btn btn-info tempSaveBtn">임시 저장</a> <a href="<%= request.getContextPath() %>/edoc/main"
				class="btn btn-danger">등록 취소</a>
		</div>
		<br>
		<div>
			<input type="hidden" id="agreeGB">
			<div class="d-flex justify-content-end table-responsive">
				<div class="fright">
					<div class="fleft">
						<table class="table table-bordered text-center">
							<tbody>
								<tr id="aprvLnTrRank">
									<th rowspan="2" class="bg-secondary noneRemove">발<br>신<br>부<br>서
									</th>
									<th class="noneRemove">${loginUser.rank_nm }</th>
								</tr>
								<tr id="aprvLnTrName">
									<td height="60" class="noneRemove">${loginUser.emp_nm }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="d-none d-flex justify-content-end table-responsive"
				id="consLnTable">
				<div class="fright">
					<div class="fleft">
						<table class="table table-bordered text-center">
							<tbody>
								<tr id="consLnTrRank">
									<th rowspan="2" class="bg-secondary noneRemove">합<br>
									<br>
									<br>의
									</th>
								</tr>
								<tr id="consLnTrName">
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<span id='inputChk' style='display: none' value='${form.af_no }'></span>
			<div id="approvalBox" class="mt-3 row m-0 d-flex justify-content"
				style="border: 1px dashed lightgray; min-height: 20px;">
				<c:forEach items="${comList}" var="list">
					<c:set var="cont" value="${fn:split(list.cp_cont,',')}" />
					<div class='dragComponent row p-0 m-0 mb-1 ${cont[4]}'
						style= 'border:1px solid lightgray'>
						<div class='text-center'
							style='width:${cont[1]}px; font-size: 0.7rem'>
							<span class='align-middle'>${list.cp_nm}</span>
						</div>
						<div>
							<input class='form-control' style='border: 0px solid;'
								id='${list.cp_tag }' name='${list.cp_tag }' ${cont[3]} />
						</div>
					</div>
				</c:forEach>
			</div>
			<textarea id="summernoteContent"></textarea>
		</div>
		<br>
		<c:if test="${fn:length(attachList) > 0}">
			<div class="form-group mb-3 row mt-3" id="fileDrop">
				<label class="form-label" style="font-weight: bold">첨부파일</label>
				<div class="divide-y" id="appendArea">
					<c:forEach var="attach" items="${attachList }">
						<div id="fileRow">
							<label class="row"> 
								<span class="col">
									${attach.attc_extnm }
									<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"	height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none" />
											<path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
											<polyline points="7 11 12 16 17 11" />
											<line x1="12" y1="4" x2="12" y2="16" />
										</svg>
									</a>
								</span> 
								<span class="col-auto"> 
									<label class="form-check form-check-single form-switch"> 
										<small data-src="${attach.attc_no }" class='oldFile'> 
											<a href="javascript:void(0);" onclick="deleteFileByAttcNo('${attach.attc_no}',this)">
												<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
													<line x1="18" y1="6" x2="6" y2="18"></line>
													<line x1="6" y1="6" x2="18" y2="18"></line>
												</svg>
											</a>
										</small>
									</label>
								</span>
							</label>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
		<c:if test="${fn:length(attachList) eq 0}">
			<div class="form-group mb-3 row" id="fileDrop">
				<label class="form-label">파일첨부</label>
				<div class="divide-y" id="appendArea">
					<label class="row" style="border: 1px dotted gray; height: 100px;"
						id="dragHere"> <span class="text-center p-4">여기에 파일을
							drag &amp; drop 해주세요</span>
					</label>
				</div>
			</div>
		</c:if>
		<br>
		<div style="text-align: right;">
			<a class="btn btn-secondary" onclick="chooseFile()">파일 등록</a> <input
				type="file" class="d-none" multiple id="aprvAddFile"
				onchange="ajaxUploadFile()"> 
		</div>
		<hr>
		<div style="text-align: right;">
			<a href="#" class="btn btn-secondary" data-toggle="modal"
				data-target="#approvalRegistModal">결재선 지정</a> <a href="#"
				class="btn btn-secondary aprvFormRegistBtn">결재 요청</a> <a href="#"
				class="btn btn-secondary tempSaveBtn">임시 저장</a> <a href="<%= request.getContextPath() %>/edoc/main"
				class="btn btn-secondary">등록 취소</a>
		</div>
	</div>
</div>
<%@ include file="aprvLn_modal.jsp"%>
<%@ include file="registForm_js.jsp"%>
<%@ include file="receiverRef_modal.jsp"%>
<%@ include file="tempSave_js.jsp"%>


