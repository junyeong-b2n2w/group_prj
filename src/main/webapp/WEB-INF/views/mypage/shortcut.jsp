<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">

					<h2 class="page-title">단축어관리</h2>
				</div>
			</div>
		</div>
		<!-- page title -->

		<div class="row row-deck row-cards row-eq-height">
			<div class="col-lg-4" >
				<div class="card p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header">
						<h3 class="card-title">단축어 목록</h3>
					</div>
					<!-- card header -->
					<div class="table-responsive">
						<table
							class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="w-1"><input
										class="form-check-input m-0 align-middle" type="checkbox"
										aria-label="Select all invoices" name="allCheck"
										id="th_allCheck" onclick="allCheck();"></th>
									<th class="w-5">단축어</th>
									<th> 내용</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${scList }" var="sc">
									<tr onclick="onModify('${sc.shc_no}','${sc.shc_save }','${sc.shc }')">
									<td><input
											class="form-check-input m-0 align-middle" type="checkbox" value="${sc.shc_no}"
											 ></td>
									<td>#<span class="text-blue">${sc.shc_save }</span></td>
									<td>${sc.shc }</td>
									</tr>
								</c:forEach>
								</tbody>
							
						</table>
					</div>
					<!-- table div -->


					<div class="card-footer" style=" height: 11%;">
						<div class="row ">
							<div class="col-10 col-sm-4 col-md-6 col-xl mb-3"></div>
							<div class="col-2 col-sm-8 col-md-6 col-xl mb-3"
								style="display: flex; justify-content: flex-end;">
								<button onclick="removeShortCut()"
									class="btn  btn-outline-danger w-5" > <svg
										xmlns="http://www.w3.org/2000/svg" class="icon m-0" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<line x1="4" y1="7" x2="20" y2="7" />
										<line x1="10" y1="11" x2="10" y2="17" />
										<line x1="14" y1="11" x2="14" y2="17" />
										<path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
										<path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" /></svg>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- card -->
			</div>
			<div class="col-lg-4 row">
			<div class="col-sm-12 mt-3">
			
				<div class="card p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header">
						<h3 class="card-title">단축어 등록</h3>
					</div>
					<!-- card header -->
					<div class="mt-3">
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">단축어</label> 
								<input type="text" class="form-control" name="shc_save">
								<div class="invalid-feedback scfd">영어소문자 2 자리만 가능합니다.</div>
							</div>
						</div>
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">내용</label> 
								<input type="text" class="form-control" name="shc">
								<div class="invalid-feedback">Invalid feedback</div>
							</div>
						</div>
						
					</div>
					<!-- table div -->


					<div class="card-footer" style=" height: 11%;">
						<div class="row">
							<div class="col-10 col-sm-4 col-md-6 col-xl mb-3"></div>
							<div class="col-2 col-sm-8 col-md-6 col-xl mb-3"
								style="display: flex; justify-content: flex-end;">
								<button class="btn btn-primary" onclick="registShortCut()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<!-- card -->
			</div>
			
			<div class="col-sm-12 mt-3">
				<div class="card p-3">
					<div class="card-status-top bg-primary"></div>
					<div class="card-header">
						<h3 class="card-title">단축어 수정</h3>
					</div>
					<!-- card header -->
					<div class="mt-3">
						<div class="row mb-3 align-items-end">
								<input type="hidden" name="shc_no_m">
							<div class="col">
								<label class="form-label">단축어</label>
								<input type="text" class="form-control bg-white" readonly name="shc_save_m">
								<div class="invalid-feedback scfd_m">영어소문자 2 자리만 가능합니다.</div>
							</div>
						</div>
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">내용</label> 
								<input type="text" class="form-control" name="shc_m">
								<div class="invalid-feedback">Invalid feedback</div>
							</div>
						</div>
						
					</div>
					<!-- table div -->


					<div class="card-footer" style=" height: 11%;">
						<div class="row">
							<div class="col-10 col-sm-4 col-md-6 col-xl mb-3"></div>
							<div class="col-2 col-sm-8 col-md-6 col-xl mb-3"
								style="display: flex; justify-content: flex-end;">
								<button class="btn btn-primary" onclick="modifyShortCut()">수정</button>
							</div>
						</div>
					</div>
				</div>
				<!-- card -->
			</div>
			
			
			</div>
		
		<!-- row -->
		<div class="col-4">
		<div class="card ">
		<div class="card-status-top bg-primary"></div>
		<div class="card-body">
			<div class="mb-3"> <h3><span class="badge bg-warning"></span>&nbsp;단축어는 '#' + 단축어로 실행 할 수 있습니다.</h3></div>
			<textarea  id="summernoteContent" >
				 테스트 영역입니다
			</textarea>
		</div>
		
		</div>
		</div>
		</div>
	</div>
	<!-- containew-xl -->
</div>

<script>
flag = false;

$('input[name="shc_save"]').on("keyup", function(){

	const regTitle = /^[a-z]{2}$/g;
    result = regTitle.test($('input[name="shc_save"]').val());
    if(result){
    	$('input[name="shc_save"]').addClass("is-valid").removeClass("is-invalid");
    	$('.scfd').css("display","none");
    	flag=true;
    }else{
    	$('input[name="shc_save"]').addClass("is-invalid").removeClass("is-valid");
    	$('.scfd').css("display","block");
    	flag = false;
    }
    
  
    
    
})


  
    
    


function registShortCut(){
	if(flag){
		$.ajax({
			url:'regist',
			data: {
				shc_save: $('input[name="shc_save"]').val(),
				shc :  $('input[name="shc"]').val(),
			},
			success : function(){
				getShortCut();
				location.reload();
			}
		})
	}else{
		alert('단축어가 형식에 맞지 않습니다.')
	}
}

function onModify(shc_no,shc_save, shc){
	$('input[name="shc_no_m"]').val(shc_no);
	$('input[name="shc_m"]').val(shc);
	$('input[name="shc_save_m"]').val(shc_save);
}


function modifyShortCut(){
	if(confirm('수정 하시겠습니까?')){
		$.ajax({
			url:'modify',
			data: {
				shc_no : $('input[name="shc_no_m"]').val(),
				shc_save: $('input[name="shc_save_m"]').val(),
				shc :  $('input[name="shc_m"]').val(),
			},
			success : function(){
				getShortCut();
				location.reload();
			}
		})
	}else{
		alert('단축어가 형식에 맞지 않습니다.')
	}
}

function allCheck(){
	if($('#th_allCheck').prop("checked") ){
		$('input[type="checkbox"]').prop("checked",true);
	}else{
		$('input[type="checkbox"]').prop("checked",false);
	}
}

function removeShortCut(){
	
	shc_no_list = [];
	checkedList = $('tbody input[type="checkbox"]:checked');
	for (var i = 0; i <  checkedList.length ;i ++){
		shc_no_list.push(checkedList[i].value);
	}
	console.log(shc_no_list)
	
	
	if(confirm('삭제 하시겠습니까?')){
		$.ajax({
			url:'remove',
			data: {
				shc_no_list : shc_no_list,
			},
			success : function(result){
				alert(result+'건이 삭제 되었습니다.')
				getShortCut();
				location.reload();
			}
		})
	}
}

function getShortCut(){
	$.ajax({
		url:'<%=request.getContextPath()%>/mypage/getShortCut',
		success : function(result){
			console.log(result);
			JSON_ShortCut = JSON.stringify(result);
			localStorage.setItem("${loginUser.emp_id}",JSON_ShortCut )
		}
	
	})
}

</script>

