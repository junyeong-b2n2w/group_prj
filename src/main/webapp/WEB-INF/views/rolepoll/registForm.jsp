<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col-sm-10">
					<h2 class="page-title">설문조사 등록</h2>
				</div>
				<div class="col-sm-2">
					<input class="btn btn-primary" type="button" value="등록하기">
				</div>
			</div>
		</div>
		<!-- page title -->

		<div class="row row-deck row-cards">
			<div class="col-12">
				<div class="card">
					<div class="card-header row px-4">
						<div class="col-sm-12">
							<div class="input-group mb-2">
								<span class="input-group-text text-center" style="width: 109px">
									제&nbsp;&nbsp;&nbsp;목 </span> <input type="text" class="form-control"
									placeholder="설문조사 제목" autocomplete="off" name="pollTitle">
							</div>
							<div class="input-group mb-2">
								<span class="input-group-text text-center pollUserChoice"
									style="width: 109px"> 대상자 설정 </span>
								<div id="pollUserInput" class="form-control"
									style="color: #959595">대상자를 선택해주세요...</div>
							</div>
						</div>
					</div>

					<div class="card-body border-bottom sortableQuestions">
						<div class="card m-3 questionCard show">
							<div class="card-status-top bg-primary"></div>
							<div class="card-header p-2 ">
								<div class="input-group">
									<input type="text" class="form-control questionTitle" value="제목없는 질문" >
									<span class="input-group-text font-weight-bold"
										style="background: #FAFAFA"> <select class='m-0 p-0 questionKindSelect'
										style="border: none; background: #FAFAFA">
											<option value="answer">주관식</option>
											<option value="choice" selected>객관식</option>
											<option value="multiple">다중선택</option>
									</select>
									</span>
									<span class="btn btn-warning ml-3 p-1 text-center" style="border-radius: 1px;" onclick="deleteQuestion(this)">
										<i class="fas fa-times m-0" style="font-size: 20px;"></i> 
									</span>
								</div>
							</div>
							<div class="card-body p-1">
								<table class="table table-vcenter card-table table-striped">
									<tbody class="sortableOptions">
										<tr class="questionOptions">
											<td>
												<div class="input-group">
													<span class="input-group-text"> <input
														class="form-check-input" type="radio" checked>
													</span> 
													<input type="text" class="form-control" autocomplete="off" placeholder="옵션 내용 입력..">
													<span class="input-group-text btn-danger" onclick="deleteOptions(this)">
						                              <i class="fas fa-trash-alt"></i>
						                            </span>
													<span class="input-group-text">
						                              <i class="fas fa-sort"></i>
						                            </span>
												</div>
											</td>
										</tr>
										<tr class="questionOptions">
											<td>
												<div class="input-group">
													<span class="input-group-text"> <input
														class="form-check-input" type="radio" checked>
													</span> 
													<input type="text" class="form-control" autocomplete="off" placeholder="옵션 내용 입력..">
													<span class="input-group-text btn-danger" onclick="deleteOptions(this)">
						                              <i class="fas fa-trash-alt"></i>
						                            </span>
													<span class="input-group-text">
						                              <i class="fas fa-sort"></i>
						                            </span>
												</div>
											</td>
										</tr>
									</tbody>
									<tfoot class="othersOptionArea">
									</tfoot>
								</table>
							</div>
							<div class="card-footer p-1 text-center">
								<a class="optionAddBtn">옵션추가 하기</a>
								<span class="othersBtnArea"> 또는 
									<a class="otherAddBtn">기타 옵션..</a>
								</span>
							</div>
							<div class="text-center" style="background: #FAFAFA"><i class="fas fa-ellipsis-h"></i></div>
						</div>
					</div>
					<div class="card-footer text-center row">
						<div class="col-sm-1"></div>
						<div class="col-sm-10 addQuestion">
							질문 추가하기 <i class="fas fa-plus"></i>
						</div>
						<div class="col-sm-1 onTheTop">
							<i class="fas fa-angle-double-up"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="poll_modal.jsp"%>
<%@ include file="registForm_js.jsp"%>