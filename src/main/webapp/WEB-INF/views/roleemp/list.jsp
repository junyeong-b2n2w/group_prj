<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>


<div class="content">
	<div class="container">
		<div class="page-header d-print-none">
	<div class=" align-items-center d-flex justify-content-between">
		<h3 class="page-title">직원목록</h3>
		
		<div>
			<a class="btn  btn-primary w-100" href="registForm">직원
						등록</a>
		</div>
	</div>
</div>

		<div class="row row-eq-height">
			<div class="col-8">
			<div class="card p-3 h-100">
			<div class="card-header">
					<div><h3>직원 목록</h3></div>
					
				</div>
				<div class="card-body border-bottom row">
					<div class="col-4">
						<div class="d-inline-block">
							
						</div>
					</div>
					<div class="col-8 d-flex justify-content-end mb-3">
						<div class="text-muted">

							<div class="mx-2 d-inline-block">
								<select name="perPageNum" class="form-control form-control-sm ">
									<option value="5"
										${pageMaker.cri.perPageNum eq '5' ? 'selected':'' }>5개씩</option>
									<option value="10"
										${pageMaker.cri.perPageNum eq '10' ? 'selected':'' }>10개씩</option>
									<option value="20"
										${pageMaker.cri.perPageNum eq '20' ? 'selected':'' }>20개씩</option>
								</select>
							</div>

						</div>

						<div class="text-muted">
							<div class="mx-2 d-inline-block">
								<select name="searchType2" class="form-control form-control-sm ">
								<option ${pageMaker.cri.searchType2 eq '' ? 'selected':'' }
										value="">활성상태</option>
									<option ${pageMaker.cri.searchType2 eq 'ac' ? 'selected':'' }
										value="ac">활성</option>
										<option ${pageMaker.cri.searchType2 eq 'na' ? 'selected':'' }
										value="na">비활성</option>
								</select>
							</div>
							
							<div class="mx-2 d-inline-block">
								<select name="searchType" class="form-control form-control-sm ">
									<option ${pageMaker.cri.searchType eq '' ? 'selected':'' }
										value="">선택</option>
									<option ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }
										value="c">회사</option>
									<option ${pageMaker.cri.searchType eq 'b' ? 'selected':'' }
										value="b">부서</option>
									<option ${pageMaker.cri.searchType eq 'n' ? 'selected':'' }
										value="n">이름</option>
									<option ${pageMaker.cri.searchType eq 'r' ? 'selected':'' }
										value="r">직급</option>
									<option ${pageMaker.cri.searchType eq 'p' ? 'selected':'' }
										value="p">직책</option>
								</select>
							</div>

						</div>
						<div class="ms-auto ">

							<div class="searchbox ms-2 d-inline-block">
								<input type="text" name="keyword"
									class="form-control form-control-sm" value="${pageMaker.cri.keyword}"
									aria-label="Search invoice">
							</div>
						</div>
						<div class="ml-1 ms-2 d-inline-block">

							<button class="btn btn-sm btn-outline-primary w-100"
								onclick="searchList_go(1);">검색</button>
						</div>


					</div>


					<div class="table-responsive">

						<table class="table table-vcenter card-table table-hover ">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>회사</th>
									<th>부서</th>
									<th>직급</th>
									<th>직책</th>
									<th>활성여부</th>
									<th>권한</th>
								</tr>
							</thead>
							<tbody style="font-size: 0.7rem;">
								<c:forEach items="${empList }" var="emp">
									<tr onclick="miribogi('${emp.emp_id }')">

										<td>${emp.emp_id }</td>
										<td>${emp.emp_nm }</td>
										<td>${emp.comp_nm}</td>
										<td>${emp.dept_nm }&nbsp;${emp.dept_actvyn eq 'N'?'<span class="badge bg-red"></span>':''  }</td>
										<td>${emp.rank_nm }</td>
										<td>${emp.emp_pos }</td>
										<td>${emp.emp_actvyn eq 'Y' ? '<span class="badge bg-primary">활성</span>' : '<span class="badge bg-danger">비활성</span>' }</td>
										<td id="auth_${emp.emp_id }"><c:forEach
												items="${emp.authList }" var="auth">
									${auth.authority eq 'ROLE_ADMIN' ? '<span class="badge bg-primary">관리자</span> ':''}
									${auth.authority eq 'ROLE_CM' ? '<span class="badge bg-pink">회사</span> ':''}
									${auth.authority eq 'ROLE_EM' ? '<span class="badge bg-info">인사</span> ':''}
									${auth.authority eq 'ROLE_BM' ? '<span class="badge bg-blue-lt">게시판</span> ':''}
									${auth.authority eq 'ROLE_NM' ? '<span class="badge bg-red-lt">공지</span> ':''}
									${auth.authority eq 'ROLE_AM' ? '<span class="badge bg-yellow">결재</span> ':''}
									</c:forEach></td>

									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer d-flex justify-content-center">

					<%@include file="../common/pagination.jsp"%>
				</div>

			</div>
			</div>
			<div class="col-4"> 
			<div class="card p-3 h-100">
				<div class="card-header">
					<h3>정보 미리보기</h3>
				</div>
				<div class="card-body border-bottom">
					<!--  -->
					<table id="miribogiTable" class="table table-vcenter card-table">
						<tr>
							<td rowspan=2 colspan=2><img id="profileImg"
								style="width: 90px; height: 120px; border: 0; vertical-align: middle;"></td>
							<td colspan=2><span id="nameRankId"></span></td>
						</tr>
						<tr>
							<td colspan=2><span id="deptPos"></span></td>
						</tr>
						<tr>
							<th>핸드폰</th>
							<td><span id="phone"></span></td>
							<th>사번</th>
							<td><span id="empNo"></span></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><span id="gender"></span></td>
							<th>생년월일</th>
							<td><span id="birthday"></span></td>
						</tr>
						<tr>
							<th>내부이메일</th>
							<td colspan="3"><span id="inemail"></span></td>
						</tr>
						<tr>
							<th>외부이메일</th>
							<td colspan="3"><span id="outemail"></span></td>
						</tr>
						<tr>
							<th>활성여부</th>
							<td colspan="3"><span id="active"></span></td>
						</tr>
						<tr>
							<th>권한</th>
							<td colspan="3"><span id="auth"></span></td>
						</tr>
					</table>
					<!--  -->
				</div>
				<div class="card-footer d-flex justify-content-between">
					<a id="detailBtn" class="btn btn-sm btn-info">자세히</a> <a
						id="modifyBtn" class="btn btn-sm btn-warning">수정하기</a> <a
						id="resetPWBtn" class="btn btn-sm btn-purple">비밀번호초기화</a>
						<sec:authorize access="hasRole('ROLE_CM')">
						 <a	id="authBtn" class="btn btn-sm btn-indigo">권한관리</a>
						</sec:authorize>
				</div>
			</div>
		</div>

		</div>
		
		<div class="mt-3 row row-eq-height">
			<div class="col-8 " >
			<div class="card p-3 h-100">
				<div class="card-header">
				<h3>직원 통계</h3></div>
				<div class="card-body">
					<div class="row">
						<div id="emp_chart" class="col-9"></div>
						<div class="col-3 chart_ck">
							<label class="form-check form-switch"> <input
								class="form-check-input" name="dept_ck" value="deptOn"
								type="checkbox"> <span class="form-check-label">부서별</span>
							</label> <label class="form-check form-switch"> <input
								class="form-check-input" name="rank_ck" value="rankOn"
								type="checkbox"> <span class="form-check-label">직급별</span>
							</label> <label class="form-check form-switch"> <input
								class="form-check-input" name="gend_ck" value="gendOn"
								type="checkbox"> <span class="form-check-label">성별</span>
							</label>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="col-4 ">
			<div class="card p-3 h-100">
				<div class="card-header"><h3>권한 통계</h3></div>
				<div class="card-body">
					
					<div class="row">
						<div class="col-6 text-center mb-3">
							<span class="badge bg-pink">회사</span>
						</div>
						<div class="col-6"><span id="role_cm_cnt">0</span> 명</div>
					</div>
					<div class="row">
						<div class="col-6 text-center mb-3">
							<span class="badge bg-info">인사</span>
						</div>
						<div class="col-6"><span id="role_em_cnt">0</span> 명</div>
					</div>
					<div class="row">
						<div class="col-6 text-center mb-3">
							<span class="badge bg-blue-lt">게시판</span>
						</div>
						<div class="col-6"><span id="role_bm_cnt">0</span> 명</div>
					</div>
					<div class="row">
						<div class="col-6 text-center mb-3">
							<span class="badge bg-red-lt">공지</span>
						</div>
						<div class="col-6"><span id="role_nm_cnt">0</span> 명</div>
					</div>
					<div class="row">
						<div class="col-6 text-center mb-3">
							<span class="badge bg-yellow">결재</span>
						</div>
						<div class="col-6"><span id="role_am_cnt">0</span> 명</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>

<div class="modal modal-blur fade" id="auth_modal" tabindex="-1"
	role="dialog" aria-modal="true" style="display: none;">
	<div class="modal-dialog modal-sm modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">권한관리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body ">
				<div class="row mb-3 d-flex justify-content-center">
					<div class="col-1">
						<span class="badge bg-pink">회사</span>
					</div>
					<div class="col-auto">
						<label class="form-check form-check-single form-switch"> <input
							class="form-check-input" value="2" id="roleCm" type="checkbox">
						</label>
					</div>
				</div>
				<div class="row mb-3 d-flex justify-content-center">
					<div class="col-1">
						<span class="badge bg-info">인사</span>
					</div>
					<div class="col-auto">
						<label class="form-check form-check-single form-switch"> <input
							class="form-check-input" value="3" id="roleEm" type="checkbox">
						</label>
					</div>
				</div>
				<div class="row mb-3 d-flex justify-content-center">
					<div class="col-1">
						<span class="badge bg-blue-lt">게시판</span>
					</div>
					<div class="col-auto">
						<label class="form-check form-check-single form-switch"> <input
							class="form-check-input" value="4" id="roleBm" type="checkbox">
						</label>
					</div>
				</div>
				<div class="row mb-3 d-flex justify-content-center">
					<div class="col-1">
						<span class="badge bg-red-lt">공지</span>
					</div>
					<div class="col-auto">
						<label class="form-check form-check-single form-switch"> <input
							class="form-check-input" value="5" id="roleNm" type="checkbox">
						</label>
					</div>
				</div>
				<div class="row mb-3 d-flex justify-content-center">
					<div class="col-1">
						<span class="badge bg-yellow">결재</span>
					</div>
					<div class="col-auto">
						<label class="form-check form-check-single form-switch"> <input
							class="form-check-input" value="6" id="roleAm" type="checkbox">
						</label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn me-auto" data-bs-dismiss="modal">닫기</button>
				<button type="button" id="grantBtn" class="btn btn-primary"
					data-bs-dismiss="modal">권한 부여</button>
			</div>
		</div>
	</div>
</div>

<div class="modal modal-blur fade" id="password-modal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          <div class="modal-status bg-danger"></div>
          <div class="modal-body text-center py-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-danger icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 9v2m0 4v.01"></path><path d="M5 19h14a2 2 0 0 0 1.84 -2.75l-7.1 -12.25a2 2 0 0 0 -3.5 0l-7.1 12.25a2 2 0 0 0 1.75 2.75"></path></svg>
            <h3>비밀번호 초기화</h3>
            <div class="text-muted" id="passwordAskBox"><span class="passwordTarget"></span> 님의 비밀번호를 초기화 하시겠습니까?</div>
            <div class="text-muted d-none" id="passwordResultBox"><span class="passwordTarget"></span> 님의 비밀번호가 초기화 되었습니다.
            <div class="mt-2" id="passwordResult" style="border: 1px dashed lightgray; min-height:50px;">
            	
            </div>
            </div>
            
          </div>
          <div class="modal-footer">
            <div class="w-100">
              <div class="row">
                <div class="col"><a href="#" class="btn btn-white w-100" onclick="modalClose()" data-bs-dismiss="modal">
                    취소
                  </a></div>
                <div class="col"><a href="#" id="modalResetPasswordBtn" class="btn btn-danger w-100" data-target-id="" data-bs-dismiss="modal">
                    초기화
                  </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<script>
	function miribogi(emp_id){
		//alert(emp_id);
	
		
		$.ajax({
			url : "<%=request.getContextPath()%>/role/emp/getEmp",
			type: "get",
			data : {
					emp_id : emp_id
			},
			dataType:"json",
			success: function(dataMap){
				result = dataMap.empVO;
				authList= dataMap.authList;
				console.log(authList)
				$('#profileImg').attr("src","<%=request.getContextPath()%>/img/getImg?fileName="+ result.emp_pic);
				$('#nameRankId').html( result.emp_nm + " " + result.rank_nm + "("+ emp_id +")");
				$('#deptPos')   .html( result.dept_nm + (result.dept_actvyn =='N' ?"&nbsp;<span class='badge bg-red'>부서비활</span>&nbsp;" :"" ) + "("+result.emp_pos+")")
				$('#phone')     .html( result.emp_ph )
				$('#empNo')     .html( result.emp_empno )
				$('#gender')    .html( result.emp_gend )
				$('#birthday')  .html( result.emp_brdt.substring(0,10) )
				$('#active')    .html( result.emp_actvyn =='Y' ? '<span class="badge bg-primary">활성</span>' : '<span class="badge bg-danger">비활성</span>'  )
				$('#inemail')   .html( result.emp_inemail )
				$('#outemail')  .html( result.emp_outemail )
				data='';
				for(var i = 0; i < authList.length; i++){
						console.log(authList[i].authority)
						
						data+=authList[i].authority == 'ROLE_ADMIN' ? '<span class="badge bg-primary">관리자</span> ':''
						data+=authList[i].authority == 'ROLE_CM' ? '<span class="badge bg-pink">회사</span> ':''
						data+=authList[i].authority == 'ROLE_EM' ? '<span class="badge bg-info">인사</span> ':''
						data+=authList[i].authority == 'ROLE_BM' ? '<span class="badge bg-blue-lt">게시판</span> ':''
						data+=authList[i].authority == 'ROLE_NM' ? '<span class="badge bg-red-lt">공지</span> ':''
						data+=authList[i].authority == 'ROLE_AM' ? '<span class="badge bg-yellow">결재</span> ':''
				}
				
				
				$('#auth').html( data);
				
				$('#auth_'+result.emp_id).empty();
				$('#auth_'+result.emp_id).html(data);
				
				$('#modifyBtn').attr('href','modiForm?emp_id=' +result.emp_id )
				$('#resetPWBtn').attr('onclick',"passwdReset('"+result.emp_id+"')" )
				$('#authBtn').attr('onclick','authChange("'+result.emp_id+'")' )
				$("#detailBtn") .attr('href','detail?emp_id=' +result.emp_id )
				
				
				// 권한관리 모달
				
				
				 $('#auth_modal').find($('input[type="checkbox"]')).prop('checked',false);
				 
				 $('#grantBtn').attr('onclick','grant("'+result.emp_id+'")' )
				 
				for(var i = 0; i < authList.length; i++){
					console.log(authList[i].authority)
					if(authList[i].authority == 'ROLE_CM'  ){ $('#roleCm').prop('checked',true);}
					if(authList[i].authority == 'ROLE_EM'  ){ $('#roleEm').prop('checked',true);}
					if(authList[i].authority == 'ROLE_BM'  ){ $('#roleBm').prop('checked',true);}
					if(authList[i].authority == 'ROLE_NM'  ){ $('#roleNm').prop('checked',true);}
					if(authList[i].authority == 'ROLE_AM'  ){ $('#roleAm').prop('checked',true);}
				}
				
				}
			})
	}
	
	function passwdReset(emp_id){
		console.log($('#auth_'+emp_id+' span').text().indexOf('회사'))
		if($('#auth_'+emp_id+' span').text().indexOf('회사') > -1 ){
			alert('회사 관리자의 비밀번호는 초기화 할 수 없습니다.')
			return false;
		}
		
		
		$('#passwordAskBox').removeClass('d-none');
		$('#passwordResultBox').addClass('d-none');
		
		$('.passwordTarget').text(emp_id);
		$('#modalResetPasswordBtn').removeClass('btn-primary').addClass('btn-danger');
		$('#modalResetPasswordBtn').attr('onclick','passwdResetGo("'+emp_id+'")')
		$('#password-modal').modal('show');
		
		
	}
	
	function passwdResetGo(emp_id){
		$('#modalResetPasswordBtn')
			.removeClass('btn-danger')
			.addClass('btn-primary')
			.text('확인')
			.attr('onclick','modalClose()');
		
		
		$.ajax({
			url : "<%=request.getContextPath()%>/role/emp/resetPw",
			type: "get",
			data : {emp_id : emp_id},
			success: function(data){
				$('#passwordAskBox').addClass('d-none');
				$('#passwordResultBox').removeClass('d-none');
				$('#passwordResult').text("변경된 비밀번호 : "+data);
			}
		})
	}
	
	function modalClose(){
		$('#password-modal').modal('hide');
		 $('#auth_modal').modal('hide');
	}
	
	function authChange(emp_id){
		 $('#auth_modal').modal('show');
	}

	function grant(emp_id){
		
		console.log(emp_id);
		
		
		
		checkedList = $('#auth_modal input[type="checkbox"]:checked');
		
		roleList = [];
		for (var i = 0 ; i < checkedList.length; i++){
			roleList.push(checkedList[i].value);
		}
		//console.log(roleList)
		
		
		
		if(confirm("권한을 부여하시겠습니까?")){
			$.ajax({
				url : "<%=request.getContextPath()%>/role/emp/grant",
				type: "post",
				data : {
						"emp_id" : emp_id,
						"roleList" : roleList
				},
				dataType:"json",
				success: function(result){
					//alert(result)
					miribogi(emp_id);
					$('#auth_modal').modal('hide');
					roleCount()
				}
			})
		}
	}
	
//차트 

var options = {
        series: [60,123],
        chart: {
        width: 580,
        type: 'donut',
      },
      labels: ['회사명','123']
      , 
      dataLabels: {
      formatter: function (value,  val ) {
//     	  val.w.globals.labels[val.seriesIndex] +" : "+val.w .globals.series[val.seriesIndex] + "명";
          return Math.round(value) + "%"
      }
      }
      ,  plotOptions: {
    	    pie: {
    	        donut: {
    	          labels: {
    	            show: true,
    	            value: {
    	            	fomatter:function(val){
    	            		return val + "명";
        	            }
    	            }
    	            
    	          }
    	        }
    	      }
    	    }
      ,legend: {
          show: true,
          width:200
          }
      
      };

var chart = new ApexCharts(document.querySelector("#emp_chart"), options);
chart.render();


function makeChart(){
	$.ajax({
		url : "<%=request.getContextPath()%>/role/emp/chart",
	
			type : "post",
			data : {
				"dept_ck" : $('input[name="dept_ck"]:checked').val(),
				"rank_ck" : $('input[name="rank_ck"]:checked').val(),
				"gend_ck" : $('input[name="gend_ck"]:checked').val(),
			},
			dataType : "json",
			success : function(result) {
				series = [];
				labels = [];

				for (var i = 0; i < result.length; i++) {
					series.push(result[i].COUNT)
					labels.push(result[i].NAME)

				}

				options.series = series;
				options.labels = labels;
				chart.updateOptions(options, document
						.querySelector("#emp_chart"));
			}

		})
	}

makeChart();

$('.chart_ck input').on('change', function() {
	makeChart();
})
function roleCount(){
		$.ajax({
			url : "<%=request.getContextPath()%>/role/emp/roleCount",
				type : "post",
				dataType : "json",
				success : function(result) {
					
		$('#role_cm_cnt')   .text(result[result.findIndex(row => row.NAME == 'ROLE_CM')]? result[result.findIndex(row => row.NAME == 'ROLE_CM')].COUNT : 0)     
		$('#role_em_cnt')   .text(result[result.findIndex(row => row.NAME == 'ROLE_EM')]? result[result.findIndex(row => row.NAME == 'ROLE_EM')].COUNT : 0)     
		$('#role_bm_cnt')   .text(result[result.findIndex(row => row.NAME == 'ROLE_BM')]? result[result.findIndex(row => row.NAME == 'ROLE_BM')].COUNT : 0)     
		$('#role_nm_cnt')   .text(result[result.findIndex(row => row.NAME == 'ROLE_NM')]? result[result.findIndex(row => row.NAME == 'ROLE_NM')].COUNT : 0)     
		$('#role_am_cnt')   .text(result[result.findIndex(row => row.NAME == 'ROLE_AM')]? result[result.findIndex(row => row.NAME == 'ROLE_AM')].COUNT : 0)     
					
					return result;
				}

			})
		}
roleCount();
	
</script>

