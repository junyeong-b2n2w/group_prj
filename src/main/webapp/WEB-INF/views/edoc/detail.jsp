<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="consList" value="${edoc.consList}" />
<c:set var="recList" value="${edoc.reciveList}" />
<c:set var="refList" value="${edoc.referList}" />
<c:set var="aprvList" value="${edoc.aprvList}" />
<c:set var="id" value="${loginUser.emp_id}"/>
<div class="card">
	<div class="card-header row">
		<div class="col-sm-1 d-flex justify-content-start">
			<input type="button" class="btn btn-sm btn-danger" value="PDF출력" onclick="movePdfPage(${edoc.ed_no})">
		</div>
		<div class="col-sm-11 d-flex justify-content-end">
			<c:if test="${edoc.ed_dftr eq id and (edoc.ed_aprvstt eq 'DED02' or edoc.ed_aprvstt eq 'DED05' or edoc.ed_aprvstt eq 'DED06')}">
				<input type="button" class="btn btn-sm mx-1 btn-warning" value="삭제" id="edocDeleteBtn">
			</c:if>
			<c:if test="${edoc.ed_dftr eq id and edoc.ed_aprvstt eq 'DED01'}">
				<input type="button" class="btn btn-sm mx-1" value="회수" id="edocCollectBtn">
			</c:if>
			<c:if test="${edoc.ed_dftr eq id and (edoc.ed_aprvstt eq 'DED02' or edoc.ed_aprvstt eq 'DED05' or edoc.ed_aprvstt eq 'DED06')}">	
				<input type="button" class="btn btn-sm mx-1" value="재기안" onclick="reAprvClick()">	
			</c:if>
			<c:if test="${edoc.ed_aprvstt eq 'DED01' or edoc.ed_aprvstt eq 'DED03'}">
				<c:if test = "${aprvMap[id].aprv_as eq 'DAP05' or aprvMap[id].aprv_as eq 'DAP35' or aprvMap[id].aprv_as eq 'DAP45'}">
					<input type="button" class="btn btn-sm mx-1 btn-info" value="결재" onclick="OpenWindow('approval.do?gno=${codeMap[id].aprv_no}&code=${aprvMap[id].aprv_as}&edno=${edoc.ed_no}','전자결재',400, 500)">	
				</c:if>
			</c:if>
			<c:if test="${edoc.ed_aprvstt eq 'DED01' or edoc.ed_aprvstt eq 'DED03'}">
				<c:if test = "${aprvMap[id].aprv_as eq 'DAP15' or aprvMap[id].aprv_as eq 'DAP25' or aprvMap[id].aprv_as eq 'DAP55' or aprvMap[id].aprv_as eq 'DAP65'}">
					<input type="button" class="btn btn-sm mx-1 btn-info" value="합의"  onclick="OpenWindow('approval.do?gno=${codeMap[id].cons_no}&code=${aprvMap[id].aprv_as}&edno=${edoc.ed_no}','전자결재',400, 400)">	
				</c:if>
			</c:if>
			<input type="button" class="btn btn-sm mx-1 btn-dark" onclick="CloseWindow()" value="닫기">	
		</div>
		
		<div class="col-sm-4 mt-1" style="font-size: x-small;">배정일시 : ${aprvMap[id].aprv_asgmdt}</div>
		<div class="col-sm-4" style="font-size: x-small;">확인일시 : ${aprvMap[id].aprv_idntydt}</div>
		<div class="col-sm-4" style="font-size: x-small;">결재일시 : ${aprvMap[id].aprv_dt}</div>
	</div>
	<div class="card-body">
		<div class="jumbotron jumbotron-fluid">
			<div class="container text-center">
				<h1 style="font-weight: bold;text-decoration: underline;">${edoc.ed_formnm}</h1>
			</div>
		</div>
		<c:if test="${fn:length(aprvList) > 0}">
			<div class="d-flex justify-content-end">
				<table class="text-center" style="font-size: x-small;">
					<tbody>
						<tr>
							<th rowspan="2" class="bg-secondary p-1">발<br>신<br>부<br>서</th>
							<th class="px-1">${edoc.ed_ranknm}</th>
							<c:forEach var="list" items="${aprvList}">
								<th class="px-1">${list.rank_nm}</th>
							</c:forEach>
							
						</tr>
						<tr>
							<td class="px-1">${edoc.ed_empnm}<br>(기안)</td>
							<c:forEach var="list" items="${aprvList}">
								<c:choose>
									<c:when test="${fn:substring(list.aprv_as, 4, 5) eq '5'}">
										<c:choose>
											<c:when test="${list.aprv_idntydt ne null}">	
												<td class="px-1">
													${list.emp_nm}<br>(확인)<br>${fn:substring(list.aprv_idntydt,2,10)}<br>${fn:substring(list.aprv_idntydt,11,19)}
												</td>
											</c:when>
											<c:when test="${list.aprv_asgmdt ne null}">	
												<td class="px-1">
													${list.emp_nm}<br>(배정)<br>${fn:substring(list.aprv_asgmdt,2,10)}<br>${fn:substring(list.aprv_asgmdt,11,19)}
												</td>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${fn:substring(list.aprv_as, 4, 5) eq '2'}">	<!-- 현재상태가 결재완료인 것들 -->
										<c:choose>
											<c:when test="${fn:substring(list.aprv_as, 3, 4) eq '0'}">	<!-- 일반결재 -->
												<td class="px-1" style="color: deepskyblue;text-decoration: underline;" onmouseleave="this.style.color='deepskyblue'" onmouseover="this.style.color='black'" onclick="OpenWindow('aprvConsDetail.do?gbcode=1&coapno=${list.aprv_no}','전자결재',400, 500)">
													${list.emp_nm}<br>(결재)<br>${fn:substring(list.aprv_dt,2,10)}<br>${fn:substring(list.aprv_dt,11,19)}
												</td>
											</c:when>
											<c:when test="${fn:substring(list.aprv_as, 3, 4) eq '3'}">	<!-- 전결 -->
												<td class="px-1" style="color: deepskyblue;text-decoration: underline;" onmouseleave="this.style.color='deepskyblue'" onmouseover="this.style.color='black'" onclick="OpenWindow('aprvConsDetail.do?gbcode=1&coapno=${list.aprv_no}','전자결재',400, 500)">
													${list.emp_nm}<br>(전결)<br>${fn:substring(list.aprv_dt,2,10)}<br>${fn:substring(list.aprv_dt,11,19)}
												</td>
											</c:when>
											<c:when test="${fn:substring(list.aprv_as, 3, 4) eq '4'}">	<!-- 대결 -->
												<td class="px-1" style="color: deepskyblue;text-decoration: underline;" onmouseleave="this.style.color='deepskyblue'" onmouseover="this.style.color='black'" onclick="OpenWindow('aprvConsDetail.do?gbcode=1&coapno=${list.aprv_no}','전자결재',400, 500)">
													${list.emp_nm}<br>(대결)<br>${fn:substring(list.aprv_dt,2,10)}<br>${fn:substring(list.aprv_dt,11,19)}
												</td>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${fn:substring(list.aprv_as, 4, 5) eq '3'}">	<!-- 현재상태가 반려인 것들 -->
										<td class="px-1" style="color: deepskyblue;text-decoration: underline;" onmouseleave="this.style.color='deepskyblue'" onmouseover="this.style.color='black'" onclick="OpenWindow('aprvConsDetail.do?gbcode=1&coapno=${list.aprv_no}','전자결재',400, 500)">
											${list.emp_nm}<br>(반려)<br>${fn:substring(list.aprv_dt,2,10)}<br>${fn:substring(list.aprv_dt,11,19)}
										</td>
									</c:when>
								</c:choose>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
		<c:if test="${fn:length(consList) > 0}">	
		<br>
			<div class="d-flex justify-content-end">
				<table class="text-center" style="font-size: x-small;">
					<tbody>
						<tr>
							<th rowspan="2" class="bg-secondary p-1">합<br><br>의</th>
							<c:forEach var="list" items="${consList}">
								<th class="px-1">${list.rank_nm}</th>
							</c:forEach>
							
						</tr>
						<tr>
							<c:forEach var="list" items="${consList}">
								<c:choose>
									<c:when test="${fn:substring(list.cons_agrestt, 4, 5) eq '5'}">	<!-- 현재상태가 합의대기인 것들 -->
										<c:choose>
											<c:when test="${list.cons_asgmdt ne null}">
												<td class="px-1">
													${list.emp_nm}<br>(배정)<br>${fn:substring(list.cons_asgmdt,2,10)}<br>${fn:substring(list.cons_asgmdt,11,19)}
												</td>
											</c:when>
											<c:when test="${list.cons_idntydt ne null}">
												<td class="px-1">
													${list.emp_nm}<br>(확인)<br>${fn:substring(list.cons_idntydt,2,10)}<br>${fn:substring(list.cons_idntydt,11,19)}
												</td>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${fn:substring(list.cons_agrestt, 4, 5) eq '2'}">	<!-- 현재상태가 합의찬성인 것들 -->
										<td class="px-1" style="color: deepskyblue;text-decoration: underline;" onmouseleave="this.style.color='deepskyblue'" onmouseover="this.style.color='black'" onclick="OpenWindow('aprvConsDetail.do?gbcode=2&coapno=${list.cons_no}','전자결재',400, 400)">
											${list.emp_nm}<br>(찬성)<br>${fn:substring(list.cons_agredt,2,10)}<br>${fn:substring(list.cons_agredt,11,19)}
										</td>
									</c:when>
									<c:when test="${fn:substring(list.cons_agrestt, 4, 5) eq '3'}">	<!-- 현재상태가 합의반대인 것들 -->
										<td class="px-1" style="color: deepskyblue;text-decoration: underline;" onmouseleave="this.style.color='deepskyblue'" onmouseover="this.style.color='black'" onclick="OpenWindow('aprvConsDetail.do?gbcode=2&coapno=${list.cons_no}','전자결재',400, 400)">
											${list.emp_nm}<br>(반대)<br>${fn:substring(list.cons_agredt,2,10)}<br>${fn:substring(list.cons_agredt,11,19)}
										</td>
									</c:when>
								</c:choose>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
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
		<div class="container mt-3" style="border: 1px solid lightgray;">
			<p>${edoc.ed_aprv}</p>
		</div>
		<c:if test="${fn:length(attachList) > 0}">
			<div class="form-group mb-3 row mt-3" id="fileDrop">
				<label class="form-label" style="font-weight: bold">첨부파일</label>
				<div class="divide-y" id="appendArea">
					<c:forEach var="attach" items="${attachList }">
						<div style="font-size: smaller;">
							<label class="row"> 
								<span class="col">${attach.attc_extnm }
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
	</div>
	<div class="card-footer">
		<table class="table bordered-table" id="">
			<c:if test="${fn:length(recList) > 0}">
				<tr>
				<td style="font-weight: bold;width: 30px">수신자</td>
				<td style="font-size: smaller;">
					<c:forEach items="${recList}" var="list" varStatus="status">
						<span class="badge my-1">${list.dept_nm}&nbsp;${list.rank_nm}&nbsp;${list.emp_nm}</span>
						<c:if test="${status.last eq false}">&nbsp;&nbsp;</c:if>
					</c:forEach>
				</td>
				</tr>
			</c:if>
			<c:if test="${fn:length(refList) > 0}">
				<tr>
				<td style="font-weight: bold;width: 30px">참조자</td>
				<td style="font-size: smaller;">
					<c:forEach items="${refList}" var="list" varStatus="status">
						<span class="badge my-1">${list.dept_nm}&nbsp;${list.rank_nm}&nbsp;${list.emp_nm}</span>
						<c:if test="${status.last eq false}">&nbsp;&nbsp;</c:if>
					</c:forEach>
				</td>
				</tr>
			</c:if>
		</table>
	</div>
</div>
<%@include file="detail_js.jsp"%>
