<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-4">
	<div class="col-sm-12 h-100">
		<div class="col-12 h-50">
			<div class="card p-3 h-100">
				<div class="card-status-top bg-primary"></div>
				<div class="card-header">
					<h3 class="card-title">직급등록</h3>
				</div>
				<!-- card header -->
				<div class="card-body">
					<div class="form-group mb-3 row">
						<label class="form-label col-3 col-form-labe">직급이름</label>
						<div class="col">
							<input type="text" name="regRankName" id="regRankName"
								class="form-control" maxlength="50">
						</div>
					</div>
					<div class="form-group mb-3 row">
						<label class="form-label col-3 col-form-label">상위직급</label>
						<div class="col">
							<select class="form-select" name="uprank" id="uprank">
								<option value="" disabled selected>상위 직급을 선택해 주세요</option>
								<c:forEach items="${rankList }" var="rank">
									<option value="${rank.rank_no }">${rank.rank_nm }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-footer"
						style="justify-content: flex-end; display: flex;">
						<button class="btn btn-primary w-25" type="button"
							onclick="registBtn();">저장</button>
						<button class="btn btn-outline-primary w-25" type="reset"
							value="Reset">취소</button>
					</div>
				</div>

			</div>
			<!-- card -->
		</div>
		<div class="col-12 h-50">
			<div class="card p-3 h-100">
				<div class="card-status-top bg-primary"></div>
				<div class="card-header">
					<h3 class="card-title">직급수정</h3>
				</div>
				<!-- card header -->
				<div class="card-body">
					<form id="modForm"
						action="<%=request.getContextPath()%>/rank/modify" method="post">
						<div class="form-group mb-3 row">
							<label class="form-label col-3 col-form-labe">직급코드</label>
							<div class="col">
								<input type="text" id="modRankNO" name="rank_no"
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group mb-3 row">
							<label class="form-label col-3 col-form-labe">직급이름</label>
							<div class="col">
								<input type="text" name="rank_nm" id="modRankNm"
									class="form-control" maxlength="50">
							</div>
						</div>
						<div class="form-group mb-3 row">
							<label class="form-label col-3 col-form-label">상위직급</label>
							<div class="col">
								<select class="form-select" name="rank_uprank" id="modUprank">
									<option value="" disabled selected>상위 직급을 선택해 주세요</option>
									<c:forEach items="${rankList }" var="rank">
										<option value="${rank.rank_no }">${rank.rank_nm }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-footer"
							style="justify-content: flex-end; display: flex;">
							<button class="btn btn-primary w-25" type="button"
								onclick="modBtn();">저장</button>
							<button class="btn btn-outline-primary w-25" type="reset"
								value="Reset">취소</button>
						</div>
					</form>
				</div>
			</div>
			<!-- card -->
		</div>
	</div>
</div>