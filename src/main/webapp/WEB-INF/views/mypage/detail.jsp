
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
				<div class="content">
				<div class="container">
					<div class="page-header d-print-none">
								<h2 class="page-title">직원정보</h2>
							</div>
							<div class="col-12">
							
						<div class="card p-3">
								
								<div class="card-header"> 
									<h3>내정보 보기</h3> 
								</div>
								<div class="card-body"> 
								<table class="table border-top"
									style="border-collapse: separate;">
									<caption></caption>
									<colgroup>
										<col width="160px">
										<col width="*">
										<col width="160px">
										<col width="*">
									</colgroup>
									<tbody>
									
									
									
										<tr>
											<th scope="row"><span class="text-point-b"></span>아이디</th>
											<td colspan="1" class="row">
													${empVO.emp_id }
											</td>
											<th rowspan="3" scope="row"><img id="profileImg" src="<%=request.getContextPath() %>/img/getImg?fileName=${empVO.emp_pic}"
														 style="width: 90px; height:120px;  border: 0; vertical-align: middle;"></th>
											<td rowspan="3">
												<div id="divSingleFileUpload" class="photo-area">
													
													<div class="ins">
														<p></p>
														<div class="t1">
														</div>
													</div>
<!-- 													<div class="btn-wrap"> -->
<!-- 														<button type="button" id="btnSelectFile" -->
<!-- 															class="btn btn-warning btn-sm">수정</button> -->
<!-- 														<button type="button" id="deleteImg" -->
<!-- 															class="btn btn-danger btn-sm">삭제</button> -->
														
<!-- 													</div> -->
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>이름</th>
											<td colspan="1">${empVO.emp_nm }</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>패스워드</th>
											<td colspan="1">
												<button type="button" onclick="passwdChangeModal()"
															class="btn btn-danger btn-sm">비밀번호 수정</button>
											</td>
										</tr>
										
										
										
										
										
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>핸드폰</th>
											<td>
												${empVO.emp_ph }
											</td>
											<th scope="row"><span class="text-point-b"></span>서명파일</th>
											<td>
											</td>
										</tr>
										
										
										<!-- 이메일 -->
										<tr>
											<th scope="row"><span class="text-point-b"></span>
												내부 이메일</th>
											<td>
												${empVO.emp_inemail }
											</td>
											<th scope="row"><span class="text-point-b"></span>외부 이메일</th>
											<td>
												${empVO.emp_outemail }
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>부서</th>
											<td>
												

					                             	${empVO.dept_nm }

											</td>
											<th scope="row"><span class="text-point-b"></span>사번</th>
											<td>
												${empVO.emp_empno }
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>직급</th>
											<td>
					                             	${empVO.rank_nm }
											</td>
											<th scope="row"><span class="text-point-b"></span>직책</th>
											<td>
												${empVO.emp_pos }
												
											</td>
										</tr>
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>수습구분?</th>
											<td>
												${not empty empVO.emp_proter_endymd ? '수습' : '비수습' }
											</td>
											<th scope="row"><span class="text-point-b"></span>수습기간 종료일</th>
											<td>
												${fn:substring(empVO.emp_proter_endymd,0,10)}
											</td>
										</tr>
										
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>성별</th>
											<td>
					                               ${empVO.emp_gend eq '남' ? '남' : '여'  }
											</td>
											<th scope="row"><span class="text-point-b"></span>생년월일</th>
											<td>
												${fn:substring(empVO.emp_brdt,0,10)}
											</td>
										</tr>
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>연봉</th>
											<td>
												${empVO.emp_ysal }
											</td>
											<th scope="row"><span class="text-point-b"></span>급여계약기준</th>
											<td>
												${empVO.emp_salctrstdd }
											</td>
										</tr>
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>재직상태</th>
											<td>
												${empVO.emp_tnrstt }
											</td>
											<th scope="row"><span class="text-point-b"></span>입사일자</th>
											<td>
												${fn:substring(empVO.emp_jncmpymd,0,10)}
											</td>
										</tr>
										
									
									</tbody>
								</table>
								</div>
							
						</div>
							
							
							
							</div>
						</div>
						<!-- content header -->
					</div>
		
		<!--비밀번호 모달-->
	<div class="modal modal-blur fade" id="password-modal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title">비밀번호 변경</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			  <div class="row mb-3 align-items-end">
				
				<div class="col">
				  <label class="form-label">기존 비밀번호</label>
				  <input type="password" name="old_pass" class="form-control">
				</div>
			  </div>
			  <div class="row mb-3 align-items-end">
				
				<div class="col">
				  <label class="form-label">새로운 비밀번호</label>
				  <input type="password" name="new_pass" placeholder="영어, 숫자, 특수문자 9~16자리 조합" class="form-control is-invalid">
				</div>
			  </div>
			  <div class="row mb-3 align-items-end">
				
				<div class="col">
				  <label class="form-label">새로운 비밀번호 재입력</label>
				  <input type="password" name="new_pass2"  placeholder="영어, 숫자, 특수문자 9~16자리 조합" class="form-control is-invalid">
				</div>
			  </div>
	
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn me-auto" data-bs-dismiss="modal">닫기</button>
			  <button type="button" onclick="passwdChange()" class="btn btn-primary" data-bs-dismiss="modal">비밀번호 변경</button>
			</div>
		  </div>
		</div>
	  </div>
<!--비밀번호 모달 끝-->
		
		<script>
			window.onload=function(){
				$('#empModifyBtn').on('click', function(){
					location.href="modiForm?emp_id=${empVO.emp_id}"
				})
				$('#cancelBtn').on('click', function(){
					location.href="list"
				})
				
				
			}
			function passwdChangeModal(emp_id){
				$('#password-modal').modal('show');
			}
			 
			flag1 = false;
			flag2 = false;
			const regPW = /^[a-zA-Z]+[a-zA-Z0-9!@#$%^&]{8,15}$/g;

			$('input[name="new_pass"]').on(
					'change',
					function() {
						if (regPW.test($('input[name="new_pass"]').val())) {
							flag1 = true;
							$('input[name="new_pass"]').removeClass(
									'is-invalid').addClass('is-valid');
						} else {
							flag1 = false;
							$('input[name="new_pass"]').addClass('is-invalid')
									.removeClass('is-valid');
						}
					})

			$('input[name="new_pass2"]').on(
					'change',
					function() {
						if ($('input[name="new_pass"]').val() == $(
								'input[name="new_pass2"]').val()) {
							flag2 = true;
							$('input[name="new_pass2"]').removeClass(
									'is-invalid').addClass('is-valid');
						} else {
							flag2 = false;
							$('input[name="new_pass2"]').addClass('is-invalid')
									.removeClass('is-valid');
						}
					})

			function passwdChange() {

				if (!flag1) {
					alert("비밀번호 형식에 맞지 않습니다.")
					$('input[name="new_pass"]').focus();
					return false;
				}
				if (!flag2) {
					alert("비밀번호 확인이 맞지 않습니다.")
					$('input[name="new_pass2  "]').focus();
					return false;
				}

				$.ajax({
					type : "POST",
					url : '<%=request.getContextPath()%>/passwordChange',
				    	data : {
				    			emp_id : "${loginUser.emp_id}",
				    			old_pass : $('input[name="old_pass"]').val(),
				    			new_pass : $('input[name="new_pass"]').val()	
				    	},
				    	success: function(result) {
				    		alert(result)
				    		$('#password-modal').modal('hide');
				    		$('#password-modal input').val("");
				    	},
				    	error:function(result){
				    		alert(result.responseText)
				    		$('input[name="old_pass"]').focus();
				    	}
				  	});
			}
			
	
		</script>
			