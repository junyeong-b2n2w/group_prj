
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
			
				<div class="container">
					<div class="page-header d-print-none">
						<div class="row align-items-center">
							<div class="col-12">
								<h2 class="page-title">직원정보</h2>
							</div>
							</div>
							</div>
							<div class="col-12">
							
						<div class="card">
								
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
													<div class="btn-wrap">
														<button type="button" id="btnSelectFile"
															class="btn btn-warning btn-sm">수정</button>
														<button type="button" id="deleteImg"
															class="btn btn-danger btn-sm">삭제</button>
														
													</div>
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
												<button type="button" onclick="passwdReset('${empVO.emp_id}')"
															class="btn btn-danger btn-sm">비밀번호 초기화</button>
											</td>
										</tr>
										
										
										
										
										
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>핸드폰</th>
											<td>
												${empVO.emp_ph }
											</td>
											<th scope="row"></th>
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
										<tr>
											<th scope="row"><span class="text-point-b"></span>활성 / 비활성</th>
											<td>
												 ${empVO.emp_actvyn eq 'Y' ? '활성' : '비활성'  } 
											</td>
											<th scope="row"><span class="text-point-b"></span></th>
											<td>
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>권한</th>
											<td colspan="3">
											<c:forEach items="${authList }" var="auth">
												${auth.authority eq 'ROLE_ADMIN' ? '<span class="badge bg-primary">관리자</span>':''}
												${auth.authority eq 'ROLE_TEST' ? '<span class="badge bg-warning">테스트</span>':''}
												${auth.authority eq 'ROLE_' ? '<span class="badge bg-warning">관리자</span>':''}
												${auth.authority eq 'ROLE_' ? '<span class="badge bg-danger">관리자</span>':''}
												${auth.authority eq 'ROLE_' ? '<span class="badge bg-cyan">관리자</span>':''}
												${auth.authority eq 'ROLE_' ? '<span class="badge bg-primary">관리자</span>':''}
												${auth.authority eq 'ROLE_' ? '<span class="badge bg-primary">관리자</span>':''}
												${auth.authority eq 'ROLE_' ? '<span class="badge bg-primary">관리자</span>':''}
												</c:forEach>
											</td>
										</tr>
									
									</tbody>
								</table>
								
							<div class="d-flex justify-content-end p-3">
								<button id="empModifyBtn" class="btn btn-warning ">수정하기</button>&nbsp;
								<button  id="cancelBtn" class="btn btn-danger ">취소</button>
							</div>
						</div>
							
							
							
							</div>
						</div>
						<!-- content header -->
					
		
		<script>
			window.onload=function(){
				$('#empModifyBtn').on('click', function(){
					location.href="modiForm?emp_id=${empVO.emp_id}"
				})
				$('#cancelBtn').on('click', function(){
					location.href="list"
				})
				
				
			}
			function passwdReset(emp_id){
				if (confirm(emp_id + '님의 비밀번호를 초기화 하시겠습니까?')){
					$.ajax({
						url : "<%=request.getContextPath()%>/role/emp/resetPw",
						type: "get",
						data : {emp_id : emp_id},
						success: function(data){
							alert(data)
						}
					})
				}
			}
			
	
		</script>
			