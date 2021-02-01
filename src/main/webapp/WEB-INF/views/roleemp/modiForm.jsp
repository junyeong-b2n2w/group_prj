
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
			<div class="content">
				<div class="container">
					<div class="page-header d-print-none">
						<div class="row align-items-center">
							<div class="col-12">
								<h2 class="page-title">직원수정</h2>
							</div>
							</div>
							</div>
							<div class="col-12">
							
						<div class="card">
							<form  role="empModifyForm" method="post"
								action="modify">
								
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
													<input type="text" name="emp_id" value="${empVO.emp_id }" readonly class="form-control form-control-sm bg-white">
											</td>
											<th rowspan="3" scope="row"><img id="profileImg" src="<%=request.getContextPath() %>/img/getImg?fileName=${empVO.emp_pic}"
														 style="width: 90px; height:120px;  border: 0; vertical-align: middle;"></th>
											<td rowspan="3">
												<div id="divSingleFileUpload" class="photo-area">
													
													<div class="ins">
														<p>${empVO.emp_pic }</p>
														<div class="t1">
															<i class="icon exclamation"></i>최대 사이즈 : 100 * 100 px, 용량
															500KB 미만
															<input type="file" name="profile_img" value="${empVO.emp_pic }" class="form-control form-control-sm">
															<input type="hidden" name="emp_pic" value="${empVO.emp_pic }" class="form-control form-control-sm">
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
											<td colspan="1"><input type="text" name="emp_nm" value="${empVO.emp_nm }" class="form-control form-control-sm bg-white"></td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>패스워드</th>
											<td colspan="1">
												
											</td>
										</tr>
										
										
										
										
										
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>핸드폰</th>
											<td>
												<input type="text" name="emp_ph" value="${empVO.emp_ph }" class="form-control form-control-sm">
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
												<input type="text" name="emp_inemail" value="${empVO.emp_inemail }" class="form-control form-control-sm">
											</td>
											<th scope="row"><span class="text-point-b"></span>외부 이메일</th>
											<td>
												<input type="text" name="emp_outemail"  value="${empVO.emp_outemail }" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>부서</th>
											<td>
												<select name="emp_deptno" class="form-select form-select-sm">
					                              <c:forEach items="${deptList }" var="dept">
					                             	<option value="${dept.dept_no }" <c:if test="${dept.dept_no eq empVO.emp_deptno }" >selected</c:if>  >${dept.dept_nm }</option>
					                             </c:forEach>
					                            </select>
											</td>
											<th scope="row"><span class="text-point-b"></span>사번</th>
											<td>
												<input type="text" name="emp_empno" value="${empVO.emp_empno }"  class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>직급</th>
											<td>
												<select name="emp_rankno" class="form-select form-select-sm">
					                             <c:forEach items="${rankList }" var="rank">
					                             	<option value="${rank.rank_no }" <c:if test="${rank.rank_no eq empVO.emp_rankno }" >selected</c:if> > ${rank.rank_nm }</option>
					                             </c:forEach>
					                            </select>
											</td>
											<th scope="row"><span class="text-point-b"></span>직책</th>
											<td>
												<input type="text" name="emp_pos" value="${empVO.emp_pos }" class="form-control form-control-sm">
												
											</td>
										</tr>
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>수습구분?</th>
											<td>
												<label class="form-check form-check-inline">
					                              <input  name="susep"  class="form-check-input" type="radio" ${not empty empVO.emp_proter_endymd ? 'checked' : '' }>
					                              <span class="form-check-label">수습</span>
					                            </label>
					                            <label class="form-check form-check-inline">
					                              <input  name="susep" class="form-check-input" type="radio" ${empty empVO.emp_proter_endymd ? 'checked' : '' }>
					                              <span class="form-check-label">비수습</span>
					                            </label>
											</td>
											<th scope="row"><span class="text-point-b"></span>수습기간 종료일</th>
											<td>
												<input type="date" name="emp_proter_endymd" value="${fn:substring(empVO.emp_proter_endymd,0,10)}" class="form-control form-control-sm">
											</td>
										</tr>
										
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>성별</th>
											<td>
												<label class="form-check form-check-inline">
					                              <input  name="emp_gend" value="남" class="form-check-input" type="radio" ${empVO.emp_gend eq '남' ? 'checked' : ''  }>
					                              <span class="form-check-label">남</span>
					                            </label>
					                            <label class="form-check form-check-inline">
					                              <input  name="emp_gend" value="여" class="form-check-input" type="radio" ${empVO.emp_gend eq '여' ? 'checked' : ''  }>
					                              <span class="form-check-label">여</span>
					                            </label>
											</td>
											<th scope="row"><span class="text-point-b"></span>생년월일</th>
											<td>
												<input type="date" name="emp_brdt" value="${fn:substring(empVO.emp_brdt,0,10)}" class="form-control form-control-sm">
											</td>
										</tr>
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>연봉</th>
											<td>
												<input type="text" name="emp_ysal" value="${empVO.emp_ysal }" class="form-control form-control-sm">
											</td>
											<th scope="row"><span class="text-point-b"></span>급여계약기준</th>
											<td>
												<input type="text" name="emp_salctrstdd" value="${empVO.emp_salctrstdd }" class="form-control form-control-sm">
											</td>
										</tr>
										
										<tr>
											<th scope="row"><span class="text-point-b"></span>재직상태</th>
											<td>
												<input type="text" name="emp_tnrstt" value="${empVO.emp_tnrstt }" class="form-control form-control-sm">
											</td>
											<th scope="row"><span class="text-point-b"></span>입사일자</th>
											<td>
												<input type="date" name="emp_jncmpymd" value="${fn:substring(empVO.emp_jncmpymd,0,10)}" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row"><span class="text-point-b"></span>활성 / 비활성</th>
											<td>
												<label class="form-check form-check-inline">
					                              <input  name="emp_actvyn" value="Y" class="form-check-input" type="radio" ${empVO.emp_actvyn eq 'Y' ? 'checked' : ''  } >
					                              <span class="form-check-label">활성</span>
					                            </label>
					                            <label class="form-check form-check-inline">
					                              <input  name="emp_actvyn" value="N" class="form-check-input" type="radio" ${empVO.emp_actvyn eq 'N' ? 'checked' : ''  }>
					                              <span class="form-check-label">비활성</span>
					                            </label>
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
								
							</form>
							<div class="d-flex justify-content-end p-3">
								<button id="empModifyBtn" class="btn btn-warning ">수정</button>&nbsp;
								<button id="cancelBtn" class="btn btn-danger ">취소</button>
							</div>
						</div>
							
							
							
							</div>
						</div>
						<!-- content header -->
					
		</div>
		<script>
			window.onload=function(){
				$('#empModifyBtn').on('click', function(){
					if(confirm("수정하시겠습니까?")){
						$('form[role="empModifyForm"]').submit();
					}
				})
				$('#cancelBtn').on('click', function(){
					location.href="list"
				})
				$('#btnSelectFile').on('click', function(){
					
					 
					sendImg()
				})
				
				
				
				
				
			}
			
			function sendImg() {
				form = new FormData();
				form.append("file", $('input[name="profile_img"]')[0].files[0])
				form.append("id", "123")
				$.ajax({
			    	data: form,
			    	type: "POST",
			    	url: '<%=request.getContextPath()%>/img/uploadImg',
			    	contentType: false,	    	
			    	processData: false,
			    	success: function(img_url) {
			      		alert(img_url)
			      		$('#profileImg').attr("src", img_url);
			      		file_url = img_url.substring(img_url.indexOf("=")+1,img_url.indexOf(".") +4 );
			      		$('input[name="emp_pic"]').val(file_url);
			    	}
			  	});
			}
			
	
		</script>
			