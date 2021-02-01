<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	<c:if test="${msg ne null}">
		alert("${msg}")
		location.href ="<%=request.getContextPath()%>/" + "${location}";
	</c:if>
</script>
<div class="content" id="mainDivId">
	<div class="container-xl">
		<div class="row row-deck row-cards mt-2" style="height: 200px;">
			<div class="col-sm-12">
				<div class="card mx-3 p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header p-2 d-flex" style="justify-content: space-between;">
						<span class="font-weight-bold" style="font-size: small;">내가 기안한 문서</span>
						<span style="font-size: x-small;">* 현재날짜 기준 7일</span>
					</div>
					<div class="card-body">
						<div class="row row-deck row-cards">
							<div class="card col-sm-2 mx-3 p-1" style="border-bottom: 2px solid #656d77;">
								<div class="card-header p-1" style="font-size: small;">상신</div>
								<div class="card-body p-1 text-center">
									<a href="edocList.do?main=main1" class="h2 d-inline link-primary" style="text-decoration: underline;">${map.up}</a>
									<div class="h5 d-inline">건</div>
								</div>
							</div>
							<div class="card col-sm-2 mx-3 p-1" style="border-bottom: 2px solid #206bc4;">
								<div class="card-header p-1" style="font-size: small;">진행중</div>
								<div class="card-body p-1 text-center">
									<a href="edocList.do?main=main2" class="h2 d-inline link-primary" style="text-decoration: underline;">${map.ing}</a>
									<div class="h5 d-inline">건</div>
								</div>
							</div>
							<div class="card col-sm-2 mx-3 p-1" style="border-bottom: 2px solid #5eba00;">
								<div class="card-header p-1" style="font-size: small;">결재완료</div>
								<div class="card-body p-1 text-center">
									<a href="edocList.do?main=main3" class="h2 d-inline link-primary" style="text-decoration: underline;">${map.fin}</a>
									<div class="h5 d-inline">건</div>
								</div>
							</div>
							<div class="card col-sm-2 mx-3 p-1" style="border-bottom: 2px solid #e53e3e;">
								<div class="card-header p-1" style="font-size: small;">반려</div>
								<div class="card-body p-1 text-center">
									<a href="saveList.do?main=main" class="h2 d-inline link-primary" style="text-decoration: underline;">${map.dan}</a>
									<div class="h5 d-inline">건</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row row-deck row-cards mt-2" style="height: 295px;">
			<div class="col-sm-6">
				<div class="card mx-3 p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header p-2">
						<span class="font-weight-bold" style="font-size: small;">상신문서함</span>
					</div>
					<div class="card-body px-2 py-0" style="font-size: smaller;">	
						<table class="table table-vcenter card-table">
							<thead>
								<tr>
									<th width="25%" class="text-center p-2">기안일자</th>
									<th width="60%" class="p-2">제목</th>
									<th width="25%" class="text-center p-2">상태</th>
								</tr>
							</thead>
							<tbody id="aprvList">
							</tbody>
						</table>
					</div>
					<div class="card-footer p-2 d-flex justify-content-center" id="aprvPaging">
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card mx-3 p-3">
					<div class="card-status-top bg-azure"></div>
					<div class="card-header p-2">
						<span class="font-weight-bold" style="font-size: small;">결재대기함</span>
					</div>
					<div class="card-body px-2 py-0" style="font-size: smaller;">
						<table class="table table-vcenter card-table">
							<thead>
								<tr>
									<th width="25%" class="text-center p-2">기안일자</th>
									<th width="60%" class="p-2">제목</th>
									<th width="25%" class="text-center p-2">상태</th>
								</tr>
							</thead>
							<tbody id="waitList">
							</tbody>
						</table>
					</div>
					<div class="card-footer p-2 d-flex justify-content-center" id="waitPaging">
					</div>
				</div>
			</div>
		</div>
		<div class="row row-deck row-cards mt-2" style="height: 295px;">
			<div class="col-sm-6">
				<div class="card mx-3 p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header p-2">
						<span class="font-weight-bold" style="font-size: small;">결재진행/완료함</span>
					</div>
					<div class="card-body px-2 py-0" style="font-size: smaller;">	
						<table class="table table-vcenter card-table">
							<thead>
								<tr>
									<th width="25%" class="text-center p-2">기안일자</th>
									<th width="60%" class="p-2">제목</th>
									<th width="25%" class="text-center p-2">상태</th>
								</tr>
							</thead>
							<tbody id="ingList">
							</tbody>
						</table>
					</div>
					<div class="card-footer p-2 d-flex justify-content-center" id="ingPaging">
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card mx-3 p-3">
					<div class="card-status-top bg-azure"></div>
					<div class="card-header p-2">
						<span class="font-weight-bold" style="font-size: small;">결재수신함</span>
					</div>
					<div class="card-body px-2 py-0" style="font-size: smaller;">
						<table class="table table-vcenter card-table">
							<thead>
								<tr>
									<th width="25%" class="text-center p-2">완료일자</th>
									<th width="60%" class="p-2">제목</th>
									<th width="25%" class="text-center p-2">상태</th>
								</tr>
							</thead>
							<tbody id="receList">
							</tbody>
						</table>
					</div>
					<div class="card-footer p-2 d-flex justify-content-center" id="recePaging">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="main_js.jsp" %>
<%@ include file="../common/pagination2.jsp" %>
