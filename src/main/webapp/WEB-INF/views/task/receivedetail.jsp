<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.button {
	margin: .4em;
	padding: 1em;
	cursor: pointer;
	background: #e1e1e1;
	text-decoration: none;
	color: #3d3d3d;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

.box-shadow-outset {
	display: inline-block;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-property: box-shadow;
	transition-property: box-shadow;
	-webkit-transform: translateZ(0);
	-ms-transform: translateZ(0);
	transform: translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	background: white;
	color: black;
	border: 1px solid;
}

.box-shadow-outset:hover {
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.6);
}
</style>

<div class="content">
	<div class="container">


<div class="con-header">
	<h1 style="font-weight: bold; margin-bottom: 0px; padding: 25px; border-bottom: 1px inset;">수신 업무 요청 조회</h1>
	<div id="navId" class="breadcrumb-line"></div>
</div>
<input type="hidden" value="${task.tasc_no }" class="tascNO">
<table class="table">
	<caption></caption>
	<colgroup>
		<col width="120px">
		<col width="*">
		<col width="120px">
		<col width="*">
	</colgroup>
	<tbody style="border-width: thick;">
		<tr>
			<th scope="row">제목</th>
			<td class="ellipsis" title="제목" style="background: white;"><a href="javascript:void(0);" onclick="addPriority(this, 'SPRO', 'TASK', '53434684', 'U277823');return false;" class="mr5"> <i class="icon nonimp"></i> <span class="blind">${task.task_title }</span>
			</a></td>

			<th scope="row">상태</th>
			<td style="background: white;"><span class="todo-cate-box1 color2">${taskOne.perf_progress }% </span></td>
		</tr>
		<tr>
			<th scope="row">지시자</th>
			<td colspan="3" style="background: white;">
				<div class="director-info">
					<div>
						<span class="per26"> <!-- IMG -->
						</span> <span> ${taskOne.rank_nm }&nbsp;${taskOne.emp_nm } </span>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row">업무기한</th>
			<td colspan="3" style="background: white;"><fmt:formatDate value='${task.task_regdt }' pattern='yyyy-MM-dd' /> <span>~</span> <fmt:formatDate value='${task.task_ddlndt }' pattern='yyyy-MM-dd' /></td>
		</tr>
		<tr>
			<th scope="row">등록일</th>
			<td style="background: white;"><fmt:formatDate value='${task.task_regdt }' pattern='yyyy-MM-dd HH:mm' /></td>
			<th scope="row">수정일</th>
			<td style="background: white;"><fmt:formatDate value='${task.task_udtdt }' pattern='yyyy-MM-dd HH:mm' /></td>
		</tr>
		<tr>
			<th scope="row">담당자</th>
			<td colspan="3" style="background: white;">
				<ul class="worker-info" style="list-style-type: none; margin-left: -15px;">
					<li>
						<div>
							<c:forEach items="${taskAll }" var="taskall">
								<span class="per26">${taskall.rank_nm }&nbsp;${taskall.emp_nm },</span>
							</c:forEach>
						</div>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td colspan="3" id="formEditorDataTd" style="background: white;">
				<div class="task_management">

					<p style="font-family: &amp; quot; 맑은 고딕&amp;quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">${task.task_cont }</p>

				</div>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td colspan="3" id="taskAttachFile" style="background: white;">
				<!-- 첨부파일 리스트 --> <c:if test="${attachList ne null}">
					<div class="form-group mb-3 row">
						<div class="divide-y">
							<c:forEach var="attach" items="${attachList }">
								<div id="fileRow">
									<div>
										<label class="row"> <span class="col">${attach.attc_extnm } <a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
														stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
											</a>
										</span>
										</label>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if> <!-- 첨부파일 리스트 끝 -->
			</td>
		</tr>
		<c:if test="${performer.perf_stt eq '반려' }">
			<tr>
				<th scope="row">반려 사유</th>
				<td colspan="3" style="background: white;">
					<div class="director-info">
						<div>
							<span class="per26"></span> <span> ${performer.perf_rere } </span>
						</div>
					</div>
				</td>
			</tr>
		</c:if>
	</tbody>
</table>
	
	<div class="btn-wrap pr10" style="float: right;">
		<button type="button" class="btn btn-color7 br" onclick="MainGoPage();">홈으로</button>
	</div>
	

<c:if test="${performer.perf_stt eq '대기'}">
	<c:if test="${performer.perf_empid eq loginUser.emp_id }">
		<div class="d-flex Bokay" style="justify-content: flex-end;">
			<div class="col-3 col-sm-1 col-md-1 col-sm mb-1">
				<a href="#" class="btn btn-outline-primary w-100" style="border-width: medium;" onclick="Bokay('승인');"> 업무 승인 </a>
			</div>
		</div>
		<div class="d-flex Bdel" style="justify-content: flex-end;">
			<div class="col-3 col-sm-1 col-md-1 col-sm mb-1">

				<a href="" class="btn btn-outline-danger w-100" data-keyboard="false" data-backdrop="static" data-toggle="modal" data-target="#modal-report" id="modalRegistBtn" style="border-width: medium;"> 업무 반려 </a>
				<div class="modal modal-blur fade" id="modal-report" tabindex="-1" style="display: none;" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">반려 사유</h5>


								<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<div class="mb-3">
									<label class="form-label">반려 내용 </label> <input type="text" class="form-control" id="returnCont" placeholder="Cont">
								</div>


							</div>
							<div class="modal-footer">
								<a href="#" class="btn btn-link link-secondary" data-dismiss="modal" onclick="cancelRegistModal()"> Cancel </a> <a href="" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="Bdel('반려',${task.tasc_no });"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="12" y1="5" x2="12" y2="19"></line>
									<line x1="5" y1="12" x2="19" y2="12"></line></svg> Create New Board
								</a>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</c:if>
</c:if>

<c:if test="${performer.perf_stt eq '진행'}">
	<div class="con-cardDetail">
		<div class="con-header">
			<div class="accordion-button" data-toggle="collapse" data-target="#collapse-1" aria-expanded="true">
				<h1 style="font-weight: bold; padding: 25px; border-bottom: 1px inset; margin-bottom: 0px;">처리 내역 ▽</h1>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<div class="accordion" id="accordion-example">
					<div class="accordion-item">
						<div id="collapse-1" class="accordion-collapse collapse" data-bs-parent="#accordion-example" style="">
							<div class="accordion-body pt-0">

								<div class="inform-wrap" style="padding: 7px;">
									<div class="statement">

										<!--                                 <span class="todo-cate-box1 color2">미완료</span> -->


										<div class="form-block">
											<form id="todoForm" name="todoForm" class="form-horizontal" action="/groupware/todo/saveTodo.do?OWASP_CSRFTOKEN=0J7A-5ZK8-DTD7-IJ5P-DVLL-G0DL-6I48-7N7Z" method="post">
												<input type="hidden" name="workerId" value="U277823"> <input type="hidden" name="taskId" value="53434684"> <input type="hidden" name="userStatus" value="A"> <input type="hidden" name="searchConditionString"
													value="todoStatus『9~fromDay『20201020235404~toDay『20210119235404~searchType『A~searchText『~directorId『U277823~workerId『U277823~pageIndex『1~pagePerRecord『10~searchTaskType『1~sortColumn『TODOSTATUS~sortType『ASC"> <input type="hidden" name="subworkCode" value="TASK"> <input
													type="hidden" name="facilityApprovalType" value=""> <input type="hidden" name="userType" value="0"> <input type="hidden" name="taskType" value="1"> <input type="hidden" name="strFolderId" value=""> <input type="hidden" name="progress" value="100">
												<input type="hidden" name="taskStatus" value="A">
												<table class="table">
													<caption></caption>
													<tbody>
														<tr>
															<th scope="row">담당자</th>
															<td style="background: white; width: 59%;"><span class="per26">${taskRe.rank_nm }&nbsp;${taskRe.emp_nm }</span></td>
															<th scope="row" style="width: 125px;">최종 수정일</th>
															<td style="background: white;"><fmt:formatDate value='${taskRe.perf_cmpl}' pattern='yyyy-MM-dd HH:mm' /></td>
														</tr>
														<tr>
															<th scope="row" style="width: 110px;">진척률</th>
															<td colspan="3" style="background: white;">
																<ul style="list-style-type: none; display: -webkit-inline-box; margin-left: -10px;">
																	<li class="percent"><a id="Percent0" target="_top" onclick="per0(0);" class="button box-shadow-outset" data-value='0'><span>0%</span></a></li>
																	<li class="percent"><a id="Percent20" target="_top" onclick="per20(20);" class="button box-shadow-outset" data-value='20'><span>20%</span></a></li>
																	<li class="percent"><a id="Percent40" target="_top" onclick="per40(40);" class="button box-shadow-outset" data-value='40'><span>40%</span></a></li>
																	<li class="percent"><a id="Percent60" target="_top" onclick="per60(60);" class="button box-shadow-outset" data-value='60'><span>60%</span></a></li>
																	<li class="percent"><a id="Percent80" target="_top" onclick="per80(80);" class="button box-shadow-outset" data-value='80'><span>80%</span></a></li>
																	<li class="percent"><a id="Percent100" target="_top" onclick="per100(100);" class="button box-shadow-outset" data-value='100'><span>100%</span></a></li>
																</ul> <input type="hidden" id="percentValue"> <input type="hidden" id="emptyBar" value="${performer.perf_progress}">

																<div class="container" style="margin-left: 0px;">
																	<div class="progress" style="width: 30%; height: 25px;">
																		<div class="progress-bar progress-bar-info" id="percentTaskBar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: ${performer.perf_progress}%">
																			<div class="percentbar" id="percentBarContent">${performer.perf_progress}%</div>
																		</div>
																	</div>
																</div>
																<div class="tdprogress" style="width: 448px;">
																	<div class="bar-chart-todo">
																		<div class="bar-chart">
																			<div id="progressBar" class="bar" style="width: 100%;"></div>
																		</div>
																	</div>
																</div>
																<div style="margin: 12px;">
																	<span><i class="icon exclamation02"></i> 업무완료(100%) 후에는 업무 내용을 수정할 수 없습니다.</span>
																</div> <!-- 	                                            <span id="progress" class="w50 text-right text-point-b"> 

<!--                                                 </span> -->
															</td>
														</tr>

														<c:if test="${performer.perf_empid eq loginUser.emp_id }">
															<tr>
																<th scope="row" style="width: 6%;">업무내용</th>
																<td colspan="3" style="background: white;"><textarea id="summernoteContent" name="post_cont" rows="" cols="">${performer.perf_cont }</textarea>
																	<div>
																		<span><i class="icon exclamation02"></i> 해당 업무는 업무완료(100%)후에만 지시자가 업무 내용을 확인할 수 있습니다.</span>
																	</div></td>
															</tr>
														</c:if>
														<c:if test="${performer.perf_empid ne loginUser.emp_id }">
															<tr>
																<th scope="row" style="width: 6%;">업무내용</th>
																<td colspan="3" style="background: white;">
																	<div style="width: 100%; background: #ded9d9; height: auto;">${performer.perf_cont }</div>
																	<div>
																		<span><i class="icon exclamation02"></i> 해당 업무는 업무완료(100%)후에만 지시자가 업무 내용을 확인할 수 있습니다.</span>
																	</div>
																</td>
															</tr>
														</c:if>



													</tbody>
												</table>
												<input type="hidden" value="${performerwork.perf_progress }">
												<c:if test="${attachList2 ne null}">
													<div class="form-group mb-3 row">
														<div class="divide-y">
															<c:forEach var="attach" items="${attachList2 }">
																<div id="fileRow">
																	<div>
																		<label class="row"> <span class="col">${attach.attc_extnm } <a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
																						viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
																			</a>
																		</span> <span class="col-auto"> <label class="form-check form-check-single form-switch"> <small data-src="${attach.attc_no }" class="newFile"> <a href="javascript:void(0);" onclick="deleteFileByAttcNo('${attach.attc_no}',this)"> <svg
																								xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																			<line x1="18" y1="6" x2="6" y2="18"></line>
																			<line x1="6" y1="6" x2="18" y2="18"></line></svg>
																					</a>
																				</small>
																			</label>
																		</span>
																		</label>
																	</div>
																</div>
															</c:forEach>
														</div>
													</div>
												</c:if>
												<c:if test="${performer.perf_empid eq loginUser.emp_id }">
													<div class="form-group mb-3 row" id="fileDrop">
														<label class="form-label">파일첨부</label>
														<div class="divide-y" id="appendArea">
															<label class="row" style="border: 1px dotted gray; height: 100px;" id="dragHere"> <span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
															</label>
														</div>
													</div>
												</c:if>
											</form>
										</div>
										<div class="btn-wrap pr10" style="float: right;">
											<button id="uploadFromFileBox" type="button" class="btn btn-color7 br" onclick="">파일첨부</button>
											<button type="button" class="btn btn-color5 br" onclick="completeButton();" style="">업무처리</button>
											<button type="button" class="btn btn-color7 br" onclick="BackTaskListGo();">목록</button>
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
</c:if>

</div>
</div>

<%@ include file="receiverlist_detail_js.jsp"%>

